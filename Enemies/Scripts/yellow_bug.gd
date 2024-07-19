extends Enemy

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	move.velocity.x = [-100, 100].pick_random()
	
