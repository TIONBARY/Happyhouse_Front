package web.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.dao.UserDAO;
import web.util.MyException;
import web.vo.UserVO;

public class UserInfoController implements Controller{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws MyException, IOException, ServletException {
		String name = request.getParameter("name");
		try {
			UserDAO userDAO = UserDAO.getInstance();
			UserVO userVO = userDAO.userInfo(name);
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
}