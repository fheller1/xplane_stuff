dataref("pitch", "sim/joystick/yoke_pitch_ratio", "writable")
dataref("roll", "sim/joystick/yoke_roll_ratio", "writable")
dataref("yaw", "sim/joystick/yoke_heading_ratio", "writable")

local pr_height = 100	-- pitch/roll canvas
local pr_width = 100
local pr_x = 80
local pr_y = 100

local cl_width = 10		-- pitch/roll crosshair

local y_height = 10		-- yaw canvas
local y_width = 100
local y_x = 80
local y_y = 80

function draw_pitch_roll_info()
	XPLMSetGraphicsState(0,0,0,1,1,0,0)
	glColor4f(1, 1, 1, 0.2)
	glRectf(pr_x, pr_y, pr_x + pr_height, pr_y + pr_width)
	glColor4f(1, 1, 1, 1)
	glBegin_LINES()		-- x line
	glVertex2f((pr_x + pr_width / 2 - cl_width / 2 + roll * 45), (pr_y + pr_width / 2 + pitch * -45))
	glVertex2f((pr_x + pr_width / 2 + cl_width / 2 + roll * 45), (pr_y + pr_width / 2 + pitch * -45))
	glEnd()
	glBegin_LINES()		-- y line
	glVertex2f((pr_x + pr_height / 2 + roll * 45), (pr_y + pr_height / 2 - cl_width / 2 + pitch * -45))
	glVertex2f((pr_x + pr_height / 2 + roll * 45), (pr_y + pr_height / 2 + cl_width / 2 + pitch * -45))
	glEnd()
end

function draw_yaw_info()
	XPLMSetGraphicsState(0,0,0,1,1,0,0)
	glColor4f(1, 1, 1, 0.2)
	glRectf(y_x, y_y, y_x + y_width, y_y + y_height)
	glColor4f(1, 1, 1, 1)
	glBegin_LINES()
	glVertex2f(y_x + y_width / 2 + yaw * 48, y_y)
	glVertex2f(y_x + y_width / 2 + yaw * 48, y_y + y_height)
	glEnd()
end

do_every_draw("draw_pitch_roll_info()")
do_every_draw("draw_yaw_info()")