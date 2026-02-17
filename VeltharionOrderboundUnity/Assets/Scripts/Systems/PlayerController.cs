using UnityEngine;
using VeltharionOrderbound.Core;

namespace VeltharionOrderbound.Systems
{
    [RequireComponent(typeof(CharacterController))]
    public class PlayerController : MonoBehaviour
    {
        public float speed = 7.5f;
        public float dodgeSpeed = 13f;
        public float staminaRegen = 24f;
        public Transform cameraTransform = null!;
        public CombatSystem combat = null!;

        private CharacterController controller = null!;
        private float dodgeTime;

        private void Awake() => controller = GetComponent<CharacterController>();

        private void Update()
        {
            var p = SaveSystem.Instance.Profile;
            p.stamina = Mathf.Min(p.maxStamina, p.stamina + staminaRegen * Time.deltaTime);

            var input = new Vector2(Input.GetAxisRaw("Horizontal"), Input.GetAxisRaw("Vertical"));
            var forward = cameraTransform.forward; forward.y = 0f; forward.Normalize();
            var right = cameraTransform.right; right.y = 0f; right.Normalize();
            var move = (right * input.x + forward * input.y).normalized;

            if (Input.GetKeyDown(KeyCode.Space) && p.stamina >= 20f)
            {
                dodgeTime = 0.18f;
                p.stamina -= 20f;
            }

            var currentSpeed = dodgeTime > 0f ? dodgeSpeed : speed;
            dodgeTime -= Time.deltaTime;
            controller.Move(move * currentSpeed * Time.deltaTime);

            if (Input.GetMouseButtonDown(0)) combat.DoMeleeArc(transform, 12f, 1.8f);
            if (Input.GetMouseButtonDown(1) && p.stamina >= combat.heavyStaminaCost)
            {
                p.stamina -= combat.heavyStaminaCost;
                combat.DoMeleeArc(transform, 24f, 2f);
            }
        }
    }
}
