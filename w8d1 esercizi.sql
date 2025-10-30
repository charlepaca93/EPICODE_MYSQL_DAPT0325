create database w8d1;
use w8d1;
create table store (
	negozio_id int auto_increment primary key,
    nome_negozio varchar (25),
    data_apertura date,
    indirizzo varchar (50),
    città varchar (25));
insert into store values
	(1, "negozio_A", "2020-01-01", "via A. Vespucci, 9", "Bergamo"),
    (2, "negozio_B", "2021-02-02", "via A. Moro, 17", "Milano"),
    (3, "negozio_C", "2022-03-03", "via delle Camelie, 24", "Roma");
create table region (
	regione_id int auto_increment primary key,
    città varchar (25),
    regione varchar (25),
    paese varchar (25));
alter table region
drop column regione_id;
alter table region
add column città_id int auto_increment primary key;
select *
from region;
insert into region values
	("Bergamo", "Lombardia", "Italia", 1),
    ("Milano", "Lombardia", "Italia", 2),
    ("Roma", "Lazio", "Italia", 3);
alter table store
add column città_id int;
alter table store
add constraint fk_region_store foreign key (città_id) references region (città_id);
select *
from store;
describe store;
select *
from region;
describe region;
update store
set città_id = 1
where negozio_id = 1;
update store
set città_id = 2
where negozio_id = 2;
update store
set città_id = 3
where negozio_id = 3;
select *
from store;
delete from store
where negozio_id = 4;
delete from store
where negozio_id = 5;
delete from store
where negozio_id = 6;
select *
from store;
