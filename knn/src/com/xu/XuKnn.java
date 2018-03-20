package com.bxd;

import java.io.IOException;
import java.io.ObjectInputStream.GetField;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Scanner;

public class XuKnn {
//	static int [] match=new int [945];
//	static int count =0;
	
	public static int knn(OneData data,List<OneData> trslist,int NoKNN){
        int resulttype = calcDis(data,trslist,NoKNN);
        return resulttype;
    }
    
	public static int calcDis(OneData data,List<OneData> trslist,int NoKNN){
    	int matchtype = 0;
    	List<CalcItem> calclist = new ArrayList() ;
    	int [] calcdeviation = new int[trslist.size()] ;
    	char[] datastringch = data.getRs().toCharArray();
    	
    	for(int i=0;i<trslist.size();i++){
    		int count = 0;
    		char[] trstringch = trslist.get(i).getRs().toCharArray();
    		for(int j=0;j<datastringch.length;j++){
    			if(datastringch[j] != trstringch[j]){
    				count++;
    			}
    		}
    		CalcItem cl = new CalcItem();
    		cl.setCount(count);
    		cl.setType(trslist.get(i).getType());
    		calclist.add(cl);
    		calcdeviation[i] = count;
        }
    	Arrays.sort(calcdeviation);
    	
    	int maxdeviation = calcdeviation[6];
    	int [] countsrs = new int[10];
    		for(int l=0;l<calclist.size();l++){
    			CalcItem cl = calclist.get(l);
    			if(cl.getCount()<=maxdeviation && NoKNN>0){
    				NoKNN--;
    				switch(cl.getType()){
    		    	case 0:  countsrs[0]=countsrs[0]+1; break;
    		    	case 1:  countsrs[1]=countsrs[1]+1; break;
    		    	case 2:  countsrs[2]=countsrs[2]+1; break;
    		    	case 3:  countsrs[3]=countsrs[3]+1; break;
    		    	case 4:  countsrs[4]=countsrs[4]+1; break;
    		    	case 5:  countsrs[5]=countsrs[5]+1; break;
    		    	case 6:  countsrs[6]=countsrs[6]+1; break;
    		    	case 7:  countsrs[7]=countsrs[7]+1; break;
    		    	case 8:  countsrs[8]=countsrs[8]+1; break;
    		    	case 9:  countsrs[9]=countsrs[9]+1; break;
    		    	default: break;
    		    	}
    	    	}
    			}
    		
    	int[] temp = new int[countsrs.length];
    	for(int n=0;n<countsrs.length;n++){
    		temp[n] = countsrs[n];
    	}
    	//找出误差前七名中出现的次数最多的数字
    	Arrays.sort(countsrs);
    	int maxcounts = countsrs[countsrs.length-1]; 
    	
    	for(int m=0;m<temp.length;m++){
    		if(temp[m] == maxcounts){
    			matchtype = m;
    		}
    	}
//    	match[count] = matchtype;
//    	count++;
    	return matchtype;
    }
    
    public static void main(String[] args) throws IOException{
    	ReadTestSet ts = new ReadTestSet();
    	List<OneData> testsetlist = ts.DataTest();
    	ReadTrSet trs = new ReadTrSet();
    	List<OneData> trslist = trs.DataTr();
    	
    	Scanner sc = new Scanner(System.in);
    	System.out.println("请输入K的值，注意是整数！");
    	int NoKNN = sc.nextInt();
        
        int correct=0;
        for(int i=0;i<testsetlist.size();i++){
            OneData data=testsetlist.get(i);
            int resulttype=knn(data,trslist,NoKNN);
            String sql="insert into resultset values ("+data.getType()+","+resulttype+")";
			SQLHelper.ExecuteSQL(sql, null);
            if(data.getType() == resulttype){
                correct++;
            }
        }
        System.out.println("total test num :"+testsetlist.size());
        System.out.println("correct test num :"+correct);
        System.out.println("ratio :"+correct/(double)testsetlist.size());
        String sql="insert into result values ("+correct/(double)testsetlist.size()+")";
		SQLHelper.ExecuteSQL(sql, null);
		System.out.println("结果已经写入数据库的result表中。");
//		System.out.println(match.length);
		
    }
	

}
