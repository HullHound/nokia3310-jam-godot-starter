extends Sprite2D

@export var round_to_pixel: bool = false;

var sfx:AudioStream = preload("res://data/sfx/sfx01.wav")
var _original_position:Vector2 = Vector2()
var _accurate_position: Vector2 = Vector2()

var _position:Vector2 = Vector2()
var _velocity:Vector2 = Vector2()


func _ready() -> void:
	_original_position = position

func _process(delta: float) -> void:
	_velocity.y -= 60.0 * delta
	_position += _velocity * delta
	if _position.y < 0:
		_velocity.y -= _position.y
		_position.y = 0.0
		
	_accurate_position =  _original_position - _position
		
	if round_to_pixel:
		position = Vector2i(_accurate_position)
	else:
		position = _accurate_position


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("jump"):
		if _position == Vector2.ZERO:
			AudioManager.play_sfx(sfx)
			_velocity.y = 30
