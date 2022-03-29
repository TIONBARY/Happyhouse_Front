package web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import web.dao.UserDAO;
import web.util.MyException;
import web.vo.UserVO;

public class LoginController implements Controller {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws MyException, IOException, ServletException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		UserVO userVO = new UserVO(id, pw);

		UserDAO userDAO = UserDAO.getInstance();
		userVO = userDAO.login(userVO);
		JSONObject jo = new JSONObject();
		if (userVO != null) {
			HttpSession session = request.getSession();
			session.setAttribute("userVO", userVO);
			
			jo.put("name", userVO.getName());
		} else {
			jo.put("msg", "다시 로그인 해주세요");
		}
		out.append(jo.toString());
	}
}