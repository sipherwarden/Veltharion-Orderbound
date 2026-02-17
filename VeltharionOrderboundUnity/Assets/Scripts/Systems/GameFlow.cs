using UnityEngine;
using VeltharionOrderbound.Core;
using VeltharionOrderbound.Data;

namespace VeltharionOrderbound.Systems
{
    public class GameFlow : MonoBehaviour
    {
        private void Start()
        {
            QuestSystem.Bootstrap(SaveSystem.Instance.Profile);
            SaveSystem.Instance.SaveAll();
        }

        public void CompleteTutorial()
        {
            var p = SaveSystem.Instance.Profile;
            QuestSystem.Advance(p, "tutorial_trial", 3);
            p.tutorialComplete = true;
            p.xp += 125;
            SaveSystem.Instance.SaveAll();
        }

        public void ClearDungeon()
        {
            var p = SaveSystem.Instance.Profile;
            p.inventory.Add("rift_core");
            p.sigils += 90;
            p.xp += 220;
            QuestSystem.Advance(p, "stabilize_rift", 1);
            SaveSystem.Instance.SaveAll();
        }

        public void RunRankedTrial(bool won, int botRating = 1020)
        {
            var p = SaveSystem.Instance.Profile;
            var res = RankedSystem.RunTrial(p, botRating, won);
            SaveSystem.Instance.AddLedgerEntry(new LedgerEntry
            {
                botRating = botRating,
                won = won,
                oldElo = res.oldElo,
                newElo = res.newElo,
                delta = res.delta,
                division = res.division
            });
        }
    }
}
