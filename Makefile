EXTENSION_NAME=act

help: ## Display this help screen
	@grep -E '^[a-zA-Z][a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sed -e 's/^GNUmakefile://' | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

install: ## install gh extention
	gh extension remove "${EXTENSION_NAME}" || :
	gh extension install .


install-released:
	gh extension remove "${EXTENSION_NAME}" || :
	gh extension install "srz-zumix/gh-${EXTENSION_NAME}"

act_value_opts:
	@act --help | grep -o -e "-.*\s*string\w*\s" | sed -e "s/,/|/g" -e "s/string.*/) shift ;;/g"

clean:
	rm -rf gh-act.* *.json

repository_dispatch:
	jq -n '{"event_type":"on-demand-test","client_payload":{"unit":false,"integration":true}}' | \
		gh api -H "Accept: application/vnd.github+json" \
			/repos/srz-zumix/gh-act/dispatches \
			--input -

ghact_envs:
	grep -o GHACT_[A-Z][A-Z_]* -r . --no-filename | sort | uniq
