extends Atores

func _ready():
	movimento.x = -velinimg
	set_physics_process(false)
	
func _on_areadepulo_body_entered(body):
	if body.global_position.y > get_node("areadepulo").global_position.y:
		return
	else:
		morrer()

func morrer() -> void:
	queue_free()

func _physics_process(delta):
	movimento.y = move_and_slide(movimento, cima).y
	if is_on_wall():
		movimento.x *= -1
	pass


