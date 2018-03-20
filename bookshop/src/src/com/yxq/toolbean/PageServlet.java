package src.com.yxq.toolbean;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PageServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			PageBean page1 = new PageBean();
			PageBean page2 = page1.getResult((String) request
					.getParameter("jumpPage"));

			// ��PageBean���浽request�����С�ע�⣺test3.jsp��jsp:useBean
			// id����Ϊ�ſ���"page2"������
			request.setAttribute("page2", page2);
		} catch (Exception e) {
			e.printStackTrace();
		}

		/**
		 * ����ͼ�ɷ���viewForum.jsp
		 */
		javax.servlet.RequestDispatcher dis = request
				.getRequestDispatcher("test3.jsp");
		dis.forward(request, response);

	}
}
