extends Node
class_name Constants

const SAVE_VERSION: int = 1
const BASE_ELO: int = 1000
const ELO_SCALE: float = 400.0
const DEFAULT_K_FACTOR: int = 32

const DAMAGE_TYPES := {
	"physical": 0,
	"arcane": 1,
	"nature": 2,
	"shadow": 3,
	"storm": 4
}

const STATUS_TYPES := ["burn", "slow", "stun", "bleed", "weaken"]

const DIVISIONS := [
	{"name":"Bronze", "min":1000, "max":1199},
	{"name":"Silver", "min":1200, "max":1399},
	{"name":"Gold", "min":1400, "max":1599},
	{"name":"Platinum", "min":1600, "max":1799},
	{"name":"Diamond", "min":1800, "max":1999},
	{"name":"Mythic", "min":2000, "max":2199},
	{"name":"Ascendant", "min":2200, "max":2399},
	{"name":"Grandmaster", "min":2400, "max":9999}
]
