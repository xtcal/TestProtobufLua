using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using LuaInterface;
// using Spine.Unity;
using LuaFramework;
using UnityEditor;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

namespace EmmyLua {
	public static class EmmyLuaApiExporter {
		[MenuItem ("EmmyLua/导出EmmyLuaApi", false, 14)]
		static void Gen () {
			string path = "./EmmyLuaApi/";
			if (Directory.Exists (path)) {
				Directory.Delete (path, true);
			}
			Directory.CreateDirectory (path);
			GenCustom (path);
		}
		public static void GenCustom (string path) {
			List<Type> types = new List<Type> () {
				typeof (UnityEngine.Object),
				typeof (System.Object),
				typeof (System.Type),
				typeof (UnityEngine.Events.UnityEvent),
				typeof (UnityEngine.Events.UnityEventBase),
				typeof (UnityEngine.UI.MaskableGraphic),
				typeof (UnityEngine.UI.Graphic),
				typeof (UnityEngine.UI.BaseMeshEffect),
				typeof (UnityEngine.UI.Slider.SliderEvent),
				typeof (UnityEngine.UI.ToggleGroup),
				typeof (UnityEngine.UI.Toggle.ToggleEvent),
				typeof (UnityEngine.UI.Selectable),
				typeof (UnityEngine.EventSystems.UIBehaviour),
				typeof (UnityEngine.Font),
				typeof (UnityEngine.TextGenerator),
				typeof (ResourceRequest),
				typeof (AsyncOperation),
				typeof (YieldInstruction),
				typeof (List<int>),
				typeof (AnimationEvent),
				typeof (SendMessageOptions),

				typeof (UnityEngine.Application),
				typeof (UnityEngine.Time),
				typeof (UnityEngine.Screen),
				typeof (UnityEngine.SleepTimeout),
				typeof (UnityEngine.Input),
				typeof (UnityEngine.Resources),
				typeof (UnityEngine.Physics),
				typeof (UnityEngine.RenderSettings),
				typeof (UnityEngine.QualitySettings),
				typeof (UnityEngine.GL),
				typeof (UnityEngine.Graphics),

				typeof (System.IO.File),
				typeof (System.IO.StreamWriter),
				typeof (System.IO.Directory),
				typeof (System.IO.Path),

				typeof (Debugger),
				typeof (Component),
				typeof (Transform),
				typeof (Material),
				typeof (Light),
				typeof (Rigidbody),
				typeof (Camera),
				typeof (AudioSource),
				typeof (Behaviour),
				typeof (MonoBehaviour),
				typeof (GameObject),
				typeof (TrackedReference),
				typeof (Application),
				typeof (RuntimePlatform),
				typeof (Physics),
				typeof (Collider),
				typeof (Time),
				typeof (Texture),
				typeof (Texture2D),
				typeof (Texture3D),
				typeof (TextureFormat),
				typeof (Rect),
				typeof (Shader),
				typeof (Renderer),
				typeof (WWW),
				typeof (WWWForm),
				typeof (Screen),
				typeof (ScreenOrientation),
				typeof (CameraClearFlags),
				typeof (AudioClip),
				typeof (AssetBundle),
				typeof (ParticleSystem),
				typeof (AsyncOperation),
				typeof (LightType),
				typeof (SleepTimeout),
#if UNITY_5_3_OR_NEWER && !UNITY_5_6_OR_NEWER
				typeof (UnityEngine.Experimental.Director.DirectorPlayer),
#endif
				typeof (Animator),
				typeof (Input),
				typeof (KeyCode),
				typeof (SkinnedMeshRenderer),
				typeof (Space),
				typeof (Mesh),
				typeof (MeshRenderer),
				typeof (MeshFilter),
				typeof (Quaternion),
				typeof (UnityEngine.Random),

#if !UNITY_5_4_OR_NEWER
				typeof (ParticleEmitter),
				typeof (ParticleRenderer),
				typeof (ParticleAnimator),
#endif

				typeof (BoxCollider),
				typeof (MeshCollider),
				typeof (SphereCollider),
				typeof (CharacterController),
				typeof (CapsuleCollider),

				typeof (Animation),
				typeof (AnimationClip),
				typeof (AnimationState),
				typeof (AnimationBlendMode),
				typeof (QueueMode),
				typeof (PlayMode),
				typeof (WrapMode),

				typeof (QualitySettings),
				typeof (RenderSettings),
				typeof (BlendWeights),
				typeof (RenderTexture),
				typeof (Resources),
				typeof (PlayerPrefs),

				// typeof (LuaDebugTool),
				// typeof (LuaValueInfo),
				typeof (RectTransform),
				typeof (Text),
				typeof (Image),
				typeof (RawImage),
				typeof (Button),
				typeof (Toggle),
				typeof (Slider),
				typeof (Scrollbar),
				typeof (Dropdown),
				typeof (InputField),
				typeof (ScrollRect),
				typeof (VerticalLayoutGroup),
				typeof (HorizontalLayoutGroup),
				typeof (GridLayoutGroup),
				typeof (Canvas),
				typeof (CanvasGroup),
				typeof (CanvasScaler),
				typeof (LayoutElement),
				typeof (ContentSizeFitter),
				typeof (AspectRatioFitter),
				typeof (PointerEventData),
				typeof (Sprite),
				typeof (EventSystem),
				typeof (Gradient),
				typeof (Shadow),
				typeof (Outline),
				typeof (Util),
				typeof (AppConst),
				typeof (LuaHelper),
				typeof (ByteBuffer),
				typeof (LuaBehaviour),
				typeof (GameManager),
				// typeof (SkeletonAnimation),
				// typeof (Spine.AnimationState),
				typeof (LuaManager),
				typeof (PanelManager),
				typeof (SoundManager),
				typeof (TimerManager),
				typeof (ThreadManager),
				typeof (NetworkManager),
				typeof (ResourceManager),
				// typeof (ThirdSDKManager),
				// typeof (GCloudVoiceManager),
				typeof (ObjectPoolManager),
				// typeof (LyxFunction),
				// typeof (UnityTools),
				// typeof (TimeManager),
				// typeof (UIEventListener),
				// typeof (StreamHelper),
				// typeof (WordFilter),
				// typeof (testWWW),
				// typeof (CC_Class),
				typeof (Dictionary<string, object>),
				// typeof (UIDepth),
				typeof (RectTransformUtility),
				typeof (Button.ButtonClickedEvent),
				// typeof (Spine.Unity.SkeletonGraphic),
				typeof (Ping),
				typeof (AnimatorStateInfo),
				typeof (AnimatorClipInfo),
				typeof (RuntimeAnimatorController),
				typeof (Convert),
				typeof (AssetBundleRequest),
				typeof (AssetBundleCreateRequest),
				typeof (Encoding),
				typeof (Color32),
				// typeof (Spine.TrackEntry),
				// typeof (Spine.AnimationStateData),
				// typeof (Spine.Skeleton),
				// typeof (Spine.SkeletonData),
				// typeof (Spine.Unity.SkeletonDataAsset),
				typeof (TextAsset),
				// typeof (Spine.Unity.AtlasAsset),
				typeof (GameObjectPool),
				typeof (LuaFunction),
			};
			foreach (var item in types) {
				GenType (item, true, path);
			}

			foreach (var item in CustomSettings.customTypeList) {
				GenType (item.type, true, path);
			}

			List<string> keyHave = new List<string> ();
			var sb = new StringBuilder ();
			foreach (var _namespace in dic.Keys) {
				foreach (var _class in dic[_namespace]) {
					if (_namespace == _class) {		//相等表示没有命名空间，直接给类型
						if (!keyHave.Contains (_namespace)) {
							keyHave.Add (_namespace);
							sb.AppendLine (_namespace + " = {} ---@type " + _class);
						}
						continue;
					}

					if (!keyHave.Contains (_namespace)) {	//有命名空间未定义，先定义命名空间
						if (_namespace.Contains (".")) {
							var arr = _namespace.Split ('.');
							var _key = "";
							for (int i = 0; i < arr.Length; i++) {
								_key += arr[i];
								if (!keyHave.Contains (_key)) {
									keyHave.Add (_key);
									sb.AppendLine (_key + " = {}");
								}
								_key += ".";
							}
						} else {
							keyHave.Add (_namespace);
							sb.AppendLine (_namespace + " = {}");
						}
					}

					var newKey = _namespace + "." + _class;
					if (!keyHave.Contains (newKey)) {
						keyHave.Add (newKey);
						sb.AppendLine (newKey + " = {} ---@type " + _class);
						continue;
					}
				}
			}
			File.WriteAllText (path + "_all.lua", sb.ToString (), Encoding.UTF8);
		}

