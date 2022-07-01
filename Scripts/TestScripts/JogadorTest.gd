extends AtoresTest

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
vel_ins,
direct
):
	#Movimento Horizontal
	if direct.x > 0:
		vel_ins.x = min(vel_ins.x + aceleracao * direct.x, velocidade_Max)
	if direct.x < 0:
		vel_ins.x = max(vel_ins.x + aceleracao * direct.x , -velocidade_Max)
	#Movimento Horizontal
	
	#Movimento Vertical/Pulo
	#Pulo Normal
	if direct.y != 0:
		vel_ins.y = pulo * direct.y
	#Pulo Normal
	
	#Pulo Interrompido
	if Input.is_action_just_released("jump") and vel_ins.y < 0.0:
		vel_ins.y = 0.0
	#Pulo Interrompido
	#Movimento Vertical/Pulo
	
	#=-=-=Código Atrito - I=-=-=
	if is_on_floor():
		vel_ins.x = lerp(vel_ins.x, 0, atritochao)
	else:
		vel_ins.x = lerp(vel_ins.x, 0, atritoar)
	#=-=-=Código Atrito - F=-=-=
	return vel_ins

func _physics_process(delta):
	GetDirect()
	movimento = GetMov(movimento, direct)
	movimento = move_and_slide(movimento, cima)
	pass
