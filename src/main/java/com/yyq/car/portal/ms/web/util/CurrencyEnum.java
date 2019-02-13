package com.yyq.car.portal.ms.web.util;

import java.util.ArrayList;
import java.util.List;





public enum CurrencyEnum {
	CAD("C$","加币", 1),DOLLAR("$","美元", 2), RMB("¥","人民币", 3) ,EUR("€","欧元", 4);  
	    // 成员变量  
	    private String name;  
	    private String currencyname;
	    private int index; 
	   
	    // 构造方法  
	    private CurrencyEnum(String name,String currencyname, int index) {  
	        this.name = name;  
	        this.index = index; 
	        this.currencyname=currencyname;
	    }  
	    // 普通方法  
	    public static String getCurrencyname(String name) {  
	        for (CurrencyEnum c : CurrencyEnum.values()) {  
	            if (c.getName().equals(name)) {  
	                return c.currencyname;  
	            }  
	        }  
	        return null;  
	    }  
	    // 普通方法  
	    public static String getName(int index) {  
	        for (CurrencyEnum c : CurrencyEnum.values()) {  
	            if (c.getIndex() == index) {  
	                return c.name;  
	            }  
	        }  
	        return null;  
	    }  
	    public static int getIndex(String name) {  
	        for (CurrencyEnum c : CurrencyEnum.values()) {  
	            if (c.getName().equals(name)) {  
	                return c.index;  
	            }  
	        }  
	        return 0;  
	    }  
	    // get set 方法  
	    public String getName() {  
	        return name;  
	    }  
	    public void setName(String name) {  
	        this.name = name;  
	    }  
	    public int getIndex() {  
	        return index;  
	    }  
	    public void setIndex(int index) {  
	        this.index = index;  
	    } 
	    @SuppressWarnings("rawtypes")
		public static List getCurrencyEnumName(){
	    	List<String> list= new ArrayList<>();
	    	for (CurrencyEnum c : CurrencyEnum.values()) {  
		          list.add(c.getName());
		            }
	    	return list;
	    }
		public String getCurrencyname() {
			return currencyname;
		}
		public void setCurrencyname(String currencyname) {
			this.currencyname = currencyname;
		}
}
