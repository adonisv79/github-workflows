module.exports = {
  extends: ["@commitlint/config-conventional"],
  rules: {
    'body-max-line-length': [2, 'always', 300], // we need to set this as commits of semantic-release can be quite detailed
    'footer-max-line-length': [0], // we need to set this as commits of semantic-release can be quite detailed
    'subject-case': [0], // Disable subject case rule
  },
};
