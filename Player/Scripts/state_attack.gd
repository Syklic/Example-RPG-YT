class_name State_Attack extends State

var attacking : bool = false

@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"
@onready var walk: State = $"../Walk"
@onready var idle: State_Idle = $"../Idle"


## What happens when the player enters this State?
func Enter() -> void:
	player.UpdateAnimation("attack")
	animation_player.animation_finished.connect( EndAttack )
	attacking = true
	pass


## What happens when the player exits this State?
func Exit() -> void:
	animation_player.animation_finished.disconnect( EndAttack )
	attacking = false
	pass


## what happens during the _process update in this State?
func Process( _delta : float ) -> State:
	player.velocity = Vector2.ZERO
	
	if attacking == false:
		if player.direction == Vector2.ZERO:
			return idle
		else:
			return walk
	return null


## What happens during the _physics_process update in this State?
func Physics( _delta : float ) -> State:
	return null


## What happens with the input events in this State?
func HandleInput( _event : InputEvent ) -> State:
	return null



func EndAttack( _newAnimName : String ) -> void:
	attacking = false
