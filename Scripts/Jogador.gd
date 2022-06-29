extends Atores

func _physics_process(delta):
	movimento.x = 0
	if is_on_floor():
		if Input.is_action_pressed("cus_ui_pular"):
			movimento.y = pulo
	if Input.is_action_pressed("cus_ui_moverdireita"):
		movimento.x += velocidade
	if Input.is_action_pressed("cus_ui_moveresquerda"):
		movimento.x += -velocidade
	movimento = move_and_slide(movimento, cima)
	pass
