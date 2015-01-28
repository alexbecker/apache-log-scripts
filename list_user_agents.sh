#!/usr/bin/gawk -f
# list the user-agents in an apache log (with default logging) and how many times each appears

{
	count[$12]++;
}

END {
	len = 0;
	for (c in count) {
		len++;
	}

	for (i = 0; i < len; i++) {
		min = 999999999;
		for (c in count) {
			if (count[c] < min) {
				min = count[c];
			}
		}
		for (c in count) {
			if (count[c] == min) {
				if (c !~ "\"-\"") {
					print min, c;
				}
				delete count[c];
			}
		}
	}
}
