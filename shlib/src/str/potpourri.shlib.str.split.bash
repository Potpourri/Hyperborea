shlib.str.split() {
	local -r str=$1
	local -r IFS=$2
	# shellcheck disable=SC2178
	local -n arrRef=$3
	# shellcheck disable=SC2034
	local -i partCount
	local -n partCountRef=${4:-partCount}
	local -a tmp

	read -ra tmp <<<"$str"
	arrRef+=("${tmp[@]}")
	# shellcheck disable=SC2034
	partCountRef=${#tmp[@]}
}
