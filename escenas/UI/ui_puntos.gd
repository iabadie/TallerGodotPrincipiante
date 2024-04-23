extends Label

var texto: String = "Puntos: "

func _ready():
	if text != "":
		texto = text
	actualizar_texto()

func _process(delta):
	actualizar_texto()

func actualizar_texto():
	text = texto + " " + str(Puntuacion.puntuacion)
