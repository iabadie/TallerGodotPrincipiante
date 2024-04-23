extends Control

func _ready():
	visible = false

func mostrar_modal():
	visible = true
	$PanelContainer/MarginContainer/VBoxContainer/Record.text = "Tu Record" + str(Puntuacion.record)
	$PanelContainer/MarginContainer/VBoxContainer/Puntuacion.text = "Tu puntuación" + str(Puntuacion.puntuacion)


func _on_reintentar_pressed():
	get_tree().reload_current_scene()

func fin_partida():
	mostrar_modal()
