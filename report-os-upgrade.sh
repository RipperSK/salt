#!/bin/bash

set -eEuo pipefail

LOGFILE=$(find /root/os_update-all/ -name "os_update-all-*" -type f -printf '%T@ %p\n' 2>/dev/null | sort -n | tail -1 | cut -d' ' -f2-)

if [[ -z "$LOGFILE" ]]; then
    echo "ERROR: No log files found under /root/os_update-all/os_update-all-*"
    exit 1
fi

echo "Using logfile: $LOGFILE"
echo "---"

grep -A 3 "^Summary for " "$LOGFILE" | awk '
/^Summary for / {
    minion = $3
}
/^Failed:/ {
    failed = $2
    if (failed > 0) {
        print "FAIL [" minion "] - Failed states: " failed
    }
}'
