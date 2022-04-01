extends Area2D

var velocitat_base = 300
var velocitat = Vector2.DOWN * velocitat_base

func _physics_process(delta):
	
	velocitat += Vector2.RIGHT * velocitat_base
