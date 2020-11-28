using System.Collections;
using System.Collections.Generic;

using System.IO;
using System.Linq;
using System.Text;
using LuaFramework;
using LuaInterface;
using UnityEditor;
using UnityEngine;
using Debug = UnityEngine.Debug;

public class Packager {
    [MenuItem("Tools/PlayerPrefs.DeleteAll %k")]
    private static void NewMenuOption()
    {
        PlayerPrefs.DeleteAll();
        Debugger.Log("PlayerPrefs.DeleteAll");
    }
	static List<string> paths = new List<string> ();
	static List<string> files = new List<string> ();
	static List<AssetBundleBuild> maps = new List<AssetBundleBuild> ();

#if UNITY_IOS
	[MenuItem ("LuaFramework/Build iPhone Resource", false, 100)]
	public static void BuildiPhoneResource () {
		BuildAssetResource (BuildTarget.iOS);
	}
#elif UNITY_ANDROID
	[MenuItem ("LuaFramework/Build Android Resource", false, 101)]
	public static void BuildAndroidResource () {
		BuildAssetResource (BuildTarget.Android);
	}
#elif UNITY_EDITOR
	[MenuItem ("LuaFramework/Build Windows Resource", false, 102)]
	public static void BuildWindowsResource () {
		BuildAssetResource (BuildTarget.StandaloneWindows64);
	}
#endif
	// [MenuItem ("LuaFramework/Test", false, 100)]
	// public static void BuildWindowsResource1111 () {
	// 	// Debug.Log(AppDataPath);
	// }

	/// <summary>
	/// 生成绑定素材
	/// </summary>
	public static void BuildAssetResource (BuildTarget target) {

		if (Directory.Exists (Util.DataPath)) {
			Directory.Delete (Util.DataPath, true);
		}
		string streamPath = Application.streamingAssetsPath;
		if (Directory.Exists (streamPath)) {
			Directory.Delete (streamPath, true);
		}
		Directory.CreateDirectory (streamPath);
		AssetDatabase.Refresh ();

		maps.Clear ();

		HandleLuaBundle ();
		HandleExampleBundle ();

		string path = Application.dataPath + "/ab/files";
		foreach (var file in Directory.GetFiles (path, "*.*", SearchOption.AllDirectories)) {
			var newFile = file.Replace ("/ab/", "/StreamingAssets/game/");
			var dir = Path.GetDirectoryName (newFile);
			if (!Directory.Exists (dir)) {
				Directory.CreateDirectory (dir);
			}
			File.Copy (file, newFile);
		}

		string resPath = "Assets/" + AppConst.AssetDir;
		BuildPipeline.BuildAssetBundles (resPath, maps.ToArray (), BuildAssetBundleOptions.None, target);
		BuildFileIndex ();

		// string streamDir = Application.dataPath + "/" + AppConst.LuaTempDir;
		// if (Directory.Exists (streamDir)) Directory.Delete (streamDir, true);
		// AssetDatabase.Refresh ();

		var versFile = "./vers.json";
		Dictionary<string, int> dics = new Dictionary<string, int> ();
		if (File.Exists (versFile)) {
			var str = File.ReadAllText (versFile);
			// Debug.Log("str="+str);
			dics = LitJson.JsonMapper.ToObject<Dictionary<string, int>> (str);
		}
		foreach (var item in maps) {
			var key = item.assetBundleName;
			if (!dics.ContainsKey (key)) {
				dics.Add (key, 1);
			} else {
				dics[key] = dics[key] + 1;
			}
		}
		// Debug.Log("ret="+ LitJson.JsonMapper.ToJson (dics));
		File.WriteAllText (versFile, LitJson.JsonMapper.ToJson (dics));
		// AssetDatabase.Refresh ();
		AssetDatabase.Refresh ();
		string vers = "./vers/";
		foreach (var item in maps) {
			var key = item.assetBundleName;
			var url = vers + dics[key] + "/" + key;
			var dir = Path.GetDirectoryName (url);
			if (!Directory.Exists (dir)) {
				Directory.CreateDirectory (dir);
			}
			File.Copy (Application.dataPath + "/" + AppConst.AssetDir + "/" + key, url);
		}

		AssetDatabase.Refresh ();
	}

