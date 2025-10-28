show databases;
create database w5d4_esercizi;
use w5d4_esercizi;
show tables;
create table fornitori (
	fornitore_id int auto_increment primary key,
    nome_fornitore varchar (50),
    prodotto_id int,
    nome_prodotto varchar (50),
    categoria varchar (25)
    );
create table prodotti (
	prodotto_id int auto_increment primary key,
    nome_prodotto varchar (50),
    categoria varchar (25),
    prezzo decimal (12, 2),
    fornitore_id int,
    nome_fornitore varchar (50)
    );
create table scontrini (
	scontrino_id int auto_increment primary key,
    prodotto_id int,
    nome_prodotto varchar (50),
    prezzo decimal (12,2),
    quantità int,
    cliente_id int,
    data_acquisto date
    );
create table clienti (
	cliente_id int auto_increment primary key,
    nome_cliente varchar (25),
    indirizzo varchar (50),
    scontrino_id int
    );
 insert into fornitori (nome_fornitore, nome_prodotto, categoria)
 values ("arcadinoè", "virtuedog_10kg", "cibo_secco"),
		("abbraccifelini", "erba_gatta", "snack"),
		("elementoanimale", "gioco_pallaL", "accessori");
insert into prodotti (nome_prodotto, categoria, prezzo, nome_fornitore)
values ("virtuedog_10kg", "cibo_secco", 50, "arcadinoè"),
       ("vivacat_1.5kg", "cibo_secco", 15, "arcadinoè"),
       ("erba_gatta", "snack", 3, "abbraccifelini"),
       ("gioco_pallaL", "accessori", 7, "elementoanimale"),
       ("gioco_pallaXS", "accessori", 3, "elementoanimale");
insert into scontrini (nome_prodotto, prezzo, quantità)
values ("virtuedog_10kg", 100, 2),
       ("erba_gatta", 3, 1),
       ("vivacat_1.5kg", 15, 1),
       ("gioco_pallaXS", 3, 1),
       ("virtuedog_10kg", 50, 1),
       ("gioco_pallaL", 21, 3);
insert into clienti (nome_cliente, indirizzo)
values ("colombo carlotta", "bergamo"),
       ("sangalli stefano", "bergamo"),
       ("rossi aldo", "lecco"),
       ("bianchi alessio", "milano");
alter table fornitori
add constraint fk_prodotti_fornitori foreign key (prodotto_id) references prodotti (prodotto_id);
alter table prodotti
add constraint fk_fornitori_prodotti foreign key (fornitore_id) references fornitori (fornitore_id);
alter table scontrini
add constraint fk_prodotti_scontrini foreign key (prodotto_id) references prodotti (prodotto_id);
alter table scontrini
add constraint fk_clienti_scontrini foreign key (cliente_id) references clienti (cliente_id);
alter table clienti
add constraint fk_scontrini_clienti foreign key (scontrino_id) references scontrini (scontrino_id);
show tables;
describe fornitori;
select * from fornitori;
describe prodotti;
select * from prodotti;
describe scontrini;
select * from scontrini;
describe clienti;
select * from clienti;
