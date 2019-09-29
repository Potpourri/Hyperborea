source potpourri.shlib.panic.bash
source potpourri.shlib.path.resolve.bash

shlib.assert.file_exist() {
	local file=$1

	file=$(shlib.path.resolve "$file")
	if [[ ! -f $file ]]; then
		shlib.panic msg="assert.file_exist failed: File '$file' not found!"
	fi
}
