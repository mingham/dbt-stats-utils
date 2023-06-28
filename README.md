# dbt-stats-utils

This package contains several useful macros to investigate the distributions of fields in your models.


# Contents
* [get_lorenz](#get_lorenz-source)

# Installation instructions
This package is not yet on [dbt hub](https://hub.getdbt.com/) so please install via git

<!-- New to dbt packages? Read more about them [here](https://docs.getdbt.com/docs/building-a-dbt-project/package-management/).
1. Include this package in your `packages.yml` file — check [here](https://hub.getdbt.com/dbt-labs/audit_helper/latest/) for the latest version number.
2. Run `dbt deps` to install the package. -->

# Macros
## get_lorenz ([source](macros/get_lorenz.sql))
This macro generates SQL that will compute the [Lorenz curve](https://demonstrations.wolfram.com/TheLorenzCurve/) for the specified field.  An optional group_by parameter controls the x-axis (sorting) variable.

Originally designed to measure wealth concentration across the population, this measure can easily be applied to other data such as sales to assess concentration (eg, to provide insights such as; the top 10% of buyers may account for 90% of sales)

Usage: [see here](models/example/lorenz_sales.sql)