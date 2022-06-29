extends Atores

func _physics_process(_delta):
	#=-=-=Código-Anti-Aceleração - I=-=-=
	movimento.x = 0
	#=-=-=Código-Anti-Aceleração - F=-=-=
	
	#=-=-=Código de Pulo - I=-=-=
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			movimento.y = pulo
	#=-=-=Código de Pulo - F=-=-=
	#=-=-=Movimentação Direita - I=-=-=
	if Input.is_action_pressed("ui_right"):
		movimento.x = min(movimento.x + Aceleracao , Velocidade_Max)
	#=-=-=Movimentação Direita - F=-=-=
	
	#=-=-=Movimentação Esquerda - I=-=-=
	if Input.is_action_pressed("ui_left"):
		movimento.x = max(movimento.x - Aceleracao , -Velocidade_Max)
	#=-=-=Movimentação Esquerda - F=-=-=
	
	#=-=-=Código Atrito - I=-=-=
	if is_on_floor():
		movimento.x = lerp(movimento.x, 0, atritochao)
	else:
		movimento.x = lerp(movimento.x, 0, atritoar)
	#=-=-=Código Atrito - F=-=-=
	movimento = move_and_slide(movimento, cima)
	pass
