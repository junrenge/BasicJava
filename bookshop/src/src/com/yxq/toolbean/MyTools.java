package src.com.yxq.toolbean;

import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class MyTools {
	public static int strToint(String str){			//��String������ת��Ϊint�����ݵķ���
		if(str==null||str.equals(""))
			str="0";
		int i=0;
		try{
			i=Integer.parseInt(str);
		}catch(NumberFormatException e){
			i=0;
			e.printStackTrace();
		}
		return i;		
	}
	public static String toChinese(String str){		//����ת������ķ���
		if(str==null)
			str="";
		try {
			str=new String(str.getBytes("gb2312"),"utf-8");
		} catch (UnsupportedEncodingException e) {
			str="";
			e.printStackTrace();
		}
		return str;
	}
	
	public static int comDate(String date1, String date2) throws ParseException{
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date dateTime1 = dateFormat.parse(date1);
		Date dateTime2 = dateFormat.parse(date2);
		int i = dateTime1.compareTo(dateTime2); 
		return i;
	}
}