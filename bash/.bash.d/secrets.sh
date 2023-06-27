#!/bin/bash
# op vault create dev
# op item create --vault dev --category password --title NAME password=VALUE
# export-secret NAME

function export-secret() {
    local variable=

    for variable
    do
        export $variable=$(op read op://dev/$variable/password)
    done
}

export-secret \
    ATLAS_API_TOKEN \
    DEPENDABOT_REBASE_ALL_GITHUB_TOKEN \
    OPENAI_API_KEY

# dependabot-rebase-all: comment on PRs
