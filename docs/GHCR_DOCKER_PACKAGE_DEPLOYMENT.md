> [BACK](/README.md)

# Docker Package Deployment to GHCR

Part of our CICD workflow should be deploying our containers to our container registry. Personally we prefer to limit our stack so since we already use github, might as well utilize the Github Container registry (GHCR) vs. using thrid parties like Dockerhub, GCP, AWS, etc.

In this project, we have a `sample-app` vite reactjs app to demo. It just serves the original basic template page provided by vite. We also have a `Dockerfile` config in the root which we will use to generate the docker image. We can test the docker by running the scripts `npm run docker:build` to build the image locally and `npm run docker:run` to start the container locally (make sure to have docker installed in your machine). You should be able to see it in [http://localhost:3000](http://localhost:3000)

## Setting your project

* Make sure you have set your the `Dockefile` locally and it works
* copy the `./github/workflows/ghcr-package-deployment.yaml` into your workflows. make sure the trigger is correct as this was made to trigger on the completion of `./github/workflows/semantic-release.yaml`