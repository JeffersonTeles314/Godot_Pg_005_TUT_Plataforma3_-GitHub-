extends KinematicBody2D
class_name Atores

#Constanstes - I
const cima = Vector2(0, -1)
const gravidade = 5
const velocidade = 200
const pulo = -300
#Constanstes - F

#Variável de Velocidade - I
var movimento = Vector2()
#Variável de Velocidade - F

func _physics_process(_delta):
	#Código de Gravidade - I
	movimento.y += gravidade
	#Código de Gravidade - F
	print('1')
	pass
