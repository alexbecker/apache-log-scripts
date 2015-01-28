#!/usr/bin/gawk -f
# list the user-agents in an apache log (with default logging) and how many times each appears

{
	user_agent = $12;

	# unlike the referer, the user-agent may have spaces
	# keep grabbing words until we reach end of user-agent
	ind = 13;
	while (substr(user_agent, length(user_agent)) != "\"") {
		user_agent = user_agent " " $ind;
		ind++;
	}
	count[user_agent]++;
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
