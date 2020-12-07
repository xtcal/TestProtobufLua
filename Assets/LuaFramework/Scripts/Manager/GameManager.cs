using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Reflection;
using LuaInterface;
using UnityEngine;

namespace LuaFramework {
	public class GameManager : Manager {
		protected static bool initialize = false;
		private List<string> downloadFiles = new List<string> ();

		/// <summary>
		/// 初始化游戏管理器
		/// </summary>
		void Awake () {
			Init ();
		}

		/// <summary>
		/// 初始化
		/// </summary>
		void Init () {
			DontDestroyOnLoad (gameObject); //防止销毁自己
			Screen.sleepTimeout = SleepTimeout.SystemSetting;
			Application.targetFrameRate = AppConst.GameFrameRate; //锁帧

			StartCoroutine (StartGame ());
			return;
			CheckExtractResource (); //释放资源
		}

		public IEnumerator StartGame () {
			yield return new WaitForEndOfFrame ();
			var abs = new List<string> () {
				"lua/tolua.unity3d",
				"lua/common.unity3d",
				"lua/main.unity3d",
			};
			foreach (var item in abs) {
				var mainFile = Util.DataPath + item;
				Debugger.LogWarning ("check file:" + mainFile);
				byte[] bytes = null;
				if (!File.Exists (mainFile)) {
					var url = Util.AppContentPath + item;
					Debugger.LogWarning ("download fileurl:" + url);
#if UNITY_ANDROID && !UNITY_EDITOR
					WWW www = new WWW (url);
					yield return www;
					bytes = www.bytes;
					www.Dispose ();
#else
					bytes = File.ReadAllBytes (url);
#endif
					var dir = Path.GetDirectoryName (Util.DataPath + item);
					if (!Directory.Exists (dir)) {
						Directory.CreateDirectory (dir);
						File.WriteAllBytes (Util.DataPath + item, bytes);
					}
				} else {
					bytes = File.ReadAllBytes (mainFile);
				}
				yield return new WaitForEndOfFrame ();
				var name = Path.GetFileNameWithoutExtension (item).ToLower ();
				LuaManager.AddSearchBundle (name, bytes);
				yield return new WaitForEndOfFrame ();
			}
			LuaManager.InitStart ();
			LuaManager.DoFile ("main/main"); //加载游戏
			Util.CallMethod ("main", "Init"); //初始化完成
		}

		/// <summary>
		/// 释放资源
		/// </summary>
		public void CheckExtractResource () {
			if (AppConst.DebugMode) {
				StartCoroutine (OnUpdateResource ());
				return;
			}

			bool isExists = Directory.Exists (Util.DataPath) &&
				Directory.Exists (Util.DataPath + "lua/") &&
				File.Exists (Util.DataPath + "files.txt");
			if (isExists) {
				StartCoroutine (OnUpdateResource ());
				return; //文件已经解压过了，自己可添加检查文件列表逻辑
			} else {
				StartCoroutine (OnExtractResource ()); //启动释放协成 
			}
		}

