# Semantic Release and CommitLint

One of the most popular tools for managing releases is the Semantic-Release(https://github.com/semantic-release/semantic-release) project. It uses Conventional commit which we can enfore using [CommitLint](https://github.com/conventional-changelog/commitlint/#what-is-commitlint)

## Setting the necessary libraries

Do the following in your project

* Make sure you have first installed [husky](/docs/HUSKY.md) as it is needed by this for enforcing commitlint rules
* Install semantic-release, commitlint and husky as dev dependency 
  * `npm install --save-dev @commitlint/cli @commitlint/config-conventional`
  * `npm install --save-dev semantic-release @semantic-release/changelog @semantic-release/commit-analyzer @semantic-release/release-notes-generator @semantic-release/changelog @semantic-release/npm @semantic-release/github`

* create a `commitlint.config.js` configuration file in the root and copy-paste the following

    ```
    module.exports = {
      extends: ["@commitlint/config-conventional"],
      rules: {
        'subject-case': [0], // Disable subject case rule
      },
    };

    ```

* inside the `.husky` folder on your project root add file named `commit-msg` in it if it does not exist and enter the following

    ```
    npx --no-install commitlint --edit "$1"

    ```

* Create a `releaserc.json` file in your root and add the following (Note: replace 'main' with whatever master branch is used)

    ```
    {
      "branches": ["main"],
      "plugins": [
        "@semantic-release/commit-analyzer",
        "@semantic-release/release-notes-generator",
        "@semantic-release/changelog",
        "@semantic-release/npm",
        "@semantic-release/github"
      ]
    }
    ```

* Go to your package.json file and make sure the following is set properly

    ```
    "repository": {
      "type": "git",
      "url": "https://github.com/your-username/your-repo.git"
    }
    ```

* Add also the scripts

    ```
    "scripts": {
      "release": "semantic-release"
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

