using System;
using System.IO;
using System.Net;
using System.Net.Sockets;
using System.Text;
using System.Threading;
using LuaInterface;
using UnityEngine;

public class UDPClient : MonoBehaviour {
	private void Start () {
		Init ();
	}
	public static IPEndPoint ServerPoint { get; set; }
	public static Thread ReceiveThread { get; set; }
	public static Socket Client { get; set; }
	public static void Init () {
		Client = new Socket (AddressFamily.InterNetwork, SocketType.Dgram, ProtocolType.Udp);
		IPEndPoint point = new IPEndPoint (IPAddress.Any, 0);
		Client.Bind (point);
		ReceiveThread = new Thread (ReceiveMessage);
		ReceiveThread.Start ();
	}

	private void OnDestroy () {
		UnInit ();
	}

	private void OnApplicationQuit () {
		UnInit ();
	}

	private static void ReceiveMessage () {
		byte[] byt = new byte[1024];
		while (true) {
			EndPoint receivePoint = new IPEndPoint (IPAddress.Any, 0);
			int length = Client.ReceiveFrom (byt, ref receivePoint);
			string str = Encoding.UTF8.GetString (byt, 0, length);
			var data = new {
				ip = receivePoint.ToString (),
					str = str
			};
			Debug.Log ("s-c:" + LitJson.JsonMapper.ToJson (data));
			ServerPoint = (IPEndPoint) receivePoint;
		}
	}

	public static void UnInit () {
		if (ReceiveThread != null) {
			ReceiveThread.Abort ();
			ReceiveThread = null;
		}
		if (Client != null) {
			Client.Close ();
			Client = null;
		}
	}
	public static void SendMsg (string str, EndPoint ip = null) {
		if (ip == null) {
			ip = new IPEndPoint (IPAddress.Broadcast, 2333);
		}
		byte[] data = Encoding.UTF8.GetBytes (str);
		Client.SetSocketOption (SocketOptionLevel.Socket, SocketOptionName.Broadcast, 1);
		Client.SendTo (data, ip);
		var _data = new {
			ip = ip.ToString (),
				str = str
		};
		Debug.Log ("c-s:" + LitJson.JsonMapper.ToJson (_data));
	}
	public static void SendMsg (string name, byte[] data, EndPoint ip = null) {
		if (ip == null)
			ip = new IPEndPoint (IPAddress.Broadcast, 2333);
		Client.SetSocketOption (SocketOptionLevel.Socket, SocketOptionName.Broadcast, 1);
		Client.SendTo (data, ip);
	}

	public static void SendMsg (byte[] data, EndPoint ip = null) {
		var cs = DeSerialize<protoLoginUser.CS_LoginUser> (data);
		Debug.Log (LitJson.JsonMapper.ToJson (data));
	}
	public static string GetData () {
		var user = new protoLoginUser.CS_LoginUser ();
		user.uid = "1";
		user.userName = "2";
		user.passWord = "1";
		var data = Serialize (user);
		var ret = System.Text.Encoding.UTF8.GetString (data);
		return ret;
	}
	public static byte[] StringConvertToBytes (string _str, string _codeing = "utf-8") {
		Encoding codeing = System.Text.Encoding.GetEncoding (_codeing);
		return codeing.GetBytes (_str);
	}
	///字节数组转字符
	public static string BytesConvertToString (byte[] bytes, string _codeing = "utf-8") {
		Encoding codeing = System.Text.Encoding.GetEncoding (_codeing);
		return codeing.GetString (bytes);
	}

	public static void ShowData (byte[] data) {
		Debug.Log (LitJson.JsonMapper.ToJson (data));
	}

	public static void GetRoomList () {
		var a = new IPEndPoint (IPAddress.Broadcast, 2333);
		SendMsg ("RequestServer", a);
	}

	// 将消息序列化为二进制的方法
	// < param name="model">要序列化的对象< /param>
	public static byte[] Serialize<T> (T model) {
		try {
			//涉及格式转换，需要用到流，将二进制序列化到流中
			using (MemoryStream ms = new MemoryStream ()) {
				//使用ProtoBuf工具的序列化方法
				ProtoBuf.Serializer.Serialize<T> (ms, model);
				//定义二级制数组，保存序列化后的结果
				Debug.Log ("ms.Length==" + ms.Length);
				byte[] result = new byte[ms.Length];
				//将流的位置设为0，起始点
				ms.Position = 0;
				//将流中的内容读取到二进制数组中
				ms.Read (result, 0, result.Length);
				return result;
			}
		} catch (Exception ex) {
			Debug.Log ("序列化失败: " + ex.ToString ());
			return null;
		}
	}

	// 将收到的消息反序列化成对象
	// < returns>The serialize.< /returns>
	// < param name="msg">收到的消息.</param>
	public static T DeSerialize<T> (byte[] msg) {
		try {
			using (MemoryStream ms = new MemoryStream ()) {
				//将消息写入流中
				ms.Write (msg, 0, msg.Length);
				//将流的位置归0
				ms.Position = 0;
				//使用工具反序列化对象
				T result = ProtoBuf.Serializer.Deserialize<T> (ms);
				return result;
			}
		} catch (Exception ex) {
			Debug.Log ("反序列化失败: " + ex.ToString ());
			return default (T);
		}
	}

}