#!/usr/bin/env bats

@test "assert.is_root: under user ; prints an error" {
	run sudo -u '#1000' bash -c 'source potpourri.shlib.assert.is_root.bash && shlib.assert.is_root'

	[[ $status == 1 ]]
	[[ $output == *"assert.is_root failed: This script must be run as root!" ]]
}

@test "assert.is_root: under root" {
	fakeroot bash -c 'source potpourri.shlib.assert.is_root.bash && shlib.assert.is_root'
}
