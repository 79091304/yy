package com.ifeng.util;


import com.danga.MemCached.MemCachedClient;
import com.danga.MemCached.SockIOPool;
import java.util.Date;

public class MemCachedManager
{
  protected static MemCachedClient mcc = new MemCachedClient();
  protected static MemCachedManager memCachedManager = new MemCachedManager();

  static
  {
    String[] servers = { "211.151.175.141:12121" };

    SockIOPool pool = SockIOPool.getInstance();

    pool.setServers(servers);

    pool.setFailover(true);
    pool.setInitConn(10);
    pool.setMinConn(5);
    pool.setMaxConn(250);
    pool.setMaintSleep(30L);
    pool.setNagle(false);
    pool.setSocketTO(3000);
    pool.setAliveCheck(true);
    pool.initialize();
  }

  public static MemCachedManager getInstance()
  {
    return memCachedManager;
  }

  public boolean add(String key, Object value)
  {
    return mcc.add(key, value);
  }

  public boolean add(String key, Object value, Date expiry)
  {
    return mcc.add(key, value, expiry);
  }

  public boolean del(String key)
  {
    return mcc.delete(key);
  }

  public boolean replace(String key, Object value)
  {
    return mcc.replace(key, value);
  }

  public boolean clear() {
    mcc.syncAll();
    return mcc.flushAll();
  }

  public boolean replace(String key, Object value, Date expiry)
  {
    return mcc.replace(key, value, expiry);
  }

  public Object get(String key)
  {
    return mcc.get(key);
  }
  
 
}