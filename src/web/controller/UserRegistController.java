package web.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import web.dao.UserDAO;
import web.util.MyException;
import web.vo.UserVO;

public class UserRegistController implements Controller{
//	private static MemberInsertController instance;
//	
//	private MemberInsertController() {}
//
//	public static MemberInsertController getInstance() {
//		if(instance==null) {
//			instance = new MemberInsertController();
//		}
//		return instance;
//	}
	
	@Override
	public void execute(HttpServletRequest request,HttpServletResponse response) throws MyException, IOException, ServletException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		int age = Integer.parseInt(request.getParameter("age"));
        UserVO userVO = new UserVO(id, password, name, email, age);
        System.out.println(userVO);                    
        
        UserDAO memberDAO = UserDAO.getInstance();
        
        memberDAO.userRegist(userVO);
        
        JSONObject jo=new JSONObject();
        jo.put("msg",name+"님 회원가입 되셨습니다");
        out.append(jo.toString());
	}

}
