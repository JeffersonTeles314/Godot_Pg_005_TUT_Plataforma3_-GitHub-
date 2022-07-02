extends Atores

func _ready():
	movimento.x = -velocidade_max
	set_physics_process(false)
	
func _physics_process(delta):
	movimento.y = move_and_slide(movimento, cima).y
	if is_on_wall():
		movimento.x *= -1
	pass
