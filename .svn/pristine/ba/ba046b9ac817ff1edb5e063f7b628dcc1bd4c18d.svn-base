package com.cloud.test;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSON;
import com.yyq.car.portal.ms.web.util.paybaofu.util.JXMConvertUtil;

public class Test {

	public static void main(String[] args) throws ParseException {
		/*SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date today = sdf.parse("2018-06-18");
        Calendar c=Calendar.getInstance();
        c.setTime(today);
        int weekday=c.get(Calendar.DAY_OF_WEEK);
        System.out.println(weekday);*/
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // 格式化日期
		Calendar c = new GregorianCalendar();
		  c.setFirstDayOfWeek(Calendar.MONDAY);
		  c.setTime(new Date());
		  c.set(Calendar.DAY_OF_WEEK, c.getFirstDayOfWeek()); // Monday
		 System.out.println(sdf.format(c.getTime())); 
		/*BigDecimal a =  new BigDecimal("0");
		System.out.println(a);
		
		Boolean b = new Boolean("0");
		System.out.println(b);
		Date d = null;
		if(null == d){
			System.out.println(d+"11");
		}*/
		
	/*	String PostString="{\"actual_info\":{\"info\":[\"1111111#F#BF00195#交易金额不正确###1212\",\"3333333#F#BF00195#交易金额不正确###35566\",\"2222222#F#BF00195#交易金额不正确###3344\"]},\"member_id\":\"100000178\",\"resp_code\":\"0000\",\"resp_msg\":\"查询成功\",\"terminal_id\":\"100000916\"}";
		Map<String, Object> ArrayDataString = JXMConvertUtil.JsonConvertHashMap(PostString);//将JSON转化为Map对象。
		System.out.println(ArrayDataString);*/

		/*Map<String, Object> Tempinfo = (Map<String, Object>) ArrayDataString.get("actual_info");
		System.out.println(Tempinfo);
		List<Map<String, Object>> OrderList = (List<Map<String, Object>>) Tempinfo.get("info");
		System.out.println(OrderList);
		for(Map<String, Object> aa:OrderList){
			System.out.println(aa.keySet()+"11");
		}*/
		
		//System.out.println(ArrayDataString.get("actual_info"));
		/*Map<String, Object> maps = (Map)JSON.parse(PostString);  
		//System.out.println(PostString);
		Map<String, Object> maps1 =(Map<String, Object>) JSON.parse( maps.get("actual_info").toString());
		System.out.println(maps1.get("info"));*/
		
		System.out.println("..................");
		
		
		
		
		  String str = "{\"0\":\"zhangsan\",\"1\":\"lisi\",\"2\":\"wangwu\",\"3\":\"maliu\"}";  
	        //第一种方式  
	        Map<String, Object> maps = (Map)JSON.parse(str);  
	        System.out.println("这个是用JSON类来解析JSON字符串!!!"+maps.toString());  
	        for (Object map : maps.entrySet()){  
	            System.out.println(((Map.Entry)map).getKey()+"     " + ((Map.Entry)map).getValue());  
	        }  
	        
	        
	        Map<String, Object> map33 =new HashMap<String, Object>() ;   
	        map33.put("22", "33");
	        map33.put("222", "332");
	        System.out.println(map33);
	}
}
