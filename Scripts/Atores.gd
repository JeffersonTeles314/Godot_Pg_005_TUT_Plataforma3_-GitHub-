extends KinematicBody2D
class_name Atores

const cima = Vector2(0, -1)
const gravidade = 5
const velocidade = 200
const pulo = -300
var movimento = Vector2()
func _physics_process(delta):
	movimento.y += gravidade
	pass
