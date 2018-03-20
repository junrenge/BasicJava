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
 * ��װ�˻�����CRUD��������̳�ʵ��
 * 
 * @author xu ����DAO��ȡDBUtil�Ĵ�����
 * @param <T>:��ǰDAO�����ʵ����ľ�������
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
	 * ����ĳһ���ֶε�ֵ
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
	 * ����T��Ӧ��list
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
	 * ���ض�Ӧ��T��һ��ʵ����Ķ���
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
	 * ��װ��insert,delet,update�Ĳ���
	 * 
	 * @param sql
	 *            :sql���
	 * @param args
	 *            :���sql��ռλ��
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
