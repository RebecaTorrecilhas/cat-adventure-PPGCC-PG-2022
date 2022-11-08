extends KinematicBody2D

const SPEED = 200
var movedirection = Vector2(0,0)
var spritedirection = "down"

func _physics_process(_delta):
	controls()
	movement()
	spritedirection_loop()
	if movedirection != Vector2(0,0):
		animswitch("walk")
	else:
		animswitch("idle")

func controls():
		var LEFT = Input.is_action_pressed("ui_left")
		var RIGHT = Input.is_action_pressed("ui_right")
		var UP = Input.is_action_pressed("ui_up")
		var DOWN = Input.is_action_pressed("ui_down")
		movedirection.x = -int(LEFT) + int(RIGHT)
		movedirection.y = -int(UP) + int(DOWN)

func movement():
	var motion = movedirection.normalized() * SPEED
	move_and_slide(motion, Vector2(0,0))

func spritedirection_loop():
	match movedirection:
		Vector2(-1,0):
			spritedirection = "left"
		Vector2(1,0):
			spritedirection = "right"
		Vector2(0,-1):
			spritedirection = "up"
		Vector2(0,1):
			spritedirection = "down"

func animswitch(Animation):
	var newanim = str(Animation, spritedirection)
	if $anim.current_animation != newanim:
		$anim.play(newanim)
