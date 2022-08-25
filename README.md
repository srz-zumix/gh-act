# gh-act

gh-act generates and configures event.json for [act][]

## Installation

> gh extension install srz-zumix/gh-act

## Usage

```sh
$ gh act pull_request
```

Create event.json in a temporary file, add it to the options of act and execute

```sh
$ gh act pull_request -e pull_request.json
```

gh-act does nothing if exist pull_request.json file.  
If pull_request.json is not exist, gh-act will generate it in the specified file.

Please check [test workflow][](Diff step) for the difference between the generated event.json and the actual event

[act]:https://github.com/nektos/act
[test workflow]:https://github.com/srz-zumix/gh-act/actions/workflows/main.yml

## Features

### Events

Supported Events

| Event                  | Configurable environment variables |
|:-----------------------|:-----------------------------------|
| branch_protection_rule |
| create                 |
| delete                 |
| discussion             | GHACT_DISCUSSION_NUMBER            |
| discussion_comment     | GHACT_DISCUSSION_NUMBER            |
| gollum                 |
| issue_comment          | GHACT_ISSUE_NUMBER                 |
| issues                 | GHACT_ISSUE_NUMBER                 |
| label                  |
| milestone              | GHACT_MILESTONE_NUMBER             |
| page_build             |
| public                 |
| pull_request           | GHACT_PULL_REQUEST_SPEC,GHACT_PULL_REQUEST_NUMBER |
| pull_request_review    | GHACT_PULL_REQUEST_SPEC,GHACT_PULL_REQUEST_NUMBER |
| pull_request_target    | GHACT_PULL_REQUEST_SPEC,GHACT_PULL_REQUEST_NUMBER |
| push                   |
| repository_dispatch    | GHACT_CLIENT_PAYLOAD               |
| schedule               | GHACT_SCHEDULE_CRON                |
| watch                  |
| workflow_dispatch      | GHACT_INPUTS                       |

### Environment Variables

| name                       | description                                                                            | default                |
|:---------------------------|:---------------------------------------------------------------------------------------|:-----------------------|
| GHACT_CLIENT_PAYLOAD       | repository_dispatch client_payload json string                                         | null                   |
| GHACT_INPUTS               | workflow_dispatch inputs json string                                                   | null                   |
| GHACT_CLIENT_PAYLOAD       | repository_dispatch client_payload json string                                         | null                   |
| GHACT_ISSUE_NUMBER         | specify issue number (https://github.com/{owner}/{repo}/issues/{__number__})           | last issue number      |
| GHACT_MILESTONE_NUMBER     | specify milestone number (https://github.com/{owner}/{repo}/milestone/{__number__})    | last milestone number  |
| GHACT_PULL_REQUEST_NUMBER  | specify pull request number (https://github.com/{owner}/{repo}/pull/{__number__})      | gh pr view --json number --jq .number |
| GHACT_PULL_REQUEST_SPEC    | specify gh pr view __[\<number\> \| \<url\> \| \<branch\>]__                           | |
| GHACT_SCHEDULE_CRON        | specify [cron string][]                                                                | 0 0 * * *              |

### GITHUB_TOKEN

gh-act passes following token as GITHUB_TOKEN secret to act.

* GITHUB_TOKEN
* GH_TOKEN
* \<gh-config-dir\>/hosts.yml token

Set GHACT_AUTO_GITHUB_TOKEN=false to disable this feature.

> GHACT_AUTO_GITHUB_TOKEN=false gh act ...

[cron string]:https://pubs.opengroup.org/onlinepubs/9699919799/utilities/crontab.html#tag_20_25_07
