# Hook for collecting user-defined chunk risk level in markdown documents

This is a function that can be used with Rmarkdown or quarto to collect
the risk associated with a particular chunk. The risk level can then be
tabulated towards the end of the document to give an overview of the
risk associated with the product.

## Usage

``` r
risk_hook(options, before)
```

## Arguments

- options:

  chunk options

- before:

  whether the hook is called before or after the chunk (only before does
  anything)

## Examples

``` r
# in e.g. setup chunk
knitr::knit_hooks$set(risk = SCTORvalidation::risk_hook)
RISKENV <- new.env()

# as a chunk option
#```{r highriskchunk, echo=FALSE, risk = "high"}
#```{r mediumriskchunk, echo=FALSE, risk = "medium"}
#```{r lowriskchunk, echo=FALSE, risk = "low"}

# towards the end of the script, tabulate RISKENV$chunk_risk for an overview
```
