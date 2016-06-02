package model;

import java.sql.Timestamp;

import util.JDBC;

public class Contact 
{
	private int id;
	private String name;
	private String email;
	private Timestamp time;
	private String message;
	
	public static int add(String name, String email, String message)
	{
		String sql="insert into contact(name, email, message) values('"+
				name+"','"+email+"','"+message+"')";
		int result=JDBC.update(sql);
		
		JDBC.close();
		
		return result;
	}
	
}