	static void AddBuildMap (string bundleName, string pattern, string path) {
		string[] files = Directory.GetFiles (path, pattern, SearchOption.AllDirectories);
		if (files.Length == 0) return;

		for (int i = 0; i < files.Length; i++) {
			files[i] = files[i].Replace ('\\', '/');
		}
		AssetBundleBuild build = new AssetBundleBuild ();
		build.assetBundleName = bundleName;
		build.assetNames = files;
		maps.Add (build);
	}

	/// <summary>
	/// 处理Lua代码包
	/// </summary>
	static void HandleLuaBundle () {
		string streamDir = Application.dataPath + "/" + AppConst.LuaTempDir;
		if (Directory.Exists (streamDir)) Directory.Delete (streamDir, true);
		if (!Directory.Exists (streamDir)) Directory.CreateDirectory (streamDir);

		var alldir = Directory.GetDirectories (LuaConst.luaDir, "*.*", SearchOption.TopDirectoryOnly).ToList ();
		alldir.ForEach (s => s.Replace ("\\", "/"));
		var moduleDic = new Dictionary<string, string> ();
		foreach (var dir in alldir) {
			var dirName = Path.GetFileName (dir);
			if (!moduleDic.ContainsKey (dirName)) {
				moduleDic.Add (dirName, dir);
			} else {
				Debug.LogError ("error! dic.ContainsKey(dirName) dirName:" + dirName + ",dir:" + dir);
			}
		}
		moduleDic.Add ("tolua", LuaConst.toluaDir);
		Debug.Log (LitJson.JsonMapper.ToJson (moduleDic));

		foreach (var item in moduleDic) {
			var newTempDir = Path.Combine (streamDir, item.Key.ToLower ());
			if (!Directory.Exists (newTempDir)) {
				Directory.CreateDirectory (newTempDir);
			}
			var files = Directory.GetFiles (item.Value, "*.*", SearchOption.AllDirectories);
			foreach (var file in files) {
				var newFilePath = file.Replace (item.Value, newTempDir);
				if (File.Exists (newFilePath)) {
					continue;
				}
				var oldDir = Path.GetDirectoryName (file);
				var newDir = oldDir.Replace (item.Value, newTempDir);
				if (!Directory.Exists (newDir)) {
					Directory.CreateDirectory (newDir);
				}
				var ext = Path.GetExtension (newFilePath).ToLower ();
				if (ext.Equals (".lua") || ext.Equals (".proto")) {
					newFilePath += ".bytes";
				}
				if (!ext.Equals (".meta")) {
					File.Copy (file, newFilePath);
				}
			}

			var name = "lua/" + item.Key.ToLower () + AppConst.ExtName;
			var path = newTempDir.Replace (Application.dataPath, "Assets");
			AddBuildMap (name, "*.bytes", path);
		}

		Debug.Log (LitJson.JsonMapper.ToJson (maps));

		AssetDatabase.Refresh ();
	}

	/// <summary>
	/// 处理框架实例包
	/// </summary>
	static void HandleExampleBundle () {
		string resPath = AppDataPath + "/" + AppConst.AssetDir + "/";
		if (!Directory.Exists (resPath)) Directory.CreateDirectory (resPath);

		AddBuildMap ("res/img" + AppConst.ExtName, "*.*", "Assets/ab/res/img");
		AddBuildMap ("res/prefab" + AppConst.ExtName, "*.*", "Assets/ab/res/prefab");
	}

