extends Node

func _ready():
	$AudioStreamPlayer2D.play()

func _on_jugar_pressed():
	get_tree().change_scene("res://Main.tscn")


func _on_salir_pressed():
	get_tree().quit()
