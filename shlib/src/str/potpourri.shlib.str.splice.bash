source potpourri.shlib.array.join.bash

shlib.str.splice() {
	local str=$1
	local -ri start=$2
	local -ri deleteCount=${3:-}
	if (($# > 3)); then
		local -r items=$(shlib.array.join "${@:4}" '')
	else
		local -r items=''
	fi

	if [[ -n $deleteCount ]]; then
		echo "${str:0:start}$items${str:start+deleteCount}"
	else
		echo "${str:0:start}"
	fi
}
