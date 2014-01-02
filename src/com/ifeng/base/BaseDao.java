package com.ifeng.base;

import java.util.List;

import com.ifeng.util.PageView;

/**
 * 集合持久层的公用的增，删，改，查接口
 * <T> 表示传入实体类
 * @author zhangzhanhui
 * @version 1.0v
 * @param <T>
 */
public interface BaseDao<T> {
	/**
	 * 返回分页后的数据
	 * @param pageView
	 * @param t
	 * @return
	 */
	public List<T> query(PageView pageView,T t);
	/**
	 * 返回所有数据
	 * @param t
	 * @return
	 */
	public List<T> queryAll(T t);
	public int delete(long id);
	public int modify(T t);
	public T getById(long id);
	public int add(T t);
	
}
