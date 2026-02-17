# Build Order Checklist

1. Open project and import autoload singletons.
2. Verify input map via `InputMapLoader`.
3. Create `order_hall.tscn` as main scene.
4. Add player + camera rig + NavigationRegion3D.
5. Configure GameFlow child systems.
6. Build training arena and dungeon scenes.
7. Build ranked arena scene and ladder UI.
8. Wire save/load hooks on scene enter/exit.
9. Validate quests, rewards, and ledger writes.
10. Run test plan before packaging.
