package src.com.yxq.toolbean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import org.apache.catalina.connector.Request;

import src.com.yxq.valuebean.Book;
import src.com.yxq.valuebean.Book;

public class ShopCar {
	private ArrayList buylist = new ArrayList(); // 用来存储购买的商品

	public ArrayList getBuylist() {
		return buylist;
	}

	private Book s = new Book(); 
	public Book getBook() {
		return s;
	}

	/**
	 * @功能 向购物车中添加商品
	 */
	public void addItem(Book single) {
		if (single != null) {
//			single.setRemain(single.getRemain() - 1);
			if (buylist.size() == 0) {
				single.setTempno(single.getTempno() + 1);
				buylist.add(single); 
			} else { 
				int i = 0;
				for (; i < buylist.size(); i++) { 
					Book temp = (Book) buylist.get(i); 
					if (temp.getId() == single.getId()) {
						temp.setTempno(temp.getTempno() + 1); 
						break; 
					}
				}
				if (i >= buylist.size()) {
					single.setTempno(single.getTempno() + 1);
					buylist.add(single);
				}
			}
		}
	}

	/**
	 * @功能 从购物车中移除指定名称的商品
	 */
	public void removeItem(int id) {
		for (int i = 0; i < buylist.size(); i++) { 
			Book temp = (Book) buylist.get(i); 
			if (temp.getId() == id) {
//				temp.setRemain(temp.getRemain() + 1);
				if (temp.getTempno() > 1) { 
					temp.setTempno(temp.getTempno() - 1);; 
					break; 
				} else if (temp.getTempno() == 1) {
					temp.setTempno(0);
					buylist.remove(i); 
				}
			}
		}
	}

	/**
	 * @功能 清空购物车
	 */
	public void clearCar() {
		buylist.clear(); 
	}

	public void payCar() throws ClassNotFoundException {
		Connection con = null;
		Statement stm = null;
		String sql = null;
		String url = "jdbc:mysql://127.0.0.1/testjdbc";
		String usr = "root";
		String pwd = "root";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, usr, pwd);
			stm = con.createStatement();
			for (int i = 0; i < buylist.size(); i++) {
				Book temp = (Book) buylist.get(i);
				int num1 = temp.getRemain();
				int num2 = temp.getSales() + temp.getTempno();
				sql = "update book set remain = " + num1 +", sales = "+ num2 +" where id = " + temp.getId();
				System.out.println(sql);
				stm.execute(sql);
			}

		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		buylist.clear(); 
	}

	/**
	 * 管理员修改已经有的商品
	 */
//	public void edit() throws ClassNotFoundException {
//		Connection con = null;
//		Statement stm = null;
//		String sql = null;
//		String url = "jdbc:mysql://127.0.0.1/testjdbc";
//		String usr = "root";
//		String pwd = "root";
//
//		try {
//			Class.forName("com.mysql.jdbc.Driver");
//			con = DriverManager.getConnection(url, usr, pwd);
//			stm = con.createStatement();
//			String name = s.getName();
//			for (int i = 0; i < buylist.size(); i++) {
//				Book temp = (Book) buylist.get(i);
//				if (temp.getName().equals(MyTools.toChinese(name))) { // 仓库中有此商品所以是update
//					sql = "update goods set remiannum = " + s.getRemiannum()
//							+ "where name = '" + temp.getName() + "'";
//				} else {// 仓库中有此商品所以是insert
//					sql = "insert into goods values ('"+s.getName()+"',"+s.getPrice()+","+s.getRemiannum()+")";
//				}
//				System.out.println(sql);
//				stm.execute(sql);
//			}
//		} catch (SQLException e1) {
//			e1.printStackTrace();
//		}
//	}
}