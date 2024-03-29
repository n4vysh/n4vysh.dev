# Check codes with hooks
test:
    lefthook run pre-commit
    lefthook run commit-msg

# List available commands
list:
    ./scripts/list.bash

deploy:
    just infra/deploy

# format yaml files with prettier
fmt-yaml *target:
    prettier --parser yaml --write --list-different {{ target }}

# format toml files with taplo
fmt-toml *target:
    taplo format {{ target }}

# format markdown files with markdownlint
fmt-md *target:
    markdownlint --fix {{ target }}

# format justfile with just --fmt option
fmt-just:
    just --fmt --unstable

# format shell scripts with shfmt
fmt-bash-shfmt *target:
    shfmt -w {{ target }}

# format shell scripts with shellharden
fmt-bash-shellharden *target:
    shellharden --replace {{ target }}

# check yaml files with prettier
check-yaml *target:
    prettier --parser yaml --check {{ target }}

# check justfile with just --fmt option
check-just:
    just --fmt --check --unstable

# check shell scripts with shfmt
check-bash-shfmt *target:
    shfmt -d {{ target }}

# check shell scripts with shellharden
check-bash-shellharden *target:
    shellharden --check {{ target }}

# check all files with editorconfig-checker
lint-file-format *target:
    ec {{ target }}

# check yaml files with yamllint
lint-yaml *target:
    yamllint {{ target }}

# check toml files with taplo
lint-toml *target:
    taplo lint {{ target }}

# check markdown files with markdownlint
lint-md-markdownlint *target:
    markdownlint {{ target }}

# check markdown files with markdown-link-check
lint-md-markdown-link-check *target:
    markdown-link-check --config .markdown-link-check.json {{ target }}

# check markdown files with vale
lint-md-vale *target:
    vale {{ target }}

# check commit message with commitlint
lint-commit-commitlint:
    ./scripts/commitlint.bash

# detect hardcoded secrets with gitleaks
lint-commit-gitleaks:
    gitleaks protect --verbose --redact --staged

# check shell scripts with shellcheck
lint-bash *target:
    shellcheck -s bash {{ target }}

# check common misspellings in text files with typos
lint-text *target:
    typos --hidden {{ target }}

# check GitHub Actions workflow files with actionlint
lint-ci *target:
    actionlint {{ target }}
