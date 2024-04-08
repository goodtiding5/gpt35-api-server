#!/bin/bash

set -eo pipefail

# -- Program starts

WORKDIR=/home/bun/app
cd ${WORKDIR}

if [[ $@ ]]; then
    case "$1" in
        "start")
	    exec bun run app.ts
	    ;;
        *)
            eval "exec $@"
	    ;;
    esac
else
    exec bun run app.ts
fi

exit 0
