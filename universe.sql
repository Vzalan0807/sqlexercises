create database universe;

create table galaxy;
create table moon;
create table planet;
create table star;
create table person;

alter table galaxy add column galaxy_id integer not null;
alter table galaxy add column diam integer;
alter table galaxy add column name varchar(40);
alter table galaxy add column is_bigger_than_earth boolean;
alter table galaxy add column dis_from_earth numeric;
alter table galaxy add column nasa_id_galaxy text not null;

alter table star add column star_id integer not null;
alter table star add diam integer;
alter table star add column name varchar(40);
alter table star add column is_bigger_than_earth boolean;
alter table star add column dis_from_earth numeric;
alter table star add column nasa_id_star text not null;
alter table star add column nasa_id_galaxy text;

alter table planet add column planet_id integer not null;
alter table planet add diam integer;
alter table plnaet add column name varchar(40);
alter table planet add column is_bigger_than_earth boolean;
alter table planet add column dis_from_earth numeric;
alter table planet add column nasa_id_planet text not null;
alter table planet add column nasa_id_star text;

alter table moon add column moon_id integer not null;
alter table moon add diam integer;
alter table moon add column name varchar(40);
alter table moon add column is_bigger_than_earth boolean;
alter table moon add column dis_from_earth numeric;
alter table moon add column nasa_id_moon text not null;
alter table moon add column nasa_id_planet text;

alter table person add column person_id text not null;
alter table person add column age integer not null;
alter table person add column personal_id_number text not null;
alter table person add column name varchar(40);

alter table galaxy add constraint g_pk1 primary key (galaxy_id);
alter table star add constraint s_pk1 primary key (star_id);
alter table planet add constraint p_pk1 primary key (planet_id);
alter table moon add constraint m_pk1 primary key (moon_id);
alter table person add constraint pe_pk1 primary key (person_id);

alter table moon add constraint moon_uq1 unique(nasa_id_moon);
alter table star add constraint star_uq1 unique(nasa_id_star);
alter table planet add constraint planet_uq1 unique(nasa_id_planet);
alter table galaxy add constraint galaxy_uq1 unique(nasa_id_galaxy);
alter table moon add constraint moon_uq1 unique(nasa_id_moon);
alter table person add constraint person_uq1 unique(personal_id_number);

alter table star add constraint star_fk1 foreign key (nasa_id_galaxy) references galaxy(nasa_id_galaxy);
alter table planet add constraint planet_fk1 foreign key (nasa_id_star) references galaxy(nasa_id_star);
alter table moon add constraint moon_fk1 foreign key (nasa_id_planet) references planet(nasa_id_planet);

insert into galaxy (galaxy_id, diam, name, is_bigger_than_earth, dis_from_earth, nasa_id_galaxy) values (2, 3457, 'galaxy2', true, 45
69, 'g12');
insert into galaxy (galaxy_id, diam, name, is_bigger_than_earth, dis_from_earth, nasa_id_galaxy) values (3, 3458, 'galaxy3', true, 45
70, 'g13');
insert into galaxy (galaxy_id, diam, name, is_bigger_than_earth, dis_from_earth, nasa_id_galaxy) values (4, 3459, 'galaxy4', true, 45
71, 'g14');
insert into galaxy (galaxy_id, diam, name, is_bigger_than_earth, dis_from_earth, nasa_id_galaxy) values (5, 3460, 'galaxy5', true, 45
77, 'g15');
insert into galaxy (galaxy_id, diam, name, is_bigger_than_earth, dis_from_earth, nasa_id_galaxy) values (6, 3461, 'galaxy6', true, 45
78, 'g16');

insert into star(star_id, diam, name, is_bigger_than_earth, dis_from_earth, nasa_id_galaxy, nasa_id_star) values (1, 345, 'star1', false, 34567, 'g1', 's1');
insert into star(star_id, diam, name, is_bigger_than_earth, dis_from_earth, nasa_id_galaxy, nasa_id_star) values (2, 346, 'star2', tr
ue, 34565, 'g12', 's2');
insert into star(star_id, diam, name, is_bigger_than_earth, dis_from_earth, nasa_id_galaxy, nasa_id_star) values (3, 347, 'star3', tr
ue, 34570, 'g13', 's3');
insert into star(star_id, diam, name, is_bigger_than_earth, dis_from_earth, nasa_id_galaxy, nasa_id_star) values (4, 348, 'star4', tr
ue, 34571, 'g13', 's4');
insert into star(star_id, diam, name, is_bigger_than_earth, dis_from_earth, nasa_id_galaxy, nasa_id_star) values (5, 340, 'star5', tr
ue, 34575, 'g1', 's5');
insert into star(star_id, diam, name, is_bigger_than_earth, dis_from_earth, nasa_id_galaxy, nasa_id_star) values (6, 333, 'star6', tr
ue, 3456, 'g14', 's6');

insert into planet values(1, 234, 'planet1', false, 34, 's1', 'p1');
insert into planet values(2, 230, 'planet2', true, 30, 's2', 'p2');
insert into planet values(3, 2356, 'planet3', true, 456, 's3', 'p3');
insert into planet values(4, 33455, 'planet4', false, 4567, 's2', 'p4');
insert into planet values(5, 3355, 'planet5', true, 4567678, 's6', 'p5');
insert into planet values(6, 335522, 'planet5', true, 45676783, 's5', 'p6');
insert into planet values(7, 33552, 'planet6', true, 45676, 's4', 'p7');
insert into planet values(8, 33522, 'planet8', false, 1231252, 's2', 'p8');
insert into planet values(9, 33567, 'planet9', false, 1231, 's1', 'p9');
insert into planet values(10, 33545, 'planet10', true, 12311, 's2', 'p10');
insert into planet values(11, 33541, 'planet11', true, 1231241, 's1', 'p11');
insert into planet values(12, 33, 'planet12', false, 12312, 's4', 'p12');

insert into moon values (1, 23, 'moon1', false, 3, 'p2', 'm1');
insert into moon values (2, 223, 'moon2', true, 5, 'p12', 'm12');
insert into moon values (3, 22, 'moon3', false, 1, 'p4', 'm3');
insert into moon values (4, 21, 'moon4', false, 45, 'p5', 'm4');
insert into moon values (5, 21, 'moon5', false, 4, 'p3', 'm5');
insert into moon values (6, 21, 'moon6', false, 3, 'p3', 'm6');
insert into moon values (7, 21, 'moon7', false, 3, 'p1', 'm7');
insert into moon values (8, 12, 'moon8', false, 3, 'p11', 'm8');
insert into moon values (9, 12, 'moon9', false, 3, 'p10', 'm9');
insert into moon values (10, 12, 'moon10', false, 3, 'p9', 'm10');
insert into moon values (11, 12, 'moon11', false, 3, 'p8', 'm11');
insert into moon values (12, 12, 'moon12', false, 3, 'p9', 'm13');
insert into moon values (13, 12, 'moon13', false, 3, 'p7', 'm14');
insert into moon values (14, 12, 'moon14', false, 3, 'p6', 'm15');
insert into moon values (15, 12, 'moon15', false, 3, 'p11', 'm16');
insert into moon values (16, 12, 'moon16', false, 3, 'p1', 'm17');
insert into moon values (17, 12, 'moon17', false, 3, 'p3', 'm18');
insert into moon values (18, 12, 'moon18', false, 3, 'p3', 'm19');
insert into moon values (19, 12, 'moon19', false, 3, 'p5', 'm20');
insert into moon values (20, 12, 'moon20', false, 3, 'p5', 'm21');














