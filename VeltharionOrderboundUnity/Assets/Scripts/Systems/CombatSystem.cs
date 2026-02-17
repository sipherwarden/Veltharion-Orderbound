using UnityEngine;

namespace VeltharionOrderbound.Systems
{
    public class CombatSystem : MonoBehaviour
    {
        public float heavyStaminaCost = 25f;
        public LayerMask enemyMask;

        public void DoMeleeArc(Transform attacker, float damage, float radius)
        {
            var hits = Physics.OverlapSphere(attacker.position + attacker.forward * 1.2f, radius, enemyMask);
            foreach (var hit in hits)
            {
                var health = hit.GetComponent<EnemyAI>();
                if (health != null)
                {
                    health.TakeDamage(damage);
                }
            }
        }
    }
}
