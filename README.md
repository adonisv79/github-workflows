# github-workflows

This guide serves as our cheatsheet for managing common enterprise github action (workflow) templates. 

* sample-app - this is just a basic ReactJS typescript app created using vite via `npm create vite@latest sample-app`. Its purpose is to be the sample app we deploy via our CICD github action workflows.


## Semantic Release and automatied version bump

One of the most important workflow for any organization is the release versioning and when to update the package.json version. semantic-release aides deployment by generating a version bump (using semver) based on the commit message provided. See more in [Semver Guide](/docs/SEMANTIC_RELEASE.md)

## Docker Package deployment to Github Container registry

(Applicable to container projects) Once a github version is created, we need to publish our Package's Container Image. This should be automated aftermerge to main particularly after the version of the package is bumped already. See more in [Docker Deployment to GHCR](/docs/GHCR_DOCKER_PACKAGE_DEPLOYMENT.md)