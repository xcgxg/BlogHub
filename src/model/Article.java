package model;

import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.swing.plaf.basic.BasicInternalFrameTitlePane.RestoreAction;

import org.omg.PortableInterceptor.DISCARDING;

import util.JDBC;

public class Article 
{
	private int id;
	private int user_id;
	private Timestamp time;
	private String title;
	private String digest;
	private String content;
	
	public static ArrayList<Article> findOrFail(String type,int id)
	{
		String selectField=null;
		
		if(type.equals("user_id"))
		{
			selectField="user_id";
		}
		else if(type.equals("id"))
		{
			selectField="id";
		}
		else 
		{
			return null;
		}
		
		String sql="select * from article where article."+selectField+"="+id;
		JDBC jdbc=new JDBC();
		ResultSet rs=jdbc.select(sql);
		ArrayList<Article> articles=new ArrayList<Article>();
		
		try 
		{
			while(rs.next())
			{
				Article article=new Article(rs.getInt("id"), rs.getInt("user_id"), rs.getTimestamp("time"),
						rs.getString("title"), rs.getString("digest"), rs.getString("content"));
				
				articles.add(article);
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		jdbc.close();
		
		return articles;
	}
	
	public static ArrayList<Article> findOrFail(String type, String title_digest)
	{
		String selectField=null;
		
		if(type.equals("title"))
		{
			selectField="title";
		}
		else if (type.equals("digest")) 
		{
			selectField="digest";
		}
		
		String sql="select * from article where article."+selectField+" like "+"'%"+title_digest+"%'";
		JDBC jdbc=new JDBC();
		ResultSet rs=jdbc.select(sql);
		ArrayList<Article> articles=new ArrayList<Article>();
		
		try 
		{
			while(rs.next())
			{
				Article article=new Article(rs.getInt("id"), rs.getInt("user_id"), rs.getTimestamp("time"),
						rs.getString("title"), rs.getString("digest"), rs.getString("content"));
				
				articles.add(article);
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		jdbc.close();
		
		return articles;
	}
	
	public static int add(int user_id, String title, String digest, String content)
	{
		String sql="insert into article(user_id, title, digest, content) values("+
				user_id+",'"+title+"','"+digest+"','"+content+"')";
		JDBC jdbc=new JDBC();
		int result=jdbc.update(sql);
		
		jdbc.close();
		
		return result;
	}
	
	public Article(int id, int user_id, Timestamp time, String title, 
			String digest, String content) 
	{
		this.id=id;
		this.user_id=user_id;
		this.time=time;
		this.title=title;
		this.digest=digest;
		this.content=content;
	}

	public int getId() 
	{
		return id;
	}

	public int getUser_id() 
	{
		return user_id;
	}

	public Timestamp getTime() 
	{
		return time;
	}

	public String getTitle() 
	{
		return title;
	}
	public int setTitle(String title) 
	{
		String sql="update article set article.title='"+title+
				"' where article.id="+this.id;
		JDBC jdbc=new JDBC();
		int result=jdbc.update(sql);
		
		jdbc.close();
		
		if(1==result)
		{
			this.title = title;
		}
		
		return result;
	}

	public String getDigest() 
	{
		return digest;
	}
	public int setDigest(String digest)
	{
		String sql="update article set article.digest='"+digest+
				"' where article.id="+this.id;
		JDBC jdbc=new JDBC();
		int result=jdbc.update(sql);		
		
		jdbc.close();
		
		if(1==result)
		{
			this.digest = digest;
		}
		
		return result;
	}

	public String getContent() 
	{
		return content;
	}
	public int setContent(String content) 
	{
		String sql="update article set article.content='"+content+
				"' where article.id="+this.id;
		JDBC jdbc=new JDBC();
		int result=jdbc.update(sql);
		
		jdbc.close();
		
		if(1==result)
		{
			this.content = content;
		}
		
		return result;
	}
	
	public int delete()
	{
		String sql1="delete from article where article.id="+this.id;
		String sql2="delete from comment where comment.article_id="+this.id;
		JDBC jdbc=new JDBC();
		int result1=jdbc.update(sql1);
		int result2=jdbc.update(sql2);
		
		jdbc.close();
		
		return result1|result2;
	}

}
