#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
DELETE2=$($PSQL "DELETE FROM games")
DELETE1=$($PSQL "DELETE FROM teams")


cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT W_GOALS O_GOALS
do
  if [[ $YEAR != "year" ]]
  then
    CHECK1=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
    CHECK2=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")

    if [[ -z $CHECK1 ]]
    then
      INSERT_RESULT_WINNER=$($PSQL "INSERT INTO teams (name) VALUES ('$WINNER')")
      CHECK1=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
    fi

    if [[ -z $CHECK2 ]]
    then
      INSERT_RESULT_OPP=$($PSQL "INSERT INTO teams (name) VALUES ('$OPPONENT')")
      CHECK2=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
    fi

    INSERT_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals)
                 VALUES ($YEAR, '$ROUND', $CHECK1, $CHECK2, $W_GOALS, $O_GOALS)")
  fi
done         