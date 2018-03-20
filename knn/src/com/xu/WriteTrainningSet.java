package com.bxd;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Scanner;


public class WriteTrainningSet {

	public static void main(String[] args) throws IOException{
	    	File f = new File("D:\\trainingDigit");
	    	File[] filelist = f.listFiles();
	    	Scanner input = null;
	    	String s = "";
	    	int count =0;
	    	for(int i=0;i<filelist.length;i++){
	    			try {
	    				input = new Scanner(filelist[i]);
	    			} catch (FileNotFoundException e) {
	    				e.printStackTrace();
	    			}
	    			while(input.hasNext()){
	    			s = s+input.next();
	    			}
	    			int ii =Integer.parseInt(filelist[i].getName().charAt(0)+"");
	    			//把数据放入数据库
	    			String sql="insert into trset values ('"+s+"',"+ii+")";
	    			SQLHelper.ExecuteSQL(sql, null);
	    			count++;
                    s = "";
			        input.close();
	    		}
	    	System.out.println("读取"+f.getName()+"并写入数据库trset表里的记录为："+count+"条。");
	    }
}
