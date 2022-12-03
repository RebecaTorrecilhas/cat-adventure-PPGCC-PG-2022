extends CollisionShape2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const SPEED = 200
var movedirection = Vector2(0,0)
var spritedirection = "down"

func _physics_process(_delta):
	controls()
	movement()
	spritedirection_loop()
	

func controls():
		var LEFT = Input.is_action_pressed("ui_left")
		var RIGHT = Input.is_action_pressed("ui_right")
		var UP = Input.is_action_pressed("ui_up")
		var DOWN = Input.is_action_pressed("ui_down")
		movedirection.x = -int(LEFT) + int(RIGHT)
		movedirection.y = -int(UP) + int(DOWN)

func movement():
	var motion = movedirection.normalized() * SPEED


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
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
