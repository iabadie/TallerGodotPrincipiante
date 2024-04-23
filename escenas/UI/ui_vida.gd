extends Control

@export var personaje: Texture2D

func actualizar_vida(vidas: int):
	$HBoxContainer/Label.text = "Vidas:"
	for n in $HBoxContainer/VidasContainer.get_children():
		$HBoxContainer/VidasContainer.remove_child(n)
	for n in range(vidas):
		var sp = TextureRect.new()
		sp.texture = personaje
		sp.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
		sp.custom_minimum_size  = Vector2(50, 50)
		sp.size_flags_vertical =Control.SIZE_SHRINK_CENTER
		$HBoxContainer/VidasContainer.add_child(sp)
