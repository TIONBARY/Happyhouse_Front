package web.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class mainServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		System.out.println("doPost 호출됨");
		String sign = request.getParameter("sign");
		if(sign!=null) {
			System.out.println(sign);
			if(sign.equals("login")) {
				String id = request.getParameter("id");
				String pw = request.getParameter("pw");
				System.out.println(id+" : " + pw);
				
				// db
				
				// 세션 처리
				HttpSession session = request.getSession();
				session.setAttribute("id", id);
				
				out.print("{\"id\":\""+id+"\", \"pw\":\""+pw+"\"}");
//				out.append("{\"id\":\""+id+"\", \"pw\":\""+pw+"\"}");
			} else if(sign.equals("logout")) {
				HttpSession session = request.getSession();
				session.invalidate();
			}
		} else {
			// 침해대응코드(해킹당한것이다.)
			System.out.println("비상 ~!!!"+request.getRemoteAddr());
			
		}
		
	}

}
