source potpourri.shlib.panic.bash

shlib.assert.is_root() {
	if [[ $(id -u) != 0 ]]; then
		shlib.panic msg="assert.is_root failed: This script must be run as root!"
	fi
}
