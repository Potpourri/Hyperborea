shlib.util.rm_junk() {
	find \
		\( \
		-name \*~ \
		-or -name .#\* \
		-or -name \*.tmp \
		\) \
		-print \
		-delete
}
