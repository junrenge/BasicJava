package src.com.yxq.toolbean;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import src.com.yxq.valuebean.Book;

public class PageBean {
	private int curPage = 1; //当前是第几页
    private int maxPage; //一共有多少页
    private int maxRowCount; //一共有多少行
    public int rowsPerPage = 3; //每页多少行

    Connection conn;
    public ArrayList goodslist;

    public PageBean() throws Exception {
        this.setPageBean();
    }
    public int getCurPage() {
        return curPage;
    }

    public int getMaxPage() {
        return maxPage;
    }

    public int getMaxRowCount() {
        return maxRowCount;
    }

    public int getRowsPerPage() {
        return rowsPerPage;
    }

    public void setCurPage(int curPage) {
        this.curPage = curPage;
    }

    public void setMaxPage(int maxPage) {
        this.maxPage = maxPage;
    }

    public void setMaxRowCount(int maxRowCount) {
        this.maxRowCount = maxRowCount;
    }

    public void setRowsPerPage(int rowsPerPage) {
        this.rowsPerPage = rowsPerPage;
    }

    //得到要显示于本页的数据
    public PageBean getResult(String page) throws Exception {
        try {
            PageBean pageBean = new PageBean();
            ArrayList list = new ArrayList();
            int pageNum = Integer.parseInt(page);
            Statement stmt = conn.createStatement();
            String strSql = "select * from book limit " +(pageNum-1) * pageBean.rowsPerPage + "," + pageBean.rowsPerPage;
            System.out.println(strSql);
            
            ResultSet rst = stmt.executeQuery(strSql);
            int i = 0;
            while (rst.next()) {
                    //这里要和表的字段对应起来！！！！
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
    			list.add(i, single); 
                i++;
            }
            JDBCTools.releaseDB(rst, stmt, null);
            pageBean.setCurPage(pageNum);
            pageBean.goodslist = list;
            return pageBean;
        } catch (Exception e) {
            e.printStackTrace();
            throw e;

        }
    }
    
    //获取总行数
    public int getAvailableCount() throws Exception {
        int ret = 0;
        conn = JDBCTools.getConnection();
        System.out.println("conn:"+conn);
        Statement stmt = conn.createStatement();
        String strSql = "select * from book";
        ResultSet rset = stmt.executeQuery(strSql);
        while (rset.next()) {
            ret++;
        }
        return ret;
    }
    
    //初始化时对PageBean进行设置
    public void setPageBean() throws Exception {

        //得到总行数
        this.setMaxRowCount(this.getAvailableCount());

        if (this.maxRowCount % this.rowsPerPage == 0) { 
            this.maxPage = this.maxRowCount / this.rowsPerPage;
        } else {
            this.maxPage = this.maxRowCount / this.rowsPerPage + 1;
        }
    }

}
