source potpourri.shlib.__globalvar__.bash
source potpourri.shlib.io.symlink_fullderef.bash

shlib.sys.get_real_scriptdir() {
	dirname "$(shlib.io.symlink_fullderef "$shlib__MAIN_SCRIPT_PATH__")"
}
