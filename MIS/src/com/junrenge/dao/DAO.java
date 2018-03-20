package com.junrenge.dao;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.junrenge.db.JdbcUtils;
import com.junrenge.model.Teacher;

/**
 * 封装了基本的CRUD，供子类继承实现
 * 
 * @author xu 整个DAO采取DBUtil的处理方案
 * @param <T>:当前DAO处理的实体类的具体类型
 */
public abstract class DAO<T> {

	private QueryRunner queryRunner = new QueryRunner();

	private Class<T> clazz;

	public DAO() {
		Type superClass = getClass().getGenericSuperclass();
		if (superClass instanceof ParameterizedType) {
			ParameterizedType parameterizedType = (ParameterizedType) superClass;

			Type[] typeArgs = parameterizedType.getActualTypeArguments();
			if (typeArgs != null && typeArgs.length > 0) {
				if (typeArgs[0] instanceof Class) {
					clazz = (Class<T>) typeArgs[0];
				}
			}

		}

	}

	/**
	 * 返回某一个字段的值
	 * 
	 * @param sql
	 * @param args
	 * @return
	 */
	public <E> E getForValue(String sql, Object... args) {
		java.sql.Connection connection = null;
		try {
			connection = JdbcUtils.getConnection();
			return (E) queryRunner.query(connection, sql, new ScalarHandler(),
					args);
		} catch (Exception e) {
		} finally {
			JdbcUtils.releaseConnection(connection);
		}
		return null;
	}

	/**
	 * 返回T对应的list
	 * 
	 * @param sql
	 * @param args
	 * @return
	 */
	public List<T> getForList(String sql, Object... args) {
		java.sql.Connection connection = null;
		try {
			connection = JdbcUtils.getConnection();
			return queryRunner.query(connection, sql, new BeanListHandler<>(
					clazz), args);
		} catch (Exception e) {
		} finally {
			JdbcUtils.releaseConnection(connection);
		}
		return null;
	}

	/**
	 * 返回对应的T的一个实体类的对象
	 * 
	 * @param sql
	 * @param args
	 * @return
	 */
	public T get(String sql, Object... args) {
		java.sql.Connection connection = null;
		try {
			connection = JdbcUtils.getConnection();
			return queryRunner.query(connection, sql, new BeanHandler<>(clazz),
					args);
		} catch (Exception e) {
		} finally {
			JdbcUtils.releaseConnection(connection);
		}
		System.out.println(clazz);
		return null;
	}

	/**
	 * 封装了insert,delet,update的操作
	 * 
	 * @param sql
	 *            :sql语句
	 * @param args
	 *            :填充sql的占位符
	 */
	public void update(String sql, Object... args) {
		java.sql.Connection connection = null;
		try {
			connection = JdbcUtils.getConnection();
			queryRunner.update(connection, sql, args);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtils.releaseConnection(connection);
		}
	}
	
	public abstract <T> List<T> getAll();
	public abstract void save(T c);
	public abstract void update(T c);
	public abstract T get(Integer id);
	public abstract void delete(Integer id);
}
