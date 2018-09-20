# GOV.UK OAuth2 Proxy for Docker

A Dockerfile for running Bitly's OAuth2 Proxy.

## Usage

`docker run -p <your port>:4180 -v <local conf path>:/conf --name oauth2-proxy govuk/govuk-oauth2-proxy-docker`

* `<your port>` can be any free port of your choice.
* `<local conf path>` should be the path to a directory that contains a file named `oauth2_proxy.cfg` with configuration directives

[The upstream repository](https://github.com/bitly/oauth2_proxy) has more details on configuring the OAuth2 Proxy.

## Building a new image

This process builds a new Docker image from the Dockerfile and pushes it to the Docker Registry for public use.

All commands are run inside the directory containing the Dockerfile.

1. `docker login`, providing the username and password of the `govukci` Docker Hub user (credentials in the [2nd line password store](https://github.com/alphagov/govuk-secrets/blob/master/pass/2ndline/docker/govukci.gpg))
2. `docker build .` to build a Docker image from the Dockerfile
3. `docker tag <image id> govuk/govuk-oauth2-proxy-docker`, where `<image id>` is the ID of the Docker image built in step 2 (looks like `932dc390031e`)
4. `docker push govuk/govuk-oauth2-proxy-docker` to push the tagged Docker image to the Docker Registry
