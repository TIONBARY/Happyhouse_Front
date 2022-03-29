package web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import web.util.MyException;
import web.vo.UserVO;

public class UserDAO {
	DataSource ds;
	private static UserDAO instance;
	
	public static UserDAO getInstance() {
		if(instance==null) {
			instance = new UserDAO();
		}
		return instance;
	}

	private UserDAO() {
		try {
			Context ic = new InitialContext();
			Context ic2 = (Context)ic.lookup("java:comp/env");
			ds = (DataSource)ic2.lookup("pjtDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	public void userRegist(UserVO userVO) throws MyException{
		try(Connection con = ds.getConnection()){
			String sql = "insert into user(id, pw, email, name, age) values(?, ?, ?, ?, ?)";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, userVO.getId());
			stmt.setString(2, userVO.getPw());
			stmt.setString(3, userVO.getEmail());
			stmt.setString(4, userVO.getName());
			stmt.setInt(5, userVO.getAge());
			
			int i = stmt.executeUpdate();
			System.out.println(i+"행이 insert되었습니다. ");
		} catch(Exception e) {
			e.printStackTrace();
			throw new MyException("회원가입 실패");
		}

	}

	public UserVO login(UserVO userVO) throws MyException{
		try(Connection con = ds.getConnection()){
			String sql = "select name from user where id=? and pw=? ";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, userVO.getId());
			stmt.setString(2, userVO.getPw());
			
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) {
				userVO.setName(rs.getString("name"));
				return userVO;
			}
			return null;
		} catch(Exception e) {
			e.printStackTrace();
			throw new MyException("login 실패");
		}
	}
	
	public UserVO userInfo(String name) throws MyException{
		try(Connection con = ds.getConnection()){
			UserVO userVO = new UserVO();
			String sql = "select id, pw, email, name, age from user where name=?";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, name);
			
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) {
				userVO.setId(rs.getString("id"));
				userVO.setPw(rs.getString("pw"));
				userVO.setEmail(rs.getString("email"));
				userVO.setName(rs.getString("name"));
				userVO.setAge(Integer.parseInt(rs.getString("age")));
				System.out.println(userVO);
				return userVO;
			}
			return null;
		} catch(Exception e) {
			e.printStackTrace();
			throw new MyException("login 실패");
		}
	}
}