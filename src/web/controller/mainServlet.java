package web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

import org.json.JSONObject;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

import web.dao.UserDAO;
import web.util.MyException;
import web.vo.UserVO;

public class mainServlet extends HttpServlet {
	HashMap<String, Controller> map;
	Controller ctrl;
	
	@Override
	public void init() throws ServletException {
		ServletContext application = getServletContext();
		map = (HashMap<String, Controller>) application.getAttribute("map");
		if(map == null) {
			map = new HashMap<>();
			application.setAttribute("map", map);
		}
		
		try {
			SAXParserFactory f = SAXParserFactory.newInstance();
			SAXParser parser = f.newSAXParser();
			parser.parse("C:\\SSAFY\\FrontEnd\\0310_HaapyHouse\\action-servlet.xml", new DefaultHandler() {
				@Override
				public void startElement(String uri, String localName, String qName, Attributes attributes)
						throws SAXException {
					try {
						if(qName.equals("bean")) {
							String id = attributes.getValue("id");
							String clazz = attributes.getValue("class");
							Class clazz2 = Class.forName(clazz);
							Controller value = (Controller)clazz2.newInstance();
							map.put(id, value);
						}
					}catch(Exception e) {
						e.printStackTrace();
					}
				}
			});
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		String sign = request.getParameter("sign");
		if (sign != null) {
			try {
				map.get(sign).execute(request, response);
			} catch (MyException e) {
				JSONObject jo = new JSONObject();
				jo.put("msg", e.getMessage());
				out.append(jo.toString());
			}
		} else {
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		}
	}
}