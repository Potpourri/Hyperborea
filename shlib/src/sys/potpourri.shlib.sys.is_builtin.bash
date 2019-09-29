source potpourri.shlib.sys.get_type.bash

shlib.sys.is_builtin() {
	local -r name=$1

	if [[ $(shlib.sys.get_type "$name") == builtin ]]; then
		return 0
	fi
	return 1
}
