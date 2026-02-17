# Unity Acceptance Test Plan

1. Launch scene with `SaveSystem` and verify new `profile.json` is created.
2. Move player with WASD; rotate camera with Q/E and reset with R.
3. Attack enemy with left/right mouse and confirm enemy destruction.
4. Trigger `GameFlow.CompleteTutorial()` and confirm tutorial quest + sigils in JSON.
5. Trigger `GameFlow.ClearDungeon()` and confirm loot (`rift_core`) + sigils.
6. Trigger `GameFlow.RunRankedTrial(true/false)` and verify ELO + ledger update.
7. Restart game and verify profile + ledger persist.
