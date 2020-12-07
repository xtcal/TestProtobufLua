using LuaInterface;
using UnityEngine;
using UnityEngine.EventSystems;

public class UIEventListener : EventTrigger {
	private bool isLockClick = false;

	public LuaFunction aniClickDown = null; //动画按下
	public LuaFunction aniClickUp = null; //动画抬起
	public LuaFunction soundClick = null; //点击音效

	public LuaFunction onClickDown = null;
	public LuaFunction onClickUp = null;
	public LuaFunction onClick = null;
	public LuaFunction onEnter = null;
	public LuaFunction onExit = null;
	public LuaFunction onInitializePotentialDrag = null;
	public LuaFunction onBeginDrag = null;
	public LuaFunction onDrag = null;
	public LuaFunction onEndDrag = null;
	public LuaFunction onDrop = null;
	public LuaFunction onSelect = null;
	public LuaFunction onUpdateSelected = null;
	public LuaFunction onDeselect = null;
	public LuaFunction onSubmit = null;
	public LuaFunction onCancel = null;
	public LuaFunction onScroll = null;
	public LuaFunction onMove = null;

	/// <summary>
	/// 设定点击锁定
	/// </summary>
	/// <param name="_bool">true：上锁  false：解锁</param>
	public void SetClickLock (bool _bool) {
		isLockClick = _bool;
	}

	public override void OnPointerDown (PointerEventData eventData) {
		if (isLockClick) return;
		if (onClickDown != null) onClickDown.Call (gameObject);
		if (aniClickDown != null) aniClickDown.Call ();
	}

	public override void OnPointerUp (PointerEventData eventData) {
		if (isLockClick) return;
		if (onClickUp != null) onClickUp.Call (gameObject);
		if (aniClickUp != null) aniClickUp.Call ();
	}

	public override void OnPointerClick (PointerEventData eventData) {
		if (isLockClick) return;
		if (onClick != null) onClick.Call (gameObject);
		if (soundClick != null) soundClick.Call ();
	}

	public override void OnPointerEnter (PointerEventData eventData) {
		if (onEnter != null) onEnter.Call (gameObject);
	}

	public override void OnPointerExit (PointerEventData eventData) {
		if (onExit != null) onExit.Call (gameObject);
	}

	public override void OnInitializePotentialDrag (PointerEventData eventData) {
		if (onInitializePotentialDrag != null) onInitializePotentialDrag.Call (gameObject);
	}

	public override void OnBeginDrag (PointerEventData eventData) {
		if (onBeginDrag != null) onBeginDrag.Call (gameObject, eventData);
	}

	public override void OnDrag (PointerEventData eventData) {
		if (onDrag != null) onDrag.Call (gameObject, eventData.position, eventData);
	}

	public override void OnEndDrag (PointerEventData eventData) {
		if (onEndDrag != null) onEndDrag.Call (gameObject, eventData);
	}

	public override void OnDrop (PointerEventData eventData) {
		if (onDrop != null) onDrop.Call (gameObject, eventData);
	}

	public override void OnSelect (BaseEventData eventData) {
		if (onSelect != null) onSelect.Call (gameObject);
	}

	public override void OnUpdateSelected (BaseEventData eventData) {
		if (onUpdateSelected != null) onUpdateSelected.Call (gameObject);
	}

	public override void OnDeselect (BaseEventData eventData) {
		if (onDeselect != null) onDeselect.Call (gameObject);
	}

	public override void OnSubmit (BaseEventData eventData) {
		if (onSubmit != null) onSubmit.Call (gameObject);
	}

	public override void OnCancel (BaseEventData eventData) {
		if (onCancel != null) onCancel.Call (gameObject);
	}

	public override void OnScroll (PointerEventData eventData) {
		if (onScroll != null) onScroll.Call (gameObject);
	}

	public override void OnMove (AxisEventData eventData) {
		if (onMove != null) onMove.Call (gameObject, eventData.moveVector);
	}

	public static UIEventListener Get (GameObject go) {
		UIEventListener listener = go.GetComponent<UIEventListener> ();
		if (listener == null) listener = go.AddComponent<UIEventListener> ();
		return listener;
	}
}