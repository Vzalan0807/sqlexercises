create database salon;

create table customers();
create table appointments();
create table services();

alter table customers add column customer_id serial;
alter table appointments add column appointment_id serial;
alter table services add column service_id serial;

alter table customers add primary key (customer_id);
alter table appointments add primary key (appointment_id);
alter table services add primary key (service_id);

alter table appointments add column customer_id integer;
alter table appointments add constraint appointments_fk1 foreign key (customer_id) references customers (customer_id);
alter table appointments add column service_id integer;
alter table appointments add constraint appointments_fk2 foreign key (service_id) references services (service_id);

alter table customers add column phone varchar(30);
alter table customers add constraint customers_phone_uq unique (phone);

alter table customers add column name varchar(30);
alter table services add column name varchar(30);
alter table appointments add column time varchar(30);

insert into services (name) values ('cut');
insert into services (name) values ('color');
insert into services (name) values ('perm');
insert into services (name) values ('style');
insert into services (name) values ('trim');





