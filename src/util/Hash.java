package util;

import java.security.*;

public class Hash
{
	public static String getHash(String src,String typesOfEncry) 
	{
		String hash=null;
		try 
		{
			MessageDigest md = MessageDigest.getInstance(typesOfEncry);
			byte []bytes=md.digest(src.getBytes());
			hash=HashBytesToHex(bytes);
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
			
			return null;
		}
		
		return hash;
	}
	
	private static String HashBytesToHex(byte []bytes)
	{
		StringBuffer hashHex=new StringBuffer();
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
				hashHex.append('0');
			}
			
			hashHex.append(Integer.toHexString(tmp));
		}
		
		return hashHex.toString().toUpperCase();
	}
}
