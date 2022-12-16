help: ## Display this help screen
	@grep -E '^[a-zA-Z][a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sed -e 's/^GNUmakefile://' | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

install: ## install gh extention
	gh extension remove act || :
	gh extension install .

act_value_opts:
	@act --help | grep -o -e "-.*\s*string\w*\s" | sed -e "s/,/|/g" -e "s/string.*/) shift ;;/g"

clean:
	rm -rf gh-act.* *.json

repository_dispatch:
	curl -X POST -H "Accept: application/vnd.github+json" -H "Authorization: token ${GH_TOKEN}" \
		https://api.github.com/repos/srz-zumix/gh-act/dispatches \
		-d '{"event_type":"on-demand-test","client_payload":{"unit":false,"integration":true}}'
