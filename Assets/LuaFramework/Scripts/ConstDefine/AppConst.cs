using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace LuaFramework {
	public class AppConst {
		/// <summary>
		/// 调试模式-用于内部测试
		/// </summary>
		public const bool DebugMode = true;
		/// <summary>
		/// 更新模式-默认关闭 
		/// 如果开启更新模式，前提必须启动框架自带服务器端。
		/// 否则就需要自己将StreamingAssets里面的所有内容
		/// 复制到自己的Webserver上面，并修改下面的WebUrl。
		/// </summary>
		public const bool UpdateMode = true;
		public const int TimerInterval = 1;
		/// <summary>
		/// 游戏帧频
		/// </summary>
		public const int GameFrameRate = 30;
		/// <summary>
		/// 应用程序名称
		/// </summary>
		public const string AppName = "LuaFramework";
		/// <summary>
		/// 临时目录
		/// </summary>
		public const string LuaTempDir = "lua2txt/";
		/// <summary>
		/// 应用程序前缀
		/// </summary>
		public const string AppPrefix = AppName + "_";
		/// <summary>
		/// 素材扩展名
		/// </summary>
		public const string ExtName = ".unity3d";
		/// <summary>
		/// 素材目录
		/// </summary>
		public const string AssetDir = "StreamingAssets/game";
		//测试更新地址
		public const string WebUrl = "http://localhost:6688/";
		/// <summary>
		/// 用户ID
		/// </summary>
		public static string UserId = string.Empty;
		/// <summary>
		/// Socket服务器端口
		/// </summary>
		public static int SocketPort = 0;
		/// <summary>
		/// Socket服务器地址
		/// </summary>
		public static string SocketAddress = string.Empty;
		public static string FrameworkRoot {
			get {
				return Application.dataPath + "/" + AppName;
			}
		}
		public enum LuaLoadMode {
			//在 search path 路径读.lua文件
			ToFile,
			//在bundel文件里读代码文本
			ToAb
		}
		public static LuaLoadMode LoadLuaType = LuaLoadMode.ToAb;
	}
}