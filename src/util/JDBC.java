package util;

import util.DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class JDBC 
{
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public ResultSet select(String sql)
	{
		con = null;
		try 
		{
			con = DB.getConnection();
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		} 
		
		ps=null;
		rs=null;
		
		try 
		{
			ps=con.prepareStatement(sql);			
			rs=ps.executeQuery();
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		return rs;
	}
	
	public int update(String sql)
	{
		con = null;
		try 
		{
			con = DB.getConnection();
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		} 
		
		ps=null;
		int influenced=0;
		
		try 
		{
			ps=con.prepareStatement(sql);			
			influenced=ps.executeUpdate();
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		return influenced;
	}
	
	public void close()
	{
		try 
		{
			if(rs!=null)
			{
				rs.close();
			}
			if (ps!=null)
			{
				ps.close();
			}
			if(con!=null)
			{
				con.close();
			}
		} 
		catch(Exception e) 
		{
			e.printStackTrace();
		}
	}
}
