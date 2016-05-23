package model;

import java.sql.ResultSet;
import java.util.ArrayList;

import util.JDBC;

public class Comment 
{
	private int id;
	private int article_id;
	private int user_id;
	private long time;
	private String message;
	
	public ArrayList<Comment> findOrFail(int article_id)
	{
		String sql="select * from comment where comment.article_id="+article_id;
		ResultSet rs=JDBC.select(sql);
		ArrayList<Comment> comments=new ArrayList<Comment>();
		
		try 
		{
			while(rs.next())
			{
				Comment comment=new Comment(rs.getInt("id"), rs.getInt("article_id"), 
						rs.getInt("user_id"),rs.getLong("time"), rs.getString("message"));
				comments.add(comment);
			}

			rs.close();
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		return comments;
	}
	
	public static int add(int article_id, int user_id, String message)
	{
		String sql="insert into comment(article_id, user_id, message) values("+
				article_id+","+user_id+","+message+")";
		int result=JDBC.update(sql);
		
		return result;
	}
	
	public Comment(int id, int article_id, int user_id, long time, String message)
	{
		this.id=id;
		this.article_id=article_id;
		this.user_id=user_id;
		this.time=time;
		this.message=message;
	}
	
	public int getId()
	{
		return id;
	}

	public int getArticle_id() 
	{
		return article_id;
	}

	public int getUser_id() 
	{
		return user_id;
	}

	public long getTime()
	{
		return time;
	}

	public String getMessage() 
	{
		return message;
	}
	public int setMessage(String message) 
	{
		String sql="update comment set comment.email="+message+"where comment.id="+this.id;
		int result=JDBC.update(sql);		
		
		if(1==result)
		{
			this.message = message;
		}
		
		return result;
	}
	
	public int delete() 
	{
		String sql="delete from comment where comment.id="+this.id;
		int result=JDBC.update(sql);
		
		return result;
	}
	
}