		IEnumerator OnExtractResource () {
			string dataPath = Util.DataPath; //数据目录
			string resPath = Util.AppContentPath; //游戏包资源目录

			if (Directory.Exists (dataPath)) Directory.Delete (dataPath, true);
			Directory.CreateDirectory (dataPath);

			string infile = resPath + "files.txt";
			string outfile = dataPath + "files.txt";
			if (File.Exists (outfile)) File.Delete (outfile);

			string message = "正在解包文件:>files.txt";
			Debugger.LogWarning ("infile=" + infile);
			Debugger.LogWarning ("outfile=" + outfile);
#if UNITY_ANDROID && !UNITY_EDITOR
			WWW www = new WWW (infile);
			yield return www;
			if (www.isDone) {
				File.WriteAllBytes (outfile, www.bytes);
			}
			www.Dispose ();
			yield return 0;
#else
			File.Copy (infile, outfile, true);
			yield return new WaitForEndOfFrame ();
#endif
			//释放所有文件到数据目录
			string[] files = File.ReadAllLines (outfile);
			foreach (var file in files) {
				string[] fs = file.Split ('|');
				infile = resPath + fs[0]; //
				outfile = dataPath + fs[0];

				message = "正在解包文件:>" + fs[0];
				Debugger.Log ("正在解包文件:infile>" + infile + ",outfile>" + outfile);
				facade.SendMessageCommand (NotiConst.UPDATE_MESSAGE, message);

				string dir = Path.GetDirectoryName (outfile);
				if (!Directory.Exists (dir)) Directory.CreateDirectory (dir);
#if UNITY_ANDROID && !UNITY_EDITOR
				WWW _www = new WWW (infile);
				yield return _www;
				if (_www.isDone) {
					File.WriteAllBytes (outfile, _www.bytes);
				}
				_www.Dispose ();
#else
				if (File.Exists (outfile)) {
					File.Delete (outfile);
				}
				File.Copy (infile, outfile, true);
#endif
				yield return new WaitForEndOfFrame ();
			}
			message = "解包完成!!!";
			facade.SendMessageCommand (NotiConst.UPDATE_MESSAGE, message);
			yield return new WaitForSeconds (0.1f);

			message = string.Empty;
			//释放完成，开始启动更新资源
			StartCoroutine (OnUpdateResource ());
		}

		/// <summary>
		/// 启动更新下载，这里只是个思路演示，此处可启动线程下载更新
		/// </summary>
		IEnumerator OnUpdateResource () {
			if (!AppConst.UpdateMode) {
				OnResourceInited ();
				yield break;
			}
			string dataPath = Util.DataPath; //数据目录
			string url = AppConst.WebUrl;
			string message = string.Empty;
			string random = DateTime.Now.ToString ("yyyymmddhhmmss");
			string listUrl = url + "files.txt?v=" + random;
			Debug.LogWarning ("LoadUpdate---->>>" + listUrl);

			WWW www = new WWW (listUrl);
			yield return www;
			if (www.error != null) {
				OnUpdateFailed (string.Empty);
				yield break;
			}
			if (!Directory.Exists (dataPath)) {
				Directory.CreateDirectory (dataPath);
			}
			File.WriteAllBytes (dataPath + "files.txt", www.bytes);
			string filesText = www.text;
			string[] files = filesText.Split ('\n');

			for (int i = 0; i < files.Length; i++) {
				if (string.IsNullOrEmpty (files[i])) continue;
				string[] keyValue = files[i].Split ('|');
				string f = keyValue[0];
				string localfile = (dataPath + f).Trim ();
				string path = Path.GetDirectoryName (localfile);
				if (!Directory.Exists (path)) {
					Directory.CreateDirectory (path);
				}
				string fileUrl = url + f + "?v=" + random;
				bool canUpdate = !File.Exists (localfile);
				if (!canUpdate) {
					string remoteMd5 = keyValue[1].Trim ();
					string localMd5 = Util.md5file (localfile);
					canUpdate = !remoteMd5.Equals (localMd5);
					if (canUpdate) File.Delete (localfile);
				}
				if (canUpdate) { //本地缺少文件
					Debug.Log (fileUrl);
					message = "downloading>>" + fileUrl;
					facade.SendMessageCommand (NotiConst.UPDATE_MESSAGE, message);

					/*
					www = new WWW(fileUrl); 
					yield return www;
					if (www.error != null) {
					    OnUpdateFailed(path);   //
					    yield break;
					}
					File.WriteAllBytes(localfile, www.bytes);
					 */

					//这里都是资源文件，用线程下载
					BeginDownload (fileUrl, localfile);
					while (!(IsDownOK (localfile))) { yield return new WaitForEndOfFrame (); }
				}
			}
			yield return new WaitForEndOfFrame ();

			message = "更新完成!!";
			facade.SendMessageCommand (NotiConst.UPDATE_MESSAGE, message);

			OnResourceInited ();
		}

