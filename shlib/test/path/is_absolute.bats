#!/usr/bin/env bats

source potpourri.shlib.path.is_absolute.bash

@test "path.is_absolute: /foo/bar" {
	shlib.path.is_absolute /foo/bar
}

@test "path.is_absolute: /" {
	shlib.path.is_absolute /
}

@test "path.is_absolute: foo/bar" {
	run shlib.path.is_absolute foo/bar
	[[ $status == 1 ]]
}

@test "path.is_absolute: x" {
	run shlib.path.is_absolute x
	[[ $status == 1 ]]
}

@test "path.is_absolute: ./foo/bar" {
	run shlib.path.is_absolute ./foo/bar
	[[ $status == 1 ]]
}

@test "path.is_absolute: ." {
	run shlib.path.is_absolute .
	[[ $status == 1 ]]
}

@test "path.is_absolute: ''" {
	run shlib.path.is_absolute ''
	[[ $status == 1 ]]
}

@test "path.is_absolute: ' '" {
	run shlib.path.is_absolute ' '
	[[ $status == 1 ]]
}
