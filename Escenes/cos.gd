extends KinematicBody2D

var velocitat_base = 300
var velocitat = Vector2.DOWN * velocitat_base
var gravetat = Vector2.DOWN * 980
var salt = Vector2.UP * 500

func _physics_process(delta):

	
	velocitat.x = 0
	
	if Input.is_action_pressed("mou dreta"):
		velocitat += Vector2.RIGHT * velocitat_base
	if Input.is_action_pressed("mou esquerra"):
		velocitat += Vector2.LEFT * velocitat_base
	if Input.is_action_just_pressed("mou adalt") and is_on_floor():
		velocitat += salt
		
	if Input.is_action_pressed("correr"):
		velocitat_base = 500
	else:
		velocitat_base = 300
		
	if position.y >= 1000:
		position = Vector2(-173,185)

	velocitat += gravetat * delta
	velocitat = move_and_slide(velocitat, Vector2.UP) 
	anima(velocitat)
	
	
func anima(velocitat: Vector2):
	var animacio : AnimatedSprite = $AnimatedSprite
	if velocitat.x > 0:
		animacio.flip_h = false
		animacio.play('corriendo')
	elif velocitat.x < 0:
		animacio.flip_h = true
		animacio.play('corriendo')
	
	if abs(velocitat.x) < 0.1:
		animacio.play('parao')
