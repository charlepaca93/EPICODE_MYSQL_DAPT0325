#esercizio 1
show databases;
use AdventureWorksDW;
create view Product as (
	select
		p.ProductKey,
        p.EnglishProductName,
        s.EnglishProductSubcategoryName,
        c.EnglishProductCategoryName
	from dimproduct p
    left join dimproductsubcategory s
    on p.ProductSubcategoryKey = s.ProductSubcategoryKey
    left join dimproductcategory c
    on s.ProductCategoryKey = c.ProductCategoryKey);
#esercizio 2
create view Reseller as (
	select
		r.ResellerName,
        g.City,
        g.EnglishCountryRegionName
	from reseller r
    left join dimgeography g
    on r.GeographyKey = g.GeographyKey);
#esercizio 3
create view Sales as (
	select
		OrderDate,
        SalesOrderNumber,
        SalesOrderLineNumber,
        OrderQuantity,
        SalesAmount,
        SalesAmount - TotalProductCost as TotalRevenue
	from factresellersales f);
#esercizio 4 - report su excel
