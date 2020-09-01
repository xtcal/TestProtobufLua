using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using LuaInterface;

[NoToLua]
public class TimeData
{
    public float delayTime;
    public int updateCount;
    public Action cb;
    public LuaFunction luacb;
    public float updateTime;

    public void Init(Action _cb, LuaFunction _luacb, float _delayTime, int _updateCount)
    {
        delayTime = _delayTime;
        updateCount = _updateCount;
        cb = _cb;
        luacb = _luacb;
        updateTime = Time.realtimeSinceStartup;
    }

    public void Clear()
    {
        delayTime = 0;
        updateCount = 0;
        cb = null;
        luacb = null;
        updateTime = 0;
    }

    public static implicit operator bool(TimeData tData)
    {
        return tData != null;
    }
}

public class TimeManager
{
    private static TimeManager instance;

    public static void SetInstance(TimeManager value)
    {
        instance = value;
    }

    public static TimeManager Instance
    {
        get
        {
            if (instance == null)
                instance = new TimeManager();
            return instance;
        }
    }
    private int m_index = 0;
    private Dictionary<int, TimeData> m_timeDatas = new Dictionary<int, TimeData>();
    private Stack<TimeData> m_pools = new Stack<TimeData>();

    /// <summary>
    /// 开启一个事件任务
    /// </summary>
    /// <param name="_cb">事件</param>
    /// <param name="_delayTime">执行间隔</param>
    /// <param name="_updateCount">执行次数</param>
    /// <returns>任务ID</returns>
    [NoToLua]
    public static int Execute(Action _cb, float _delayTime, int _updateCount = -1)
    {
        return Instance.Add(_cb, null, _delayTime, _updateCount);
    }

    public int Add(Action _cb, LuaFunction _luacb, float _delayTime, int _updateCount = -1)
    {
        TimeData _data = null;
        if (m_pools.Count == 0)
        {
            _data = new TimeData();
            _data.Init(_cb, _luacb, _delayTime, _updateCount);
        }
        else
        {
            _data = m_pools.Pop();
            _data.Clear();
            _data.Init(_cb, _luacb, _delayTime, _updateCount);
        }
        m_index++;
        if (m_index > int.MaxValue)
            m_index = int.MinValue;

        TimeData _temp = null;
        m_timeDatas.TryGetValue(m_index, out _temp);
        if (_temp)
        {
            Debug.LogError(string.Format("The same m_index: ({0}) is not deleted", m_index));
        }
        else
        {
            m_timeDatas.Add(m_index, _data);
        }
        return m_index;
    }

    [NoToLua]
    public void UpdateData(int _index, Action _cb, LuaFunction _luacb, float _delayTime, int _updateCount = -1)
    {
        TimeData _temp = null;
        m_timeDatas.TryGetValue(_index, out _temp);
        if (_temp)
        {
            _temp.Init(_cb, _luacb, _delayTime, _updateCount);
        }
        else
        {
            Debug.LogError(string.Format("index:{0} is not in list", _index));
        }
    }

    [NoToLua]
    public void Delete(int _index)
    {
        TimeData _temp = null;
        m_timeDatas.TryGetValue(_index, out _temp);
        if (_temp)
        {
            _temp.Clear();
            m_timeDatas.Remove(_index);
            m_pools.Push(_temp);
        }
    }

    Dictionary<int, TimeData>.Enumerator _tempEnum;
    Queue<int> _deleteQueue = new Queue<int>();
    TimeData _tempData = null;
    [NoToLua]
    public void Update()
    {
        _deleteQueue.Clear();
        _tempEnum = m_timeDatas.GetEnumerator();
        while (_tempEnum.MoveNext())
        {
            _tempData = _tempEnum.Current.Value;

            if (((Time.realtimeSinceStartup - _tempData.updateTime) >= _tempData.delayTime) && (_tempData.updateCount > 0 || _tempData.updateCount == -1))
            {
                _tempData.updateTime = Time.realtimeSinceStartup;
                if (_tempData.updateCount != -1)
                    _tempData.updateCount--;
                if (_tempData.cb != null)
                {
                    _tempData.cb();
                }
                if (_tempData.luacb != null)
                {
                    _tempData.luacb.Call();
                }
            }
            if (_tempData.updateCount == 0)
            {
                _deleteQueue.Enqueue(_tempEnum.Current.Key);
            }
        }
        for (int i = 0; i < _deleteQueue.Count; i++)
        {
            Delete(_deleteQueue.Dequeue());
        }
    }

    [NoToLua]
    public void Clear()
    {
        m_index = 0;
        m_timeDatas.Clear();
        m_pools.Clear();
        _deleteQueue.Clear();
        _tempData = null;
    }
}
