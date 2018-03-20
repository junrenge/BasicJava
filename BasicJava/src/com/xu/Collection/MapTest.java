package com.xu.Collection;
import java.io.File;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Properties;
import java.util.Set;
import java.lang.Object;

public class MapTest {

	public void testMap() throws FileNotFoundException, IOException{
		Properties pos = new Properties();
		pos.load(new FileInputStream(new File("tt.txt")));
		System.out.println(pos.get("user"));
		
		HashMap map = new HashMap();
		map.put("aaa", "bbb");
		map.put(111, 222);
		map.put(new Human("a", "b"), "value");
		Object v = (Object) map.get(new Human("a", "b"));
		System.out.println(v);
		
		System.out.println(map.size());
		Set set = map.keySet();
		System.out.println(set);
		Collection c = map.values();
		for(Object o :c){
			System.out.println(o);
		}
		Set set2 = map.entrySet();
		for(Object o :set2){
			Entry m =(Entry) o;
			System.out.println(m.getKey()+"==="+m.getValue());
		}
		for(Object o :set2){
			System.out.println(o);
		}
	}
}
