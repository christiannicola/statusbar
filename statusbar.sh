#!/bin/sh

# A modular status bar for dwm
# Joe Standring <git@joestandring.com>
# Christian Nicola <hi@chrisnicola.de>
#
# GNU GPLv3

# Dependencies: xorg-xsetroot

# Import functions with "$include /route/to/module"
# It is recommended that you place functions in the subdirectory ./functions and use: . "$DIR/functions/dwm_example.sh"

# Store the directory the script is running from
LOC=$(readlink -f "$0")
DIR=$(dirname "$LOC")

# Change the appearance of the module identifier. if this is set to "unicode", then symbols will be used as identifiers instead of text. E.g. [📪 0] instead of [MAIL 0].
# Requires a font with adequate unicode character support
export IDENTIFIER="unicode"

# Change the charachter(s) used to seperate modules. If two are used, they will be placed at the start and end.
export SEP1="["
export SEP2="]"

# Import the modules
. "$DIR/functions/dwm_resources.sh"
. "$DIR/functions/dwm_pulse.sh"
. "$DIR/functions/dwm_keyboard.sh"
. "$DIR/functions/dwm_date.sh"
. "$DIR/functions/dwm_loadavg.sh"

# Update dwm status bar every second
while true
do
    # Append results of each func one by one to the upperbar string
    upperbar=""
    upperbar="$upperbar$(dwm_keyboard)"
    upperbar="$upperbar$(dwm_resources)"
    upperbar="$upperbar$(dwm_loadavg)"
    upperbar="$upperbar$(dwm_pulse)"
    upperbar="$upperbar$(dwm_date)"

    xsetroot -name "$upperbar"

	sleep 1
done
