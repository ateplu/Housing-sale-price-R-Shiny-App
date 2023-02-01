---
output:
  html_document: default
  pdf_document: default
---
R-Shiny Application `Texas housing sale price`
==================================
author: Anna Teplukhina
date: 14 July 2022



Overview
==================================
This Shiny App is dedicated to predicting housing median sale prices (MSP) in multiple Texas cities. There are multiple factors that can affect the final price, in particular: location/city; season/month; year itself since house prices usually go up.

This application predicts a median sale price per city, month and year. To build a predictive linear model the data set `txhousing` collected in 2000-2015 is used.

Here one can find the Shiny application: [https://ateplu.shinyapps.io/Texas-housing-sale-price/](https://ateplu.shinyapps.io/Texas-housing-sale-price/)

A corresponding GitHub project with ui.R and server.R files is available here:
[https://github.com/ateplu/Housing-sale-price-R-Shiny-App](https://github.com/ateplu/Housing-sale-price-R-Shiny-App)

Data overview 1
==================================
First, let's look at the data set `txhousing`.

```
# A tibble: 5 x 4
  city     year month median
  <chr>   <int> <int>  <dbl>
1 Abilene  2000     1  71400
2 Abilene  2000     2  58700
3 Abilene  2000     3  58100
4 Abilene  2000     4  68600
5 Abilene  2000     5  67300
```
To get a certain MSP, in this application a user should specify a city, a month and a year. Data points are fitted as `median` vs `year` for selected `city` and `month`.

Data overview 2
==================================
There are 46 cities and data are collected for years 2000-2015 for each month.

```r
summary(unique(txhousing$city))
```

```
   Length     Class      Mode 
       46 character character 
```

```r
unique(txhousing$year)
```

```
 [1] 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014
[16] 2015
```

Sample plot for Austin
==================================
Here is a sample plot made for Austin data with `ggplot2`. During the year price changes depend on the season (January seems to be a low one).
The observed trend is a continuous increase in MSP.
![plot of chunk unnamed-chunk-3](Developing-Data-Products-Course-Project-figure/unnamed-chunk-3-1.png)





