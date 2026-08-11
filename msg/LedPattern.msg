# A blink pattern the cube plays on its own.
#
# The cube runs the sequence itself, so the pattern keeps its timing and
# survives a BLE dropout - unlike publishing colors one at a time from a host.

# The steps to play in order. Each step's duration_ms is how long that color
# is held; a step with DURATION_UNLIMITED holds until the pattern ends.
#
# At most STEPS_MAX steps fit in one command.
toio_msgs/Led[] steps

# How many times to play the whole sequence. REPEAT_INFINITE plays until
# another indicator command arrives.
uint8 repeat 1

uint8 REPEAT_INFINITE = 0
uint8 STEPS_MAX = 29
