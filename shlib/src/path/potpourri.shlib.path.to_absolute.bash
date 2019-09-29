source potpourri.shlib.path.is_absolute.bash

shlib.path.to_absolute() {
	local -r path=$1
	local -r relativeBase=${2:-$PWD}

	if shlib.path.is_absolute "$path"; then
		echo "$path"
	fi
	echo "$relativeBase/$path"
}
