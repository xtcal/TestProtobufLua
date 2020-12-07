using System;
using System.Collections;
using System.IO;
using LuaInterface;
using UnityEngine;

namespace LuaFramework {
	public class LuaManager : Manager {
		private LuaState lua;
		private LuaLoader loader;
		private LuaLooper loop = null;

		// Use this for initialization
		void Awake () {
			loader = new LuaLoader ();
			lua = new LuaState ();
			this.OpenLibs ();
			lua.LuaSetTop (0);

			LuaBinder.Bind (lua);
			DelegateFactory.Init ();
			LuaCoroutine.Register (lua, this);
		}

		public void InitStart () {
			InitLuaPath ();
			this.lua.Start (); //启动LUAVM
			this.StartMain ();
			this.StartLooper ();
		}

		void StartLooper () {
			loop = gameObject.AddComponent<LuaLooper> ();
			loop.luaState = lua;
		}

		//cjson 比较特殊，只new了一个table，没有注册库，这里注册一下
		protected void OpenCJson () {
			lua.LuaGetField (LuaIndexes.LUA_REGISTRYINDEX, "_LOADED");
			lua.OpenLibs (LuaDLL.luaopen_cjson);
			lua.LuaSetField (-2, "cjson");

			lua.OpenLibs (LuaDLL.luaopen_cjson_safe);
			lua.LuaSetField (-2, "cjson.safe");
		}

		void StartMain () {
			if (AppConst.DebugMode) {
				lua.DoFile ("Main.lua");

				LuaFunction main = lua.GetFunction ("Main");
				main.Call ();
				main.Dispose ();
				main = null;
			}
		}

		/// <summary>
		/// 初始化加载第三方库
		/// </summary>
		void OpenLibs () {
			lua.OpenLibs (LuaDLL.luaopen_pb);
			lua.OpenLibs (LuaDLL.luaopen_sproto_core);
			lua.OpenLibs (LuaDLL.luaopen_protobuf_c);
			lua.OpenLibs (LuaDLL.luaopen_lpeg);
			lua.OpenLibs (LuaDLL.luaopen_bit);
			lua.OpenLibs (LuaDLL.luaopen_socket_core);

			this.OpenCJson ();
		}

		/// <summary>
		/// 初始化Lua代码加载路径
		/// </summary>
		void InitLuaPath () {
			if (AppConst.DebugMode && Application.isEditor) {
				string rootPath = AppConst.FrameworkRoot;
				lua.AddSearchPath (rootPath + "/Lua");
				lua.AddSearchPath (rootPath + "/ToLua/Lua");
			} else {
				lua.AddSearchPath (Util.DataPath + "lua");
			}
		}

		public void DoFile (string filename) {
			lua.DoFile (filename);
		}

		// Update is called once per frame
		public object[] CallFunction (string funcName, params object[] args) {
			LuaFunction func = lua.GetFunction (funcName);
			if (func != null) {
				return func.LazyCall (args);
			}
			return null;
		}

		public void LuaGC () {
			lua.LuaGC (LuaGCOptions.LUA_GCCOLLECT);
		}

		public void Close () {
			if (loop != null) {
				loop.Destroy ();
				loop = null;
			}

			if (lua != null) {
				lua.Dispose ();
				lua = null;
			}
			loader = null;
		}
		public void EnterGame () {
			AddSearchBundle ("lua/main");
		}
		public void AddSearchBundle (string url) {
			if (!url.EndsWith (AppConst.ExtName)) {
				url += AppConst.ExtName;
			}
			url = Util.DataPath + url;
			try {
				var bytes = File.ReadAllBytes (url);
				AssetBundle bundle = AssetBundle.LoadFromMemory (bytes);
				loader.AddSearchBundle (Path.GetFileNameWithoutExtension (url).ToLower (), bundle);
			} catch (System.Exception ex) {
				Debugger.LogError ("AddSearchBundle find err {0} {1}", url, ex.Message);
			}
		}

		public void AddSearchBundle (string name, AssetBundle bundle) {
			loader.AddSearchBundle (name, bundle);
		}
		public void AddSearchBundle (string name, byte[] bytes) {
			AssetBundle bundle = AssetBundle.LoadFromMemory (bytes);
			if (bundle != null) {
				loader.AddSearchBundle (name, bundle);
			}
		}
		public void UnloadModule (string bundleName) {
			loader.UnloadModule (bundleName);
		}
	}
}