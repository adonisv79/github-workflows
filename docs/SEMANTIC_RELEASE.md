> [BACK](/README.md)

# Semantic Release and CommitLint

One of the most popular tools for managing releases is the Semantic-Release(https://github.com/semantic-release/semantic-release) project. It uses Conventional commit which we can enfore using [CommitLint](https://github.com/conventional-changelog/commitlint/#what-is-commitlint)

## Setting the necessary libraries

Do the following in your project

* Make sure you have first installed [husky](/docs/HUSKY.md) as it is needed by this for enforcing commitlint rules
* Install semantic-release stuffs and commitlint as dev dependencies
  * `npm install --save-dev @commitlint/cli @commitlint/config-conventional`
  * `npm install --save-dev semantic-release @semantic-release/commit-analyzer @semantic-release/release-notes-generator @semantic-release/changelog @semantic-release/npm @semantic-release/git @semantic-release/github`

* create a `commitlint.config.js` configuration file in the root and copy-paste the following

    ```
    module.exports = {
      extends: ["@commitlint/config-conventional"],
      rules: {
        'body-max-line-length': [2, 'always', 300],
        'footer-max-line-length': [0],
        'subject-case': [0], // Disable subject case rule
      },
    };
    ```

* inside the `.husky` folder on your project root add file named `commit-msg` in it (if it does not exist) and enter the following

    ```
    npx --no-install commitlint --edit "$1"

    ```

* inside your `package.json` add the following. Note to replace 'main' with whatever master branch is used and the repository.url is correctly pointing to your repo.

    ```
    "scripts": {
      "release": "semantic-release"
    }
    "repository": {
      "type": "git",
      "url": "https://github.com/your-username/your-repo.git"
    },
    "release": {
      "branches": [
        "main"
      ],
      "plugins": [
        "@semantic-release/commit-analyzer",
        "@semantic-release/release-notes-generator",
        "@semantic-release/changelog",
        [
          "@semantic-release/npm",
          {
            "npmPublish": false
          }
        ],
        [
          "@semantic-release/git",
          {
            "assets": [
              "package.json",
              "package-lock.json",
              "CHANGELOG.md"
            ]
          }
        ],
        "@semantic-release/github"
      ]
    }
    ```

* Try making a non-compliant commit `git commit -m "invalid message"`. You will receive the following error

```
⧗   input: invalid message 3
✖   subject may not be empty [subject-empty]
✖   type may not be empty [type-empty]

✖   found 2 problems, 0 warnings
ⓘ   Get help: https://github.com/conventional-changelog/commitlint/#what-is-commitlint

husky - commit-msg script failed (code 1)
```

* Now try using a valid commit message `git commit -m "feat: valid message"`. This will now allow the commit to proceed

* perform a semantic-release dry run to test your setup `npx semantic-release --dry-run`

## Automating releases

Of course the goal is automation so we need to get the CICD part going. 

* First copy the Semantic-release workflow file found here in `.github/workflows/semantic-release.yaml` into your own project.
* Commit the changes into your main. The github actions will trigger for this like so...

    ![Github actions running icon](/docs/images/github-commits-workflow-running.png)

* click on that for details. The following is a successful commit

    ![Semantic Release workflow success](/docs/images/github-commits-semanticrelease-succes.png)

* If you go into your releases page, there will be a new publish tag.

    ![Github new published release tag](/docs/images/github-publish-tag.png)
