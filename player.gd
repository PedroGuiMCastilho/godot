extends Area2D

const SPEED := 400
var screen_size 
@onready var anim = get_node("anim")
# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Input.get_vector("move_left","move_right","move_up","move_down")
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * SPEED
		
		
		
		if velocity.x != 0:
			anim.play("Move")
			elif velocity.y > 0:
				anim.play("Move_up")
		
		
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	
