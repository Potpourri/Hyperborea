#!/usr/bin/env bats

source potpourri.shlib.path.is_relative.bash

@test "path.is_relative: /foo/bar" {
	run shlib.path.is_relative /foo/bar
	[[ $status == 1 ]]
}

@test "path.is_relative: /" {
	run shlib.path.is_relative /
	[[ $status == 1 ]]
}

@test "path.is_relative: foo/bar" {
	shlib.path.is_relative foo/bar
}

@test "path.is_relative: x" {
	shlib.path.is_relative x
}

@test "path.is_relative: ./foo/bar" {
	shlib.path.is_relative ./foo/bar
}

@test "path.is_relative: ." {
	shlib.path.is_relative .
}

@test "path.is_relative: ''" {
	run shlib.path.is_relative ''
	[[ $status == 1 ]]
}

@test "path.is_relative: ' '" {
	run shlib.path.is_relative ' '
	[[ $status == 1 ]]
}
