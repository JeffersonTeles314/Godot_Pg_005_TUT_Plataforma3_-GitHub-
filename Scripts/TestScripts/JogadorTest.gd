#=-=-=GetDirect=-=-=
func GetDirect():
	direct.x = 0
	if Input.is_action_pressed("cus_ui_moverdireita"):
		direct.x += 1
	if Input.is_action_pressed("cus_ui_moveresquerda"):
		direct.x -= 1
	if is_on_floor() and Input.is_action_pressed("cus_ui_pular"):
		direct.y = 1

#=-=-=GetMov=-=-=
func GetMov(
vel_ins,
direct,
acel,
e_pulo_interropido
):
	#Movimento Horizontal
	var vel_f = null
	if direct > 0:
		vel_f.x = min(acel.x * direct.x + vel_ins.x, Velocidade_Max)
	if direct < 0:
		vel_f.x = max(acel.x * direct.x - vel_ins.x, -Velocidade_Max)
	#Movimento Horizontal
	
	#Movimento Vertical/Pulo
	if direct.y != 0.0:
		#Pulo Normal
		velocity.y = .y * direction.y
		#Pulo Normal
		
	if Input.is_action_just_released("jump") and _velocity.y < 0.0:
		#Pulo Interrompido
		velocity.y = 0.0
		#Pulo Interrompido
	#Movimento Vertical/Pulo
	
	#=-=-=Código Atrito - I=-=-=
	if is_on_floor():
		movimento.x = lerp(movimento.x, 0, atritochao)
	else:
		movimento.x = lerp(movimento.x, 0, atritoar)
	#=-=-=Código Atrito - F=-=-=
	return velocity

func _physics_process(_delta):
	movimento = move_and_slide(movimento, cima)
	pass
