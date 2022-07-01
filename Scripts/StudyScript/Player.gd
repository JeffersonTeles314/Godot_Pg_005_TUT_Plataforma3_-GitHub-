extends Actor

	func _physics_process(delta: float) -> void:
		#Pegar Pulo Interrompido
		var is_jump_interrupted: = Input.is_action_just_released("jump") and _velocity.y < 0.0
		#Chamar Função Pegar Direção
		var direction: = get_direction()
		#Chamar Função Pegar Velocidade
		_velocity = calculate_move_velocity(_velocity, direction, speed, is_jump_interrupted)
		#Observação(Não sei o que é isso!)
		var snap: Vector2 = Vector2.DOWN * 60.0 if direction.y == 0.0 else Vector2.ZERO
		_velocity = move_and_slide_with_snap(
			_velocity, snap, FLOOR_NORMAL, true
		)
	
	
	func get_direction() -> Vector2:
		#Pegar Direção
		return Vector2(
			Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
			-Input.get_action_strength("jump") if is_on_floor() and Input.is_action_just_pressed("jump") else 0.0
		)
	
	
	func calculate_move_velocity(
			vel_ins: Vector2,
			direct: Vector2,
			acel: Vector2,
			is_jump_interrupted: bool
		) -> Vector2:
		var velocity: = vel_ins
		
		#Movimento Horizontal
		velocity.x = acel.x * direct.x
		
		#Movimento Vertical/Pulo
		if direct.y != 0.0:
			#Pulo Normal
			velocity.y = speed.y * direction.y
		if is_jump_interrupted:
			#Pulo Interrompido
			velocity.y = 0.0
		return velocity