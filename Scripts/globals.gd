extends Node

var dark_world: bool = false

var switchLock: bool = false

var can_switch: bool = true

var in_dialog: bool = false

var alec_first_talk: bool = false

var tried_dying: bool = false

var alec_died: bool = false

var start_tossing: bool = false

var ball_thrown: bool = false

var catches: int = 0

# Bus
var talked_to_bus: bool = false
var queue_outro: bool = false
var bus_move: bool = false
# Dog:
var has_met_dogman: bool = false
var has_tuna: bool = false
var has_fed: bool = true
var played_fetch: bool = true
var dog_has_new_owner: bool = true
var ended_dogman_quest: bool = false
