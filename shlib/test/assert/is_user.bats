#!/usr/bin/env bats

@test "assert.is_user: under user" {
	sudo -u '#1000' bash -c 'source potpourri.shlib.assert.is_user.bash && shlib.assert.is_user'
}

@test "assert.is_user: under root" {
	run fakeroot bash -c 'source potpourri.shlib.assert.is_user.bash && shlib.assert.is_user'
	[[ $status == 1 ]]
	[[ $output == *"assert.is_user failed: This script must be run as regular user (non-root)!" ]]
}
