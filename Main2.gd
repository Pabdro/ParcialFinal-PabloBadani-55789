extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$musicat.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_JefeReal_tree_exited():
	get_tree().change_scene("res://MainP.tscn")
	Main.vida = 100
	Main.contador = 0


#func _on_jugador_tree_exited():
#	get_tree().change_scene("res://MainP.tscn")
#	Main.vida = 100
#	Main.contador = 0
