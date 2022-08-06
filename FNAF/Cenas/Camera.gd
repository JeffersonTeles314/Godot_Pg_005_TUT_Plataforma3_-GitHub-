extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Controle/Cam1.connect(“pressed”, self, “_on_Cam1_pressed”)
func _on_Cam1_pressed():
	
