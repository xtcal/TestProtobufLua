﻿//this source code was auto-generated by tolua#, do not modify it
using System;
using LuaInterface;

public class LuaFramework_LuaManagerWrap
{
	public static void Register(LuaState L)
	{
		L.BeginClass(typeof(LuaFramework.LuaManager), typeof(Manager));
		L.RegFunction("InitStart", InitStart);
		L.RegFunction("DoFile", DoFile);
		L.RegFunction("CallFunction", CallFunction);
		L.RegFunction("LuaGC", LuaGC);
		L.RegFunction("Close", Close);
		L.RegFunction("EnterGame", EnterGame);
		L.RegFunction("AddSearchBundle", AddSearchBundle);
		L.RegFunction("UnloadModule", UnloadModule);
		L.RegFunction("__eq", op_Equality);
		L.RegFunction("__tostring", ToLua.op_ToString);
		L.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int InitStart(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			LuaFramework.LuaManager obj = (LuaFramework.LuaManager)ToLua.CheckObject<LuaFramework.LuaManager>(L, 1);
			obj.InitStart();
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int DoFile(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			LuaFramework.LuaManager obj = (LuaFramework.LuaManager)ToLua.CheckObject<LuaFramework.LuaManager>(L, 1);
			string arg0 = ToLua.CheckString(L, 2);
			obj.DoFile(arg0);
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int CallFunction(IntPtr L)
	{
		try
		{
			int count = LuaDLL.lua_gettop(L);
			LuaFramework.LuaManager obj = (LuaFramework.LuaManager)ToLua.CheckObject<LuaFramework.LuaManager>(L, 1);
			string arg0 = ToLua.CheckString(L, 2);
			object[] arg1 = ToLua.ToParamsObject(L, 3, count - 2);
			object[] o = obj.CallFunction(arg0, arg1);
			ToLua.Push(L, o);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int LuaGC(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			LuaFramework.LuaManager obj = (LuaFramework.LuaManager)ToLua.CheckObject<LuaFramework.LuaManager>(L, 1);
			obj.LuaGC();
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int Close(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			LuaFramework.LuaManager obj = (LuaFramework.LuaManager)ToLua.CheckObject<LuaFramework.LuaManager>(L, 1);
			obj.Close();
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int EnterGame(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			LuaFramework.LuaManager obj = (LuaFramework.LuaManager)ToLua.CheckObject<LuaFramework.LuaManager>(L, 1);
			obj.EnterGame();
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int AddSearchBundle(IntPtr L)
	{
		try
		{
			int count = LuaDLL.lua_gettop(L);

			if (count == 2)
			{
				LuaFramework.LuaManager obj = (LuaFramework.LuaManager)ToLua.CheckObject<LuaFramework.LuaManager>(L, 1);
				string arg0 = ToLua.CheckString(L, 2);
				obj.AddSearchBundle(arg0);
				return 0;
			}
			else if (count == 3 && TypeChecker.CheckTypes<byte[]>(L, 3))
			{
				LuaFramework.LuaManager obj = (LuaFramework.LuaManager)ToLua.CheckObject<LuaFramework.LuaManager>(L, 1);
				string arg0 = ToLua.CheckString(L, 2);
				byte[] arg1 = ToLua.CheckByteBuffer(L, 3);
				obj.AddSearchBundle(arg0, arg1);
				return 0;
			}
			else if (count == 3 && TypeChecker.CheckTypes<UnityEngine.AssetBundle>(L, 3))
			{
				LuaFramework.LuaManager obj = (LuaFramework.LuaManager)ToLua.CheckObject<LuaFramework.LuaManager>(L, 1);
				string arg0 = ToLua.CheckString(L, 2);
				UnityEngine.AssetBundle arg1 = (UnityEngine.AssetBundle)ToLua.ToObject(L, 3);
				obj.AddSearchBundle(arg0, arg1);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L, "invalid arguments to method: LuaFramework.LuaManager.AddSearchBundle");
			}
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int UnloadModule(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			LuaFramework.LuaManager obj = (LuaFramework.LuaManager)ToLua.CheckObject<LuaFramework.LuaManager>(L, 1);
			string arg0 = ToLua.CheckString(L, 2);
			obj.UnloadModule(arg0);
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int op_Equality(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			UnityEngine.Object arg0 = (UnityEngine.Object)ToLua.ToObject(L, 1);
			UnityEngine.Object arg1 = (UnityEngine.Object)ToLua.ToObject(L, 2);
			bool o = arg0 == arg1;
			LuaDLL.lua_pushboolean(L, o);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}
}

