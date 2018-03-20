package src.com.yxq.toolbean;

import java.io.IOException;
import java.nio.channels.SeekableByteChannel;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import src.com.yxq.valuebean.Book;

public class CartServlet extends HttpServlet{
	
	public ArrayList goodslist;
	public ArrayList buylist;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if(action != null && !"".equals(action)){
			if(action.equals("buy")){
				buy(request, response);
			}else if(action.equals("clear")){
				clear(request, response);
			}else if(action.equals("remove")){
				remove(request, response);
			}else if(action.equals("pay")){
				pay(request, response);
			}else if(action.equals("search")){
				search(request, response,null);
			}
		}
	}

	public void buy(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String pageNo = request.getParameter("pageNo");
		int id = MyTools.strToint(request.getParameter("id"));
		goodslist = (ArrayList) request.getSession().getAttribute("goodslist");
		buylist = (ArrayList) request.getSession().getAttribute("buylist");
		Book single = new Book();
		for (int i = 0; i < goodslist.size(); i++) {
			Book temp = (Book) goodslist.get(i); 
			if (temp.getId() == id) {
				single = temp;
				if(single.getTempno() == single.getRemain()){
					response.sendRedirect("error.jsp?pageNo="+pageNo);//回显库存为空
					return;
				}
				//((Book) goodslist.get(i)).setTempno(temp.getTempno() + 1);
				break;
			}
		}
		if (single != null) {
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
		response.sendRedirect("page?jumpPage="+pageNo);//回显第几页
	}
	
	public void clear(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String pageNo = request.getParameter("pageNo");
		goodslist = (ArrayList) request.getSession().getAttribute("goodslist");
		for (int i = 0; i < goodslist.size(); i++) {
			Book temp = (Book) goodslist.get(i); 
			temp.setTempno(0);
		}
		buylist = (ArrayList) request.getSession().getAttribute("buylist");
		buylist.clear();
		response.sendRedirect("page?jumpPage="+pageNo);//回显第几页
	}
	
	public void remove(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String pageNo = request.getParameter("pageNo");
		int id = MyTools.strToint(request.getParameter("id"));
		goodslist = (ArrayList) request.getSession().getAttribute("goodslist");
		buylist = (ArrayList) request.getSession().getAttribute("buylist");
		for (int i = 0; i < buylist.size(); i++) { 
			Book temp = (Book) buylist.get(i); 
			if (temp.getId() == id) {
				if (temp.getTempno() > 1) { 
					temp.setTempno(temp.getTempno() - 1); 
					break; 
				} else if (temp.getTempno() == 1) {
					temp.setTempno(0);
					buylist.remove(i); 
				}
			}
		}
//		for (int i = 0; i < goodslist.size(); i++) {
//			Book temp = (Book) goodslist.get(i); 
//			if(temp.getId() == id){
//				temp.setTempno(temp.getTempno() - 1);
//				break;
//			}
//		}
		response.sendRedirect("shopcar.jsp?pageNo="+pageNo);//回到购物车
	}
	
	public void pay(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String pageNo = request.getParameter("pageNo");
		buylist = (ArrayList) request.getSession().getAttribute("buylist");
		Connection conn = null;
		String sql = null;
		try {
			conn = JDBCTools.getConnection();
			Statement st = conn.createStatement();
			for (int i = 0; i < buylist.size(); i++) {
				Book temp = (Book) buylist.get(i);
				int num1 = temp.getRemain() - temp.getTempno();
				int num2 = temp.getSales() + temp.getTempno();
				sql = "update book set remain = " + num1 +", sales = "+ num2 +" where id = " + temp.getId();
				System.out.println(sql);
				st.execute(sql);
				DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
				String now = df.format(new Date());
				String sql2 = "insert into booksale (bookname,kind,time,bookid,saleno) values ('"+temp.getTitle()+"','"+temp.getKind()+"','"+now+"',"+temp.getId()+",'"+temp.getTempno()+"')";
				System.out.println(sql2);
				st.execute(sql2);
			}
			conn.close();
			search(request, response,pageNo);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void search(HttpServletRequest request, HttpServletResponse response,String pageNo)
			throws ServletException, IOException {
		ArrayList goodslist = new ArrayList();
		ArrayList buylist = new ArrayList();
		Connection con;
		Statement stm;
		ResultSet rst;
		ResultSetMetaData rsmd;
		String sql = "select * from book";
		String url = "jdbc:mysql://127.0.0.1/testjdbc";
		String usr = "root";
		String pwd = "root";

		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, usr, pwd);
			stm = con.createStatement();
			rst = stm.executeQuery(sql);
			rsmd = rst.getMetaData();
			int i = 0;
			while (rst.next()) {
				Book single = new Book();
				single.setId(rst.getInt("id"));
				single.setTitle(rst.getString("title"));
				single.setAuthor(rst.getString("author"));
				single.setPrice(rst.getDouble("price"));
				single.setRemain(rst.getInt("remain"));
				single.setSales(rst.getInt("sales"));
				single.setKind(rst.getString("kind"));
				single.setPic(rst.getString("pic"));
				single.setTempno(0);
				goodslist.add(i++, single); 
			}
			con.close();
			stm.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Query Error！");
		}
		request.getSession().setAttribute("goodslist", goodslist);
		request.getSession().setAttribute("buylist", buylist);
		if(pageNo == null || "".equals(pageNo)){
			response.sendRedirect("admin.jsp");//回到admin.jsp
			return; 
		}
		response.sendRedirect("page?jumpPage="+pageNo);//回显第几页
	}
}
