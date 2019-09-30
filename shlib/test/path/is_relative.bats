#!/usr/bin/env bats

@test "path.is_relative: /foo/bar ; returns an error code" {
	source potpourri.shlib.path.is_relative.bash

	run shlib.path.is_relative /foo/bar

	[[ $status == 1 ]]
}

@test "path.is_relative: / ; returns an error code" {
	source potpourri.shlib.path.is_relative.bash

	run shlib.path.is_relative /

	[[ $status == 1 ]]
}

@test "path.is_relative: foo/bar" {
	source potpourri.shlib.path.is_relative.bash

	shlib.path.is_relative foo/bar
}

@test "path.is_relative: x" {
	source potpourri.shlib.path.is_relative.bash

	shlib.path.is_relative x
}

@test "path.is_relative: ./foo/bar" {
	source potpourri.shlib.path.is_relative.bash

	shlib.path.is_relative ./foo/bar
}

@test "path.is_relative: ." {
	source potpourri.shlib.path.is_relative.bash

	shlib.path.is_relative .
}

@test "path.is_relative: '' ; returns an error code" {
	source potpourri.shlib.path.is_relative.bash

	run shlib.path.is_relative ''

	[[ $status == 1 ]]
}

@test "path.is_relative: ' ' ; returns an error code" {
	source potpourri.shlib.path.is_relative.bash

	run shlib.path.is_relative ' '

	[[ $status == 1 ]]
}
