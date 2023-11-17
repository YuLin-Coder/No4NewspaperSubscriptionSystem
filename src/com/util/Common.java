package com.util;

/**
 * 常用方法类
 * 
 * 
 */
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public final class Common {
	////////////字符串 HTML 转换
	public static String turn(String str) {
	
		while (str.indexOf("\n") != -1) {
			str = str.substring(0, str.indexOf("\n")) + "<br>"
					+ str.substring(str.indexOf("\n") + 1);
		}
		while (str.indexOf(" ") != -1) {
			str = str.substring(0, str.indexOf(" ")) + "&nbsp;"
					+ str.substring(str.indexOf(" ") + 1);
		}
		return str;
	}
	
	/////////////返回日期  当前日期传入0  一年之前传入-1 三年后传入3
	public static String getDate(int num){
	
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Calendar c = Calendar.getInstance();
		c.add(Calendar.YEAR, num);
		
		return df.format(c.getTime());
	}
	
	/////////////数据库输出字符串的过滤
	public static String SQLStr(String str){
	
		if(str != null && str.length()>1 && str.substring(0,1).equals("?")){
			str = str.substring(1);
		}
				
		if(str == null || str.equals("") || str.equals(" ")){
			str = "&nbsp;";
		}
		return str;
	} 
	/////////////过滤空格
	public static String PageStr(String str){
	
		if(str==null || str.trim().equals("") || str.equals(" ")||str.equals("null")){
			str = "";
		}
		str = str.trim();
		return str;
	}
	/////////////格式化日期	
	public static String formatRZ(String oldDate){
	
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date Date = new Date(oldDate);
		return df.format(Date);
	}
	
	////////////汉化
	public static String toChineseAndTrim(String str){
	
		if(str==null){
			str="";
		}
		try{
			byte b[]=str.getBytes("iso-8859-1");
			str=new String(b);
			str=str.trim();
		}catch(Exception e){
			e.printStackTrace();
		}
		return str;
	}
}