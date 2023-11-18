extends Node

var debug = false

var actived_checkpoints = []
var player_spawnpos = Vector2(64, 172) #Vector2(3568, -340) position near the first loop

var player_gsp = 0
var player_xspeed = 0
var player_yspeed = 0
var player_position = player_spawnpos
var player_rings = 0
var player_is_dead = false
var player_is_rolling = false
var player_actual_layer = 1

var dead_frames = 0

func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		debug = !debug
		get_tree().debug_collisions_hint = debug
	
	if player_rings >= 999:
		player_rings = 999
	
	if player_is_dead:
		if dead_frames == 90:
			dead_frames = 0
			player_is_dead = false
			player_is_rolling = false
			player_actual_layer = 1
			player_rings = 0
			actived_checkpoints.clear()
			get_tree().reload_current_scene()
		else:
			dead_frames += 1
