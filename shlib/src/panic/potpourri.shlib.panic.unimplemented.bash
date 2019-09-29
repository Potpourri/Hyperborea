source potpourri.shlib.bool.bash
source potpourri.shlib.panic.bash

shlib.panic.unimplemented() {
	shlib.panic msg="unimplemented!" cmd="shlib.panic.unimplemented" \
		stackTrace="$shlib_TRUE" frameStart=2
}
