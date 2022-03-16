extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var velocitat = 300
var direccio = Vector2(0,0)


# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(239, 262)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += direccio * velocitat * delta
	direccio = Vector2.ZERO
	if Input.is_action_pressed("mou dreta"):
		direccio[0] = 1
	if Input.is_action_pressed("mou esquerra"):
		direccio[0] = -1
	if Input.is_action_pressed("mou abaix"):
		direccio[1] = 1
	if Input.is_action_pressed("mou adalt"):
		direccio[1] = -1
		
func _on_Personatges_area_entered(area):
	$Obama.texture = load ('pez.jpg')
	
func _on_Personatges_area_exited(area):
	$Obama.texture = load ('obama.jpg')
