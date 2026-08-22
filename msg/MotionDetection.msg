# Motion detection information of the cube.
#
# Published whenever the cube reports a change in any of the fields below.
# collision and double_tap are momentary: the cube reports them as true in
# the notification that detects them and as false in the next one, so they
# should be treated as events. The other fields are states.
#
# https://toio.github.io/toio-spec/docs/ble_sensor

std_msgs/Header header

# true while the cube is level (within the cube's horizontal detection
# threshold), false while it is tilted
bool horizontal

# true when the cube has just hit something
bool collision

# true when the cube has just been double-tapped
bool double_tap

# Which face of the cube is pointing up, one of the POSTURE_* constants
uint8 posture

uint8 POSTURE_UNKNOWN = 0
uint8 POSTURE_TOP = 1       # top face up (normal, on its wheels)
uint8 POSTURE_BOTTOM = 2    # upside down
uint8 POSTURE_REAR = 3      # rear face up
uint8 POSTURE_FRONT = 4     # front face up
uint8 POSTURE_RIGHT = 5     # right face up
uint8 POSTURE_LEFT = 6      # left face up

# Shake strength, SHAKE_NONE or SHAKE_LEVEL_MIN-SHAKE_LEVEL_MAX
uint8 shake

uint8 SHAKE_NONE = 0
uint8 SHAKE_LEVEL_MIN = 1
uint8 SHAKE_LEVEL_MAX = 10
