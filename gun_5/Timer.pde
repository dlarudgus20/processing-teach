class Timer
{
  float deciTime;
  int nowTime;
  
  class Record
  {
    int index;
    int freq, fireTime;
    boolean enabled;
  }
  ArrayList<Record> recordList;

  Timer()
  {
    deciTime = 0;
    nowTime = 0;
    recordList = new ArrayList<Record>();
  }
  
  int update(float timespan)
  {
    if (recordList.size() != 0)
    {
      deciTime += timespan;

      int dt = (int)deciTime;
      nowTime += dt;
      deciTime -= dt;

      for (int i = 0; i < recordList.size(); i++)
      {
        Record r = recordList.get(i);
        if (r.enabled && r.fireTime <= nowTime)
        {
          r.fireTime += r.freq;
          return r.index;
        }
      }
    }
    return -1;
  }
  
  boolean addTimer(int index, int freq, boolean enabled)
  {
    for (int i = 0; i < recordList.size(); i++)
    {
      if (recordList.get(i).index == index)
      {
        return false;
      }
    }

    Record r = new Record();
    r.index = index;
    r.freq = freq;
    if (enabled)
      r.fireTime = nowTime + freq;
    else
      r.fireTime = freq;
    r.enabled = enabled;
    recordList.add(recordList.size(), r);
    return true;
  }
  
  boolean removeTimer(int index)
  {
    for (int i = 0; i < recordList.size(); i++)
    {
      if (recordList.get(i).index == index)
      {
        recordList.remove(i);
        return true;
      }
    }
    
    return false;
  }
  
  boolean updateTimer(int index, int freq)
  {
    for (int i = 0; i < recordList.size(); i++)
    {
      Record r = recordList.get(i);
      if (r.index == index)
      {
        r.fireTime = max(r.fireTime - r.freq + freq, nowTime);
        r.freq = freq;
        return true;
      }
    }
    
    return false;
  }
  
  boolean enableTimer(int index, boolean enabled, boolean reset)
  {
    for (int i = 0; i < recordList.size(); i++)
    {
      Record r = recordList.get(i);
      if (r.index == index)
      {
        if (r.enabled != enabled)
        {
          r.enabled = enabled;
          if (enabled)
          {
            // enable timer
            // reset parameter is ignored
            r.fireTime += nowTime;
          }
          else
          {
            // disable timer
            if (!reset)
              r.fireTime -= nowTime;
            else
              r.fireTime = r.freq;
          }
          return true;
        }
        else
        {
          return false;
        }
      }
    }
    
    return false;
  }
}
