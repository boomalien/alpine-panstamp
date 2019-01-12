
#!/bin/sh

set -e

# If --user is used on command line
if [ "$(id -u)" != '0' ]; then
    exec "$@"
fi

if [ -n "$CHOWN_DIRS" ]; then
    for DIR in $CHOWN_DIRS
    do
        chown -R $USER_ID $DIR
    done
fi

# Add 'panstamp' user using $USER_ID and $GROUP_ID
if [ ! -z "$GROUP_ID+x}" ] && [ "$GROUP_ID" != "$USER_ID" ]; then

    addgroup -g $GROUP_ID panstamp
    adduser -D -G panstamp -u $USER_ID panstamp
else
    adduser -D -u $USER_ID panstamp
fi
adduser panstamp dialout

# Step down from root to aws, and run command
exec su-exec panstamp "$@"
