﻿using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using LuaInterface;
using UnityEngine;
using UObject = UnityEngine.Object;

public class AssetBundleInfo {
	public AssetBundle m_AssetBundle;
	/// <summary>
	/// 已加载完成的依赖个数
	/// </summary>
	public int m_ReferencedCount;

	public AssetBundleInfo (AssetBundle assetBundle) {
		m_AssetBundle = assetBundle;
		m_ReferencedCount = 0;
	}
}

namespace LuaFramework {

	public class ResourceManager : Manager {
		string m_BaseDownloadingURL = "";
		string[] m_AllManifest = null;
		AssetBundleManifest m_AssetBundleManifest = null;
		/// <summary>
		/// 包依赖字典
		/// </summary>
		/// <typeparam name="string">本包</typeparam>
		/// <typeparam name="string[]">依赖哪些包</typeparam>
		/// <returns></returns>
		Dictionary<string, string[]> m_Dependencies = new Dictionary<string, string[]> ();
		/// <summary>
		/// 已经完成过加载的ab包
		/// </summary>
		/// <typeparam name="string"></typeparam>
		/// <typeparam name="AssetBundleInfo"></typeparam>
		/// <returns></returns>
		Dictionary<string, AssetBundleInfo> m_LoadedAssetBundles = new Dictionary<string, AssetBundleInfo> ();
		Dictionary<string, List<LoadAssetRequest>> m_LoadRequests = new Dictionary<string, List<LoadAssetRequest>> ();

		class LoadAssetRequest {
			public Type assetType;
			public string[] assetNames;
			public LuaFunction luaFunc;
			public Action<UObject[]> sharpFunc;
		}

		// Load AssetBundleManifest.
		public void Initialize (string manifestName, Action initOK) {
			m_BaseDownloadingURL = Util.GetRelativePath ();
			LoadAsset<AssetBundleManifest> (manifestName, new string[] { "AssetBundleManifest" }, delegate (UObject[] objs) {
				if (objs.Length > 0) {
					m_AssetBundleManifest = objs[0] as AssetBundleManifest;
					m_AllManifest = m_AssetBundleManifest.GetAllAssetBundles ();
				}
				if (initOK != null) initOK ();
			});
		}

		public void LoadPrefab (string abName, string assetName, Action<UObject[]> func) {
			LoadAsset<GameObject> (abName, new string[] { assetName }, func);
		}

		public void LoadPrefab (string abName, string[] assetNames, Action<UObject[]> func) {
			LoadAsset<GameObject> (abName, assetNames, func);
		}

		public void LoadPrefab (string abName, string[] assetNames, LuaFunction func) {
			LoadAsset<GameObject> (abName, assetNames, null, func);
		}

		string GetRealAssetPath (string abName) {
			if (abName.Equals ("game")) {
				return abName;
			}
			abName = abName.ToLower ();
			if (!abName.EndsWith (AppConst.ExtName)) {
				abName += AppConst.ExtName;
			}
			if (abName.Contains ("/")) {
				return abName;
			}
			//string[] paths = m_AssetBundleManifest.GetAllAssetBundles();  产生GC，需要缓存结果
			for (int i = 0; i < m_AllManifest.Length; i++) {
				int index = m_AllManifest[i].LastIndexOf ('/');
				string path = m_AllManifest[i].Remove (0, index + 1); //字符串操作函数都会产生GC
				if (path.Equals (abName)) {
					return m_AllManifest[i];
				}
			}
			Debug.LogError ("GetRealAssetPath Error:>>" + abName);
			return null;
		}

		/// <summary>
		/// 载入素材
		/// </summary>
		void LoadAsset<T> (string abName, string[] assetNames, Action<UObject[]> action = null, LuaFunction func = null) where T : UObject {
			abName = GetRealAssetPath (abName);

			LoadAssetRequest request = new LoadAssetRequest ();
			request.assetType = typeof (T);
			request.assetNames = assetNames;
			request.luaFunc = func;
			request.sharpFunc = action;

			List<LoadAssetRequest> requests = null;
			if (!m_LoadRequests.TryGetValue (abName, out requests)) { //这个ab包没有任何asset在加载，new个新表
				requests = new List<LoadAssetRequest> ();
				requests.Add (request);
				m_LoadRequests.Add (abName, requests);
				StartCoroutine (OnLoadAsset<T> (abName));
			} else {
				requests.Add (request); //向现有未完成列表中插入，完成后会remove，重新new
			}
		}

