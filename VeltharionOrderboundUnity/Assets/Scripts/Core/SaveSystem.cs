using System;
using System.IO;
using UnityEngine;
using VeltharionOrderbound.Data;

namespace VeltharionOrderbound.Core
{
    public class SaveSystem : MonoBehaviour
    {
        public static SaveSystem Instance { get; private set; } = null!;

        public PlayerProfile Profile = new();
        public LedgerContainer Ledger = new();

        private string ProfilePath => Path.Combine(Application.persistentDataPath, "profile.json");
        private string LedgerPath => Path.Combine(Application.persistentDataPath, "ledger.json");

        private void Awake()
        {
            if (Instance != null && Instance != this)
            {
                Destroy(gameObject);
                return;
            }
            Instance = this;
            DontDestroyOnLoad(gameObject);
            LoadAll();
        }

        public void LoadAll()
        {
            Profile = ReadJson<PlayerProfile>(ProfilePath) ?? new PlayerProfile();
            Ledger = ReadJson<LedgerContainer>(LedgerPath) ?? new LedgerContainer();
            if (Profile.version != Constants.SaveVersion)
            {
                Profile.version = Constants.SaveVersion;
            }
        }

        public void SaveAll()
        {
            WriteJson(ProfilePath, Profile);
            WriteJson(LedgerPath, Ledger);
        }

        public void AddLedgerEntry(LedgerEntry entry)
        {
            entry.id = $"{DateTimeOffset.UtcNow.ToUnixTimeSeconds()}-{Ledger.entries.Count}";
            entry.timestamp = DateTime.UtcNow.ToString("o");
            Ledger.entries.Add(entry);
            SaveAll();
        }

        private static T? ReadJson<T>(string path) where T : class
        {
            if (!File.Exists(path)) return null;
            var json = File.ReadAllText(path);
            return JsonUtility.FromJson<T>(json);
        }

        private static void WriteJson<T>(string path, T data)
        {
            var json = JsonUtility.ToJson(data, true);
            File.WriteAllText(path, json);
        }
    }
}
