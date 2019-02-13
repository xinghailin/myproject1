package com.cloud.test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Utils {
	
	public static void main(String[] args) throws ParseException {
		List<Map<String,String>> list = new ArrayList<Map<String,String>>();
		Map<String,String> map1 = new HashMap<String,String>();
		map1.put("name", "xiaopeng1");
		map1.put("time", "2018-05-24");
		Map<String,String> map2 = new HashMap<String,String>();
		map2.put("name", "xiaopeng3");
		map2.put("time", "2018-05-23");
		Map<String,String> map3 = new HashMap<String,String>();
		map3.put("name", "xiaopeng2");
		map3.put("time", "2018-05-25");
		Map<String,String> map4 = new HashMap<String,String>();
		map4.put("name", "xiaopeng4");
		map4.put("time", "2018-05-27");
		list.add(map2);
		list.add(map1);
		list.add(map3);
		list.add(map4);

		
		Map<String,String>[] maps = new Map[list.size()];
		list.toArray(maps);
		test2(maps);
		  
	}
	
	public static Map<String,String>[] test2(Map<String,String>[] maps) throws ParseException{
		SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd");
		for(int i=0;i<maps.length-1;i++){
			for(int j=i+1;j<=maps.length-1;j++){
				if(sdf.parse(maps[i].get("time")).getTime()<sdf.parse(maps[j].get("time")).getTime()){
					Map<String,String> map = maps[i];
					maps[i]=maps[j];
					maps[j]=map;
				}
			}
		}
		for(int x=0;x<maps.length;x++){
			System.out.println(maps[x].get("name"));
		}
		return null;
		
	}
	
	
	public static List<Map<String,String>> test1(List<Map<String,String>> list){
		for(int i=0;i<list.size()-1;i++){
			Map<String,String> map = list.get(i);
			for(int y=i+1;i<list.size()-1;y++){
				
			}
		}
		
		return list;
		
	}

}
