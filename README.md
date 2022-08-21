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

* create
* delete
* discussion
* discussion_comment
* gollum
* issue_comment
* issues
* label
* milestone
* page_build
* public
* pull_request
* pull_request_review
* pull_request_target
* push
* schedule
* watch
* workflow_dispatch

### GITHUB_TOKEN

gh-act passes following token as GITHUB_TOKEN secret to act.

* GITHUB_TOKEN
* GH_TOKEN
* ~/.config/gh/hosts.yml token

Set GHACT_AUTO_GITHUB_TOKEN=false to disable this feature.

> GHACT_AUTO_GITHUB_TOKEN=false gh act ...
