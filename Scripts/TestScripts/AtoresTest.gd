extends KinematicBody2D
class_name AtoresTest

#=-=-=Constanstes - I=-=-=
const cima = Vector2(0, -1)
const gravidade = 15
const aceleracao = 200
const velocidade_Max = 500
const pulo = -300
const atritochao = 0.1
const atritoar = 0.005
#=-=-=Constanstes - F=-=-=

var movimento = Vector2.ZERO
var direct = Vector2.ZERO

func _physics_process(delta):
	movimento.y += gravidade
	pass

