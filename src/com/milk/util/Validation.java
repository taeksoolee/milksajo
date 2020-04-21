package com.milk.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Validation {
	public static final String regMgrNo = "^[0-9]{10}$";
	public static final String regMgrPwd = "^(?=.*[a-zA-Z])((?=.*\\d)|(?=.*\\W)).{6,20}$"; 
	public static final String regMgrName = "^[°¡-ÆR]{2,4}$";
	private static final String[] mgrJoinCode = {"1234567890", "1597535791"};
	
	public static boolean checkMgrJoinCode(String src) {
		boolean result = false;
		for(String code : mgrJoinCode) {
			if(src.equals(code))
				result = true;
		}
		return result;
	}
	
	public static boolean test(int no, String reg) {
		boolean result = false;
		Pattern p =  Pattern.compile(reg);
		Matcher m = p.matcher((no+""));
		if(m.find()) {
			result = true;
		}
		return result;
	}
	
	public static boolean test(String str, String reg) {
		boolean result = false;
		Pattern p =  Pattern.compile(reg);
		Matcher m = p.matcher((str));
		if(m.find()) {
			result = true;
		}
		return result;
	}
	
	public static void main(CheckString[] args) {
		System.out.println(Validation.checkMgrJoinCode("1234567890"));
		System.out.println(!Validation.test("1234567890", Validation.regMgrNo));
		System.out.println(!Validation.test("123456789a", Validation.regMgrPwd));
	}
	
}


