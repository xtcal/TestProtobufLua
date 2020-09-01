using System.Net;
using System.Net.Sockets;
using System.Text;
using System.Threading;
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

		GetRoomList ();
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
		ReceiveThread.Abort ();
		ReceiveThread = null;
		Client.Close ();
		Client = null;
	}
	public static void SendMsg (string str, EndPoint ip = null) {
		if (ip == null)
			ip = ServerPoint;
		byte[] data = Encoding.UTF8.GetBytes (str);
		Client.SetSocketOption (SocketOptionLevel.Socket, SocketOptionName.Broadcast, 1);
		Client.SendTo (data, ip);
		var _data = new {
			ip = ip.ToString (),
				str = str
		};
		Debug.Log ("c-s:" + LitJson.JsonMapper.ToJson (_data));
	}
	public static void SendMsg (byte[] data, EndPoint ip = null) {
		if (ip == null)
			ip = ServerPoint;
		Client.SetSocketOption (SocketOptionLevel.Socket, SocketOptionName.Broadcast, 1);
		Client.SendTo (data, ip);
	}

	public static void GetRoomList () {
		var a = new IPEndPoint (IPAddress.Broadcast, 2333);
		SendMsg ("RequestServer", a);
	}
}