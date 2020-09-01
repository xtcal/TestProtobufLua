---@class Physics : Object
---@field public IgnoreRaycastLayer Int32
---@field public kIgnoreRaycastLayer Int32
---@field public DefaultRaycastLayers Int32
---@field public kDefaultRaycastLayers Int32
---@field public AllLayers Int32
---@field public kAllLayers Int32
---@field public gravity Vector3
---@field public minPenetrationForPenalty Single
---@field public defaultContactOffset Single
---@field public bounceThreshold Single
---@field public bounceTreshold Single
---@field public sleepVelocity Single
---@field public sleepAngularVelocity Single
---@field public maxAngularVelocity Single
---@field public defaultSolverIterations Int32
---@field public solverIterationCount Int32
---@field public defaultSolverVelocityIterations Int32
---@field public solverVelocityIterationCount Int32
---@field public sleepThreshold Single
---@field public queriesHitTriggers bool
---@field public queriesHitBackfaces bool
---@field public penetrationPenaltyForce Single
local Physics = {}
---@public
---@param origin Vector3
---@param direction Vector3
---@param maxDistance Single
---@param layerMask Int32
---@return bool
function Physics.Raycast(origin, direction, maxDistance, layerMask) end
---@public
---@param origin Vector3
---@param direction Vector3
---@param maxDistance Single
---@return bool
function Physics.Raycast(origin, direction, maxDistance) end
---@public
---@param origin Vector3
---@param direction Vector3
---@return bool
function Physics.Raycast(origin, direction) end
---@public
---@param origin Vector3
---@param direction Vector3
---@param maxDistance Single
---@param layerMask Int32
---@param queryTriggerInteraction number
---@return bool
function Physics.Raycast(origin, direction, maxDistance, layerMask, queryTriggerInteraction) end
---@public
---@param origin Vector3
---@param direction Vector3
---@param hitInfo RaycastHit
---@param maxDistance Single
---@param layerMask Int32
---@return bool
function Physics.Raycast(origin, direction, hitInfo, maxDistance, layerMask) end
---@public
---@param origin Vector3
---@param direction Vector3
---@param hitInfo RaycastHit
---@param maxDistance Single
---@return bool
function Physics.Raycast(origin, direction, hitInfo, maxDistance) end
---@public
---@param origin Vector3
---@param direction Vector3
---@param hitInfo RaycastHit
---@return bool
function Physics.Raycast(origin, direction, hitInfo) end
---@public
---@param origin Vector3
---@param direction Vector3
---@param hitInfo RaycastHit
---@param maxDistance Single
---@param layerMask Int32
---@param queryTriggerInteraction number
---@return bool
function Physics.Raycast(origin, direction, hitInfo, maxDistance, layerMask, queryTriggerInteraction) end
---@public
---@param ray Ray
---@param maxDistance Single
---@param layerMask Int32
---@return bool
function Physics.Raycast(ray, maxDistance, layerMask) end
---@public
---@param ray Ray
---@param maxDistance Single
---@return bool
function Physics.Raycast(ray, maxDistance) end
---@public
---@param ray Ray
---@return bool
function Physics.Raycast(ray) end
---@public
---@param ray Ray
---@param maxDistance Single
---@param layerMask Int32
---@param queryTriggerInteraction number
---@return bool
function Physics.Raycast(ray, maxDistance, layerMask, queryTriggerInteraction) end
---@public
---@param ray Ray
---@param hitInfo RaycastHit
---@param maxDistance Single
---@param layerMask Int32
---@return bool
function Physics.Raycast(ray, hitInfo, maxDistance, layerMask) end
---@public
---@param ray Ray
---@param hitInfo RaycastHit
---@param maxDistance Single
---@return bool
function Physics.Raycast(ray, hitInfo, maxDistance) end
---@public
---@param ray Ray
---@param hitInfo RaycastHit
---@return bool
function Physics.Raycast(ray, hitInfo) end
---@public
---@param ray Ray
---@param hitInfo RaycastHit
---@param maxDistance Single
---@param layerMask Int32
---@param queryTriggerInteraction number
---@return bool
function Physics.Raycast(ray, hitInfo, maxDistance, layerMask, queryTriggerInteraction) end
---@public
---@param ray Ray
---@param maxDistance Single
---@param layerMask Int32
---@return RaycastHit[]
function Physics.RaycastAll(ray, maxDistance, layerMask) end
---@public
---@param ray Ray
---@param maxDistance Single
---@return RaycastHit[]
function Physics.RaycastAll(ray, maxDistance) end
---@public
---@param ray Ray
---@return RaycastHit[]
function Physics.RaycastAll(ray) end
---@public
---@param ray Ray
---@param maxDistance Single
---@param layerMask Int32
---@param queryTriggerInteraction number
---@return RaycastHit[]
function Physics.RaycastAll(ray, maxDistance, layerMask, queryTriggerInteraction) end
---@public
---@param origin Vector3
---@param direction Vector3
---@param maxDistance Single
---@param layermask Int32
---@param queryTriggerInteraction number
---@return RaycastHit[]
function Physics.RaycastAll(origin, direction, maxDistance, layermask, queryTriggerInteraction) end
---@public
---@param origin Vector3
---@param direction Vector3
---@param maxDistance Single
---@param layermask Int32
---@return RaycastHit[]
function Physics.RaycastAll(origin, direction, maxDistance, layermask) end
---@public
---@param origin Vector3
---@param direction Vector3
---@param maxDistance Single
---@return RaycastHit[]
function Physics.RaycastAll(origin, direction, maxDistance) end
---@public
---@param origin Vector3
---@param direction Vector3
---@return RaycastHit[]
function Physics.RaycastAll(origin, direction) end
---@public
---@param ray Ray
---@param results RaycastHit[]
---@param maxDistance Single
---@param layerMask Int32
---@return Int32
function Physics.RaycastNonAlloc(ray, results, maxDistance, layerMask) end
---@public
---@param ray Ray
---@param results RaycastHit[]
---@param maxDistance Single
---@return Int32
function Physics.RaycastNonAlloc(ray, results, maxDistance) end
---@public
---@param ray Ray
---@param results RaycastHit[]
---@return Int32
function Physics.RaycastNonAlloc(ray, results) end
---@public
---@param ray Ray
---@param results RaycastHit[]
---@param maxDistance Single
---@param layerMask Int32
---@param queryTriggerInteraction number
---@return Int32
function Physics.RaycastNonAlloc(ray, results, maxDistance, layerMask, queryTriggerInteraction) end
---@public
---@param origin Vector3
---@param direction Vector3
---@param results RaycastHit[]
---@param maxDistance Single
---@param layermask Int32
---@param queryTriggerInteraction number
---@return Int32
function Physics.RaycastNonAlloc(origin, direction, results, maxDistance, layermask, queryTriggerInteraction) end
---@public
---@param origin Vector3
---@param direction Vector3
---@param results RaycastHit[]
---@param maxDistance Single
---@param layermask Int32
---@return Int32
function Physics.RaycastNonAlloc(origin, direction, results, maxDistance, layermask) end
---@public
---@param origin Vector3
---@param direction Vector3
---@param results RaycastHit[]
---@param maxDistance Single
---@return Int32
function Physics.RaycastNonAlloc(origin, direction, results, maxDistance) end
---@public
---@param origin Vector3
---@param direction Vector3
---@param results RaycastHit[]
---@return Int32
function Physics.RaycastNonAlloc(origin, direction, results) end
---@public
---@param start Vector3
---@param _end Vector3
---@param layerMask Int32
---@return bool
function Physics.Linecast(start, _end, layerMask) end
---@public
---@param start Vector3
---@param _end Vector3
---@return bool
function Physics.Linecast(start, _end) end
---@public
---@param start Vector3
---@param _end Vector3
---@param layerMask Int32
---@param queryTriggerInteraction number
---@return bool
function Physics.Linecast(start, _end, layerMask, queryTriggerInteraction) end
---@public
---@param start Vector3
---@param _end Vector3
---@param hitInfo RaycastHit
---@param layerMask Int32
---@return bool
function Physics.Linecast(start, _end, hitInfo, layerMask) end
---@public
---@param start Vector3
---@param _end Vector3
---@param hitInfo RaycastHit
---@return bool
function Physics.Linecast(start, _end, hitInfo) end
---@public
---@param start Vector3
---@param _end Vector3
---@param hitInfo RaycastHit
---@param layerMask Int32
---@param queryTriggerInteraction number
---@return bool
function Physics.Linecast(start, _end, hitInfo, layerMask, queryTriggerInteraction) end
---@public
---@param position Vector3
---@param radius Single
---@param layerMask Int32
---@param queryTriggerInteraction number
---@return Collider[]
function Physics.OverlapSphere(position, radius, layerMask, queryTriggerInteraction) end
---@public
---@param position Vector3
---@param radius Single
---@param layerMask Int32
---@return Collider[]
function Physics.OverlapSphere(position, radius, layerMask) end
---@public
---@param position Vector3
---@param radius Single
---@return Collider[]
function Physics.OverlapSphere(position, radius) end
---@public
---@param position Vector3
---@param radius Single
---@param results Collider[]
---@param layerMask Int32
---@param queryTriggerInteraction number
---@return Int32
function Physics.OverlapSphereNonAlloc(position, radius, results, layerMask, queryTriggerInteraction) end
---@public
---@param position Vector3
---@param radius Single
---@param results Collider[]
---@param layerMask Int32
---@return Int32
function Physics.OverlapSphereNonAlloc(position, radius, results, layerMask) end
---@public
---@param position Vector3
---@param radius Single
---@param results Collider[]
---@return Int32
function Physics.OverlapSphereNonAlloc(position, radius, results) end
---@public
---@param point0 Vector3
---@param point1 Vector3
---@param radius Single
---@param layerMask Int32
---@param queryTriggerInteraction number
---@return Collider[]
function Physics.OverlapCapsule(point0, point1, radius, layerMask, queryTriggerInteraction) end
---@public
---@param point0 Vector3
---@param point1 Vector3
---@param radius Single
---@param layerMask Int32
---@return Collider[]
function Physics.OverlapCapsule(point0, point1, radius, layerMask) end
---@public
---@param point0 Vector3
---@param point1 Vector3
---@param radius Single
---@return Collider[]
function Physics.OverlapCapsule(point0, point1, radius) end
---@public
---@param point0 Vector3
---@param point1 Vector3
---@param radius Single
---@param results Collider[]
---@param layerMask Int32
---@param queryTriggerInteraction number
---@return Int32
function Physics.OverlapCapsuleNonAlloc(point0, point1, radius, results, layerMask, queryTriggerInteraction) end
---@public
---@param point0 Vector3
---@param point1 Vector3
---@param radius Single
---@param results Collider[]
---@param layerMask Int32
---@return Int32
function Physics.OverlapCapsuleNonAlloc(point0, point1, radius, results, layerMask) end
---@public
---@param point0 Vector3
---@param point1 Vector3
---@param radius Single
---@param results Collider[]
---@return Int32
function Physics.OverlapCapsuleNonAlloc(point0, point1, radius, results) end
---@public
---@param point1 Vector3
---@param point2 Vector3
---@param radius Single
---@param direction Vector3
---@param maxDistance Single
---@param layerMask Int32
---@return bool
function Physics.CapsuleCast(point1, point2, radius, direction, maxDistance, layerMask) end
---@public
---@param point1 Vector3
---@param point2 Vector3
---@param radius Single
---@param direction Vector3
---@param maxDistance Single
---@return bool
function Physics.CapsuleCast(point1, point2, radius, direction, maxDistance) end
---@public
---@param point1 Vector3
---@param point2 Vector3
---@param radius Single
---@param direction Vector3
---@return bool
function Physics.CapsuleCast(point1, point2, radius, direction) end
---@public
---@param point1 Vector3
---@param point2 Vector3
---@param radius Single
---@param direction Vector3
---@param maxDistance Single
---@param layerMask Int32
---@param queryTriggerInteraction number
---@return bool
function Physics.CapsuleCast(point1, point2, radius, direction, maxDistance, layerMask, queryTriggerInteraction) end
---@public
---@param point1 Vector3
---@param point2 Vector3
---@param radius Single
---@param direction Vector3
---@param hitInfo RaycastHit
---@param maxDistance Single
---@param layerMask Int32
---@return bool
function Physics.CapsuleCast(point1, point2, radius, direction, hitInfo, maxDistance, layerMask) end
---@public
---@param point1 Vector3
---@param point2 Vector3
---@param radius Single
---@param direction Vector3
---@param hitInfo RaycastHit
---@param maxDistance Single
---@return bool
function Physics.CapsuleCast(point1, point2, radius, direction, hitInfo, maxDistance) end
---@public
---@param point1 Vector3
---@param point2 Vector3
---@param radius Single
---@param direction Vector3
---@param hitInfo RaycastHit
---@return bool
function Physics.CapsuleCast(point1, point2, radius, direction, hitInfo) end
---@public
---@param point1 Vector3
---@param point2 Vector3
---@param radius Single
---@param direction Vector3
---@param hitInfo RaycastHit
---@param maxDistance Single
---@param layerMask Int32
---@param queryTriggerInteraction number
---@return bool
function Physics.CapsuleCast(point1, point2, radius, direction, hitInfo, maxDistance, layerMask, queryTriggerInteraction) end
---@public
---@param origin Vector3
---@param radius Single
---@param direction Vector3
---@param hitInfo RaycastHit
---@param maxDistance Single
---@param layerMask Int32
---@return bool
function Physics.SphereCast(origin, radius, direction, hitInfo, maxDistance, layerMask) end
---@public
---@param origin Vector3
---@param radius Single
---@param direction Vector3
---@param hitInfo RaycastHit
---@param maxDistance Single
---@return bool
function Physics.SphereCast(origin, radius, direction, hitInfo, maxDistance) end
---@public
---@param origin Vector3
---@param radius Single
---@param direction Vector3
---@param hitInfo RaycastHit
---@return bool
function Physics.SphereCast(origin, radius, direction, hitInfo) end
---@public
---@param origin Vector3
---@param radius Single
---@param direction Vector3
---@param hitInfo RaycastHit
---@param maxDistance Single
---@param layerMask Int32
---@param queryTriggerInteraction number
---@return bool
function Physics.SphereCast(origin, radius, direction, hitInfo, maxDistance, layerMask, queryTriggerInteraction) end
---@public
---@param ray Ray
---@param radius Single
---@param maxDistance Single
---@param layerMask Int32
---@return bool
function Physics.SphereCast(ray, radius, maxDistance, layerMask) end
---@public
---@param ray Ray
---@param radius Single
---@param maxDistance Single
---@return bool
function Physics.SphereCast(ray, radius, maxDistance) end
---@public
---@param ray Ray
---@param radius Single
---@return bool
function Physics.SphereCast(ray, radius) end
---@public
---@param ray Ray
---@param radius Single
---@param maxDistance Single
---@param layerMask Int32
---@param queryTriggerInteraction number
---@return bool
function Physics.SphereCast(ray, radius, maxDistance, layerMask, queryTriggerInteraction) end
---@public
---@param ray Ray
---@param radius Single
---@param hitInfo RaycastHit
---@param maxDistance Single
---@param layerMask Int32
---@return bool
function Physics.SphereCast(ray, radius, hitInfo, maxDistance, layerMask) end
---@public
---@param ray Ray
---@param radius Single
---@param hitInfo RaycastHit
---@param maxDistance Single
---@return bool
function Physics.SphereCast(ray, radius, hitInfo, maxDistance) end
---@public
---@param ray Ray
---@param radius Single
---@param hitInfo RaycastHit
---@return bool
function Physics.SphereCast(ray, radius, hitInfo) end
---@public
---@param ray Ray
---@param radius Single
---@param hitInfo RaycastHit
---@param maxDistance Single
---@param layerMask Int32
---@param queryTriggerInteraction number
---@return bool
function Physics.SphereCast(ray, radius, hitInfo, maxDistance, layerMask, queryTriggerInteraction) end
---@public
---@param point1 Vector3
---@param point2 Vector3
---@param radius Single
---@param direction Vector3
---@param maxDistance Single
---@param layermask Int32
---@param queryTriggerInteraction number
---@return RaycastHit[]
function Physics.CapsuleCastAll(point1, point2, radius, direction, maxDistance, layermask, queryTriggerInteraction) end
---@public
---@param point1 Vector3
---@param point2 Vector3
---@param radius Single
---@param direction Vector3
---@param maxDistance Single
---@param layermask Int32
---@return RaycastHit[]
function Physics.CapsuleCastAll(point1, point2, radius, direction, maxDistance, layermask) end
---@public
---@param point1 Vector3
---@param point2 Vector3
---@param radius Single
---@param direction Vector3
---@param maxDistance Single
---@return RaycastHit[]
function Physics.CapsuleCastAll(point1, point2, radius, direction, maxDistance) end
---@public
---@param point1 Vector3
---@param point2 Vector3
---@param radius Single
---@param direction Vector3
---@return RaycastHit[]
function Physics.CapsuleCastAll(point1, point2, radius, direction) end
---@public
---@param point1 Vector3
---@param point2 Vector3
---@param radius Single
---@param direction Vector3
---@param results RaycastHit[]
---@param maxDistance Single
---@param layermask Int32
---@param queryTriggerInteraction number
---@return Int32
function Physics.CapsuleCastNonAlloc(point1, point2, radius, direction, results, maxDistance, layermask, queryTriggerInteraction) end
---@public
---@param point1 Vector3
---@param point2 Vector3
---@param radius Single
---@param direction Vector3
---@param results RaycastHit[]
---@param maxDistance Single
---@param layermask Int32
---@return Int32
function Physics.CapsuleCastNonAlloc(point1, point2, radius, direction, results, maxDistance, layermask) end
---@public
---@param point1 Vector3
---@param point2 Vector3
---@param radius Single
---@param direction Vector3
---@param results RaycastHit[]
---@param maxDistance Single
---@return Int32
function Physics.CapsuleCastNonAlloc(point1, point2, radius, direction, results, maxDistance) end
---@public
---@param point1 Vector3
---@param point2 Vector3
---@param radius Single
---@param direction Vector3
---@param results RaycastHit[]
---@return Int32
function Physics.CapsuleCastNonAlloc(point1, point2, radius, direction, results) end
---@public
---@param origin Vector3
---@param radius Single
---@param direction Vector3
---@param maxDistance Single
---@param layerMask Int32
---@return RaycastHit[]
function Physics.SphereCastAll(origin, radius, direction, maxDistance, layerMask) end
---@public
---@param origin Vector3
---@param radius Single
---@param direction Vector3
---@param maxDistance Single
---@return RaycastHit[]
function Physics.SphereCastAll(origin, radius, direction, maxDistance) end
---@public
---@param origin Vector3
---@param radius Single
---@param direction Vector3
---@return RaycastHit[]
function Physics.SphereCastAll(origin, radius, direction) end
---@public
---@param origin Vector3
---@param radius Single
---@param direction Vector3
---@param maxDistance Single
---@param layerMask Int32
---@param queryTriggerInteraction number
---@return RaycastHit[]
function Physics.SphereCastAll(origin, radius, direction, maxDistance, layerMask, queryTriggerInteraction) end
---@public
---@param ray Ray
---@param radius Single
---@param maxDistance Single
---@param layerMask Int32
---@return RaycastHit[]
function Physics.SphereCastAll(ray, radius, maxDistance, layerMask) end
---@public
---@param ray Ray
---@param radius Single
---@param maxDistance Single
---@return RaycastHit[]
function Physics.SphereCastAll(ray, radius, maxDistance) end
---@public
---@param ray Ray
---@param radius Single
---@return RaycastHit[]
function Physics.SphereCastAll(ray, radius) end
---@public
---@param ray Ray
---@param radius Single
---@param maxDistance Single
---@param layerMask Int32
---@param queryTriggerInteraction number
---@return RaycastHit[]
function Physics.SphereCastAll(ray, radius, maxDistance, layerMask, queryTriggerInteraction) end
---@public
---@param origin Vector3
---@param radius Single
---@param direction Vector3
---@param results RaycastHit[]
---@param maxDistance Single
---@param layerMask Int32
---@return Int32
function Physics.SphereCastNonAlloc(origin, radius, direction, results, maxDistance, layerMask) end
---@public
---@param origin Vector3
---@param radius Single
---@param direction Vector3
---@param results RaycastHit[]
---@param maxDistance Single
---@return Int32
function Physics.SphereCastNonAlloc(origin, radius, direction, results, maxDistance) end
---@public
---@param origin Vector3
---@param radius Single
---@param direction Vector3
---@param results RaycastHit[]
---@return Int32
function Physics.SphereCastNonAlloc(origin, radius, direction, results) end
---@public
---@param origin Vector3
---@param radius Single
---@param direction Vector3
---@param results RaycastHit[]
---@param maxDistance Single
---@param layerMask Int32
---@param queryTriggerInteraction number
---@return Int32
function Physics.SphereCastNonAlloc(origin, radius, direction, results, maxDistance, layerMask, queryTriggerInteraction) end
---@public
---@param ray Ray
---@param radius Single
---@param results RaycastHit[]
---@param maxDistance Single
---@param layerMask Int32
---@return Int32
function Physics.SphereCastNonAlloc(ray, radius, results, maxDistance, layerMask) end
---@public
---@param ray Ray
---@param radius Single
---@param results RaycastHit[]
---@param maxDistance Single
---@return Int32
function Physics.SphereCastNonAlloc(ray, radius, results, maxDistance) end
---@public
---@param ray Ray
---@param radius Single
---@param results RaycastHit[]
---@return Int32
function Physics.SphereCastNonAlloc(ray, radius, results) end
---@public
---@param ray Ray
---@param radius Single
---@param results RaycastHit[]
---@param maxDistance Single
---@param layerMask Int32
---@param queryTriggerInteraction number
---@return Int32
function Physics.SphereCastNonAlloc(ray, radius, results, maxDistance, layerMask, queryTriggerInteraction) end
---@public
---@param position Vector3
---@param radius Single
---@param layerMask Int32
---@param queryTriggerInteraction number
---@return bool
function Physics.CheckSphere(position, radius, layerMask, queryTriggerInteraction) end
---@public
---@param position Vector3
---@param radius Single
---@param layerMask Int32
---@return bool
function Physics.CheckSphere(position, radius, layerMask) end
---@public
---@param position Vector3
---@param radius Single
---@return bool
function Physics.CheckSphere(position, radius) end
---@public
---@param start Vector3
---@param _end Vector3
---@param radius Single
---@param layermask Int32
---@param queryTriggerInteraction number
---@return bool
function Physics.CheckCapsule(start, _end, radius, layermask, queryTriggerInteraction) end
---@public
---@param start Vector3
---@param _end Vector3
---@param radius Single
---@param layermask Int32
---@return bool
function Physics.CheckCapsule(start, _end, radius, layermask) end
---@public
---@param start Vector3
---@param _end Vector3
---@param radius Single
---@return bool
function Physics.CheckCapsule(start, _end, radius) end
---@public
---@param center Vector3
---@param halfExtents Vector3
---@param orientation Quaternion
---@param layermask Int32
---@param queryTriggerInteraction number
---@return bool
function Physics.CheckBox(center, halfExtents, orientation, layermask, queryTriggerInteraction) end
---@public
---@param center Vector3
---@param halfExtents Vector3
---@param orientation Quaternion
---@param layermask Int32
---@return bool
function Physics.CheckBox(center, halfExtents, orientation, layermask) end
---@public
---@param center Vector3
---@param halfExtents Vector3
---@param orientation Quaternion
---@return bool
function Physics.CheckBox(center, halfExtents, orientation) end
---@public
---@param center Vector3
---@param halfExtents Vector3
---@return bool
function Physics.CheckBox(center, halfExtents) end
---@public
---@param center Vector3
---@param halfExtents Vector3
---@param orientation Quaternion
---@param layerMask Int32
---@param queryTriggerInteraction number
---@return Collider[]
function Physics.OverlapBox(center, halfExtents, orientation, layerMask, queryTriggerInteraction) end
---@public
---@param center Vector3
---@param halfExtents Vector3
---@param orientation Quaternion
---@param layerMask Int32
---@return Collider[]
function Physics.OverlapBox(center, halfExtents, orientation, layerMask) end
---@public
---@param center Vector3
---@param halfExtents Vector3
---@param orientation Quaternion
---@return Collider[]
function Physics.OverlapBox(center, halfExtents, orientation) end
---@public
---@param center Vector3
---@param halfExtents Vector3
---@return Collider[]
function Physics.OverlapBox(center, halfExtents) end
---@public
---@param center Vector3
---@param halfExtents Vector3
---@param results Collider[]
---@param orientation Quaternion
---@param layerMask Int32
---@param queryTriggerInteraction number
---@return Int32
function Physics.OverlapBoxNonAlloc(center, halfExtents, results, orientation, layerMask, queryTriggerInteraction) end
---@public
---@param center Vector3
---@param halfExtents Vector3
---@param results Collider[]
---@param orientation Quaternion
---@param layerMask Int32
---@return Int32
function Physics.OverlapBoxNonAlloc(center, halfExtents, results, orientation, layerMask) end
---@public
---@param center Vector3
---@param halfExtents Vector3
---@param results Collider[]
---@param orientation Quaternion
---@return Int32
function Physics.OverlapBoxNonAlloc(center, halfExtents, results, orientation) end
---@public
---@param center Vector3
---@param halfExtents Vector3
---@param results Collider[]
---@return Int32
function Physics.OverlapBoxNonAlloc(center, halfExtents, results) end
---@public
---@param center Vector3
---@param halfExtents Vector3
---@param direction Vector3
---@param orientation Quaternion
---@param maxDistance Single
---@param layermask Int32
---@param queryTriggerInteraction number
---@return RaycastHit[]
function Physics.BoxCastAll(center, halfExtents, direction, orientation, maxDistance, layermask, queryTriggerInteraction) end
---@public
---@param center Vector3
---@param halfExtents Vector3
---@param direction Vector3
---@param orientation Quaternion
---@param maxDistance Single
---@param layermask Int32
---@return RaycastHit[]
function Physics.BoxCastAll(center, halfExtents, direction, orientation, maxDistance, layermask) end
---@public
---@param center Vector3
---@param halfExtents Vector3
---@param direction Vector3
---@param orientation Quaternion
---@param maxDistance Single
---@return RaycastHit[]
function Physics.BoxCastAll(center, halfExtents, direction, orientation, maxDistance) end
---@public
---@param center Vector3
---@param halfExtents Vector3
---@param direction Vector3
---@param orientation Quaternion
---@return RaycastHit[]
function Physics.BoxCastAll(center, halfExtents, direction, orientation) end
---@public
---@param center Vector3
---@param halfExtents Vector3
---@param direction Vector3
---@return RaycastHit[]
function Physics.BoxCastAll(center, halfExtents, direction) end
---@public
---@param center Vector3
---@param halfExtents Vector3
---@param direction Vector3
---@param results RaycastHit[]
---@param orientation Quaternion
---@param maxDistance Single
---@param layermask Int32
---@param queryTriggerInteraction number
---@return Int32
function Physics.BoxCastNonAlloc(center, halfExtents, direction, results, orientation, maxDistance, layermask, queryTriggerInteraction) end
---@public
---@param center Vector3
---@param halfExtents Vector3
---@param direction Vector3
---@param results RaycastHit[]
---@param orientation Quaternion
---@param maxDistance Single
---@param layermask Int32
---@return Int32
function Physics.BoxCastNonAlloc(center, halfExtents, direction, results, orientation, maxDistance, layermask) end
---@public
---@param center Vector3
---@param halfExtents Vector3
---@param direction Vector3
---@param results RaycastHit[]
---@param orientation Quaternion
---@param maxDistance Single
---@return Int32
function Physics.BoxCastNonAlloc(center, halfExtents, direction, results, orientation, maxDistance) end
---@public
---@param center Vector3
---@param halfExtents Vector3
---@param direction Vector3
---@param results RaycastHit[]
---@param orientation Quaternion
---@return Int32
function Physics.BoxCastNonAlloc(center, halfExtents, direction, results, orientation) end
---@public
---@param center Vector3
---@param halfExtents Vector3
---@param direction Vector3
---@param results RaycastHit[]
---@return Int32
function Physics.BoxCastNonAlloc(center, halfExtents, direction, results) end
---@public
---@param center Vector3
---@param halfExtents Vector3
---@param direction Vector3
---@param orientation Quaternion
---@param maxDistance Single
---@param layerMask Int32
---@return bool
function Physics.BoxCast(center, halfExtents, direction, orientation, maxDistance, layerMask) end
---@public
---@param center Vector3
---@param halfExtents Vector3
---@param direction Vector3
---@param orientation Quaternion
---@param maxDistance Single
---@return bool
function Physics.BoxCast(center, halfExtents, direction, orientation, maxDistance) end
---@public
---@param center Vector3
---@param halfExtents Vector3
---@param direction Vector3
---@param orientation Quaternion
---@return bool
function Physics.BoxCast(center, halfExtents, direction, orientation) end
---@public
---@param center Vector3
---@param halfExtents Vector3
---@param direction Vector3
---@return bool
function Physics.BoxCast(center, halfExtents, direction) end
---@public
---@param center Vector3
---@param halfExtents Vector3
---@param direction Vector3
---@param orientation Quaternion
---@param maxDistance Single
---@param layerMask Int32
---@param queryTriggerInteraction number
---@return bool
function Physics.BoxCast(center, halfExtents, direction, orientation, maxDistance, layerMask, queryTriggerInteraction) end
---@public
---@param center Vector3
---@param halfExtents Vector3
---@param direction Vector3
---@param hitInfo RaycastHit
---@param orientation Quaternion
---@param maxDistance Single
---@param layerMask Int32
---@return bool
function Physics.BoxCast(center, halfExtents, direction, hitInfo, orientation, maxDistance, layerMask) end
---@public
---@param center Vector3
---@param halfExtents Vector3
---@param direction Vector3
---@param hitInfo RaycastHit
---@param orientation Quaternion
---@param maxDistance Single
---@return bool
function Physics.BoxCast(center, halfExtents, direction, hitInfo, orientation, maxDistance) end
---@public
---@param center Vector3
---@param halfExtents Vector3
---@param direction Vector3
---@param hitInfo RaycastHit
---@param orientation Quaternion
---@return bool
function Physics.BoxCast(center, halfExtents, direction, hitInfo, orientation) end
---@public
---@param center Vector3
---@param halfExtents Vector3
---@param direction Vector3
---@param hitInfo RaycastHit
---@return bool
function Physics.BoxCast(center, halfExtents, direction, hitInfo) end
---@public
---@param center Vector3
---@param halfExtents Vector3
---@param direction Vector3
---@param hitInfo RaycastHit
---@param orientation Quaternion
---@param maxDistance Single
---@param layerMask Int32
---@param queryTriggerInteraction number
---@return bool
function Physics.BoxCast(center, halfExtents, direction, hitInfo, orientation, maxDistance, layerMask, queryTriggerInteraction) end
---@public
---@param collider1 Collider
---@param collider2 Collider
---@param ignore bool
---@return void
function Physics.IgnoreCollision(collider1, collider2, ignore) end
---@public
---@param collider1 Collider
---@param collider2 Collider
---@return void
function Physics.IgnoreCollision(collider1, collider2) end
---@public
---@param layer1 Int32
---@param layer2 Int32
---@param ignore bool
---@return void
function Physics.IgnoreLayerCollision(layer1, layer2, ignore) end
---@public
---@param layer1 Int32
---@param layer2 Int32
---@return void
function Physics.IgnoreLayerCollision(layer1, layer2) end
---@public
---@param layer1 Int32
---@param layer2 Int32
---@return bool
function Physics.GetIgnoreLayerCollision(layer1, layer2) end
---@public
---@param colliderA Collider
---@param positionA Vector3
---@param rotationA Quaternion
---@param colliderB Collider
---@param positionB Vector3
---@param rotationB Quaternion
---@param direction Vector3
---@param distance Single
---@return bool
function Physics.ComputePenetration(colliderA, positionA, rotationA, colliderB, positionB, rotationB, direction, distance) end
---@public
---@param point Vector3
---@param collider Collider
---@param position Vector3
---@param rotation Quaternion
---@return Vector3
function Physics.ClosestPoint(point, collider, position, rotation) end
