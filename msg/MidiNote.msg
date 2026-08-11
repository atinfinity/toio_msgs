# One note in a melody.

# How long the note sounds, in milliseconds. As with Led.duration_ms the cube
# takes this in units of 10ms, so a fraction below 10ms is truncated and
# anything above DURATION_MAX_MS is clipped.
uint16 duration_ms

# MIDI note number. NOTE_REST is silence, which is how a rest is written.
uint8 note

# Volume. The cube treats 0 as mute and every other value as full volume, so
# this is effectively a switch rather than a level.
uint8 volume 255

uint16 DURATION_MAX_MS = 2550
uint8 NOTE_MIN = 0
uint8 NOTE_MAX = 128
uint8 NOTE_REST = 128
