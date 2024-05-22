proc sgplot data=store_performance;
    vbar StoreID / response=TotalSales;
    title "Total Sales per Store";
run;

proc sgplot data=store_performance;
    vbar StoreID / response=AvgSales;
    title "Average Sales per Store";
run;

proc sgplot data=kpi_summary;
    vbar StoreID / response=AvgCustomerCount;
    title "Average Customer Count per Store";
run;
