using System.Collections.Generic;

namespace VeltharionOrderbound.Data
{
    public static class QuestDefs
    {
        public static readonly List<(string Id, int Goal, int Reward)> All = new()
        {
            ("prologue_oath", 1, 50),
            ("tutorial_trial", 3, 75),
            ("stabilize_rift", 1, 120),
            ("recover_sigils", 5, 100),
            ("unlock_codex", 1, 60),
            ("false_records", 3, 150),
            ("audit_memory", 2, 130),
            ("nullcourt_trace", 1, 140),
            ("ledger_siege", 1, 240),
            ("vesper_echo", 1, 300),
            ("season_zero", 3, 180)
        };
    }
}
