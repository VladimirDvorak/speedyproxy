#!/bin/bash
touch /tmp/aaa

LOGFILE=/var/log/speedyproxy.log

OPTIONS="$@"

# Log it.
echo "START:`date`:`whoami`:$OPERATION "$@"" >> $LOGFILE

# Now, do it.
exec $OPERATION "$@" 2>&1 >> $LOGFILE

echo "END:`date`:`whoami`:$OPERATION "$@"" >> $LOGFILE
