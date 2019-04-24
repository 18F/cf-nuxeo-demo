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
cf push nuxeo-dev -k 3600M --docker-image pburkholder/nuxeo -t 180 -m 1G
```

Notes:
- `-k 3600M`: Set disk limit since the full image is huge
- `--docker-image pburkholder/nuxeo`: See https://github.com/nuxeo/docker-nuxeo/issues/30
- `-t 180`: Allow 3 minutes for the health check to pass, instead of the
  default 1 minute
- `-m 1G`: Bump RAM quota from 512M to 1024M

That will get a bare instance up, but to add the web UI and sample content,
run:

```sh
cf set-env nuxeo-dev NUXEO_PACKAGES "nuxeo-dam nuxeo-web-ui nuxeo-platform-getting-started"
cf restage nuxeo-dev
```

## Contributing

See [CONTRIBUTING](CONTRIBUTING.md) for additional information.

## Public domain

This project is in the worldwide [public domain](LICENSE.md). As stated in [CONTRIBUTING](CONTRIBUTING.md):

> This project is in the public domain within the United States, and copyright and related rights in the work worldwide are waived through the [CC0 1.0 Universal public domain dedication](https://creativecommons.org/publicdomain/zero/1.0/).
>
> All contributions to this project will be released under the CC0 dedication. By submitting a pull request, you are agreeing to comply with this waiver of copyright interest.

