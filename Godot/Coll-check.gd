extends Node

onready var do = get_node("../creature/tail/Dodecahedron")
onready var pl = get_node("../Player")
onready var cr = get_node("../creature")
onready var ta = get_node("../creature/tail")

export var isChild = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area_body_entered(body):
	pl.move = false	
	if not isChild:
		isChild = true
		get_node("..").remove_child(pl)
		ta.add_child(pl)
		pl.global_transform = do.global_transform
		pl.global_rotation = cr.global_rotation
#	print(pl.get_parent())
	
	print("Collision with ", body)


func _on_Area_body_exited(body):
	pl.move = true	
#	if isChild:
#		isChild = false
#		do.remove_child(pl)
#		get_node("..").add_child(pl)
	print("Collision with ", body)