	/// <summary>
	/// 处理Lua文件
	/// </summary>
	static void HandleLuaFile () {
		string resPath = AppDataPath + "/" + AppConst.AssetDir;
		string luaPath = resPath + "/lua/";

		//----------复制Lua文件----------------
		if (!Directory.Exists (luaPath)) {
			Directory.CreateDirectory (luaPath);
		}
		string[] luaPaths = {
			AppDataPath + "/ab/lua/",
			AppDataPath + "/LuaFramework/Tolua/Lua/"
		};

		for (int i = 0; i < luaPaths.Length; i++) {
			paths.Clear ();
			files.Clear ();
			string luaDataPath = luaPaths[i].ToLower ();
			Recursive (luaDataPath);
			int n = 0;
			foreach (string f in files) {
				if (f.EndsWith (".meta")) continue;
				string newfile = f.Replace (luaDataPath, "");
				string newpath = luaPath + newfile;
				string path = Path.GetDirectoryName (newpath);
				if (!Directory.Exists (path)) Directory.CreateDirectory (path);

				if (File.Exists (newpath)) {
					File.Delete (newpath);
				}

				File.Copy (f, newpath, true);

				UpdateProgress (n++, files.Count, newpath);
			}
		}
		EditorUtility.ClearProgressBar ();
		AssetDatabase.Refresh ();
	}

	static void BuildFileIndex () {
		string resPath = AppDataPath + "/" + AppConst.AssetDir;
		///----------------------创建文件列表-----------------------
		string newFilePath = resPath + "/files.txt";
		if (File.Exists (newFilePath)) File.Delete (newFilePath);

		paths.Clear ();
		files.Clear ();
		Recursive (resPath);

		FileStream fs = new FileStream (newFilePath, FileMode.CreateNew);
		StreamWriter sw = new StreamWriter (fs);
		for (int i = 0; i < files.Count; i++) {
			string file = files[i];
			if (file.EndsWith (".meta") || file.Contains (".DS_Store")) continue;

			string md5 = Util.md5file (file);
			string value = file.Replace (resPath, string.Empty);
			sw.WriteLine (value + "|" + md5);
		}
		sw.Close ();
		fs.Close ();
	}

	/// <summary>
	/// 数据目录
	/// </summary>
	static string AppDataPath {
		get { return Application.dataPath.ToLower (); }
	}

	/// <summary>
	/// 遍历目录及其子目录
	/// </summary>
	static void Recursive (string path) {
		string[] names = Directory.GetFiles (path);
		string[] dirs = Directory.GetDirectories (path);
		foreach (string filename in names) {
			string ext = Path.GetExtension (filename);
			if (ext.Equals (".meta")) continue;
			files.Add (filename.Replace ('\\', '/'));
		}
		foreach (string dir in dirs) {
			paths.Add (dir.Replace ('\\', '/'));
			Recursive (dir);
		}
	}

	static void UpdateProgress (int progress, int progressMax, string desc) {
		string title = "Processing...[" + progress + " - " + progressMax + "]";
		float value = (float) progress / (float) progressMax;
		EditorUtility.DisplayProgressBar (title, desc, value);
	}

	// [MenuItem ("LuaFramework/Build Protobuf-lua-gen File")]
	// public static void BuildProtobufFile () {
	// 	if (true) {
	// 		UnityEngine.Debug.LogError ("若使用编码Protobuf-lua-gen功能，需要自己配置外部环境！！");
	// 		return;
	// 	}
	// 	string dir = AppDataPath + "/Lua/3rd/pblua";
	// 	paths.Clear ();
	// 	files.Clear ();
	// 	Recursive (dir);

	// 	string protoc = "d:/protobuf-2.4.1/src/protoc.exe";
	// 	string protoc_gen_dir = "\"d:/protoc-gen-lua/plugin/protoc-gen-lua.bat\"";

	// 	foreach (string f in files) {
	// 		string name = Path.GetFileName (f);
	// 		string ext = Path.GetExtension (f);
	// 		if (!ext.Equals (".proto")) continue;

	// 		ProcessStartInfo info = new ProcessStartInfo ();
	// 		info.FileName = protoc;
	// 		info.Arguments = " --lua_out=./ --plugin=protoc-gen-lua=" + protoc_gen_dir + " " + name;
	// 		info.WindowStyle = ProcessWindowStyle.Hidden;
	// 		info.UseShellExecute = true;
	// 		info.WorkingDirectory = dir;
	// 		info.ErrorDialog = true;
	// 		Util.Log (info.FileName + " " + info.Arguments);

	// 		Process pro = Process.Start (info);
	// 		pro.WaitForExit ();
	// 	}
	// 	AssetDatabase.Refresh ();
	// }
}