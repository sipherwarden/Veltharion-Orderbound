# Veltharion: Orderbound (Godot 4.x)

Top-down 3D ARPG vertical slice featuring:
- Order Hall hub
- House + lineage framework
- Combat (light/heavy/dodge/stamina)
- Rift dungeon loop
- Offline ranked trials with ELO ladder + immutable ledger
- Local persistence with migration-ready save model
- Optional FastAPI online ladder stub

## Running
1. Open `VeltharionOrderbound/project.godot` in Godot 4.2+.
2. Press Play (main scene: `order_hall.tscn`).
3. Use `J/K` for light/heavy in MVP bindings, `1/2/3` for abilities, `Q/E/R` camera.

## Required Scene Setup in Editor
- `Player` is `CharacterBody3D` with script `player_controller.gd`.
- Add `CollisionShape3D`, `CombatSystem`, `AbilitySystem` as children.
- `CameraRig` uses `navigation_system.gd`; assign Camera3D path.
- `NavigationRegion3D` should include baked navmesh for AI movement.

## Offline Ranked Formula
`expected = 1/(1 + 10^((opponent-player)/400))`
`new_elo = old_elo + K * (score - expected)`

## Chapters/Quest Arc
- Prologue: Enter the Order
- Act I: Stabilization
- Act II: False Records
- Act III: Siege of the Ledger
- Epilogue: Season activation
