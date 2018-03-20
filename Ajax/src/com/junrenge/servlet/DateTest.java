package com.junrenge.servlet;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import org.junit.Test;

public class DateTest {
	/**
	 * Date dNow = new Date（）；   //当前时间
　　Date dBefore = new Date（）；
　　Calendar calendar = Calendar.getInstance（）； //得到日历
　　calendar.setTime（dNow）；//把当前时间赋给日历
　　calendar.add（Calendar.DAY_OF_MONTH, -1）；  //设置为前一天
　　dBefore = calendar.getTime（）；   //得到前一天的时间
　　SimpleDateFormat sdf=new SimpleDateFormat（"yyyy-MM-dd HH:mm:ss"）； //设置时间格式
　　String defaultStartDate = sdf.format（dBefore）；    //格式化前一天
　　String defaultEndDate = sdf.format（dNow）； //格式化当前时间
　　System.out.println（"前一天的时间是：" + defaultStartDate）；
　　System.out.println（"生成的时间是：" + defaultEndDate）；
	 * @param args
	 */
	static Date [] dates = new Date[7];
	static String [] dstr = new String[7];
	public static void main(String[] args) {
		Calendar c = Calendar.getInstance();
		c.add(Calendar.DAY_OF_MONTH, -7);
		c.set(Calendar.HOUR_OF_DAY, 0);       
		c.set(Calendar.MINUTE, 0);            
		c.set(Calendar.SECOND, 0);            
		c.set(Calendar.MILLISECOND, 0);
		DateFormat df = new SimpleDateFormat("MM.dd");
		for (int i = 0; i < dates.length; i++) {
			c.add(Calendar.DAY_OF_MONTH, +1);
			dates[i] = c.getTime();
			dstr[i] = df.format(c.getTime());
		}
		for (int i = 0; i < dates.length; i++) {
			System.out.println(dates[i]+"==="+dstr[i]);
		}
		System.out.println(dates[2].getTime()-dates[1].getTime());
	}
	
	@Test
	public void Test(){
		HashSet s = new HashSet<>();
		s.add("bbs");
		s.add("other");
		s.add("bbs");
		s.add("bbs");
		s.add("bbs");
		HashSet s2 = new HashSet<>();
		s2.add("bbs");
		s.addAll(s2);
		System.out.println(s.toString());
		
		HashMap h = new HashMap<>();
		h.put("a", 11);
		h.put("c", 13);
		h.put("b", 14);
//		Set set = h.keySet();
//		System.out.println(set);
		
		Set set2 = h.entrySet();
		for(Object o :set2){
			Map.Entry m =(Map.Entry) o;
			System.out.println(m.getKey()+"==="+m.getValue());
		}
		
	}

}
