# Husky

Husky is one of the most popular library used in the nodejs enterprise project realm. It provides the enforcement of best practices by allowing repo owners to force prechecks on commit data and execute scripts and break when important items are missed.

To use this, in your project

* install husky as a dev dependency `npm install --save-dev husky`
* configure the project to work with husky `npx husky init`. This will ass a `prepare` script in your package.json for husky as well as add a `pre-commit` script for your project that runs the `test` script.
* perform a commit. If your test script is not yet available or has issues, the commit would be blocked by it.