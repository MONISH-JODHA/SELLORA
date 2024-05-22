libname retail 'path/to/your/dataset';

proc print data=retail.sales (obs=10);
run;
