proc fastclus data=store_performance out=clusters maxclusters=3;
    var TotalSales AvgSales;
run;

proc print data=clusters;
run;

proc sgplot data=clusters;
    scatter x=TotalSales y=AvgSales / group=Cluster;
    title "Cluster Analysis of Stores Based on Sales Performance";
run;
