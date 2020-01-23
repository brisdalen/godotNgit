extends KinematicBody2D

# Declare member variables here. Examples:
var rng = RandomNumberGenerator.new()
var velocity = Vector2(0, 0)

# Rotate the meteor a random amount, and then rotate the label the inverse amount.
func _ready():
	rng.randomize()
	var rotationAmount = rng.randf_range(0.0, 360.0)
	rotation_degrees = rotationAmount;
	var label = get_child(0).get_child(0)
	label.rect_rotation = 360-rotationAmount


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	velocity += Vector2(0, 10) * delta
	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		var collision_point = collision_info.position
		queue_free()
		print(collision_point)
		
func lazer_hit():
	print("ohno hit")
	queue_free()