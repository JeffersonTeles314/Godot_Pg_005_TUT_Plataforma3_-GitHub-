extends Actor


@onready var stomp_area: Area2D = $StompArea2D


func _ready() -> void:
	set_physics_process(false)
	_velocity.x = -speed.x


func _physics_process(delta: float) -> void:
	var snap: = Vector2.DOWN * 65.0
	set_velocity(_velocity)
	# TODOConverter40 looks that snap in Godot 4.0 is float, not vector like in Godot 3 - previous value `snap`
	set_up_direction(FLOOR_NORMAL)
	move_and_slide()
	_velocity.y = velocity.y
	_velocity.x *= -1 if is_on_wall() else 1


func _on_StompArea2D_body_entered(body: PhysicsBody2D) -> void:
	if body.global_position.y > stomp_area.global_position.y:
		return
	die()


func die() -> void:
	queue_free()
