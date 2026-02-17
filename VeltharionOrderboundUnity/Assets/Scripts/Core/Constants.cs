using System.Collections.Generic;

namespace VeltharionOrderbound.Core
{
    public static class Constants
    {
        public const int SaveVersion = 1;
        public const int BaseElo = 1000;
        public const float EloScale = 400f;
        public const int DefaultKFactor = 32;

        public static readonly List<(string Name, int Min, int Max)> Divisions = new()
        {
            ("Bronze", 1000, 1199),
            ("Silver", 1200, 1399),
            ("Gold", 1400, 1599),
            ("Platinum", 1600, 1799),
            ("Diamond", 1800, 1999),
            ("Mythic", 2000, 2199),
            ("Ascendant", 2200, 2399),
            ("Grandmaster", 2400, 9999)
        };
    }
}
