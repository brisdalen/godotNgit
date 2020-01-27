extends Node2D

# Declare member variables here. Examples:
var current_pewpew
var pewpews
var pewpew_amount 
var rng = RandomNumberGenerator.new()
var wait_time
var initial_wait_time = 1.5

# Called when the node enters the scene tree for the first time.
func _ready():
	current_pewpew = 0
	pewpews = get_child(1)
	pewpew_amount = pewpews.get_child_count()
	rng.randomize()
	wait_time = initial_wait_time

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _physics_process(delta):
	get_input()

func get_input():
	var arr = ["ui_one", "ui_two", "ui_three", "ui_four", "ui_five", "ui_six", "ui_seven"]
	
	for i in arr:
		if Input.is_action_just_pressed(i):
			var index = arr.find(i)
			pewpews.get_child(index).shoot()

func spawn_ohno():
	var spawn_pos = rng.randi_range(0, pewpew_amount-1)
	$MeteorSpawner.spawn_ohno(pewpews.get_child(spawn_pos).position)
	wait_time -= 0.05
	$Timer.wait_time = wait_time

func _on_Timer_timeout():
	spawn_ohno()
