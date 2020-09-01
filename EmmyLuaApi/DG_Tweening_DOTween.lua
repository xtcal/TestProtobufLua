---@class DOTween : Object
---@field public Version string
---@field public useSafeMode bool
---@field public showUnityEditorReport bool
---@field public timeScale Single
---@field public useSmoothDeltaTime bool
---@field public drawGizmos bool
---@field public defaultUpdateType number
---@field public defaultTimeScaleIndependent bool
---@field public defaultAutoPlay number
---@field public defaultAutoKill bool
---@field public defaultLoopType number
---@field public defaultRecyclable bool
---@field public defaultEaseType number
---@field public defaultEaseOvershootOrAmplitude Single
---@field public defaultEasePeriod Single
---@field public logBehaviour number
local DOTween = {}
---@public
---@param recycleAllByDefault Nullable
---@param useSafeMode Nullable
---@param logBehaviour Nullable
---@return IDOTweenInit
function DOTween.Init(recycleAllByDefault, useSafeMode, logBehaviour) end
---@public
---@param tweenersCapacity Int32
---@param sequencesCapacity Int32
---@return void
function DOTween.SetTweensCapacity(tweenersCapacity, sequencesCapacity) end
---@public
---@param destroy bool
---@return void
function DOTween.Clear(destroy) end
---@public
---@return void
function DOTween.ClearCachedTweens() end
---@public
---@return Int32
function DOTween.Validate() end
---@public
---@param getter DOGetter
---@param setter DOSetter
---@param endValue Single
---@param duration Single
---@return TweenerCore`3
function DOTween.To(getter, setter, endValue, duration) end
---@public
---@param getter DOGetter
---@param setter DOSetter
---@param endValue Int32
---@param duration Single
---@return Tweener
function DOTween.To(getter, setter, endValue, duration) end
---@public
---@param getter DOGetter
---@param setter DOSetter
---@param endValue UInt32
---@param duration Single
---@return Tweener
function DOTween.To(getter, setter, endValue, duration) end
---@public
---@param getter DOGetter
---@param setter DOSetter
---@param endValue Int64
---@param duration Single
---@return Tweener
function DOTween.To(getter, setter, endValue, duration) end
---@public
---@param getter DOGetter
---@param setter DOSetter
---@param endValue UInt64
---@param duration Single
---@return Tweener
function DOTween.To(getter, setter, endValue, duration) end
---@public
---@param getter DOGetter
---@param setter DOSetter
---@param endValue string
---@param duration Single
---@return TweenerCore`3
function DOTween.To(getter, setter, endValue, duration) end
---@public
---@param getter DOGetter
---@param setter DOSetter
---@param endValue Vector2
---@param duration Single
---@return TweenerCore`3
function DOTween.To(getter, setter, endValue, duration) end
---@public
---@param getter DOGetter
---@param setter DOSetter
---@param endValue Vector3
---@param duration Single
---@return TweenerCore`3
function DOTween.To(getter, setter, endValue, duration) end
---@public
---@param getter DOGetter
---@param setter DOSetter
---@param endValue Vector4
---@param duration Single
---@return TweenerCore`3
function DOTween.To(getter, setter, endValue, duration) end
---@public
---@param getter DOGetter
---@param setter DOSetter
---@param endValue Vector3
---@param duration Single
---@return TweenerCore`3
function DOTween.To(getter, setter, endValue, duration) end
---@public
---@param getter DOGetter
---@param setter DOSetter
---@param endValue Color
---@param duration Single
---@return TweenerCore`3
function DOTween.To(getter, setter, endValue, duration) end
---@public
---@param getter DOGetter
---@param setter DOSetter
---@param endValue Rect
---@param duration Single
---@return TweenerCore`3
function DOTween.To(getter, setter, endValue, duration) end
---@public
---@param getter DOGetter
---@param setter DOSetter
---@param endValue RectOffset
---@param duration Single
---@return Tweener
function DOTween.To(getter, setter, endValue, duration) end
---@public
---@param getter DOGetter
---@param setter DOSetter
---@param endValue Single
---@param duration Single
---@param axisConstraint number
---@return TweenerCore`3
function DOTween.ToAxis(getter, setter, endValue, duration, axisConstraint) end
---@public
---@param getter DOGetter
---@param setter DOSetter
---@param endValue Single
---@param duration Single
---@return Tweener
function DOTween.ToAlpha(getter, setter, endValue, duration) end
---@public
---@param setter DOSetter
---@param startValue Single
---@param endValue Single
---@param duration Single
---@return Tweener
function DOTween.To(setter, startValue, endValue, duration) end
---@public
---@param getter DOGetter
---@param setter DOSetter
---@param direction Vector3
---@param duration Single
---@param vibrato Int32
---@param elasticity Single
---@return TweenerCore`3
function DOTween.Punch(getter, setter, direction, duration, vibrato, elasticity) end
---@public
---@param getter DOGetter
---@param setter DOSetter
---@param duration Single
---@param strength Single
---@param vibrato Int32
---@param randomness Single
---@param ignoreZAxis bool
---@return TweenerCore`3
function DOTween.Shake(getter, setter, duration, strength, vibrato, randomness, ignoreZAxis) end
---@public
---@param getter DOGetter
---@param setter DOSetter
---@param duration Single
---@param strength Vector3
---@param vibrato Int32
---@param randomness Single
---@return TweenerCore`3
function DOTween.Shake(getter, setter, duration, strength, vibrato, randomness) end
---@public
---@param getter DOGetter
---@param setter DOSetter
---@param endValues Vector3[]
---@param durations Single[]
---@return TweenerCore`3
function DOTween.ToArray(getter, setter, endValues, durations) end
---@public
---@return Sequence
function DOTween.Sequence() end
---@public
---@param withCallbacks bool
---@return Int32
function DOTween.CompleteAll(withCallbacks) end
---@public
---@param targetOrId Object
---@param withCallbacks bool
---@return Int32
function DOTween.Complete(targetOrId, withCallbacks) end
---@public
---@return Int32
function DOTween.FlipAll() end
---@public
---@param targetOrId Object
---@return Int32
function DOTween.Flip(targetOrId) end
---@public
---@param to Single
---@param andPlay bool
---@return Int32
function DOTween.GotoAll(to, andPlay) end
---@public
---@param targetOrId Object
---@param to Single
---@param andPlay bool
---@return Int32
function DOTween.Goto(targetOrId, to, andPlay) end
---@public
---@param complete bool
---@return Int32
function DOTween.KillAll(complete) end
---@public
---@param targetOrId Object
---@param complete bool
---@return Int32
function DOTween.Kill(targetOrId, complete) end
---@public
---@return Int32
function DOTween.PauseAll() end
---@public
---@param targetOrId Object
---@return Int32
function DOTween.Pause(targetOrId) end
---@public
---@return Int32
function DOTween.PlayAll() end
---@public
---@param targetOrId Object
---@return Int32
function DOTween.Play(targetOrId) end
---@public
---@param target Object
---@param id Object
---@return Int32
function DOTween.Play(target, id) end
---@public
---@return Int32
function DOTween.PlayBackwardsAll() end
---@public
---@param targetOrId Object
---@return Int32
function DOTween.PlayBackwards(targetOrId) end
---@public
---@return Int32
function DOTween.PlayForwardAll() end
---@public
---@param targetOrId Object
---@return Int32
function DOTween.PlayForward(targetOrId) end
---@public
---@param includeDelay bool
---@return Int32
function DOTween.RestartAll(includeDelay) end
---@public
---@param targetOrId Object
---@param includeDelay bool
---@return Int32
function DOTween.Restart(targetOrId, includeDelay) end
---@public
---@param target Object
---@param id Object
---@param includeDelay bool
---@return Int32
function DOTween.Restart(target, id, includeDelay) end
---@public
---@param includeDelay bool
---@return Int32
function DOTween.RewindAll(includeDelay) end
---@public
---@param targetOrId Object
---@param includeDelay bool
---@return Int32
function DOTween.Rewind(targetOrId, includeDelay) end
---@public
---@return Int32
function DOTween.SmoothRewindAll() end
---@public
---@param targetOrId Object
---@return Int32
function DOTween.SmoothRewind(targetOrId) end
---@public
---@return Int32
function DOTween.TogglePauseAll() end
---@public
---@param targetOrId Object
---@return Int32
function DOTween.TogglePause(targetOrId) end
---@public
---@param targetOrId Object
---@return bool
function DOTween.IsTweening(targetOrId) end
---@public
---@return Int32
function DOTween.TotalPlayingTweens() end
---@public
---@return List
function DOTween.PlayingTweens() end
---@public
---@return List
function DOTween.PausedTweens() end
---@public
---@param id Object
---@param playingOnly bool
---@return List
function DOTween.TweensById(id, playingOnly) end
---@public
---@param target Object
---@param playingOnly bool
---@return List
function DOTween.TweensByTarget(target, playingOnly) end
