#esercizio 1A
show databases;
use AdventureWorksDW;
show tables;
describe dimproduct;
describe dimproductsubcategory;
select
	p.ProductKey,
	p.EnglishProductName,
    s.ProductSubcategoryKey,
    s.EnglishProductSubcategoryName,
    s.ProductCategoryKey
from dimproduct p
left join dimproductsubcategory s
on p.ProductSubcategoryKey = s.ProductSubcategoryKey;
#esercizio 2A
describe dimproductcategory;
select
	p.ProductKey,
    p.EnglishProductName,
    s.ProductSubcategoryKey,
    s.EnglishProductSubcategoryName,
    c.ProductCategoryKey,
    c.EnglishProductCategoryName
from dimproduct p
left join dimproductsubcategory s
on p.ProductSubcategoryKey = s.ProductSubcategoryKey
left join dimproductcategory c
on s.ProductCategoryKey = c.ProductCategoryKey
where s.EnglishProductSubcategoryName is not null; #in aggiunta per togliere valori null
#esercizio 3A
#risolvibile con join o con subquery
#inserisco select distinct per evitare doppioni
#non inserisco f.SalesOrderNumber per evitare più di 50000 righe di valori
describe factresellersales;
select distinct
	p.ProductKey,
    p.EnglishProductName,
	s.ProductSubcategoryKey,
    s.EnglishProductSubcategoryName,
    c.ProductCategoryKey,
    c.EnglishProductCategoryName
from dimproduct p
join factresellersales f
on p.ProductKey = f.ProductKey
left join dimproductsubcategory s
on p.ProductSubcategoryKey = s.ProductSubcategoryKey
left join dimproductcategory c
on s.ProductCategoryKey = c.ProductCategoryKey;
#SUBQUERY	-- select * 
#			-- from dimproduct p
#			-- where p.ProductKey in (
#			-- 		select distinct ProductKey
#			--		from factresellersales);
#perciò in alternativa ho:
select
	p.ProductKey,
	p.EnglishProductName,
    s.ProductSubcategoryKey,
	s.EnglishProductSubcategoryName,
    c.ProductCategoryKey,
	c.EnglishProductCategoryName
from dimproduct p
left join dimproductsubcategory s 
on p.ProductSubcategoryKey = s.ProductSubcategoryKey
left join dimproductcategory c
on s.ProductCategoryKey = c.ProductCategoryKey
where p.ProductKey in (
	select distinct ProductKey
	from factresellersales);
#esercizio 4A
select
	p.ProductKey,
	p.EnglishProductName,
    s.ProductSubcategoryKey,
	s.EnglishProductSubcategoryName,
    c.ProductCategoryKey,
	c.EnglishProductCategoryName
from dimproduct p
left join dimproductsubcategory s 
on p.ProductSubcategoryKey = s.ProductSubcategoryKey
left join dimproductcategory c
on s.ProductCategoryKey = c.ProductCategoryKey
where FinishedGoodsFlag = 1 
and p.ProductKey not in (
	select ProductKey
	from factresellersales);
#esercizio 5A e 1B
#non riesco a diminuire i 50000 valori e quindi li lascio per portare a casa la consegna
select
	p.ProductKey,
	p.EnglishProductName,
    s.ProductSubcategoryKey,
	s.EnglishProductSubcategoryName,
    c.ProductCategoryKey,
	c.EnglishProductCategoryName,
    f.SalesOrderNumber,
    f.SalesOrderLineNumber,
    f.OrderQuantity,
    f.UnitPrice,
    f.SalesAmount
from dimproduct p
join factresellersales f
on p.ProductKey = f.ProductKey
left join dimproductsubcategory s 
on p.ProductSubcategoryKey = s.ProductSubcategoryKey
left join dimproductcategory c
on s.ProductCategoryKey = c.ProductCategoryKey
order by SalesOrderNumber asc, SalesOrderLineNumber asc; #in aggiunta per ordinare le transazioni
#esercizio 2B
describe dimreseller;
select *
from dimreseller;
#esercizio 3B
select
	r.ResellerKey,
    r.ResellerName,
    r.BusinessType,
    g.GeographyKey,
    g.City,
    g.StateProvinceName,
    g.EnglishCountryRegionName
from dimreseller r
left join dimgeography g
on r.GeographyKey = g.GeographyKey
order by r.ResellerName asc; #in aggiunta per ordinare i valori
#esercizio 4B
#provo la join solo con le categorie richieste, senza inserire le colonne "-key"
#probabilmente numero di valori impressionante
select distinct
	f.SalesOrderNumber,
    f.SalesOrderLineNumber,
    f.OrderDate,
    f.OrderQuantity,
    f.UnitPrice,
    f.TotalProductCost,
	p.EnglishProductName,
    c.EnglishProductCategoryName,
    r.ResellerName,
    g.EnglishCountryRegionName
from dimproductcategory c
right join dimproductsubcategory s
on c.ProductCategoryKey = s.ProductCategoryKey
right join dimproduct p
on s.ProductSubcategoryKey = p.ProductSubcategoryKey
right join factresellersales f
on p.ProductKey = f.ProductKey
right join dimreseller r
on f.ResellerKey = r.ResellerKey
right join dimgeography g
on r.GeographyKey = g.GeographyKey
where f.SalesOrderNumber is not null;
