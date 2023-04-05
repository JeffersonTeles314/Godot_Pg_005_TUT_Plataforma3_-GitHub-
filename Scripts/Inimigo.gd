extends atores_class

func _ready():
	velocity.x = -velinimg
	set_physics_process(false)
	
func _on_areadepulo_body_entered(body):
	if body.global_position.y > get_node("areadepulo").global_position.y:
		return
	else:
		morrer()

func morrer() -> void:
	queue_free()

func _physics_process(_delta):
	set_velocity(velocity)
	set_up_direction(cima)
	move_and_slide()
	velocity.y = velocity.y
	if is_on_wall():
		velocity.x *= -1.0
	pass


