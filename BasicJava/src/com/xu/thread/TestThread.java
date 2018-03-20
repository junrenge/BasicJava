package com.xu.thread;

class MyRun implements Runnable{

	int count =100;
	Object obj = new Object();
	public void run() {
		
			while(true){
//				show();
				synchronized (obj) {
					if(count>1){
						try {
							Thread.currentThread().sleep(10);
						} catch (InterruptedException e) {
							e.printStackTrace();
						}
						System.out.println(Thread.currentThread().getName()+"����:"+--count);
					}
			}
		}
	}
	
	public synchronized void show(){
		if(count>1){
			try {
				Thread.currentThread().sleep(10);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			System.out.println(--count+Thread.currentThread().getName());
		}
	}
	
}

public class TestThread {
	
	public static void main(String[] args) throws InterruptedException {
		
		MyRun m = new MyRun();
		Thread t = new Thread(m);
		Thread t2 = new Thread(m);
		t.setName("win1");
		t2.setName("win2");
		t.start();
		t2.start();
		
	}

}
