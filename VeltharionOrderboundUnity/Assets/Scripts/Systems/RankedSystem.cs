using System;
using UnityEngine;
using VeltharionOrderbound.Core;
using VeltharionOrderbound.Data;

namespace VeltharionOrderbound.Systems
{
    public static class RankedSystem
    {
        public static (int oldElo, int newElo, int delta, string division) RunTrial(PlayerProfile profile, int botRating, bool won, int kFactor = Constants.DefaultKFactor)
        {
            var oldElo = profile.ranked.elo;
            var expected = 1f / (1f + Mathf.Pow(10f, (botRating - oldElo) / Constants.EloScale));
            var score = won ? 1f : 0f;
            var delta = (int)Mathf.Round(kFactor * (score - expected));
            profile.ranked.elo = Math.Max(900, oldElo + delta);

            if (won)
            {
                profile.ranked.wins += 1;
                profile.ranked.streak = Math.Max(1, profile.ranked.streak + 1);
            }
            else
            {
                profile.ranked.losses += 1;
                profile.ranked.streak = Math.Min(-1, profile.ranked.streak - 1);
            }

            return (oldElo, profile.ranked.elo, delta, GetDivision(profile.ranked.elo));
        }

        public static string GetDivision(int elo)
        {
            foreach (var d in Constants.Divisions)
            {
                if (elo >= d.Min && elo <= d.Max) return d.Name;
            }
            return "Unranked";
        }
    }
}
