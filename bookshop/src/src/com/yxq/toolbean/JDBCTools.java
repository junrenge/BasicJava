package src.com.yxq.toolbean;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class JDBCTools {

	/**
	 * ִ�� SQL ���, ʹ�� PreparedStatement
	 * @param sql
	 * @param args: ��д SQL ռλ���Ŀɱ����
	 */
	public static void update(String sql, Object ... args){
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			connection = JDBCTools.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			for(int i = 0; i < args.length; i++){
				preparedStatement.setObject(i + 1, args[i]);
			}
			
			preparedStatement.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			JDBCTools.releaseDB(null, preparedStatement, connection);
		}
	}
	
	/**
	 * ִ�� SQL �ķ���
	 * 
	 * @param sql: insert, update �� delete�� �������� select
	 */
	public static void update(String sql) {
		Connection connection = null;
		Statement statement = null;

		try {
			// 1. ��ȡ���ݿ�����
			connection = getConnection();

			// 2. ���� Connection ����� createStatement() ������ȡ Statement ����
			statement = connection.createStatement();

			// 4. ���� SQL ���: ���� Statement ����� executeUpdate(sql) ����
			statement.executeUpdate(sql);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 5. �ر����ݿ���Դ: ��������ر�.
			releaseDB(null, statement, connection);
		}
	}

	/**
	 * �ͷ����ݿ���Դ�ķ���
	 * 
	 * @param resultSet
	 * @param statement
	 * @param connection
	 */
	public static void releaseDB(ResultSet resultSet, Statement statement,
			Connection connection) {

		if (resultSet != null) {
			try {
				resultSet.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		if (statement != null) {
			try {
				statement.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		if (connection != null) {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}

	/**
	 * ��ȡ���ݿ����ӵķ���
	 */
	public static Connection getConnection() throws IOException,
			ClassNotFoundException, SQLException {
		String url = "jdbc:mysql://127.0.0.1/testjdbc?useUnicode=true&characterEncoding=UTF-8";
		String usr = "root";
		String pwd = "root";
		Connection connection = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(url, usr, pwd);
		}catch(Exception e){
			e.printStackTrace();
		}
		return connection;
	}

}
