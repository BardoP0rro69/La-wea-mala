extends KinematicBody2D

var velocitat_base = 300
var velocitat = Vector2.DOWN * velocitat_base
var gravetat = Vector2.DOWN * 980
var salt = Vector2.UP * 500
var salts_disponibles = 1
var posicio_inici

func _physics_process(delta):

	velocitat.x = 0
	
	if Input.is_action_pressed("mou dreta"):
		velocitat += Vector2.RIGHT * velocitat_base
	if Input.is_action_pressed("mou esquerra"):
		velocitat += Vector2.LEFT * velocitat_base
	if Input.is_action_just_pressed("mou adalt") and is_on_floor():
		velocitat += salt
	
	if Input.is_action_just_pressed("mou adalt") and is_on_wall():
		velocitat += salt
		
	if Input.is_action_pressed("correr"):
		velocitat_base = 500
	else:
		velocitat_base = 300
		
	if position.y >= 1000:
		position = posicio_inici

	velocitat += gravetat * delta
	velocitat = move_and_slide(velocitat, Vector2.UP) 
	anima(velocitat)
	
	
func anima(velocitat: Vector2):
	var animacio : AnimatedSprite = $AnimatedSprite
	
	if Input.is_action_pressed("Dab"):
		animacio.play('Dab')
		return
		
	if velocitat.x > 0 and velocitat.x < 400:
		animacio.flip_h = false
		animacio.play('corriendo')
	elif velocitat.x < 0 and velocitat.x > -400:
		animacio.flip_h = true
		animacio.play('corriendo')
	elif velocitat.x > 500:
		animacio.flip_h = false
		animacio.play('sprint')
	elif velocitat.x < -500:
		animacio.flip_h = true
		animacio.play('sprint')
	
	if abs(velocitat.x) < 0.1:
		animacio.play('parao')
	
	


func _on_Porta_body_entered(body):
	get_tree().change_scene("res://sexe.tscn")
	


func _on_Trofeo_body_entered(body):
	get_tree().change_scene("res://Victoria magistral.tscn")


func _on_Zombie_body_entered(body):
	position = posicio_inici


func _on_sis_body_entered(body):
	position = Vector2(666, 178)


func _on_non_body_entered(body):
	position = Vector2 (-440, 176)
