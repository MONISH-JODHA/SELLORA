proc means data=retail.sales noprint;
    class StoreID;
    var Sales CustomerCount;
    output out=kpi_summary
        sum(Sales)=TotalSales
        mean(Sales)=AvgSales
        mean(CustomerCount)=AvgCustomerCount;
run;

proc print data=kpi_summary;
run;
