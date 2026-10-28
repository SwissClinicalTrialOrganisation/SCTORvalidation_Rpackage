# Convert number of dependencies to a score

Risk score in \[0, 1\] from the number of dependencies, following the
riskmetric package: a logistic curve with midpoint 4 and growth rate
0.5, \$\$s(x) = 1 / (1 + exp(-0.5 (x - 4)))\$\$ rescaled so that 0
dependencies give 0: \$\$score = (s(x) - s(0)) / (1 - s(0))\$\$ This is
metric 5 of the SCTO package risk assessment SOP.

## Usage

``` r
convert_deps_to_score(deps)
```

## Arguments

- deps:

  number of dependencies

## Details

See [riskmetric
documentation](https://pharmar.github.io/riskmetric/reference/metric_score.pkg_metric_dependencies.html)
for further details.

## See also

[riskmetric
documentation](https://pharmar.github.io/riskmetric/reference/metric_score.pkg_metric_dependencies.html),
[`convert_downloads_to_score`](convert_downloads_to_score.md)
