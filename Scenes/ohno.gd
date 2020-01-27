extends Area2D

# Declare member variables here. Examples:
var rng = RandomNumberGenerator.new()
var speed = Vector2(0, 1.5)
var velocity = Vector2(0, 0)

# Rotate the meteor a random amount, and then rotate the label the inverse amount.
func _ready():
	self.connect("area_entered", self, "_on_shots_fired_area_entered")
	rng.randomize()
	var rotationAmount = rng.randf_range(0.0, 360.0)
	rotation_degrees = rotationAmount;
	var label = get_child(0).get_child(0)
	label.rect_rotation = 360-rotationAmount


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	velocity += speed * delta
	self.position += velocity

func _on_shots_fired_area_entered(area):
	queue_free()
