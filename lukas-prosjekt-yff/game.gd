extends Control

var times_pressed = 0
var numbers = []
var checknumber = 1
var newnumber = false
var highscore = 0
var automize = false
var times_tried = 0
var full_score = 0

@onready var label: Label = $Label
@onready var label_2: Label = $Label2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.text = str(times_pressed)
	label_2.text = str(highscore)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if automize:
		automization()


func _on_button_pressed() -> void:
	newnumber = randi() % 100
	if newnumber <= times_pressed:
		times_tried += 1
		full_score += times_pressed
		print(calculate())
		times_pressed = 0
		
		
	else:
		times_pressed += 1
		if times_pressed > highscore:
			highscore = times_pressed
			label_2.text = str(highscore)
	
	label.text = str(times_pressed)
	
	
func check() :
	pass


func _on_button_2_pressed() -> void:
	if automize:
		automize = false
	else:
		automize = true

func calculate():
	var average = full_score / float(times_tried)
	return average

func automization():
	_on_button_pressed()
