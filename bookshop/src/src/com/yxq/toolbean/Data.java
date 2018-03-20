package src.com.yxq.toolbean;

import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.rmi.UnexpectedException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

/**
 * 从数据库中获取数据并用于前台显示
 * 
 * @author xu
 * 
 */
public class Data extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		myData(req, resp);
	}
	
	public void myData(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		Connection con;
		Statement stm;
		ResultSet rst;

		String url = "jdbc:mysql://127.0.0.1/testjdbc?useUnicode=true&characterEncoding=utf-8";
		String usr = "root";
		String pwd = "root";
		
		String bookname = req.getParameter("bookname");
		String k = req.getParameter("kind");
		String from = req.getParameter("from");
		String to = req.getParameter("to");
		
		String sql1="",sql2="",sql3="",subsql="";
		sql1 = "select kind,count(bookname) from booksale where id > 0";
		if(bookname == null || "".equals(bookname)){
			sql2 = "select bookname, sum(saleno) from booksale where id > 0";
		}else{
			sql2 = "select bookname, sum(saleno) from booksale where bookname = '"+ bookname+"'";
		}
		sql3 = "select kind, sum(saleno) from booksale where kind = '"+ k +"'";
		if(from == null || "".equals(from)){
			from = "0";
		}
		if(to == null || "".equals(to)){
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Date now = new Date();
			to = df.format(now);
		}
		subsql = "time >= '" +from+ "' and time <= '"+to+"'";
		sql1 = sql1 + " and " +subsql +" group by kind";
		sql2 = sql2 + " and " +subsql;
		sql3 = sql3 + " and " +subsql;
		System.out.println("sql1:"+sql1);
		System.out.println("sql2:"+sql2);
		System.out.println("sql3:"+sql3);
		try {
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			con = DriverManager.getConnection(url, usr, pwd);
			stm = con.createStatement();
			
			rst = stm.executeQuery(sql1);
			rst.last();
			int size = rst.getRow();
			String[] kind = new String[size];
			int[] value = new int[size];
			String[] bn = new String[2];
			int[] bnv = {0,0};

			rst = stm.executeQuery(sql1);
			int i = 0;
			while (rst.next()) {
				kind[i] = rst.getString(1);
				value[i] = rst.getInt(2);
				i++;
			}
			
			rst = stm.executeQuery(sql2);
			i = 0;
			while (rst.next()) {
				if(bookname != null && !"".equals(bookname)){
					bn[i] = bookname;
				}else{
					bn[i] = "总销量";
				}
				Object obj = rst.getObject(2);
				if(obj != null){
					int j = ((BigDecimal)obj).intValue();
					bnv[i] = j;
				}
				i++;
			}
			
			rst = stm.executeQuery(sql3);
			while (rst.next()) {
				bn[i] = k;
				Object obj = rst.getObject(2);
				if(obj != null){
					int j = ((BigDecimal)obj).intValue();
					bnv[i] = j;
				}
				i++;
			}
			con.close();
			stm.close();

			Map<String, Object> map = new HashMap<String, Object>();
			//整体
			map.put("n", kind);
			map.put("v", value);
			//单本书和单个类别
			map.put("bn", bn);
			map.put("bnv", bnv);
			JSONObject json = JSONObject.fromObject(map);
			resp.setContentType("text/html;charset=UTF-8");
			resp.getWriter().write(json.toString());

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void pData(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		Connection con;
		Statement stm;
		ResultSet rst;

		String[] names = new String[3];
		float[] nums = new float[3];

		String sql1 = "select name,sum(num) from fruit group by fruit.name";
		String url = "jdbc:mysql://127.0.0.1/testjdbc";
		String usr = "root";
		String pwd = "root";

		try {
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			con = DriverManager.getConnection(url, usr, pwd);
			stm = con.createStatement();

			rst = stm.executeQuery(sql1);
			int i = 0;
			while (rst.next()) {
				names[i] = rst.getString(1);
				nums[i] = rst.getFloat(2);
				i++;
			}
			con.close();
			stm.close();

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("n", names);
			map.put("nums", nums);
			JSONObject json = JSONObject.fromObject(map);
			resp.setContentType("text/html;charset=UTF-8");
			resp.getWriter().write(json.toString());

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public Connection getConnection() throws ClassNotFoundException,
			IOException, SQLException {
		Properties properties = new Properties();
		InputStream inStream = Data.class.getClassLoader().getResourceAsStream(
				"jdbc.properties");
		properties.load(inStream);

		String user = properties.getProperty("user");
		String password = properties.getProperty("password");
		String jdbcUrl = properties.getProperty("jdbcUrl");
		String driverClass = properties.getProperty("driverClass");

		Class.forName(driverClass);

		Connection connection = DriverManager.getConnection(jdbcUrl, user,
				password);
		return connection;
	}

}
