# Give the component a class name so it can be instanced as a custom node
class_name Spawner
extends Node2D

# Export the dependencies for this component
# The scene we want to spawn
@export var scene: PackedScene

# Function to spawn an instance of the scene at a specific global position on a specified parent node
# By default, the parent is the current "main" scene, but an alternative parent can be specified
func spawn(global_spawn_position: Vector2 = global_position, parent: Node = get_tree().current_scene) -> Node:
	assert(scene is PackedScene, "Error: The scene export was never set on this spawner component.")
	# Instance the scene
	var instance = scene.instantiate()
	# Add it as a child of the parent
	parent.add_child(instance)
	# Update the global position of the instance
	# (This must be done after adding it as a child)
	instance.global_position = global_spawn_position
	# Return the instance in case we want to perform any other operations on it after instancing it
	return instance

