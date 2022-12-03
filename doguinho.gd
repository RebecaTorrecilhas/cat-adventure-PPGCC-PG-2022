extends KinematicBody2D

const SPEED = 150
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
		var LEFT = randi()%10+1
		var RIGHT = randi()%10+1
		var UP = randi()%10+1
		var DOWN = randi()%10+1
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




func _on_Area2D_body_entered(area):
	print('aaaa')
