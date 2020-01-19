extends RigidBody2D

# Declare member variables here. Examples:
var rng = RandomNumberGenerator.new()


# Rotate the meteor a random amount, and then rotate the label the inverse amount.
func _ready():
	rng.randomize()
	var rotationAmount = rng.randf_range(0.0, 360.0)
	rotation_degrees = rotationAmount;
	var label = get_child(1).get_child(0)
	label.rect_rotation = 360-rotationAmount


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _fixed_process(delta):
	pass