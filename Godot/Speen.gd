extends Spatial

export var speed = 5
onready var area = get_node("Area")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _process(delta):
	#slowly rotates on x axis
	rotate_x(.01*delta)
#	pass
