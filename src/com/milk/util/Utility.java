package com.milk.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.regex.Pattern;

public class Utility {
	/** ���ڿ����� �±׸� ����� �޼ҵ� */
	public static String stripTag(String source) {
		
		Pattern htmlScript=Pattern.compile("\\]*?<.*?\\/script\\>",Pattern.CASE_INSENSITIVE);
		Pattern htmlStyle=Pattern.compile("\\]*?<.*?\\/style\\>",Pattern.CASE_INSENSITIVE);
		Pattern htmlOption=Pattern.compile("\\]*?<.*?\\/option\\>",Pattern.CASE_INSENSITIVE);
		Pattern htmlTag=Pattern.compile("\\<.*?\\>",Pattern.CASE_INSENSITIVE);
		
		source=htmlScript.matcher(source).replaceAll("");
		source=htmlStyle.matcher(source).replaceAll("");
		source=htmlOption.matcher(source).replaceAll("");
		source=htmlTag.matcher(source).replaceAll("");
		
		return source;	
	}
	
	/** ���ڿ��� ��ȣȭ�ϴ� �޼ҵ� */
	public static String encrypt(String source) {
		String password = "";
		
		try {
			MessageDigest md=MessageDigest.getInstance("SHA-256");
			md.update(source.getBytes());
			byte[] digest=md.digest();
			
			for(int i=0;i<digest.length;i++) {
				password+=Integer.toHexString(digest[i]&0xff);
			}
		} catch (NoSuchAlgorithmException e) {
			System.out.println("[����]�߸��� ��ȣȭ �˰����� ����߽��ϴ�.");
		}
		return password;
	}
}