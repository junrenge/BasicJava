package com.junrenge.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EncodeFilter extends HttpFilter{

	public void doFilter(HttpServletRequest req, HttpServletResponse resp,
			FilterChain chain) throws IOException, ServletException {
		
		req.setCharacterEncoding("gb2312");
		chain.doFilter(req, resp);
	}

}
