source potpourri.shlib.panic.bash
source potpourri.shlib.sys.is_program.bash

shlib.assert.program_exist() {
	local -r name=$1

	if ! shlib.sys.is_program "$name"; then
		bash -ic "type command_not_found_handle &>/dev/null && command_not_found_handle $name" || :
		shlib.panic msg="assert.program_exist failed: Program '$name' not found!" exitCode=127
	fi
}
