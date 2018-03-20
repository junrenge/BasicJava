package src.com.yxq.toolbean;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import src.com.yxq.valuebean.Book;

public class PageBean {
	private int curPage = 1; //��ǰ�ǵڼ�ҳ
    private int maxPage; //һ���ж���ҳ
    private int maxRowCount; //һ���ж�����
    public int rowsPerPage = 3; //ÿҳ������

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

    //�õ�Ҫ��ʾ�ڱ�ҳ������
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
                    //����Ҫ�ͱ���ֶζ�Ӧ������������
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
    
    //��ȡ������
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
    
    //��ʼ��ʱ��PageBean��������
    public void setPageBean() throws Exception {

        //�õ�������
        this.setMaxRowCount(this.getAvailableCount());

        if (this.maxRowCount % this.rowsPerPage == 0) { 
            this.maxPage = this.maxRowCount / this.rowsPerPage;
        } else {
            this.maxPage = this.maxRowCount / this.rowsPerPage + 1;
        }
    }

}
