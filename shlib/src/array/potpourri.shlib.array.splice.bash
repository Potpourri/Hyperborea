shlib.splice.splice() {
	local -n arrRef=$1
	local -ri start=$2
	local -ri deleteCount=${3:-}
	if (($# > 3)); then
		local -r items=${#:4}
	else
		local -r items=''
	fi

	if [[ -n $deleteCount ]]; then
		arrRef=("${arrRef:0:start}" "${items[@]}" "${arrRef:start+deleteCount}")
	else
		arrRef=("${arrRef:0:start}")
	fi
}
