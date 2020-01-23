extends Area2D

# Declare member variables here. Examples:
var bullet_speed = Vector2(0, -800)
const KILL_TIMER = 4
var timer = 0
var hit_something = false

# Called when the node enters the scene tree for the first time.
func _ready():
	print("shot shot!")
	$KinematicBody2D.connect("body_entered", self, "collided")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	translate(bullet_speed * delta)
	timer += delta
	if timer >= KILL_TIMER:
		queue_free()

func collided(body):
	if hit_something == false:
		if body.has_method("lazer_hit") && body.has_method("queue_free"):
			body.queue_free()
			
	hit_something = true
	queue_free()
