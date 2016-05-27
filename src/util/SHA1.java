package util;

import java.security.*;

public class SHA1
{
	public static String getMD5(String src) 
	{
		String sha1=null;
		try 
		{
			MessageDigest sha = MessageDigest.getInstance("SHA-1");
			byte []bytes=sha.digest(src.getBytes());
			sha1=SHA1BytesToHex(bytes);
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		return sha1;
	}
	
	private static String SHA1BytesToHex(byte []bytes)
	{
		StringBuffer sha1Hex=new StringBuffer();
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
				sha1Hex.append('0');
			}
			
			sha1Hex.append(Integer.toHexString(tmp));
		}
		
		return sha1Hex.toString().toUpperCase();
	}
}
