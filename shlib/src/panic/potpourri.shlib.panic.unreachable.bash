source potpourri.shlib.bool.bash
source potpourri.shlib.panic.bash

shlib.panic.unreachable() {
	shlib.panic msg="unreachable!" cmd="shlib.panic.unreachable" \
		stackTrace="$shlib_TRUE" frameStart=2
}
