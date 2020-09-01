---@class ParticleSystem : Component
---@field public safeCollisionEventSize Int32
---@field public startDelay Single
---@field public isPlaying bool
---@field public isEmitting bool
---@field public isStopped bool
---@field public isPaused bool
---@field public loop bool
---@field public playOnAwake bool
---@field public time Single
---@field public duration Single
---@field public playbackSpeed Single
---@field public particleCount Int32
---@field public enableEmission bool
---@field public emissionRate Single
---@field public startSpeed Single
---@field public startSize Single
---@field public startColor Color
---@field public startRotation Single
---@field public startRotation3D Vector3
---@field public startLifetime Single
---@field public gravityModifier Single
---@field public maxParticles Int32
---@field public simulationSpace number
---@field public scalingMode number
---@field public randomSeed UInt32
---@field public useAutoRandomSeed bool
---@field public main MainModule
---@field public emission EmissionModule
---@field public shape ShapeModule
---@field public velocityOverLifetime VelocityOverLifetimeModule
---@field public limitVelocityOverLifetime LimitVelocityOverLifetimeModule
---@field public inheritVelocity InheritVelocityModule
---@field public forceOverLifetime ForceOverLifetimeModule
---@field public colorOverLifetime ColorOverLifetimeModule
---@field public colorBySpeed ColorBySpeedModule
---@field public sizeOverLifetime SizeOverLifetimeModule
---@field public sizeBySpeed SizeBySpeedModule
---@field public rotationOverLifetime RotationOverLifetimeModule
---@field public rotationBySpeed RotationBySpeedModule
---@field public externalForces ExternalForcesModule
---@field public noise NoiseModule
---@field public collision CollisionModule
---@field public trigger TriggerModule
---@field public subEmitters SubEmittersModule
---@field public textureSheetAnimation TextureSheetAnimationModule
---@field public lights LightsModule
---@field public trails TrailModule
---@field public customData CustomDataModule
local ParticleSystem = {}
---@public
---@param particles Particle[]
---@param size Int32
---@return void
function ParticleSystem:SetParticles(particles, size) end
---@public
---@param particles Particle[]
---@return Int32
function ParticleSystem:GetParticles(particles) end
---@public
---@param customData List
---@param streamIndex number
---@return void
function ParticleSystem:SetCustomParticleData(customData, streamIndex) end
---@public
---@param customData List
---@param streamIndex number
---@return Int32
function ParticleSystem:GetCustomParticleData(customData, streamIndex) end
---@public
---@param t Single
---@param withChildren bool
---@param restart bool
---@return void
function ParticleSystem:Simulate(t, withChildren, restart) end
---@public
---@param t Single
---@param withChildren bool
---@return void
function ParticleSystem:Simulate(t, withChildren) end
---@public
---@param t Single
---@return void
function ParticleSystem:Simulate(t) end
---@public
---@param t Single
---@param withChildren bool
---@param restart bool
---@param fixedTimeStep bool
---@return void
function ParticleSystem:Simulate(t, withChildren, restart, fixedTimeStep) end
---@public
---@return void
function ParticleSystem:Play() end
---@public
---@param withChildren bool
---@return void
function ParticleSystem:Play(withChildren) end
---@public
---@param withChildren bool
---@return void
function ParticleSystem:Stop(withChildren) end
---@public
---@return void
function ParticleSystem:Stop() end
---@public
---@param withChildren bool
---@param stopBehavior number
---@return void
function ParticleSystem:Stop(withChildren, stopBehavior) end
---@public
---@return void
function ParticleSystem:Pause() end
---@public
---@param withChildren bool
---@return void
function ParticleSystem:Pause(withChildren) end
---@public
---@return void
function ParticleSystem:Clear() end
---@public
---@param withChildren bool
---@return void
function ParticleSystem:Clear(withChildren) end
---@public
---@return bool
function ParticleSystem:IsAlive() end
---@public
---@param withChildren bool
---@return bool
function ParticleSystem:IsAlive(withChildren) end
---@public
---@param count Int32
---@return void
function ParticleSystem:Emit(count) end
---@public
---@param position Vector3
---@param velocity Vector3
---@param size Single
---@param lifetime Single
---@param color Color32
---@return void
function ParticleSystem:Emit(position, velocity, size, lifetime, color) end
---@public
---@param particle Particle
---@return void
function ParticleSystem:Emit(particle) end
---@public
---@param emitParams EmitParams
---@param count Int32
---@return void
function ParticleSystem:Emit(emitParams, count) end
