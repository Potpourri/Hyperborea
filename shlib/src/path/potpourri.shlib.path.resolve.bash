source potpourri.shlib.path.normalize.bash
source potpourri.shlib.path.to_absolute.bash

shlib.path.resolve() {
	local -r path=$1
	local -r relativeBase=${2:-}

	shlib.path.normalize "$(shlib.path.to_absolute "$path" "$relativeBase")"
}
