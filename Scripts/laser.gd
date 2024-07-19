extends Node2D

# Reference to the VisibleOnScreenNotifier2D component
@onready var visible_on_screen_notifier_2d = $VisibleOnScreenNotifier2D

# Reference to the ScaleObjects component
@onready var scale_objects = $Scale as ScaleObjects

# Reference to the Hitbox component
@onready var hitbox = $Hitbox as Hitbox

# Called when the node enters the scene tree for the first time
func _ready() -> void:
	# Activate the scaling effect
	scale_objects.tween_scale()
	
	# Connect the screen_exited signal to the queue_free method to remove the node when it leaves the screen
	visible_on_screen_notifier_2d.screen_exited.connect(queue_free)
	
	# Connect the hit_hurtbox signal to the queue_free method to remove the node when it hits a hurtbox
	hitbox.hit_hurtbox.connect(queue_free.unbind(1))
