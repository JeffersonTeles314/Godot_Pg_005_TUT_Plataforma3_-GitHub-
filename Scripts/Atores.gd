extends CharacterBody2D
class_name Atores

#=-=-=Constanstes - I=-=-=
const cima = Vector2(0.0, -1.0)
const gravidade = 15
#=-=-=Constanstes - F=-=-=

#=-=-=Constanstes do Jogador - I=-=-=
const aceleracao = 50
const velocidade_max = 200
const pulo = -300
const atritochao = 0.2
const atritoar = 0.005
const forcejumpbreak = 0.5
var is_jumpbreak = false 
#=-=-=Constanstes do Jogador - F=-=-=

const velinimg = 50.0

#=-=-=Vetores de Movimento - F=-=-=
var movimento = Vector2.ZERO
var direct = Vector2.ZERO
#=-=-=Vetores de Movimento - F=-=-=

func _physics_process(delta):
	movimento.y += gravidade
	pass

