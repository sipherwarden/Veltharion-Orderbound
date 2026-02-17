using UnityEngine;

namespace VeltharionOrderbound.Systems
{
    public class TopDownCameraController : MonoBehaviour
    {
        public Transform target = null!;
        public Vector3 offset = new(0f, 18f, -14f);
        public float smooth = 8f;
        public float yaw = -35f;

        private void LateUpdate()
        {
            if (target == null) return;

            if (Input.GetKey(KeyCode.Q)) yaw -= 75f * Time.deltaTime;
            if (Input.GetKey(KeyCode.E)) yaw += 75f * Time.deltaTime;
            if (Input.GetKeyDown(KeyCode.R)) yaw = -35f;

            var rot = Quaternion.Euler(55f, yaw, 0f);
            var desired = target.position + rot * offset;
            transform.position = Vector3.Lerp(transform.position, desired, smooth * Time.deltaTime);
            transform.rotation = Quaternion.Lerp(transform.rotation, rot, smooth * Time.deltaTime);
        }
    }
}
