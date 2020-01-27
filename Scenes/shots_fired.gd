extends Area2D

# Declare member variables here. Examples:
var bullet_speed = Vector2(0, -800)
const KILL_TIMER = 4
var timer = 0
var isAlive = true

# Called when the node enters the scene tree for the first time.
func _ready():
	print("shot shot!")
# warning-ignore:return_value_discarded
	self.connect("area_entered", self, "_on_ohno_area_entered")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	translate(bullet_speed * delta)
	timer += delta
	if isAlive == true && timer >= KILL_TIMER:
		isAlive = false;
		
# warning-ignore:unused_argument
func _on_ohno_area_entered(area):
	queue_free()