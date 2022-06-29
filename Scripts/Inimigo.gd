extends Atores

func _physics_process(delta):
	movimento = move_and_slide(movimento, cima)
	pass
