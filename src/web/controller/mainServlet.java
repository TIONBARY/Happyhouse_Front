package web.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.dao.UserDAO;
import web.util.MyException;
import web.vo.UserVO;

public class mainServlet extends HttpServlet {
	UserDAO userDAO;
	
	@Override
	public void init() throws ServletException {
		userDAO = UserDAO.getInstance();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		String sign = request.getParameter("sign");
		if (sign != null) {
			if(sign.equals("login")) {
				String id = request.getParameter("id");
				String pw = request.getParameter("pw");
				try {
					UserVO userVO = new UserVO(id, pw);
					userDAO = UserDAO.getInstance();
					userVO = userDAO.login(userVO);
					if(userVO != null) {
						HttpSession session = request.getSession();
						session.setAttribute("login_user", userVO);
						out.append("ok");
					}else out.append("fail");
				} catch (MyException e) {
					out.append(e.getMessage());
					e.printStackTrace();
				}
			}else if(sign.equals("regist")) {
				String id = request.getParameter("id");
				String password = request.getParameter("password");
				String name = request.getParameter("name");
				String email = request.getParameter("email");
				int age = Integer.parseInt(request.getParameter("age"));
				try {
					UserVO userVO = new UserVO(id, password, name, email, age);
					userDAO = UserDAO.getInstance();
					userDAO.userRegist(userVO);
					
					out.append("ok");
				} catch (MyException e) {
					out.append(e.getMessage());
					e.printStackTrace();
				}
			}else if(sign.equals("logout")) {
				
			}else if(sign.equals("userinfo")) {
				String id = request.getParameter("id");
				try {
					userDAO = UserDAO.getInstance();
					UserVO userVO = userDAO.userInfo(id);
					if(userVO!=null) {
						HttpSession session = request.getSession();
						session.setAttribute("userid", userVO.getId());
						session.setAttribute("userpw", userVO.getPw());
						session.setAttribute("useremail", userVO.getEmail());
						session.setAttribute("username", userVO.getName());
						session.setAttribute("userage", userVO.getAge()+"");
						RequestDispatcher disp = request.getRequestDispatcher("user_info.jsp");
						disp.forward(request, response);
					}
				} catch (MyException e) {
					e.printStackTrace();
				}
			}
		} else {
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		}
	}
}
