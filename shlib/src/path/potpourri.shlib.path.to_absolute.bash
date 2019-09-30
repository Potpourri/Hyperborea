source potpourri.shlib.path.is_absolute.bash

shlib.path.to_absolute() {
	local -r path=$1
	local -r relativeBase=${2:-$PWD}

	if ! shlib.path.is_absolute "$relativeBase"; then
		return 1
	fi
	if shlib.path.is_absolute "$path"; then
		echo "$path"
		return 0
	fi
	if [[ ${relativeBase: -1} == / ]]; then
		echo "$relativeBase$path"
	else
		echo "$relativeBase/$path"
	fi
}
