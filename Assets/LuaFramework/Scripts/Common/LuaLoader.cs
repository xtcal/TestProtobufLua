using System.Collections;
using System.IO;
using LuaInterface;
using UnityEngine;

namespace LuaFramework {
	/// <summary>
	/// 集成自LuaFileUtils，重写里面的ReadFile，
	/// </summary>
	public class LuaLoader : LuaFileUtils {
		private ResourceManager m_resMgr;

		ResourceManager resMgr {
			get {
				if (m_resMgr == null)
					m_resMgr = AppFacade.Instance.GetManager<ResourceManager> (ManagerName.Resource);
				return m_resMgr;
			}
		}

		public LuaLoader () {
			instance = this;
		}

		/// <summary>
		/// 当LuaVM加载Lua文件的时候，这里就会被调用，
		/// 用户可以自定义加载行为，只要返回byte[]即可。
		/// </summary>
		/// <param name="fileName"></param>
		/// <returns></returns>
		public override byte[] ReadFile (string fileName) {
			return base.ReadFile (fileName);
		}
		public void UnloadModule (string bundleName) {
			if (zipMap.ContainsKey (bundleName)) {
				AssetBundle ab = zipMap[bundleName];
				if (!ab) ab.Unload (true);
				zipMap.Remove (bundleName);
			}
		}
	}
}