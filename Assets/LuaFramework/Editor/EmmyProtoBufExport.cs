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
* Filename: TestProtoBuf
* Created:  2017/12/17 21:05:01
* Author:   HaYaShi ToShiTaKa
* Purpose:  
* ==============================================================================
*/
using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Text.RegularExpressions;
using UnityEngine;

#region class
public class ProBufAPIFiled {
	public readonly string type;
	public readonly string name;
	private readonly static HashSet<string> m_numStrHash = new HashSet<string> {
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
	public ProBufAPIFiled (string lineStr, string pkgName) {
		name = lineStr;

		List<string> strList = SplitLine (lineStr);
		if (strList.Count != 3) {
			Debug.LogError ("格式错误");
			Debug.Log (lineStr);
			return;
		}
		bool isArray = strList[0].Trim () == "repeated";
		string firstType = strList[1].Trim ();
		name = strList[2];
		if (firstType == "string") {
			type = "string";
		} else if (firstType == "bool") {
			type = "boolean";
		} else if (m_numStrHash.Contains (firstType)) {
			type = "number";
		} else {
			var types = firstType.Split ('.');
			if (types.Length == 2) {
				type = firstType;
			} else {
				type = string.Format ("{0}.{1}", pkgName, firstType);
			}
		}

		if (isArray) {
			type += "[]";
		}
	}

	private static List<string> SplitLine (string lineStr) {
		lineStr = lineStr.Trim ();
		List<string> result = new List<string> ();

		int lastIndex = 0;
		for (int i = 0, imax = lineStr.Length; i < imax; i++) {
			char c = lineStr[i];
			if (c == ' ') {
				string str = lineStr.Substring (lastIndex, i - lastIndex + 1);
				if (lastIndex != i) {
					result.Add (str);
				}
				lastIndex = i + 1;
			} else if (i == imax - 1) {
				string str = lineStr.Substring (lastIndex, i - lastIndex + 1);
				result.Add (str);
			}
		}

		return result;
	}
	public override string ToString () {
		return string.Format ("---@field public {0} {1}", name, type);
	}
}

public class ProBufAPIEnum {

	public readonly string className;
	public readonly string packageName;
	public readonly Dictionary<string, int> fieldList = new Dictionary<string, int> ();
	public ProBufAPIEnum (string messageStr, string parent) {
		string[] fieldArray;
		EmmyProtoBufExport.GetClassInfo ("enum", messageStr, parent, out packageName, out className, out fieldArray);
		for (int i = 0; i < fieldArray.Length - 1; i++) {
			var lineStr = fieldArray[i].Split ('=');
			var key = lineStr[0].Trim ();
			try {
				var number = System.Convert.ToInt32 (lineStr[1].Trim ());
				fieldList[key] = number;
			} catch (System.Exception ex) {
				Debug.Log (ex.ToString ());
			}
		}
	}

	public override string ToString () {
		StringBuilder sb = new StringBuilder ();
		string name = string.Format ("{0}.{1}", packageName, className);
		sb.AppendLine (string.Format ("---@class {0}.{1}", packageName, className));
		sb.AppendLine (name + " = " + "{}");
		foreach (var item in fieldList) {
			sb.AppendLine (string.Format ("{0}.{1} = {2}", name, item.Key, item.Value));
		}
		return sb.ToString ();
	}
}
public class ProBufAPI {
	public readonly string className;
	public readonly string packageName;
	public readonly List<ProBufAPIFiled> fieldList = new List<ProBufAPIFiled> ();

	public ProBufAPI (string messageStr, string parent) {
		string[] fieldArray;
		EmmyProtoBufExport.GetClassInfo ("message", messageStr, parent, out packageName, out className, out fieldArray);
		for (int i = 0; i < fieldArray.Length - 1; i++) {
			string lineStr = (fieldArray[i].Split ('=') [0]).Trim ();
			if (string.IsNullOrEmpty (lineStr)) {
				continue;
			}
			ProBufAPIFiled pf = new ProBufAPIFiled (lineStr, packageName);
			fieldList.Add (pf);
		}
	}

