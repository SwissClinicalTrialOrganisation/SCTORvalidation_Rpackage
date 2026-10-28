# Convert number of downloads to a score

Risk score in \[0, 1\] from the number of downloads in the last 12
months, following the riskmetric package's simplification of the
logistic curve: \$\$score = 1.5 / (downloads / 100000 + 1.5)\$\$ 0
downloads give 1, 150,000 give 0.5, many downloads approach 0. `NA`
counts as 0 downloads. This is metric 8 of the SCTO package risk
assessment SOP.

## Usage

``` r
convert_downloads_to_score(downloads)
```

## Arguments

- downloads:

  number of downloads

## Details

See [riskmetric
documentation](https://pharmar.github.io/riskmetric/reference/metric_score.pkg_metric_downloads_1yr.html)
for further details.

## See also

[riskmetric
documentation](https://pharmar.github.io/riskmetric/reference/metric_score.pkg_metric_downloads_1yr.html),
[`convert_deps_to_score`](convert_deps_to_score.md)
