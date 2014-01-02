package com.ifeng.util;

import java.util.Date;

import com.danga.MemCached.MemCachedClient;
import com.danga.MemCached.SockIOPool;
/**
 * @author gaoxs
 */
public class MemCachedManager1 {
	// 创建全局的唯�?���? 
	protected static MemCachedClient mcc = new MemCachedClient();
	protected static MemCachedManager1 memCachedManager = new MemCachedManager1();
	
	// 设置与缓存服务器的连接池
	static {  
		// 服务器列表和其权�? 
		//String[] servers = { "192.168.181.101:11211" };
	
		// public  static String ip="10.51.0.58:2121" 电信机房Memcache

		String[] servers = { "211.151.175.141:12121" };
		//Integer[] weights = { 3 };  
		
		// 获取socke连接池的实例对象  
		SockIOPool pool = SockIOPool.getInstance();  
		
		pool.setServers( servers );
		//pool.setWeights(weights);
		pool.setFailover( true );
		pool.setInitConn( 10 ); 
		pool.setMinConn( 5 );
		pool.setMaxConn( 250 );
		pool.setMaintSleep( 30 );
		pool.setNagle( false );
		pool.setSocketTO( 3000 );
		pool.setAliveCheck( true );
		pool.initialize();
	}
	
	/** 
	 * 保护型构造方法，不允许实例化�?*/  
	protected MemCachedManager1() { }
	
	/** 
	 * 获取唯一实例 */  
	public static MemCachedManager1 getInstance() 
	{  
		return memCachedManager;  
	}
	
	/** 
	 * 添加�?��指定的�?到缓存中. 
	 * @param key 
	 * @param value 
	 * @return */  
	public boolean add(String key, Object value)
	{  
		return mcc.add(key, value);  
	} 
	
	//添加时如果系统中有相同的KEY 则不进行替换要用REPLACE方法
	public boolean add(String key, Object value, Date expiry)
	{  
		return mcc.add(key, value, expiry);  
	}  
	//删除�?再去取这个KEY 则返回NULL
	public boolean del(String key)
	{
		return mcc.delete(key);
	}
	//用来替换值不用此方法不会改变Cache当中的�?
	public boolean replace(String key, Object value) 
	{  
		return mcc.replace(key, value);  
	}
	public boolean clear()
	{
		 mcc.syncAll();
		return mcc.flushAll();
	}
	
	public boolean replace(String key, Object value, Date expiry)
	{  
		return mcc.replace(key, value, expiry);  
	}
	
	/** 
	 * 根据指定的关键字获取对象. 
	 * @param key 
	 * @return */  
	public Object get(String key)
	{  
		return mcc.get(key);  
	}
	
	
}