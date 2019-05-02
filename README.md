# ECMS pilot

## Why this project

Here are the goals of this project and how we'll measure its success.

- Demonstrate running an open-source Enterprise Content Management (ECM)
  system on cloud.gov.
  - Current target product: [Nuxeo](https://www.nuxeo.com)
- Demonstrate enough of a ECM system to model a real world workflow
- Provide a basis for a competition RFP

## Quick Start

```sh
cf push nuxeo
```

The above command will run a standalone Docker container with an embedded database and elasticsearch.  All you work will be lost if the container restarts.


By default, this will allocate Nuxeo to a "random route" in your Foundry, for example, `nuxeo-insightful-cat.app.cloud.gov`. 


## Adding backing services

```sh
cf create-service aws-rds shared-psql database

## Contributing

See [CONTRIBUTING](CONTRIBUTING.md) for additional information.

## Public domain

This project is in the worldwide [public domain](LICENSE.md). As stated in [CONTRIBUTING](CONTRIBUTING.md):

> This project is in the public domain within the United States, and copyright and related rights in the work worldwide are waived through the [CC0 1.0 Universal public domain dedication](https://creativecommons.org/publicdomain/zero/1.0/).
>
> All contributions to this project will be released under the CC0 dedication. By submitting a pull request, you are agreeing to comply with this waiver of copyright interest.

