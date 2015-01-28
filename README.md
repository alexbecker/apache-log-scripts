Apache-log-scripts
==================

Awk scripts for processing Apache logs. These scripts assume default log format (as of 2.4.10).

Usage
-----

* "./list_referers.sh < [logfile]" lists the unique referers in the logfile and the count of each
* "./list_user_agents.sh < [logfile]" lists the unique user-agents in the logfile and the count of each
