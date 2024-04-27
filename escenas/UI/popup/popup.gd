class_name CustomPopup
extends Control

const ANIMATION_DURATION = 0.5

# SIGNALS
signal appear_finished
signal disappear_finished
signal primary_button_pressed
signal secondary_button_pressed
signal close_button_pressed

# NODE REFERENCES
@onready var title: Label = %PopupTitle
@onready var subtitle: Label = %PopupSubtitle
@onready var button1: Button = %PopupButton1
@onready var button2: Button = %PopupButton2

# EXPORTS
@export var custom_title: String = ""
@export var custom_subtitle: String = ""
@export var custom_button1_title: String = ""
@export var custom_button2_title: String = ""
@export var auto_display: bool = true


# ---BASIC METHODS---
func _ready():
	visible = false
	config_popup(custom_title, custom_subtitle, custom_button1_title, custom_button2_title)
	if auto_display:
		animate_appear()

# Function to configure all component labels
func config_popup(title: String, subtitle: String, primary_button_title: String, secondary_button_title: String = ""):
	self.title.text = title;
	self.subtitle.text = subtitle;
	if subtitle == "":
		self.subtitle.visible = false
	self.button1.text = primary_button_title;
	if secondary_button_title != "":
		self.button2.text = secondary_button_title
	else:
		self.button2.visible = false

# ---ANIMATIONS ---
func animate_appear():
	$Background.visible = true
	position.y = size.y
	visible = true
	var appear_tween = create_tween().set_trans(Tween.TRANS_SPRING).set_ease(Tween.EASE_OUT);
	appear_tween.tween_property(self, "position:y", 0, ANIMATION_DURATION)
	appear_tween.play()
	await appear_tween.finished
	emit_signal("appear_finished");

func animate_dispparear():
	var appear_tween = create_tween().set_trans(Tween.TRANS_SPRING).set_ease(Tween.EASE_IN);
	appear_tween.tween_property(self, "position:y", size.y, ANIMATION_DURATION)
	appear_tween.play()
	await appear_tween.finished
	emit_signal("disappear_finished");
	visible = true
	$Background.visible = false

# ---BUTTONS CONNECTION---

func _on_button_1_pressed():
	emit_signal("primary_button_pressed")


func _on_button_2_pressed():
	emit_signal("primary_button_pressed")


func _on_close_button_pressed():
	emit_signal("close_button_pressed")
	animate_dispparear();
