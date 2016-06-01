package model;

import util.JDBC;

public class contact 
{
	private int id;
	private String name;
	private String email;
	private long time;
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
