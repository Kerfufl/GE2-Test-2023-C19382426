extends Node

onready var do = get_node("../creature/tail/Dodecahedron")
onready var pl = get_node("../Player")
onready var cr = get_node("../creature")

onready var bo = cr.get_child(1)
onready var ta = get_node("../creature/tail")

export var isChild = false

var pl_rot
var pl_pos
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
	
	if not isChild:
		pl.move = false	
		isChild = true
		get_node("..").remove_child(pl)
		ta.add_child(pl)
		
		#Tried to smoothly lerp from player position to dodecahedron position, not really working : (
		pl.global_transform = do.global_transform
		
		pl_rot= pl.global_rotation
		pl.global_rotation = -bo.global_rotation
		bo.get_child(6).enabled=false
		bo.get_child(7).enabled= true
		
#	print(pl.get_parent())
	
func _input(event):
	if event is InputEventKey and event.pressed and ! event.echo:
		if event.scancode == KEY_Z and isChild:
			#isChild = false
			pl_pos = pl.global_transform
			ta.remove_child(pl)
			get_node("..").add_child(pl)
			
			pl.move = true
			pl.global_rotation= pl_rot
			pl.global_transform = pl_pos
			bo.get_child(6).enabled=true
			bo.get_child(7).enabled= false
			
#	print("Collision with ", body)


