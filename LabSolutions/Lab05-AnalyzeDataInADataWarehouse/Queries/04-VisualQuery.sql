select [$Outer].[SalesOrderKey],
    [$Outer].[SalesOrderDateKey],
    [$Outer].[ProductKey],
    [$Outer].[CustomerKey],
    [$Outer].[Quantity],
    [$Outer].[SalesTotal],
    [$Inner].[ProductName]
from [CF_Demo_Warehouse_DC].[dbo].[FactSalesOrder] as [$Outer]
left outer join 
(
    select [_].[ProductKey] as [ProductKey2],
        [_].[ProductAltKey] as [ProductAltKey],
        [_].[ProductName] as [ProductName],
        [_].[Category] as [Category],
        [_].[ListPrice] as [ListPrice]
    from [CF_Demo_Warehouse_DC].[dbo].[DimProduct] as [_]
) as [$Inner] on ([$Outer].[ProductKey] = [$Inner].[ProductKey2])