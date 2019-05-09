#!/usr/bin/env bash
set -e

INIT_SCRIPT=/srv/www/init.sh

# if exists initial script, execute it
if [ -f "$INIT_SCRIPT" ]; then
	chmod +x $INIT_SCRIPT
	sleep 1;
	$INIT_SCRIPT
fi

exec "$@"
