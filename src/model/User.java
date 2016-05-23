package model;

import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.jsp.tagext.TryCatchFinally;

import util.JDBC;

public class User 
{
	private int id;
	private String name;
	private String email;
	private String introduction;
	private long time;
	private String password;
	
	public static User findOrFail(int id)
	{
		String sql="select * from user where user.id="+id;
		ResultSet rs=JDBC.select(sql);
		User user=null;
		
		try 
		{
			if(rs.next())
			{
				user=new User(id, rs.getString("name"), rs.getString("email"),
						rs.getString("inroduction"), rs.getLong("time"), rs.getString("password"));
			}

			rs.close();
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		return user;
	}
	
	public static ArrayList<User> findOrFail(String name)
	{
		String sql="select * from user where user.name like "+"*"+name+"*";
		ResultSet rs=JDBC.select(sql);
		ArrayList<User> users=new ArrayList<User>();
		
		try 
		{
			while(rs.next())
			{
				User user=new User(rs.getInt("id"), name, rs.getString("email"), rs.getString("inroduction"), 
						rs.getLong("time"), rs.getString("password"));
				
				users.add(user);
			}

			rs.close();
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		return users;
	}
	
	public static int add(String name, String email, String introduction, String password)
	{
		String sql="insert into user(name, email, introduction, password) values("+
				name+","+email+","+introduction+","+password+")";
		int result=JDBC.update(sql);
		
		return result;
	}
	
	public User(int id, String name, String email, String introduction,
			long time, String password)
	{
		this.id=id;
		this.name=name;
		this.email=email;
		this.introduction=introduction;
		this.time=time;
		this.password=password;
	}
	
	public int getId() 
	{
		return id;
	}
	
	public String getName() 
	{
		return name;
	}
	
	public String getEmail()
	{
		return email;
	}
	public int setEmail(String email)
	{
		String sql="update user set user.email="+email+"where user.id="+this.id;
		int result=JDBC.update(sql);		
		
		if(1==result)
		{
			this.email = email;
		}
		
		return result;
	}
	
	public String getIntroduction()
	{
		return introduction;
	}
	public int setIntroduction(String introduction)
	{
		String sql="update user set user.introduction="+introduction+
				"where user.id="+this.id;
		int result=JDBC.update(sql);		
		
		if(1==result)
		{
			this.introduction = introduction;
		}
		
		return result;
	}
	
	public long getTime()
	{
		return time;
	}
	
	public String getPassword() 
	{
		return password;
	}
	public int setPassword(String password) 
	{
		String sql="update user set user.password="+password+
				"where user.id="+this.id;
		int result=JDBC.update(sql);		
		
		if(1==result)
		{
			this.password = password;
		}
		
		return result;
	}
}