using UnityEngine;

public static class LuaConst {
	/// <summary>
	/// lua逻辑代码目录
	/// </summary>
	public static string luaDir = Application.dataPath + "/ab/lua";
	/// <summary>
	/// tolua lua文件目录
	/// </summary>
	public static string toluaDir = Application.dataPath + "/LuaFramework/ToLua/Lua";
#if UNITY_STANDALONE
	public static string osDir = "Win";
#elif UNITY_ANDROID
	public static string osDir = "Android";
#elif UNITY_IPHONE
	public static string osDir = "iOS";
#else
	public static string osDir = "";
#endif
	/// <summary>
	/// 手机运行时lua文件下载目录
	/// </summary>
	/// <returns></returns>
	public static string luaResDir = string.Format ("{0}/{1}/Lua", Application.persistentDataPath, osDir);
#if UNITY_EDITOR_WIN || UNITY_STANDALONE_WIN    
	public static string zbsDir = "D:/ZeroBraneStudio/lualibs/mobdebug"; //ZeroBraneStudio目录       
#elif UNITY_EDITOR_OSX || UNITY_STANDALONE_OSX
	public static string zbsDir = "/Applications/ZeroBraneStudio.app/Contents/ZeroBraneStudio/lualibs/mobdebug";
#else
	public static string zbsDir = luaResDir + "/mobdebug/";
#endif    
	/// <summary>
	/// 是否打开Lua Socket库
	/// </summary>
	public static bool openLuaSocket = true;
	/// <summary>
	/// 是否连接lua调试器
	/// </summary>
	public static bool openLuaDebugger = false;
}