package com.milk.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.regex.Pattern;

public class Utility {
	/** 문자열에서 태그를 지우는 메소드 */
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
	
	/** 문자열을 암호화하는 메소드 */
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
			System.out.println("[에러]잘못된 암호화 알고리즘을 사용했습니다.");
		}
		return password;
	}
}