using UnityEngine;
using UnityEngine.AI;

namespace VeltharionOrderbound.Systems
{
    [RequireComponent(typeof(NavMeshAgent))]
    public class EnemyAI : MonoBehaviour
    {
        public Transform target = null!;
        public float maxHp = 70f;
        public float damage = 9f;
        public float retreatThreshold = 0.35f;

        private NavMeshAgent agent = null!;
        private float hp;

        private void Awake()
        {
            agent = GetComponent<NavMeshAgent>();
            hp = maxHp;
        }

        private void Update()
        {
            if (target == null) return;
            var dist = Vector3.Distance(transform.position, target.position);
            if (hp < maxHp * retreatThreshold)
            {
                var away = (transform.position - target.position).normalized;
                agent.SetDestination(transform.position + away * 5f);
            }
            else if (dist > 2f)
            {
                agent.SetDestination(target.position);
            }
            else
            {
                agent.ResetPath();
            }
        }

        public void TakeDamage(float amount)
        {
            hp -= amount;
            if (hp <= 0f) Destroy(gameObject);
        }
    }
}
