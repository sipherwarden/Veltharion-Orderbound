using System;
using System.Collections.Generic;
using VeltharionOrderbound.Core;

namespace VeltharionOrderbound.Data
{
    [Serializable]
    public class RankedStats
    {
        public int elo = Constants.BaseElo;
        public int wins;
        public int losses;
        public int streak;
    }

    [Serializable]
    public class QuestRecord
    {
        public string id = "";
        public int progress;
        public int goal;
        public bool completed;
    }

    [Serializable]
    public class PlayerProfile
    {
        public int version = Constants.SaveVersion;
        public string playerName = "Initiate";
        public string house = "";
        public string lineage = "";
        public int level = 1;
        public int xp;
        public int sigils;
        public float hp = 100f;
        public float maxHp = 100f;
        public float stamina = 100f;
        public float maxStamina = 100f;
        public RankedStats ranked = new();
        public List<QuestRecord> quests = new();
        public List<string> inventory = new();
        public bool tutorialComplete;
    }

    [Serializable]
    public class LedgerEntry
    {
        public string id = "";
        public string timestamp = "";
        public string mode = "ranked_trial";
        public int botRating;
        public bool won;
        public int oldElo;
        public int newElo;
        public int delta;
        public string division = "Bronze";
    }

    [Serializable]
    public class LedgerContainer
    {
        public List<LedgerEntry> entries = new();
    }
}
