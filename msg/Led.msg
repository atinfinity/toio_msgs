# One indicator state: a color and how long to hold it.
#
# Sending this instead of a bare ColorRGBA lets each command carry its own
# duration, so a "flash for 3 seconds" and a "stay lit until told otherwise"
# can be issued on the same topic.

# Color. Each channel is 0.0-1.0 and is scaled to the cube's 0-255 range.
# The alpha channel is ignored; use duration_ms below.
std_msgs/ColorRGBA color

# How long the indicator stays lit, in milliseconds.
#
# The cube takes this in units of 10ms, so a fraction below 10ms is truncated
# and anything above DURATION_MAX_MS is clipped. Values under DURATION_MIN_MS
# mean "no time limit": the indicator stays lit until the next command.
uint16 duration_ms

uint16 DURATION_UNLIMITED = 0
uint16 DURATION_MIN_MS = 10
uint16 DURATION_MAX_MS = 2550
