# Veltharion: Orderbound (Unity Runtime Port)

This folder provides a Unity-runnable implementation of the vertical slice requested for **Veltharion: Orderbound**.

## Unity Version
- Recommended: **Unity 2022.3 LTS** (URP or Built-in both acceptable for placeholders)

## Implemented Gameplay Systems
- Top-down 3D movement relative to camera (`PlayerController.cs`)
- Smooth top-down camera orbit controls Q/E/R (`TopDownCameraController.cs`)
- Combat with light/heavy attacks + stamina (`CombatSystem.cs`)
- Enemy nav AI with aggro/retreat logic (`EnemyAI.cs`)
- Offline persistence to JSON profile + immutable ledger (`SaveSystem.cs`)
- Ranked Trials ELO + divisions (`RankedSystem.cs`)
- Quest progression + rewards (`QuestSystem.cs`)
- Vertical-slice flow hooks for tutorial, dungeon, ranked (`GameFlow.cs`)

## Scene Setup (Required)
1. Create scene `OrderHall`.
2. Add `GameObject` named `Bootstrap` with `SaveSystem`.
3. Add `GameObject` named `GameFlow` with `GameFlow`.
4. Add Player capsule with `CharacterController`, `PlayerController`, and `CombatSystem`.
5. Add Camera with `TopDownCameraController`; assign player as target.
6. Add ground plane and bake NavMesh.
7. Add enemy prefabs with `NavMeshAgent` + `EnemyAI`, set target to player.
8. Add Canvas HUD with sliders/text and `HudController`.

## Control Mapping
- WASD: move
- Mouse Left: light attack
- Mouse Right: heavy attack
- Space: dodge
- Q/E: camera rotate
- R: camera reset

## Persistence
- Profile: `Application.persistentDataPath/profile.json`
- Ledger: `Application.persistentDataPath/ledger.json`
