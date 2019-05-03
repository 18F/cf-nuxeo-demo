# ECMS pilot

## Why this project

Goals of this project:

- Demonstrate running an open-source Enterprise Content Management (ECM)
  system on cloud.gov.
  - Current target product: [Nuxeo](https://www.nuxeo.com)
- Demonstrate enough of a ECM system to model a real world workflow
- Provide a basis for a competition RFP

Why Nuxeo?

* It's open-source, well-supported and has an active community
* It has an architecture that can run [at scale](https://doc.nuxeo.com/nxdoc/nuxeo-cluster-scalability-options/), on any Cloud Foundry that has DBs, S3-style storage, Redis and Elasticsearch, like [cloud.gov](https://cloud.gov).


Why Docker?

For this initial proof-of-concept, rewriting the steps in the [upstream Dockerfiles](https://github.com/nuxeo/docker-nuxeo) for Cloud Foundry wasn't something we wanted to take on. There's a downside that this currently relies on Docker images in a team member's personal repository.

## Quick Start

You can push the Docker image to cloud.gov by running:

```sh
cf push nuxeo
```

The above command will run a standalone Docker container with an embedded database and elasticsearch.  All your work will be lost if the container restarts. By default, this will allocate Nuxeo to a "random route" in your Foundry, for example, `nuxeoquick-insightful-cat.app.cloud.gov`. 

## Adding backing services

To get closer to a working system with persistent backing services on cloud.gov, run the commands below, substituting in your preferred name for `<your_preferred_name>`

```sh
cf create-service aws-rds shared-psql database
cf push nuxeo-persist --hostname <your_perferred_name>
```

When the push completes, your Nuxeo will be available at: https://&lt;your_preferred_name&gt;app.cloud.gov, and will be using the provisioned Postgres database.


## Contributing

See [CONTRIBUTING](CONTRIBUTING.md) for additional information.

## Public domain

This project is in the worldwide [public domain](LICENSE.md). As stated in [CONTRIBUTING](CONTRIBUTING.md):

> This project is in the public domain within the United States, and copyright and related rights in the work worldwide are waived through the [CC0 1.0 Universal public domain dedication](https://creativecommons.org/publicdomain/zero/1.0/).
>
> All contributions to this project will be released under the CC0 dedication. By submitting a pull request, you are agreeing to comply with this waiver of copyright interest.
