# Acceptance Test Plan

1. **New Profile Flow**
   - Delete `user://profile.json`.
   - Launch game.
   - Choose House + sub-lineage from character create view.
   - Expected: Spawn in Order Hall and profile saved.

2. **Tutorial Completion**
   - Enter Training Arena.
   - Perform movement, light/heavy attack, ability usage.
   - Trigger tutorial completion.
   - Expected: quest `tutorial_trial` complete, +75 Sigils.

3. **Dungeon Clear**
   - Enter `rift_dungeon_01`.
   - Defeat two basic + one elite enemy.
   - Open reward chest event.
   - Expected: Loot added and Sigils increased by 90.

4. **Ranked Trial / ELO**
   - Start Ranked Arena trial vs bot.
   - Win match then lose match.
   - Expected: ELO updates by logistic formula; ledger entry appended each match.

5. **Leaderboard Refresh**
   - Open leaderboard tab after ranked match.
   - Expected: top ELO, wins, and level reflect latest profile data.

6. **Persistence**
   - Quit and relaunch.
   - Expected: House/lineage, quests, rank, and inventory retained.
