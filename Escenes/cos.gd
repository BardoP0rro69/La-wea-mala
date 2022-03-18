extends KinematicBody2D

var velocitat_base = 300
var velocitat = Vector2.DOWN * velocitat_base
var gravetat = Vector2.DOWN * 980
var salt = Vector2.UP * 500
var salts_disponibles = 2

func _physics_process(delta):

	
	velocitat.x = 0
	
	if salts_disponibles <= 0 and is_on_floor():
		salts_disponibles = 2
	
	if Input.is_action_pressed("mou dreta"):
		velocitat += Vector2.RIGHT * velocitat_base
	if Input.is_action_pressed("mou esquerra"):
		velocitat += Vector2.LEFT * velocitat_base
	if Input.is_action_just_pressed("mou adalt") and salts_disponibles > 0:
		velocitat += salt
		salts_disponibles -= 1
		
	if Input.is_action_pressed("correr"):
		velocitat_base = 500
	else:
		velocitat_base = 300
		
	if position.y >= 1000:
		position = Vector2(500,270)

	velocitat += gravetat * delta
	velocitat = move_and_slide(velocitat, Vector2.UP) 
	