	public override string ToString () {
		StringBuilder sb = new StringBuilder ();
		sb.AppendLine (string.Format ("---@class {0}.{1}", packageName, className));
		foreach (var item in fieldList) {
			sb.AppendLine (item.ToString ());
		}
		sb.AppendLine (string.Format ("---@return {1}.{0}\nfunction {1}.{0}() end", className, packageName));
		return sb.ToString ();
	}
}
#endregion

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
	public static void ExportApi (string dirUrl) {
		List<string> strs = new List<string> ();
		StringBuilder sb = new StringBuilder ();
		string[] files = Directory.GetFiles (dirUrl, "*.proto");
		foreach (var path in files) {
			string proBufStr = File.ReadAllText (path, Encoding.UTF8);

			string packageName = Regex.Match (proBufStr, "package.*").Value.Replace ("package", "");
			packageName = Regex.Replace (packageName, "//.*", "").Replace (";", "").Trim ();
			if (packageName == "") {
				packageName = Path.GetFileNameWithoutExtension ("packageName");
			}
			sb = new StringBuilder ();
			sb.AppendLine ("MsgData." + packageName + " = {}");
			sb.AppendLine ("local " + packageName + " = MsgData." + packageName);

			MatchCollection con = Regex.Matches (proBufStr, @"[message|enum].*[\s\S]?.*{.*[\s\S]+?(}+?)");
			foreach (Match item in con) { //每个 { } 块
				Debug.Log (item.Value);
				string[] allLine = item.Value.Split ('\n');
				string firstLine = allLine[0];

				string cName = "";
				bool isClass = false;
				bool isEnum = false;
				if (Regex.IsMatch (firstLine, "message")) { //类
					cName = Regex.Replace (firstLine, "//.*", "").Replace ("message", "").Replace ("{", "").Trim ();
					isClass = true;
				} else if (Regex.IsMatch (firstLine, "enum")) { //枚举
					cName = Regex.Replace (firstLine, "//.*", "").Replace ("enum", "").Replace ("{", "").Trim ();
					isEnum = true;
				}

				string pname = packageName + "." + cName;
				// sb.AppendLine ("---@type " + pname);
				// sb.AppendLine (pname + " = {}");

				for (int i = 0; i < allLine.Length; i++) {
					string temp = allLine[i].Trim ().Replace (";", "");
					string zhushi = Regex.Match (temp, "//.*").Value;
					if (zhushi != "") {
						zhushi = zhushi.Replace ("//", "");
					}
					if (i == 0) {
						sb.AppendLine ("---@class " + pname + " " + zhushi);
						if (isEnum) {
							sb.AppendLine (pname + " = {}");
						}
					} else {
						if (temp.IndexOf ("=") != -1) {
							string[] temps = temp.Split (' ');
							if (isClass) {
								sb.Append ("---@field public " + temps[2] + " ");
								string firstType = temps[1].Trim ();
								if (firstType == "string") {
									sb.Append ("string");
								} else if (firstType == "bool") {
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
								if (zhushi != "") {
									zhushi = "---" + zhushi;
								}
								sb.AppendLine (pname + "." + temps[0] + " = " + Regex.Replace (temps[2], "//.*", "") + zhushi);
							}
						}
					}
				}

				if (isClass) {
					strs.Add (pname);
					sb.AppendLine ("---@return " + pname);
					sb.AppendLine ("function " + pname + "(code)");
					sb.AppendLine ("\t---@type " + pname);
					sb.AppendLine ("\tlocal _new = {}");
					sb.AppendLine ("\t_new._desc = \"" + pname + "\"");
					sb.AppendLine ("\tif code then");
					sb.AppendLine ("\t\t_new = protobuf.decode(\"" + pname + "\", code)");
					sb.AppendLine ("\tend");

					sb.AppendLine ("\tfunction _new.Encode()");
					sb.AppendLine ("\t\t_new.Encode = nil");
					sb.AppendLine ("\t\t_new._desc = nil");
					sb.AppendLine ("\t\treturn protobuf.encode(\"" + pname + "\", _new)");
					sb.AppendLine ("\tend");

					sb.AppendLine ("\treturn _new");
					sb.AppendLine ("end");

					// sb.AppendLine ("function " + pname + "(code)");
					// sb.AppendLine ("\tif code then");
					// sb.AppendLine ("\t\treturn protobuf.decode(\"" + pname + "\", code)");
					// sb.AppendLine ("\tend");
					// sb.AppendLine ("\treturn {}");
					// sb.AppendLine ("end");

					// sb.AppendLine ("function " + pname + ":Encode()");
					// sb.AppendLine ("\treturn protobuf.encode(\"" + pname + "\", self.data)");
					// sb.AppendLine ("end");
				}

				if (isClass || isEnum) {
					sb.AppendLine ("");
				}
			}
			Debug.Log (sb.ToString ());

			File.WriteAllText (dirUrl + "/" + Path.GetFileNameWithoutExtension (path) + "_pb.lua", sb.ToString ());
		}

		sb = new StringBuilder ();
		foreach (var item in strs) {
			sb.AppendLine ("MsgData[\"" + item + "\"] = MsgData." + item);
		}
		File.WriteAllText (dirUrl + "/MsgData_tab.lua", sb.ToString ());
	}
	public static void ExportApi (string inPath, string outPath, string name) {
		string proBufStr = File.ReadAllText (inPath, Encoding.UTF8);
		name += "_pb";
		EmmyProtoBufExport export = new EmmyProtoBufExport (proBufStr, name);
		name += ".lua";
		var path = Path.Combine (outPath, name);
		try {
			if (File.Exists (path)) {
				File.Delete (path);
			}
		} catch (System.Exception ex) {

		}
		FileStream fs = new FileStream (path, FileMode.Create);
		var utf8WithoutBom = new System.Text.UTF8Encoding (false);
		StreamWriter sw = new StreamWriter (fs, utf8WithoutBom);
		sw.Write (export.ToString ());

		//清空缓冲区
		sw.Flush ();
		sw.Close ();
		fs.Close ();
	}
	public override string ToString () {
		StringBuilder sb = new StringBuilder ();

		sb.AppendLine (strPackageName + " = {}");
		sb.AppendLine (string.Format ("{0} = {1}", strFileName, strPackageName));
		for (int i = 0, imax = strList.Count; i < imax; i++) {
			var item = strList[i];
			sb.AppendLine (item.ToString ());
		}
		return sb.ToString ();
	}

	public static void GetClassInfo (string classType, string messageStr, string parent, out string packageName, out string className, out string[] fieldArray) {
		var value = TrimUseless (messageStr);
		className = Regex.Match (value, classType + @"([\s\S]*?)\{").Value.Replace (classType, "");
		className = className.Replace ("{", "");
		className = className.Trim ();
		packageName = parent;
		string fields = Regex.Replace (value, classType + @"([\s\S]*?)\{", "");
		fields = Regex.Replace (fields, @"([\s\S])\}", "").Trim ();
		fieldArray = fields.Split (';');
	}

	#region private
	private readonly List<object> strList = new List<object> ();
	private readonly string strPackageName;
	private readonly string strFileName;
	private EmmyProtoBufExport (string pbStr, string fileName) {
		strFileName = fileName;
		pbStr = TrimUseless (pbStr, out strPackageName);
		//pbStr = Regex.Match(pbStr, @"(?:message)([\s\S])*\}").Value;
		strList.Clear ();
		SplitMessage (pbStr, ref strList, strPackageName);
	}
	private static string TrimUseless (string value, out string strPackageName) {
		var matches = Regex.Matches (value, @"package(?<pkg>.+);");
		strPackageName = matches[0].Groups["pkg"].Value.Trim ();
		//文件声明
		value = Regex.Replace (value, "syntax.+", "");
		value = Regex.Replace (value, "package.+", "");
		value = Regex.Replace (value, "import.+", "");
		value = TrimUseless (value);
		return value;
	}

	public static string TrimUseless (string value) {
		//去注释
		value = Regex.Replace (value, "//.+", "");
		//替换制表符
		value = value.Replace ("\t", " ");
		//去空白行
		value = Regex.Replace (value, @"\n[\s| ]*\r", "");
		return value;
	}
	private static void SplitMessage (string pbStr, ref List<object> result, string parent) {
		int leftTime = 0;
		int rightTime = 0;
		int lastIndex = 0;
		for (int i = 0, imax = pbStr.Length; i < imax; i++) {
			char c = pbStr[i];
			if (c == '{') {
				leftTime++;
			}
			if (c == '}') {
				rightTime++;
			}
			if (leftTime == 0) continue;
			if (rightTime == 0) continue;
			if (leftTime == rightTime) {
				string msgStr = pbStr.Substring (lastIndex, i - lastIndex + 1);
				// Debug.Log("msgStr == " + msgStr);
				if (msgStr.IndexOf ("enum") >= 0) {
					ProBufAPIEnum api = new ProBufAPIEnum (msgStr, parent);
					result.Add (api);
				} else if (msgStr.IndexOf ("message") >= 0) {
					if (leftTime > 1) {
						string p;
						string selfContent = null;
						msgStr = TrimMessage (msgStr, out p, out selfContent);
						if (!string.IsNullOrEmpty (parent)) {
							p = parent + "." + p;
						}
						SplitMessage (msgStr, ref result, p);
						if (!string.IsNullOrEmpty (selfContent)) {
							result.Add (new ProBufAPI (selfContent, parent));
						}
					} else {
						ProBufAPI api = new ProBufAPI (msgStr, parent);
						result.Add (api);
					}
				}

				lastIndex = i + 1;
				leftTime = 0;
				rightTime = 0;
			}
		}
	}
	private static string TrimMessage (string pbStr, out string parent, out string selfContent) {
		string result = "";
		parent = "";
		selfContent = null;
		string[] strList = pbStr.Split ("{".ToCharArray (), 2);
		if (strList.Length == 2) {
			result = strList[1].TrimEnd ('}').Trim ();
			parent = (strList[0].Replace ("message", "")).Trim ();
		} else {
			result = pbStr;
		}
		string trimResult = Regex.Match (result, @"message([\s\S]*)\}").Value;
		if (trimResult != result) {
			selfContent = pbStr.Replace (trimResult, "");
			result = trimResult;
		}

		return result;
	}
	#endregion
}