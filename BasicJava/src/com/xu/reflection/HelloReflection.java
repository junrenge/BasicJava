package com.xu.reflection;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import com.xu.reflection.User;

public class HelloReflection {
	
	public static void main(String[] args) throws Exception {
		Class clazz = User.class;
		
		User u = (User) clazz.newInstance();
		Field f = clazz.getField("name");
		Field ff = clazz.getDeclaredField("age");
		ff.setAccessible(true);
		f.set(u,"junrenge");
		ff.set(u,"12");
		
		Method mm = clazz.getMethod("show");
		mm.invoke(u);
		
		String s = "com.xu.reflection.User";
		Class clazz1 = Class.forName(s);
		Object obj = clazz1.newInstance();
		User uu = (User) obj;
		Method[] m = clazz1.getDeclaredMethods();
		for(Method ss:m){
			System.out.println(ss);
		}
		
	}
}
