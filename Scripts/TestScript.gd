extends Atores

func _physics_process(_delta):
	#Redefinido o Valor do Movimento - I
	movimento.x = 0
	#Redefinido o Valor do Movimento - F
	
	#Código de Pulo - I
	if is_on_floor():
		if Input.is_action_pressed("cus_ui_pular"):
			movimento.y = pulo
	#Código de Pulo - F
	
	#Movimentação Direita - I
	if Input.is_action_pressed("cus_ui_moverdireita"):
		movimento.x += velocidade
	#Movimentação Direita - F
	
	#Movimentação Esquerda - I
	if Input.is_action_pressed("cus_ui_moveresquerda"):
		movimento.x += -velocidade
	#Movimentação Esquerda - F
	movimento = move_and_slide(movimento, cima)
	pass
