#! /bin/bash

echo -e "\n~~~~~ MY SALON ~~~~~\n"
echo -e "Welcome to My Salon, how can I help you?\n"

GET_ID(){
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  SERVICES=$(psql --username=freecodecamp --dbname=salon --tuples-only -c "SELECT * FROM services")
  IFS="|"
  echo $SERVICES | while IFS=' ' read -r SERVICE_ID SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done

  read SERVICE_ID_SELECTED

  if [[ ! "$SERVICE_ID_SELECTED" =~ ^[0-9]+$ ]]
    then
      GET_ID "Sorry, that is not a valid number! Please, choose again."
    else
      RESULT=$(psql --username=freecodecamp --dbname=salon --tuples-only -c "SELECT * FROM services WHERE service_id = $SERVICE_ID_SELECTED")
      if [[ -z $RESULT ]]
      then
        GET_ID "I could not find that service. What would you like today?"
      else
        NEXT_STEP $SERVICE_ID_SELECTED
      fi
    fi
}

NEXT_STEP(){

  SERVICE_ID_SELECTED=$1
  SERVICE_NAME=$(psql --username=freecodecamp --dbname=salon --tuples-only -c "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
  echo "What's your phone number?"
  read CUSTOMER_PHONE

  PHONE_EXISTS=$(psql --username=freecodecamp --dbname=salon --tuples-only -c "SELECT * FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  if [[ -z $PHONE_EXISTS ]]
  then
    echo "I don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    INSERT_NEW_CUS=$(psql --username=freecodecamp --dbname=salon --tuples-only -c "INSERT INTO customers (name, phone) VALUES ('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
  fi
  CUSTOMER_NAME=$(psql --username=freecodecamp --dbname=salon --tuples-only -c "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  echo "What time would you like your $(echo $SERVICE_NAME | sed -r 's/^ *| *$//g'), $(echo $CUS_NAME | sed -r 's/^ *| *$//g')?"
  read SERVICE_TIME
  CUSTOMER_ID=$(psql --username=freecodecamp --dbname=salon --tuples-only -c "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  APPOINTMENT_INSERT=$(psql --username=freecodecamp --dbname=salon --tuples-only -c "INSERT INTO APPOINTMENTS (customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
  echo -e "\nI have put you down for a $(echo $SERVICE_NAME | sed -r 's/^ *| *$//g') at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."

}


GET_ID
