source potpourri.shlib.panic.bash

shlib.assert.is_user() {
	if [[ $(id -u) == 0 ]]; then
		shlib.panic msg="assert.is_user failed: This script must be run as regular user (non-root)!"
	fi
}
