
# hdR

<!-- badges: start -->
<!-- badges: end -->

The goal of hdR is to download data from **Human Development Report
Office (HDRO)** using its API.

## Installation

You can install the development version of hdR from
[GitHub](https://github.com/) with:

``` r
# install.packages("remotes")
remotes::install_github("brunomioto/hdR")
```

## Example

``` r
library(hdR)

brazil <- country_indicators(country = "BRA",
                             year = 2020,
                             indicator = "hdi")

brazil
#> # A tibble: 1 × 5
#>   country      index                         indicator               year  value
#>   <chr>        <chr>                         <chr>                   <chr> <chr>
#> 1 BRA - Brazil HDI - Human Development Index hdi - Human Developmen… 2020  0.758
```
