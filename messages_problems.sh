#!/bin/sh
#
# Author: https://github.com/rc5hack/
#
# Licence: Creative Commons Attribution-ShareAlike 3.0 Unported
# http://creativecommons.org/licenses/by-sa/3.0/
#
# Find out some typography problems in messages on YaBB 2.x forum
# Reason: what we have to sanitize into messages?
#

# crap from the end of messages
find ./ -type f -name '*.txt' -exec egrep --color -H '(&nbsp;|<br[ ]*\/>| )+\|\|\|\|$' {} \;

# crap from the end of text blocks inside of the message
find ./ -type f -name '*.txt' -exec egrep --color -H '(&nbsp;|<br[ ]*\/>| )+\[\/(quote|code|edit)\]' {} \;

# crap from the beginning of message' title
find ./ -type f -name '*.txt' -exec egrep --color -H '^(&nbsp;|<br[ ]*\/>| )+' {} \;
