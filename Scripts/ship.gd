extends Node2D

# Reference to the Spawner 
@onready var spawner = $Spawner as Spawner

# Reference to the left cannon node
@onready var left_cannon = $LeftCannon

# Reference to the right cannon node
@onready var right_cannon = $RightCannon

# Reference to the fire rate timer
@onready var fire_rate_timer = $FireRateTimer

# Reference to ScaleObjects 
@onready var scale_objects = $Scale as ScaleObjects

# Called when the node enters the scene tree for the first time
func _ready() -> void:
	# Connect the timeout signal of the fire rate timer to the fire_lasers method
	fire_rate_timer.timeout.connect(fire_lasers)
	pass

# Function to handle firing lasers
func fire_lasers() -> void:
	# Spawn laser at the left cannon's position
	spawner.spawn(left_cannon.global_position)
	# Spawn laser at the right cannon's position
	spawner.spawn(right_cannon.global_position)
	# Trigger the scale animation
	scale_objects.tween_scale()

