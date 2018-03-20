package com.xuyixin.servlet;

import java.awt.Rectangle;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;

import java.io.BufferedWriter;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;

import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;

@SuppressWarnings("serial")
public class JFrame1 extends JFrame implements KeyListener {
	// JFrame jFrame1;
	JTextField f1;
	JTextField f2;
	JTextField f3;
	JTextField f4;

	JFrame1() {
		JLabel l1 = new JLabel("Va和Vb相差较小：");
		JLabel l2 = new JLabel("Va:");
		JLabel l3 = new JLabel("Vb:");
		JLabel l4 = new JLabel("Va和Vb相差较大：");
		JLabel l5 = new JLabel("Va:");
		JLabel l6 = new JLabel("Vb:");
		f1 = new JTextField(4);
		f2 = new JTextField(4);
		f3 = new JTextField(4);
		f4 = new JTextField(4);
		// jFrame1 =new JFrame("界面一");
		setFocusable(true); // 能聚焦
		addKeyListener(this);
		// setDefaultCloseOperation(jFrame1.EXIT_ON_CLOSE);
		setLocation(100, 100);
		setSize(400, 500);
		setTitle("界面一");
		JPanel panel = new JPanel();
		panel.setLayout(null);// 取消布局管理器
		setVisible(true);
		panel.add(l1);
		panel.add(l2);
		panel.add(l3);
		panel.add(l4);
		panel.add(l5);
		panel.add(l6);
		panel.add(f1);
		panel.add(f2);
		panel.add(f3);
		panel.add(f4);
		// jFrame1.setContentPane(panel);
		add(panel);
		l1.setBounds(new Rectangle(30, 30, 200, 30));
		l2.setBounds(new Rectangle(30, 70, 30, 30));
		f1.setBounds(new Rectangle(70, 70, 80, 30));
		l3.setBounds(new Rectangle(30, 120, 30, 30));
		f2.setBounds(new Rectangle(70, 120, 80, 30));

		l4.setBounds(new Rectangle(30, 170, 200, 30));
		l5.setBounds(new Rectangle(30, 210, 30, 30));
		f3.setBounds(new Rectangle(70, 210, 80, 30));
		l6.setBounds(new Rectangle(30, 260, 30, 30));
		f4.setBounds(new Rectangle(70, 260, 80, 30));
		// Font fn1=new Font("宋体",Font.BOLD,15);
	}

	public static void main(String[] args) {
		new JFrame1();
	}

	public void keyTyped(KeyEvent e) {
		// TODO Auto-generated method stub

	}

	public void keyPressed(KeyEvent e) {
		int keyCode = e.getKeyCode();
		if (!f1.getText().equals("") && !f2.getText().equals("")
				&& !f3.getText().equals("") && !f4.getText().equals("")
				&& keyCode == 32) {
			try {
				BufferedWriter pw = new BufferedWriter(new OutputStreamWriter(
						new FileOutputStream("d:/speed.txt", false)));
				pw.write(f1.getText());
				pw.newLine();
				pw.write(f2.getText());
				pw.newLine();
				pw.write(f3.getText());
				pw.newLine();
				pw.write(f4.getText());
				pw.newLine();
				pw.close();
				// new JFrame2();
				setVisible(false);
			} catch (FileNotFoundException e1) {
				e1.printStackTrace();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
	}

	public void keyReleased(KeyEvent e) {
		// TODO Auto-generated method stub

	}
}