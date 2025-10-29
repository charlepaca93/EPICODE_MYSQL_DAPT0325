#esercizio 1A
show databases;
use AdventureWorksDW;
show tables;
describe dimproduct;
#sercizio 2A
describe factresellersales;
select
	SalesOrderNumber,
    SalesOrderLineNumber,
    count(*)
from factresellersales
group by SalesOrderNumber, SalesOrderLineNumber
having count(*) > 1;
#esercizio 3A
select
	SalesOrderNumber,
	SalesOrderLineNumber,
    OrderDate,
	count(SalesOrderLineNumber)
from factresellersales
group by OrderDate
having OrderDate >= "2020-01-01";
#esercizio 4A
select
	p.EnglishProductName as Product,
    sum(f.SalesAmount) as TotalRevenue,
    sum(f.OrderQuantity) as TotalQuantity,
	round(avg(f.UnitPrice), 2) as AveragePrice #inserisco round per arrotondare
from dimproduct p
left join factresellersales f
on p.ProductKey = f.ProductKey
where f.OrderDate >= "2020.01.01"
group by p.EnglishProductName;
#esercizio 1B
select
	c.EnglishProductCategoryName as ProductCategory,
    sum(f.SalesAmount) as TotalRevenue,
    sum(f.OrderQuantity) as TotalQuantity
from dimproduct p
left join dimproductsubcategory s
on p.ProductSubcategoryKey = s.ProductSubcategoryKey
left join dimproductcategory c
on s.ProductCategoryKey = c.ProductCategoryKey
left join factresellersales f
on p.ProductKey = f.ProductKey
group by c.EnglishProductCategoryName;
#esercizio 2B
select
	g.City,
    sum(f.SalesAmount)
from dimgeography g
left join dimreseller r
on g.GeographyKey = r.GeographyKey
left join factresellersales f
on r.ResellerKey = f.ResellerKey
where f.OrderDate >= "2020-01-01"
group by g.City
having sum(f.SalesAmount) > 60000;
