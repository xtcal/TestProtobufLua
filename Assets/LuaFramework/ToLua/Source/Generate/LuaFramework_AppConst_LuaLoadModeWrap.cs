﻿//this source code was auto-generated by tolua#, do not modify it
using System;
using LuaInterface;

public class LuaFramework_AppConst_LuaLoadModeWrap
{
	public static void Register(LuaState L)
	{
		L.BeginEnum(typeof(LuaFramework.AppConst.LuaLoadMode));
		L.RegVar("ToFile", get_ToFile, null);
		L.RegVar("ToAb", get_ToAb, null);
		L.RegFunction("IntToEnum", IntToEnum);
		L.EndEnum();
		TypeTraits<LuaFramework.AppConst.LuaLoadMode>.Check = CheckType;
		StackTraits<LuaFramework.AppConst.LuaLoadMode>.Push = Push;
	}

	static void Push(IntPtr L, LuaFramework.AppConst.LuaLoadMode arg)
	{
		ToLua.Push(L, arg);
	}

	static bool CheckType(IntPtr L, int pos)
	{
		return TypeChecker.CheckEnumType(typeof(LuaFramework.AppConst.LuaLoadMode), L, pos);
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_ToFile(IntPtr L)
	{
		ToLua.Push(L, LuaFramework.AppConst.LuaLoadMode.ToFile);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_ToAb(IntPtr L)
	{
		ToLua.Push(L, LuaFramework.AppConst.LuaLoadMode.ToAb);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int IntToEnum(IntPtr L)
	{
		int arg0 = (int)LuaDLL.lua_tonumber(L, 1);
		LuaFramework.AppConst.LuaLoadMode o = (LuaFramework.AppConst.LuaLoadMode)arg0;
		ToLua.Push(L, o);
		return 1;
	}
}