		static Dictionary<string, List<string>> dic = new Dictionary<string, List<string>> ();
		public static void GenType (Type t, bool custom, string path, ToLuaMenu.BindType bindType = null) {
			if (!CheckType (t))
				return;
			var sb = new StringBuilder ();

			string tname = t.Name;
			tname = tname.Replace ("`2", "").Replace ("`1", "");

			string filename = tname;
			if (t.Namespace != null) {
				filename = t.Namespace + "." + tname;
				string _namespace = t.Namespace;
				if (t.IsNested) { //这个类是被嵌套的，要先找出向上嵌套的类，比如 UnityEngine.UI.Dropdown.OptionData 是 嵌套在 UnityEngine.UI.Dropdown 底下的
					filename = t.DeclaringType + "." + tname;
					_namespace = t.DeclaringType.ToString ();
				}
				if (!dic.ContainsKey (_namespace)) {
					dic.Add (_namespace, new List<string> ());
				}
				dic[_namespace].Add (tname);
			} else {
				if (!dic.ContainsKey (tname)) {
					dic.Add (tname, new List<string> ());
				}
				dic[tname].Add (tname);
			}

			// string className = bindType != null ? bindType.libName : tname;
			if (!CheckType (t.BaseType)) {
				sb.AppendFormat ("---@class {0}\n", tname);
			} else {
				sb.AppendFormat ("---@class {0} : {1}\n", tname, t.BaseType.Name.Replace ("`2", "").Replace ("`1", ""));
			}

			GenTypeField (t, sb);

			sb.AppendLine ("local " + tname + " = {}");

			GenTypeMehod (t, sb);

			filename = filename.Replace (".", "_");
			File.WriteAllText (path + filename + ".lua", sb.ToString (), Encoding.UTF8);
		}

