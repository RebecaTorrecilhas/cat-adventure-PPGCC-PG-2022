extends KinematicBody2D
var score=0
onready var ray_wall = $raycasts/RayCast2D

func _physics_process(_delta):
	if ray_wall.is_colliding():
		score=score+1;
		print('score ',score);
		queue_free();
