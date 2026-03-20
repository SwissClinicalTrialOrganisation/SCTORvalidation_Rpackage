# Map a domain from one range to another

Map a domain from one range to another

## Usage

``` r
domain_mapper(
  value,
  min_original = 0,
  max_original = 1,
  min_range = 0,
  max_range = 1
)
```

## Arguments

- value:

  value to map from

- min_original:

  minimum of the original domain

- max_original:

  maximum of the original domain

- min_range:

  minimum of the desired domain

- max_range:

  maximum of the desired domain

## Value

values mapped to the new domain, typically a vector or single value.

## Examples

``` r
if (FALSE) { # \dontrun{
domain_mapper(0.5, 0, 1, 0, 100)
} # }
```
