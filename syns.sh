#!/usr/bin/env bash
# Provides list of synonyms from bighugelabs.com's synonym service

set -o nounset
set -o pipefail

declare -r APIKEY_PATH="${HOME}/.config/syns/apikey"
declare -r FORMAT="%-10s %s\n"
declare -r URL="http://words.bighugelabs.com"
declare -i isJsonOutput=0
declare -a queryWords=()

# mkdir -p ~/.config/syns &&echo "yourapikey" > ~/.config/syns/apikey
declare APIKEY=""


if [[ -e ${APIKEY_PATH} ]]; then
	APIKEY="$(< ${APIKEY_PATH})"
	if [[ -z $APIKEY ]]; then
		echo "api key not set. Define in $APIKEY_PATH"
		exit 1
	fi
fi

for w in "$@"; do
	if [[ "${w}" =~ "--json" ]]; then
		isJsonOutput=1
		continue
	fi

	if [[ "${w}" =~ [a-zA-Z0-9]+ ]]; then
		querywords+=(${w})
	fi
done

if [[ ${isJsonOutput} -eq 1 ]]; then
	for q in ${querywords[@]}; do
		curl -sL --fail "${URL}/api/2/${APIKEY}/${q}/json"
	done
else
	prev_article=""
	for q in ${querywords[@]}; do
		lq=$(echo $q | sed 's/ /%20/g')
		for res in $(curl -sL --fail "${URL}/api/2/${APIKEY}/${q}/" | sed 's/ /_/g'); do
			article="$(echo $res | awk -F\| '{print $1}')"
			category="$(echo $res | awk -F\| '{print $2}')"
			word="$(echo $res | awk -F\| '{print $3, $4, $5, $6}')"
			if [[ "${article}" != "${prev_article}" ]]; then
				printf "${FORMAT}" "$(tput smul; tput setaf 5; )$q (${article})$(tput sgr 0)"
				prev_article="${article}"
			fi

			printf "${FORMAT}" " " "${word/_/ }"

		done

		echo 
	done
fi
