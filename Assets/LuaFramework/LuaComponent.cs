using System.Collections.Generic;
using LuaInterface;
using UnityEngine;

public class LuaComponent : MonoBehaviour {
	public Dictionary<string, LuaTable> components = new Dictionary<string, LuaTable> ();
	public LuaTable Get (string name) {
		LuaTable table = null;
		if (components.ContainsKey (name)) {
			table = components[name];
		}
		return table;
	}
// #if UNITY_EDITOR
// 	public List<string> _keys = new List<string> ();
// #endif
	public bool Add (string name, LuaTable table) {
		if (!components.ContainsKey (name)) {
			components.Add (name, table);
// #if UNITY_EDITOR
// 			_keys.Add (name);
// #endif
			return true;
		}
		return false;
	}
	public bool Remove (string name) {
		if (components.ContainsKey (name)) {
			components.Remove (name);
// #if UNITY_EDITOR
// 			_keys.Remove (name);
// #endif
			return true;
		}
		return false;
	}

	public void Clear () {
		components.Clear ();
// #if UNITY_EDITOR
// 		_keys.Clear ();
// #endif
	}
	private void OnDestroy () {
		components.Clear ();
	}
}