		static bool CheckType (Type t) {
			if (t == null) {
				return false;
			}
			return !ToLuaMenu.BindType.IsObsolete (t);
		}

		public static void GenTypeField (Type t, StringBuilder sb) {
			FieldInfo[] fields = t.GetFields (BindingFlags.Public | BindingFlags.Static | BindingFlags.Instance | BindingFlags.DeclaredOnly);
			foreach (var field in fields) {
				if (field.IsDefined (typeof (NoToLuaAttribute), false))
					continue;
				sb.AppendFormat ("---@field public {0} {1}\n", field.Name, GetLuaType (field.FieldType));
			}
			PropertyInfo[] properties = t.GetProperties (BindingFlags.Public | BindingFlags.Static | BindingFlags.Instance | BindingFlags.DeclaredOnly);
			foreach (var pro in properties) {
				if (pro.IsDefined (typeof (NoToLuaAttribute), false))
					continue;
				sb.AppendFormat ("---@field public {0} {1}\n", pro.Name, GetLuaType (pro.PropertyType));
			}
		}

		public static void GenTypeMehod (Type t, StringBuilder sb) {
			string tname = t.Name;
			tname = tname.Replace ("`2", "").Replace ("`1", "");
			MethodInfo[] methods = t.GetMethods (BindingFlags.Public | BindingFlags.Static | BindingFlags.Instance | BindingFlags.DeclaredOnly);
			foreach (var method in methods) {
				if (method.IsGenericMethod)
					continue;
				if (method.IsDefined (typeof (NoToLuaAttribute), false))
					continue;
				if (method.Name.StartsWith ("get_") || method.Name.StartsWith ("set_"))
					continue;
				sb.AppendLine ("---@public");
				var paramstr = new StringBuilder ();
				foreach (var param in method.GetParameters ()) {
					string pname = param.Name;
					if (pname == "end") pname = "_" + pname.Replace ("&", "");
					sb.AppendFormat ("---@param {0} {1}\n", pname, GetLuaType (param.ParameterType));
					if (paramstr.Length != 0) {
						paramstr.Append (", ");
					}
					paramstr.Append (pname);
				}
				sb.AppendFormat ("---@return {0}\n", method.ReturnType == null ? "void" : GetLuaType (method.ReturnType));
				if (method.IsStatic) {
					sb.AppendFormat ("function {0}.{1}({2}) end\n", tname, method.Name, paramstr);
				} else {
					sb.AppendFormat ("function {0}:{1}({2}) end\n", tname, method.Name, paramstr);
				}
			}
		}

		static string GetLuaType (Type t) {
			string tname = t.Name;
			tname = tname.Replace ("`2", "").Replace ("`1", "").Replace ("&", "");
			if (t.IsEnum || t == typeof (double))
				return "number";
			if (t == typeof (bool))
				return "bool";
			if (t == typeof (string))
				return "string";
			if (t == typeof (void))
				return "void";
			return tname;
		}
	}
}