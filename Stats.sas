proc timeseries data=retail.sales out=ts_sales;
    id Date interval=day accumulate=total;
    var Sales;
run;

proc timeseries data=ts_sales outdecomp=decomposed;
    id Date interval=day;
    var Sales;
run;

proc print data=decomposed;
run;

proc sgplot data=decomposed;
    series x=Date y=Trend / lineattrs=(color=blue);
    series x=Date y=Seasonal / lineattrs=(color=green);
    series x=Date y=Residual / lineattrs=(color=red);
    title "Decomposed Time Series Components";
run;
