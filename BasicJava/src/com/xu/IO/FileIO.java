package com.xu.IO;

import java.io.*;

public class FileIO {

    public void test2(){
        InputStream is = System.in;
        InputStreamReader isr = new InputStreamReader(is);
        BufferedReader br = new BufferedReader(isr);

        while(true){
            System.out.println("enter...");
            String str="";
            try {
                str = br.readLine();
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            if(str.equalsIgnoreCase("e") || str.equalsIgnoreCase("exit")
                    ){
                break;
            }

            str = str.toUpperCase();
            System.out.println(str);
        }
        try {
            br.close();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }

    public void test(){
        String src = "C:\\Users\\xu\\Desktop\\a.mkv";
        String dest = "C:\\Users\\xu\\Desktop\\b.mkv";
        copyFile(src, dest);
    }

    //对字节文件的拷贝
    public static void copyFile(String src,String dest){
        File f1 = new File(src);
        File f2 = new File(dest);
        FileInputStream fin = null;
        FileOutputStream fos = null;
        BufferedInputStream bin = null;
        BufferedOutputStream bos = null;

        try {
            fin = new FileInputStream(f1);
            fos = new FileOutputStream(f2);
            bin = new BufferedInputStream(fin);
            bos = new BufferedOutputStream(fos);

            byte [] b = new byte[1024];
            int len;

            while((len = bin.read(b)) != -1){
                bos.write(b, 0, len);
                bos.flush();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            if(bos != null){
                try {
                    bos.close();
                } catch (IOException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            }
            if(bin != null){
                try {
                    bin.close();
                } catch (IOException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            }
        }
    }

    public void TestFile() throws IOException{
        File f = new File("t.txt");
        //包装
        FileReader fr = new FileReader(f);
        BufferedReader br = new BufferedReader(fr);

        String str="";
        while((str = br.readLine()) != null){
            System.out.println(str);
        }
        br.close();
        fr.close();


//		File f = new File("t.txt");
//		File f2 = new File("tt.txt");
//
//		FileReader fr = new FileReader(f);
//		FileWriter fw = new FileWriter(f2);
//
//		char [] c = new char[3];
//		int len = 0;
//
//		while((len = fr.read(c)) != -1){
//			fw.write(c,0,len);
//		}
//
//		fr.close();
//		fw.close();

//		File f = new File("C:\\Users\\xu\\Desktop\\故事\\1.jpg");
//		File f2 = new File("C:\\Users\\xu\\Desktop\\故事\\11.jpg");
//
//		FileInputStream fin = new FileInputStream(f);
//		FileOutputStream fout = new FileOutputStream(f2);
//		BufferedInputStream bin = new BufferedInputStream(fin);
//		BufferedOutputStream bou = new BufferedOutputStream(fout);
//
//		byte [] b = new byte[20];
//		int len=0;
//		while((len=bin.read(b)) != -1){
//			bou.write(b, 0, len);
//		}
//
//		bin.close();
//		bou.close();
//		fin.close();
//		fout.close();
//
        //字节流
//		File f = new File("C:\\Users\\xu\\Desktop\\故事\\1.jpg");
//		File f2 = new File("C:\\Users\\xu\\Desktop\\故事\\11.jpg");
//
//		FileInputStream fin = new FileInputStream(f);
//		FileOutputStream fout = new FileOutputStream(f2);
//
//		byte [] b = new byte[20];
//		int len=0;
//		while((len=fin.read(b)) != -1){
//			fout.write(b, 0, len);
//		}
//
//		fin.close();
//		fout.close();

//		File f = new File("t.txt");
//		FileOutputStream out = new FileOutputStream(f);
//		out.write(new String("I love you").getBytes());
//		out.close();
//		File f = new File("D:\\");
//		System.out.println(f.exists());
//		String [] s = f.list();
//		for(int i=0;i<s.length;i++){
//			System.out.println(s[i]);
//		}
//
//		File f2 = new File("copyhello.txt");
//
//		FileInputStream in = new FileInputStream(f2);
//		int b = in.read();
//		while((b=in.read()) != -1){
//			System.out.println(in.read());
//		}

//		byte [] c = new byte[3];
//		int len=0;
//		while((len=in.read(c)) != -1){
//			System.out.println(len);
//		}
//
//		in.close();

    }

}
