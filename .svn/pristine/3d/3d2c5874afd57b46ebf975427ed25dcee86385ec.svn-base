package com.cloud.test;

import java.util.HashMap;
import java.util.Map;

public class BankCode {
	
	
	
	
	public static String getCodeByName(String name){
		String code ="11";
		switch(name){
			case "中国银行":
				code ="a";
				break;
			case "中国农业银行":
				code ="b";
				break;
		}
		return code;
	}
	
	
	
	
	
	
	

	public static void main(String[] args) {
		/*String b = BankCode.getCodeByName("中国农业银行");
		System.out.println(b);*/
	  String s="1#I#BF00254#交易处理中###";
	  String[] a = s.split("#");
	  if(a.length>=4){//
		  for(int i=0;i<4;i++){
			  System.out.println(a[i]);
		  } 
	  }
	  
		

	}

}
