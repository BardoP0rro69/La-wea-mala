extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var velocitat = 300
var direccio = Vector2(0,0)


# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(500, 200)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += direccio * velocitat * delta
	
	if Input.is_action_pressed("mou dreta"):
		direccio = Vector2(1,0)
		
	
	
	
