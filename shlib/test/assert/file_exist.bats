#!/usr/bin/env bats

@test "assert.file_exist: real file" {
	source potpourri.shlib.assert.file_exist.bash

	shlib.assert.file_exist test/fixtures/assert/file_exist/foo.txt
}

@test "assert.file_exist: symlink to real file" {
	source potpourri.shlib.assert.file_exist.bash

	shlib.assert.file_exist test/fixtures/assert/file_exist/foo1.txt
}

@test "assert.file_exist: broken symlink ; prints an error" {
	source potpourri.shlib.assert.file_exist.bash

	run shlib.assert.file_exist test/fixtures/assert/file_exist/foo2.txt

	[[ $status == 1 ]]
	[[ $output == *"assert.file_exist failed: File '$PWD/test/fixtures/assert/file_exist/foo2.txt' not found!" ]]
}

@test "assert.file_exist: real dir ; prints an error" {
	source potpourri.shlib.assert.file_exist.bash

	run shlib.assert.file_exist test/fixtures/assert/file_exist/foo3

	[[ $status == 1 ]]
	[[ $output == *"assert.file_exist failed: File '$PWD/test/fixtures/assert/file_exist/foo3' not found!" ]]
}

@test "assert.file_exist: nonexistent file ; prints an error" {
	source potpourri.shlib.assert.file_exist.bash

	run shlib.assert.file_exist test/fixtures/assert/file_exist/bar.txt

	[[ $status == 1 ]]
	[[ $output == *"assert.file_exist failed: File '$PWD/test/fixtures/assert/file_exist/bar.txt' not found!" ]]
}
