/*
               #########                       
              ############                     
              #############                    
             ##  ###########                   
            ###  ###### #####                  
            ### #######   ####                 
           ###  ########## ####                
          ####  ########### ####               
         ####   ###########  #####             
        #####   ### ########   #####           
       #####   ###   ########   ######         
      ######   ###  ###########   ######       
     ######   #### ##############  ######      
    #######  #####################  ######     
    #######  ######################  ######    
   #######  ###### #################  ######   
   #######  ###### ###### #########   ######   
   #######    ##  ######   ######     ######   
   #######        ######    #####     #####    
    ######        #####     #####     ####     
     #####        ####      #####     ###      
      #####       ###        ###      #        
        ###       ###        ###               
         ##       ###        ###               
__________#_______####_______####______________

                我们的未来没有BUG              
* ==============================================================================
* Filename: zx edit 正则实现 for TestProtoBuf
* Created:  2020年12月7日15:00:17 edit for 2017/12/17 21:05:01
* Author:  zx edit for HaYaShi ToShiTaKa
* Purpose:  
* ==============================================================================
*/
using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Text.RegularExpressions;
using UnityEditor;
using UnityEngine;

public class EmmyProtoBufExport {
	static List<string> has = new List<string> {
		"double",
		"float",
		"int32",
		"uin32",
		"uint32",
		"int64",
		"uint64",
		"sint32",
		"sing64",
		"fixed32",
		"fixed64",
		"sfixed32",
		"sfixed64",
	};

	[MenuItem ("Tools/Build protobuf Lua", false, 100)]
	public static void BuildiPhoneResource () {
		EmmyProtoBufExport.ExportApi ();
	}
	static string protoUrl = Application.dataPath + "/ab/files/proto";
	static string luaUrl = Application.dataPath + "/ab/lua/testPbc";
	public static void ExportApi () {
		string[] files = Directory.GetFiles (protoUrl, "*.proto");
		StringBuilder sb = new StringBuilder ();
		foreach (var filePath in files) {
			sb = new StringBuilder ();
			string proBufStr = File.ReadAllText (filePath, Encoding.UTF8);

			string packageName = Regex.Match (proBufStr, "package.*").Value.Replace ("package", "").Replace (";", "").Trim ();;
			packageName = Regex.Replace (packageName, "//.*", ""); // 去掉注释
			if (packageName.Equals (string.Empty)) {
				packageName = Path.GetFileNameWithoutExtension (filePath); //找不到package就用文件名
			}
			sb.AppendLine ("MsgData." + packageName + " = {");

			MatchCollection con = Regex.Matches (proBufStr, @"[message|enum].*[\s\S]?.*{.*[\s\S]+?(}+?)");
			foreach (Match item in con) { //每个 { } 块

				// Debug.Log (item.Value);

				string[] allLine = item.Value.Split ('\n');
				string firstLine = allLine[0];

				string mName = "";
				bool isClass = false;
				bool isEnum = false;
				if (Regex.IsMatch (firstLine, "message")) { //class
					mName = Regex.Replace (firstLine, "//.*", "").Replace ("message", "").Replace ("{", "").Trim ();
					isClass = true;
				} else if (Regex.IsMatch (firstLine, "enum")) { //enum
					mName = Regex.Replace (firstLine, "//.*", "").Replace ("enum", "").Replace ("{", "").Trim ();
					isEnum = true;
				}

				string pName = packageName + "." + mName;

				for (int i = 0; i < allLine.Length; i++) {
					string temp = allLine[i].Trim ().Replace (";", "");

					// Debug.Log ("one line =" + temp);

					if (isEnum && temp.Equals ("}")) { //到语句块结尾了
						sb.AppendLine ("\t},");
						continue;
					}

					string zhushi = Regex.Match (temp, "//.*").Value;
					if (zhushi != "") {
						zhushi = zhushi.Replace ("//", "");
					}
					if (i == 0) {
						sb.AppendLine ("\t---@class " + pName + " " + zhushi);
						if (isEnum) {
							sb.AppendLine ("\t" + mName + " = {");
						}
					} else {
						if (temp.IndexOf ("=") != -1) {
							string[] temps = temp.Split (' ');
							if (isClass) {
								sb.Append ("\t---@field public " + temps[2] + " ");
								string firstType = temps[1].Trim ();
								if (firstType.Equals ("string")) {
									sb.Append ("string");
								} else if (firstType.Equals ("bool")) {
									sb.Append ("boolean");
								} else if (has.Contains (firstType)) {
									sb.Append ("number");
								} else if (firstType.IndexOf (".") != -1) {
									sb.Append (firstType);
								} else {
									sb.Append (packageName + "." + firstType);
								}

								if (temps[0].Equals ("repeated")) {
									sb.Append ("[] " + zhushi);
								} else {
									sb.Append (" " + zhushi);
								}
								sb.AppendLine ();
							} else if (isEnum) {
								if (!zhushi.Equals (string.Empty)) {
									zhushi = "---" + zhushi;
									sb.AppendLine ("\t\t" + zhushi);
								}
								sb.AppendLine ("\t\t" + temps[0] + " = " + Regex.Replace (temps[2], "//.*", "") + ",");
							}
						}
					}
				}

				if (isClass) {
					sb.AppendLine ("\t---@return " + pName);
					sb.AppendLine ("\t" + mName + " = function(code)");
					sb.AppendLine ("\t\treturn MsgData.GenData(\"" + pName + "\", code)");
					sb.AppendLine ("\tend,");
				}

				if (isClass || isEnum) {
					sb.AppendLine ("");
				}
			}

			sb.Append ("}");
			Debug.LogWarning (sb.ToString ());
			File.WriteAllText (luaUrl + "/lua/" + Path.GetFileNameWithoutExtension (filePath) + "_pb.lua", sb.ToString ());
		}

		sb = new StringBuilder ();
		sb.AppendLine ("return {");
		foreach (var item in files) {
			sb.AppendLine ("\t\"" + Path.GetFileNameWithoutExtension (item) + "\",");
		}
		sb.AppendLine ("}");
		File.WriteAllText (luaUrl + "/allPb.lua", sb.ToString ());
	}
}