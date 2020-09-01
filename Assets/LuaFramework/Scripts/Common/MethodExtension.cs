using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public static class MethodExtension
{
    public static void SetPositionX(this Transform t, float newX)
    {
        t.position = new Vector3(newX, t.position.y, t.position.z);
    }

    public static void SetPositionY(this Transform t, float newY)
    {
        t.position = new Vector3(t.position.x, newY, t.position.z);
    }

    public static void SetPositionZ(this Transform t, float newZ)
    {
        t.position = new Vector3(t.position.x, t.position.y, newZ);
    }

    public static void SetLocalPositionX(this Transform t, float newX)
    {
        t.localPosition = new Vector3(newX, t.localPosition.y, t.localPosition.z);
    }

    public static void SetLocalPositionY(this Transform t, float newY)
    {
        t.localPosition = new Vector3(t.localPosition.x, newY, t.localPosition.z);
    }

    public static void SetLocalPositionZ(this Transform t, float newZ)
    {
        t.localPosition = new Vector3(t.localPosition.x, t.localPosition.y, newZ);
    }

    /// <summary>
    /// 获取字典的值
    /// </summary>
    /// <typeparam name="TKey">键类型</typeparam>
    /// <typeparam name="TValue">值类型</typeparam>
    /// <param name="dic">当前字典</param>
    /// <param name="key">通过当前键</param>
    /// <returns></returns>
    public static TValue GetValue<TKey, TValue>(this Dictionary<TKey, TValue> dic, TKey key)
    {
        if (dic.ContainsKey(key))
        {
            return dic[key];
        }
        else
        {
            Debug.LogErrorFormat("MethodExtension -> Dictionary: {0}, not find key: {1}", dic.ToString(), key.ToString());
            return default(TValue);
        }
    }
}
