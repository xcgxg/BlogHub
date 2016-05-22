package util;

import util.DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class JDBC 
{
	public static ResultSet select(String sql)
	{
		Connection con = null;
		try 
		{
			con = DB.getConnection();
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		} 
		
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		try 
		{
			ps=con.prepareStatement(sql);			
			rs=ps.executeQuery();
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		finally
		{
			try 
			{
				if (ps!=null)
				{
					ps.close();
				}
				if(con!=null)
				{
					con.close();
				}
			} 
			catch(Exception e2) 
			{
				e2.printStackTrace();
			}
		}
		
		return rs;
	}
	
	public static int update(String sql)
	{
		Connection con = null;
		try 
		{
			con = DB.getConnection();
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		} 
		
		PreparedStatement ps=null;
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
		finally
		{
			try 
			{
				if (ps!=null)
				{
					ps.close();
				}
				if(con!=null)
				{
					con.close();
				}
			} 
			catch(Exception e2) 
			{
				e2.printStackTrace();
			}
		}
		
		return influenced;
	}
}
