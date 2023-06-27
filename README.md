# dbt-distributions

This package contains several useful macros to investigate the distributions of fields in your models.


# Contents
* [get_lorenz](#get_lorenz-source)

# Installation instructions
This package is not yet on [dbt hub](https://hub.getdbt.com/) so install via git clone

<!-- New to dbt packages? Read more about them [here](https://docs.getdbt.com/docs/building-a-dbt-project/package-management/).
1. Include this package in your `packages.yml` file — check [here](https://hub.getdbt.com/dbt-labs/audit_helper/latest/) for the latest version number.
2. Run `dbt deps` to install the package. -->

# Macros
## get_lorenz ([source](macros/get_lorenz.sql))
This macro generates SQL that will compute the [Lorenz curve](https://demonstrations.wolfram.com/TheLorenzCurve/) for the specified field.  An optional group_by parameter controls the x-axis (sorting) variable.

Originally designed to measure wealth concentration across the population, this measure can easily be applied to other data such as sales to assess concentration (eg, to provide insights such as; the top 10% of buyers may account for 90% of sales)


| in_a  | in_b  | count | percent_of_total |
|-------|-------|------:|-----------------:|
| True  | True  | 6870  | 99.74            |
| True  | False | 9     | 0.13             |
| False | True  | 9     | 0.13             |

Setting the `summarize` argument to `false` lets you check which rows do not match between relations:

| order_id | order_date | status    | in_a  | in_b  |
|----------|------------|-----------|-------|-------|
| 1        | 2018-01-01 | completed | True  | False |
| 1        | 2018-01-01 | returned  | False | True  |
| 2        | 2018-01-02 | completed | True  | False |
| 2        | 2018-01-02 | returned  | False | True  |

