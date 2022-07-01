extends KinematicBody2D
class_name AtoresTest

#=-=-=Constanstes - I=-=-=
const cima = Vector2(0, -1)
const gravidade = 15
#=-=-=Constanstes - F=-=-=

#=-=-=Constanstes do Jogador - I=-=-=
const aceleracao = 200
const velocidade_Max = 500
const pulo = -600
const atritochao = 0.2
const atritoar = 0.005
const forcejumpbreak = 0.5
var is_jumpbreak = false 
#=-=-=Constanstes do Jogador - F=-=-=

#=-=-=Vetores de Movimento - F=-=-=
var movimento = Vector2.ZERO
var direct = Vector2.ZERO
#=-=-=Vetores de Movimento - F=-=-=

func _physics_process(delta):
	movimento.y += gravidade
	pass

