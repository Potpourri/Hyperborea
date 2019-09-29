shlib.sys.get_type() {
	local -r name=$1
	local type

	if ! type=$(type -t "$name"); then
		type="not_found"
	fi
	echo "$type"
}
