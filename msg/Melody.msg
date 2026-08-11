# A melody the cube plays on its own.
#
# This covers what the built-in sound effects cannot: an arbitrary tune. Like
# LedPattern, the cube sequences it internally, so timing does not depend on
# how reliably a host can publish.

# The notes to play in order. At most NOTES_MAX notes fit in one command.
toio_msgs/MidiNote[] notes

# How many times to play the whole melody. REPEAT_INFINITE plays until
# another sound command arrives.
uint8 repeat 1

uint8 REPEAT_INFINITE = 0
uint8 NOTES_MAX = 59
