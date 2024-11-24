> [BACK](/README.md)

# Docker Package Deployment to GHCR

Part of our CICD workflow should be deploying our containers to our container registry. Personally we prefer to limit our stack so since we already use github, might as well utilize the Github Container registry (GHCR) vs. using thrid parties like Dockerhub, GCP, AWS, etc.

In this project, we have a `sample-app` vite reactjs app to demo. It just serves the original basic template page provided by vite. We also have a `Dockerfile` config in the root which we will use to generate the docker image. We can test the docker by running the scripts `npm run docker:build` to build the image locally and `npm run docker:run` to start the container locally (make sure to have docker installed in your machine). You should be able to see it in [http://localhost:3000](http://localhost:3000)

## Setting your project

* Make sure you have set your the `Dockefile` locally and it works
* copy the `./github/workflows/ghcr-package-deployment.yaml` into your workflows. make sure the trigger is correct as this was made to trigger on the completion of `./github/workflows/semantic-release.yaml`
* test this by triggering the workflow (i.e. commit to main). You should see that the package will be deployed to your repository

    ![Package deployed](/docs/images/github-package-deployed.png)

* Click the link so you can see the package versions you have published.adonisv79/github-workflows:latest`

    ![Package run locally](/docs/images/github-package-pull.png)

* now let's test the image by pulling the image and running into your local. Note that by default, GHCR will copy the visibility settings of your repo. If it is a private repo, the packages cannot be handled publicly. If you want it change this, go to the `Package settings` page (accessed from the Repo Pagkage's page found in the right sidebar). click and set the visibility to private or public. (Note: Using private will require you to use PAT with the necessary package permissions)
  * to speed up our sample, make sure that the package visibility is public
  * Pull the image. Ex: `docker pull ghcr.io/adonisv79/adonisv79/github-workflows:latest`
  * Run the image. Ex: `docker run -p 3000:80 ghcr.io/adonisv79/adonisv79/github-workflows:latest`
  * In our sample, the sample vite app will be visible on localhost:3000 served by the container.