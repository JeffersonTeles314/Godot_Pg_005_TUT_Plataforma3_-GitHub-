extends Atores

#=-=-=GetDirect=-=-=
func GetDirect():
	direct.x = 0
	direct.y = 0
	if Input.is_action_pressed("cus_ui_moverdireita"):
		direct.x += 1
	if Input.is_action_pressed("cus_ui_moveresquerda"):
		direct.x -= 1
	if is_on_floor() and Input.is_action_pressed("cus_ui_pular"):
		direct.y += 1

#=-=-=GetMov=-=-=
func GetMov(
mov_ins,
direct
):
	#Movimento Horizontal
	if direct.x > 0:
		mov_ins.x = min(mov_ins.x + aceleracao * direct.x, velocidade_max)
	if direct.x < 0:
		mov_ins.x = max(mov_ins.x + aceleracao * direct.x , -velocidade_max)
	#Movimento Horizontal
	
	#Movimento Vertical/Pulo
	#Pulo Normal
	if direct.y != 0:
		mov_ins.y = pulo * direct.y
	#Pulo Normal
	
	#Pulo Interrompido
	if Input.is_action_just_released("cus_ui_pular") and mov_ins.y < 0.0:
		is_jumpbreak = true
	if is_jumpbreak == true:
		mov_ins.y = lerp(mov_ins.y, 0, forcejumpbreak)
		if mov_ins.y >= 0:
			is_jumpbreak = false
	#Pulo Interrompido
	#Movimento Vertical/Pulo
	
	#=-=-=Código Atrito - I=-=-=
	if is_on_floor():
		mov_ins.x = lerp(mov_ins.x, 0, atritochao)
	else:
		mov_ins.x = lerp(mov_ins.x, 0, atritoar)
	#=-=-=Código Atrito - F=-=-=
	return mov_ins

func GetAnim():
	#=-=-=Codigo Mov.Direita=-=--=
	if direct.x > 0:
		$Sprite.flip_h = false
		if  is_on_floor() == true:
			$Sprite.play("Correndo")
	#=-=-=Codigo Mov.Direita=-=--=
	#=-=-=Codigo Mov.Esquerda=-=-=
	elif direct.x < 0:
		$Sprite.flip_h = true
		if  is_on_floor() == true:
			$Sprite.play("Correndo")
	#=-=-=Codigo Mov.Esquerda=-=-=
	#=-=-=Codigo Parado=-=-=
	else:
		$Sprite.play("Parado")
	#=-=-=Codigo Parado=-=-=
	#=-=-=Código de Pulo=-=-=
	if is_on_floor() == false:
		get_node("Sprite").play("Pulando")
	#=-=-=Código de Pulo=-=-=

func _physics_process(delta):
	GetDirect()
	GetAnim()
	movimento = GetMov(movimento, direct)
	movimento = move_and_slide(movimento, cima)
	pass