		IEnumerator OnLoadAsset<T> (string abName) where T : UObject {
			AssetBundleInfo bundleInfo = GetLoadedAssetBundle (abName);
			if (bundleInfo == null) {
				yield return StartCoroutine (OnLoadAssetBundle (abName, typeof (T))); //获取不到。等待这个ab包加载完成

				bundleInfo = GetLoadedAssetBundle (abName);
				if (bundleInfo == null) {
					m_LoadRequests.Remove (abName);
					Debug.LogError ("OnLoadAsset--->>>" + abName);
					yield break;
				}
			}
			List<LoadAssetRequest> list = null;
			if (!m_LoadRequests.TryGetValue (abName, out list)) { //列表中的任务可能被其它协程处理完毕
				m_LoadRequests.Remove (abName);
				yield break;
			}
			for (int i = 0; i < list.Count; i++) {
				string[] assetNames = list[i].assetNames;
				List<T> result = new List<T> ();

				AssetBundle ab = bundleInfo.m_AssetBundle;
				for (int j = 0; j < assetNames.Length; j++) {
					string assetPath = assetNames[j];
					AssetBundleRequest request = ab.LoadAssetAsync (assetPath, list[i].assetType); //异步加载这个asset
					yield return request;
					result.Add (request.asset as T);
				}
				if (list[i].sharpFunc != null) {
					list[i].sharpFunc (result.ToArray ());
					list[i].sharpFunc = null;
				}
				if (list[i].luaFunc != null) {
					list[i].luaFunc.Call ((object) result.ToArray ());
					list[i].luaFunc.Dispose ();
					list[i].luaFunc = null;
				}
				bundleInfo.m_ReferencedCount++;
			}
			m_LoadRequests.Remove (abName);
		}

		IEnumerator OnLoadAssetBundle (string abName, Type type) {
			string url = m_BaseDownloadingURL + abName;
			Debugger.Log ("url==" + url);
			WWW download = null;
			if (type == typeof (AssetBundleManifest)) // AssetBundleManifest 这个包没有其它依赖，直接加载
				download = new WWW (url);
			else {
				string[] dependencies = m_AssetBundleManifest.GetAllDependencies (abName); //获取依赖的包
				if (dependencies.Length > 0) {
					m_Dependencies.Add (abName, dependencies);
					for (int i = 0; i < dependencies.Length; i++) {
						string depName = dependencies[i];
						AssetBundleInfo bundleInfo = null;
						if (m_LoadedAssetBundles.TryGetValue (depName, out bundleInfo)) { //这个依赖的资源已经加载完成过了。
							bundleInfo.m_ReferencedCount++;
						} else if (!m_LoadRequests.ContainsKey (depName)) {
							yield return StartCoroutine (OnLoadAssetBundle (depName, type)); //开始加载这个依赖的资源
						}
					}
				}
				download = WWW.LoadFromCacheOrDownload (url, m_AssetBundleManifest.GetAssetBundleHash (abName), 0); //从www缓存下载这个依赖
			}
			yield return download; //等待依赖下载完成

			AssetBundle assetObj = download.assetBundle;
			if (assetObj != null) {
				m_LoadedAssetBundles.Add (abName, new AssetBundleInfo (assetObj));
			}
		}

		AssetBundleInfo GetLoadedAssetBundle (string abName) {
			AssetBundleInfo bundle = null;
			m_LoadedAssetBundles.TryGetValue (abName, out bundle);
			if (bundle == null) return null;

			// 不记录任何依赖项，只需要包本身。
			string[] dependencies = null;
			if (!m_Dependencies.TryGetValue (abName, out dependencies))
				return bundle;

			// 确保所有依赖项都已加载
			foreach (var dependency in dependencies) {
				AssetBundleInfo dependentBundle;
				m_LoadedAssetBundles.TryGetValue (dependency, out dependentBundle);
				if (dependentBundle == null) return null;
			}
			return bundle;
		}

		/// <summary>
		/// 此函数交给外部卸载专用，自己调整是否需要彻底清除AB
		/// </summary>
		/// <param name="abName"></param>
		/// <param name="isThorough"></param>
		public void UnloadAssetBundle (string abName, bool isThorough = false) {
			abName = GetRealAssetPath (abName);
			Debug.Log (m_LoadedAssetBundles.Count + " assetbundle(s) in memory before unloading " + abName);
			UnloadAssetBundleInternal (abName, isThorough);
			UnloadDependencies (abName, isThorough);
			Debug.Log (m_LoadedAssetBundles.Count + " assetbundle(s) in memory after unloading " + abName);
		}

		void UnloadDependencies (string abName, bool isThorough) {
			string[] dependencies = null;
			if (!m_Dependencies.TryGetValue (abName, out dependencies))
				return;

			// Loop dependencies.
			foreach (var dependency in dependencies) {
				UnloadAssetBundleInternal (dependency, isThorough);
			}
			m_Dependencies.Remove (abName);
		}

		void UnloadAssetBundleInternal (string abName, bool isThorough) {
			AssetBundleInfo bundle = GetLoadedAssetBundle (abName);
			if (bundle == null) return;

			if (--bundle.m_ReferencedCount <= 0) {
				if (m_LoadRequests.ContainsKey (abName)) {
					return; //如果当前AB处于Async Loading过程中，卸载会崩溃，只减去引用计数即可
				}
				bundle.m_AssetBundle.Unload (isThorough);
				m_LoadedAssetBundles.Remove (abName);
				Debug.Log (abName + " has been unloaded successfully");
			}
		}

		//加载图片
		public void LoadSprite (string abName, string assetName, LuaFunction func) {
			LoadAsset<Sprite> (abName, new string[] { assetName }, null, func);
		}

		//加载MeshMaterial
		public void LoadMaterial (string abName, string assetName, LuaFunction func) {
			LoadAsset<Material> (abName, new string[] { assetName }, null, func);
		}

		//加载动画
		public void LoadAnimation (string abName, string assetName, LuaFunction func) {
			LoadAsset<AnimationClip> (abName, new string[] { assetName }, null, func);
		}
	}
}