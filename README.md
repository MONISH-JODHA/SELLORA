

# Retail Sales Analysis with SAS

This project analyzes sales data for a chain of retail stores using SAS. The analysis aims to identify high-performing and low-performing outlets, compute essential key performance indicators (KPIs), and uncover patterns and trends in the sales data using advanced statistical techniques.

## Table of Contents
- [Introduction](#introduction)
- [Project Overview](#project-overview)
  - [Data Preparation](#data-preparation)
  - [Sales Data Examination](#sales-data-examination)
  - [KPI Computation](#kpi-computation)
  - [Data Visualization](#data-visualization)
  - [Advanced Statistical Techniques](#advanced-statistical-techniques)
- [Setup](#setup)
- [Usage](#usage)
- [License](#license)

## Introduction

This SAS project provides an in-depth analysis of retail sales data. The analysis includes identifying the performance of different retail outlets, computing key performance indicators (KPIs), and applying advanced statistical techniques to uncover patterns and trends. The results are visualized using various SAS procedures.

## Project Overview

### Data Preparation

```sas
libname retail 'path/to/your/dataset';

proc print data=retail.sales (obs=10);
run;
```

### Sales Data Examination

```sas
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
```

### KPI Computation

```sas
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
```

### Data Visualization

```sas
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
```

### Advanced Statistical Techniques

#### Time Series Analysis

```sas
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
```

#### Cluster Analysis

```sas
proc fastclus data=store_performance out=clusters maxclusters=3;
    var TotalSales AvgSales;
run;

proc print data=clusters;
run;

proc sgplot data=clusters;
    scatter x=TotalSales y=AvgSales / group=Cluster;
    title "Cluster Analysis of Stores Based on Sales Performance";
run;
```

## Setup

1. **Download and setup SAS:**
   Ensure you have SAS installed on your system. If you don't have it, you can download it from [SAS Software](https://www.sas.com/en_us/software/sas9.html).

2. **Load the data:**
   Place your sales dataset in the specified path and update the `libname` statement in the code accordingly.

## Usage

1. **Run the SAS scripts:**
   - Execute each script in your SAS environment to perform the respective analysis.
   - Follow the steps outlined in the project overview to sequentially run data preparation, examination, KPI computation, visualization, and advanced statistical techniques.

2. **Analyze the results:**
   - Observe the output tables and visualizations to gain insights into sales performance, KPIs, and trends.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

