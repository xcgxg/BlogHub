package util;

import java.security.*;

public class MD5
{
	public static String getMD5(String src) 
	{
		String md5=null;
		try 
		{
			MessageDigest md = MessageDigest.getInstance("MD5");
			byte []bytes=md.digest(src.getBytes());
			md5=MD5BytesToHex(bytes);
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		return md5;
	}
	
	private static String MD5BytesToHex(byte []bytes)
	{
		StringBuffer md5Hex=new StringBuffer();
		int tmp;
		for (byte b : bytes) 
		{
			tmp=b;
			
			if(tmp<0)
			{
				tmp+=256;
			}
			if(tmp<16)
			{
				md5Hex.append('0');
			}
			
			md5Hex.append(Integer.toHexString(tmp));
		}
		
		return md5Hex.toString().toUpperCase();
	}
}
