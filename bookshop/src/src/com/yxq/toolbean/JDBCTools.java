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
	 * 执行 SQL 语句, 使用 PreparedStatement
	 * @param sql
	 * @param args: 填写 SQL 占位符的可变参数
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
	 * 执行 SQL 的方法
	 * 
	 * @param sql: insert, update 或 delete。 而不包含 select
	 */
	public static void update(String sql) {
		Connection connection = null;
		Statement statement = null;

		try {
			// 1. 获取数据库连接
			connection = getConnection();

			// 2. 调用 Connection 对象的 createStatement() 方法获取 Statement 对象
			statement = connection.createStatement();

			// 4. 发送 SQL 语句: 调用 Statement 对象的 executeUpdate(sql) 方法
			statement.executeUpdate(sql);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 5. 关闭数据库资源: 由里向外关闭.
			releaseDB(null, statement, connection);
		}
	}

	/**
	 * 释放数据库资源的方法
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
	 * 获取数据库连接的方法
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
