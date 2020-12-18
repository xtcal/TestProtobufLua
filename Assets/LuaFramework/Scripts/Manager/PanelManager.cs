using System.Collections;
using System.Collections.Generic;
using LuaInterface;
using UnityEngine;
using UnityEngine.UI;

namespace LuaFramework {
	public class PanelManager : Manager {
		private Transform parent;

		Transform Parent {
			get {
				if (parent == null) {
					GameObject go = GameObject.FindWithTag ("GuiCamera");
					if (go != null) {
						parent = go.transform.Find ("root");
					}
				}
				return parent;
			}
		}

		public void CreatePanel (string name, LuaFunction func = null) {
			string assetName = name + "Panel";
			string abName = name.ToLower () + AppConst.ExtName;
			if (Parent.Find (name) != null) {
				return;
			}
			ResManager.LoadPrefab (abName, assetName, (objs) => {
				if (objs.Length == 0) {
					return;
				}
				GameObject prefab = objs[0] as GameObject;
				if (prefab == null) {
					return;
				}
				GameObject go = Instantiate (prefab) as GameObject;
				go.name = assetName;
				go.layer = LayerMask.NameToLayer ("UI");
				go.transform.SetParent (Parent);
				go.transform.localScale = Vector3.one;
				go.transform.localPosition = Vector3.zero;
				if (func != null)
					func.Call (go);
				Debug.LogWarning ("CreatePanel::>> " + name + " " + prefab);
			});
		}
		public void CreatePanel (string abName, string assetName, LuaFunction func = null) {
			if (Parent.Find (assetName) != null) {
				return;
			}
			ResManager.LoadPrefab (abName, assetName, (objs) => {
				if (objs.Length == 0) {
					return;
				}
				GameObject prefab = objs[0] as GameObject;
				if (prefab == null) {
					return;
				}
				GameObject go = Instantiate (prefab) as GameObject;
				go.name = assetName;
				go.layer = LayerMask.NameToLayer ("UI");
				go.transform.SetParent (Parent);
				go.transform.localScale = Vector3.one;
				go.transform.localPosition = Vector3.zero;
				go.transform.localRotation = Quaternion.identity;
				var rect = go.GetComponent<RectTransform>();
				rect.anchorMin = Vector2.zero;
				rect.anchorMax = Vector2.one;
				rect.offsetMin = Vector2.zero;
				rect.offsetMax = Vector2.zero;
				if (func != null)
					func.Call (go);
				Debug.LogWarning ("CreatePanel::>> " + assetName + " " + prefab);
			});
		}

		public void ClosePanel (string name) {
			var panelName = name + "Panel";
			var panelObj = Parent.Find (panelName);
			if (panelObj == null) return;
			Destroy (panelObj.gameObject);
		}
	}
}