source potpourri.shlib.bool.bash

# shellcheck disable=SC2034
if [[ -z ${shlib__VERSION__:-} ]]; then
	# Constants:
	declare -r shlib__VERSION__="0.0.1"
	declare -r shlib__DEBUG__=${SHLIB_DEBUG:-$shlib_FALSE}
	declare -r shlib__MAIN_SCRIPT_PATH__=${BASH_SOURCE[-1]}
	declare -r shlib__MAIN_SCRIPT_NAME__=${shlib__MAIN_SCRIPT_PATH__##*/}
	declare -r shlib__MAIN_SCRIPT_DIR__=${shlib__MAIN_SCRIPT_PATH__%/*}
	declare -r shlib__ERR_CAUGHT_FLAG__=/dev/shm/shlib__ERR_CAUGHT_FLAG_PID${$}__
fi
