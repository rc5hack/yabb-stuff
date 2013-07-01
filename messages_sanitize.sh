#!/usr/bin/env bash
#
# Author: https://github.com/rc5hack/
#
# Licence: Creative Commons Attribution-ShareAlike 3.0 Unported
# http://creativecommons.org/licenses/by-sa/3.0/
#
# Sanitize messages (remove superfluous spaces, tabs, <br />, etc.) on YaBB 2.x forum
# Reason: improving typography, restore wasted diskspace ;-)
#

if [ -z "$1" ]
    then
        echo "You should tell me where to work! I can't guess."
        exit 1
fi

workdir="$1"

if [ -d "$1" ]
    then
        echo "Working directory is set to <$workdir>"
    else
        echo "<$workdir> does not exist (or not a directory)!"
        exit 1
fi

echo

# remove some crap from the end of messages
echo "Sanitizing..."
find $workdir \
    -type f \
    -name '*.txt' \
    -exec perl -e 's/(?:&nbsp;|<br[ ]*\/>|[ \t])+\|\|\|\|$/\|\|\|\|/ig' -pi '{}' \; \
    -print \
    | awk '{count = count+1 }; END { print count " file(s) handled" }'

echo
echo "Done!"

# TODO: count and show number of removals done
# TODO: affect also messages with attachments and other extra data (not ending with ||||)
# TODO: check if working directory is correct
