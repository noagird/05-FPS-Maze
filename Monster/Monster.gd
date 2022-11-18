extends KinematicBody
var vel = null
const speed = 5
var target_player = null

func _physics_process(_delta):
	# Query the `NavigationAgent` to know the next free to reach location.
	$NavigationAgent.set_target_location(get_node("../Player").get_global_transform().origin)
	var target = $NavigationAgent.get_next_location()
	var _pos = get_global_transform().origin

	# Floor normal.
	var n = $RayCast.get_collision_normal()
	#if n.length_squared() < 0.001:
		# Set normal to Y+ if on air.
	#	n = Vector3(0, 1, 0)
	
	# Calculate the velocity.
	vel = (target - translation).normalized() * speed * Vector3(1,0,1)
	vel = move_and_slide(vel)

func set_target(target):
	target_player = target