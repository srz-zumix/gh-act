# gh-act

gh-act generates and configures event.json for [act][]

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
