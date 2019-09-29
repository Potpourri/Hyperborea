gitlib.git_no_sign() {
	git -c commit.gpgSign=false "$@"
}
