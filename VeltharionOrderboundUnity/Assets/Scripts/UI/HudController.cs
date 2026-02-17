using TMPro;
using UnityEngine;
using UnityEngine.UI;
using VeltharionOrderbound.Core;

namespace VeltharionOrderbound.UI
{
    public class HudController : MonoBehaviour
    {
        public Slider hpBar = null!;
        public Slider staminaBar = null!;
        public TMP_Text questText = null!;

        private void Update()
        {
            var p = SaveSystem.Instance.Profile;
            hpBar.maxValue = p.maxHp;
            hpBar.value = p.hp;
            staminaBar.maxValue = p.maxStamina;
            staminaBar.value = p.stamina;
            questText.text = p.tutorialComplete ? "Trial complete. Enter the Rift." : "Complete tutorial trial.";
        }
    }
}
