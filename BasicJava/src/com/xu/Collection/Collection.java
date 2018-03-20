package com.xu.Collection;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

public class Collection {
	public void test() {
		
		List<?> list = new ArrayList<>();
		List<Integer> l = new ArrayList<>();
		l.add(123);
		l.add(234);
		list = l;
		
		Map<String, Integer> map =new HashMap<String, Integer>();
		map.put("a", 1);
		map.put("b",2);
		Set<Map.Entry<String, Integer>> i = map.entrySet();
		for(Map.Entry<String, Integer> m :i){
			System.out.println(m.getKey()+"==="+m.getValue());
		}
		
		
		Comparator com = new Comparator() {
			@Override
			public int compare(Object o1, Object o2) {
				int i = 1;
				if (o1 instanceof Cust && o2 instanceof Cust) {
					Cust c1 = (Cust) o1;
					Cust c2 = (Cust) o2;
					i = c1.getName().compareTo(c2.getName());
					if (i == 0) {
						i = c1.getAge().compareTo(c2.getAge());
					}
				}
				return i;
			}
		};

		TreeSet<Cust> treeset = new TreeSet<Cust>(com);

		treeset.add(new Cust("abc",123));
		treeset.add(new Cust("abc", 1234));
		// set.add("1");ֻ�����ͬһ�����ͣ���һ����ӵ�ʱ���ȷ��������
		// comparableTo hashCode equalsҪ��һ��
		for (Object s : treeset) {
			System.out.println(s);
		}
	}
}
