package web.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.util.MyException;

public interface Controller {
	
	public void execute(HttpServletRequest request , HttpServletResponse response) throws MyException, IOException, ServletException ;

}