		void OnUpdateFailed (string file) {
			string message = "更新失败!>" + file;
			facade.SendMessageCommand (NotiConst.UPDATE_MESSAGE, message);
		}

		/// <summary>
		/// 是否下载完成
		/// </summary>
		bool IsDownOK (string file) {
			return downloadFiles.Contains (file);
		}

		/// <summary>
		/// 线程下载
		/// </summary>
		void BeginDownload (string url, string file) { //线程下载
			object[] param = new object[2] { url, file };

			ThreadEvent ev = new ThreadEvent ();
			ev.Key = NotiConst.UPDATE_DOWNLOAD;
			ev.evParams.AddRange (param);
			ThreadManager.AddEvent (ev, OnThreadCompleted); //线程下载
		}

		/// <summary>
		/// 线程完成
		/// </summary>
		/// <param name="data"></param>
		void OnThreadCompleted (NotiData data) {
			switch (data.evName) {
				case NotiConst.UPDATE_EXTRACT: //解压一个完成
					//
					break;
				case NotiConst.UPDATE_DOWNLOAD: //下载一个完成
					downloadFiles.Add (data.evParam.ToString ());
					break;
			}
		}

		/// <summary>
		/// 资源初始化结束
		/// </summary>
		public void OnResourceInited () {
			ResManager.Initialize ("game", delegate () {
				Debugger.Log ("Initialize OK!!!");
				this.OnInitialize ();
			});
		}

		void OnInitialize () {
			LuaManager.InitStart ();
			LuaManager.DoFile ("logic/Game"); //加载游戏
			LuaManager.DoFile ("logic/Network"); //加载网络
			NetManager.OnInit (); //初始化网络
			Util.CallMethod ("Game", "OnInitOK"); //初始化完成

			initialize = true;

			//类对象池测试
			// var classObjPool = ObjPoolManager.CreatePool<TestObjectClass> (OnPoolGetElement, OnPoolPushElement);
			//方法1
			//objPool.Release(new TestObjectClass("abcd", 100, 200f));
			//var testObj1 = objPool.Get();

			//方法2
			// ObjPoolManager.Release<TestObjectClass> (new TestObjectClass ("abcd", 100, 200f));
			// var testObj1 = ObjPoolManager.Get<TestObjectClass> ();

			// Debugger.Log ("TestObjectClass--->>>" + testObj1.ToString ());

			//游戏对象池测试
			// var prefab = Resources.Load ("TestGameObjectPrefab", typeof (GameObject)) as GameObject;
			// var gameObjPool = ObjPoolManager.CreatePool ("TestGameObject", 5, 10, prefab);

			// var gameObj = Instantiate (prefab) as GameObject;
			// gameObj.name = "TestGameObject_01";
			// gameObj.transform.localScale = Vector3.one;
			// gameObj.transform.localPosition = Vector3.zero;

			// ObjPoolManager.Release ("TestGameObject", gameObj);
			// for (int i = 0; i < 20; i++)
			// {
			// 	var backObj = ObjPoolManager.Get ("TestGameObject");
			// 	backObj.transform.SetParent (null);
			// }

			// Debug.Log ("TestGameObject--->>>" + backObj);
		}

		/// <summary>
		/// 当从池子里面获取时
		/// </summary>
		/// <param name="obj"></param>
		void OnPoolGetElement (TestObjectClass obj) {
			Debugger.Log ("OnPoolGetElement--->>>" + obj);
		}

		/// <summary>
		/// 当放回池子里面时
		/// </summary>
		/// <param name="obj"></param>
		void OnPoolPushElement (TestObjectClass obj) {
			Debugger.Log ("OnPoolPushElement--->>>" + obj);
		}

		/// <summary>
		/// 析构函数
		/// </summary>
		void OnDestroy () {
			if (NetManager != null) {
				NetManager.Unload ();
			}
			if (LuaManager != null) {
				LuaManager.Close ();
			}
			Debugger.Log ("~GameManager was destroyed");
		}
	}
}