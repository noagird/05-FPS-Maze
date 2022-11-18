extends Spatial

onready var monster = $Nav/Navigation/Monster
onready var player = $Nav/Navigation/Player
onready var nav = $Nav/Navigation

func _ready():
#	monster.set_nav(nav)
	monster.set_target(player)
