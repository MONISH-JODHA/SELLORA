proc sql;
    create table store_performance as
    select StoreID,
           sum(Sales) as TotalSales,
           mean(Sales) as AvgSales
    from retail.sales
    group by StoreID
    order by TotalSales desc;
quit;

proc print data=store_performance;
run;
