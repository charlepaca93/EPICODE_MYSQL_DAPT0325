#esercizi 1A-2A
show databases;
use AdventureWorksDW;
show tables;
describe dimproduct;
select * from dimproduct;
#esercizi 3A-4A
select
	ProductKey as "prodotto_ID",
    ProductAlternateKey as "alt_prodotto_ID",
    EnglishProductName as "nome_prodotto",
    Color as "colore",
    StandardCost as "prezzo",
    FinishedGoodsFlag as "prodotto_finito"
from dimproduct
where FinishedGoodsFlag = 1;
#esercizio 5A
select 
	ProductKey,
    ProductAlternateKey,
    EnglishProductName,
    StandardCost,
    ListPrice
from dimproduct
where ProductAlternateKey like "FR%"
or ProductAlternateKey like "BK%";
#esercizio 1B
select
ProductKey,
ProductAlternateKey,
EnglishProductName,
StandardCost,
ListPrice,
ListPrice - StandardCost as Markup
from dimproduct
where (ProductAlternateKey like "FR%"
or ProductAlternateKey like "BK%")
and ListPrice - StandardCost is not null; #in aggiunta per togliere valori null
#esercizio 2B
select
	ProductKey,
	ProductAlternateKey,
    EnglishProductName,
    StandardCost,
    ListPrice,
    FinishedGoodsFlag
from dimproduct
where FinishedGoodsFlag = 1
and ListPrice between 1000 and 2000
order by ListPrice asc; #in aggiunta per riordinare i valori
#esercizio 3B
describe dimemployee;
select * from dimemployee;
select distinct DepartmentName
from dimemployee; #in aggiunta durante la correzione dell'esercizio
#esercizio 4B
select
	EmployeeKey,
    FirstName,
    LastName,
    Title,
    DepartmentName,
    Position,
    SalesPersonFlag
from dimemployee
where SalesPersonFlag = 1
order by EmployeeKey; #in aggiunta per riordinare i valori
#esercizio 5B
describe factresellersales;
select * from factresellersales;
select
	SalesOrderNumber,
    SalesOrderLineNumber,
    OrderDate,
    ProductKey,
    OrderQuantity,
    UnitPrice,
    TotalProductCost,
    SalesAmount,
    SalesAmount - TotalProductCost as TotalRevenue
from factresellersales
where ProductKey in (597, 598, 477, 214)
and OrderDate >= "2020-01-01";
