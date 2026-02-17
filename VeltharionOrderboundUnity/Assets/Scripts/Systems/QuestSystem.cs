using System.Linq;
using VeltharionOrderbound.Data;

namespace VeltharionOrderbound.Systems
{
    public static class QuestSystem
    {
        public static void Bootstrap(PlayerProfile profile)
        {
            foreach (var q in QuestDefs.All)
            {
                if (profile.quests.All(x => x.id != q.Id))
                {
                    profile.quests.Add(new QuestRecord { id = q.Id, goal = q.Goal, progress = 0, completed = false });
                }
            }
        }

        public static void Advance(PlayerProfile profile, string questId, int amount = 1)
        {
            var rec = profile.quests.FirstOrDefault(x => x.id == questId);
            if (rec == null || rec.completed) return;

            rec.progress = System.Math.Min(rec.progress + amount, rec.goal);
            if (rec.progress >= rec.goal)
            {
                rec.completed = true;
                var reward = QuestDefs.All.FirstOrDefault(x => x.Id == questId).Reward;
                profile.sigils += reward;
            }
        }
    }
}
