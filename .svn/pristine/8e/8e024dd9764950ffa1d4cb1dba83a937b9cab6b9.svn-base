package com.yyq.car.portal.ms.web.controller;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.yyq.car.portal.ms.web.util.HttpUtil;

public class testsheng {
	 public static final String APPKEY = "80a44ffef4107a0a";// 你的appkey
	    public static final String URL = "http://api.jisuapi.com/area/query";
	    public static final int parentid = 28;//父区域ID，为0时返回省和直辖市一级区域
	 
	    public static void main(String[] args) {
	        String result = null;
	        String url = URL + "?parentid=" + parentid + "&appkey=" + APPKEY;
	 
	        try {
	            result = HttpUtil.sendGet(url, "utf-8");
	            JSONObject json = JSONObject.fromObject(result);
	            if (json.getInt("status") != 0) {
	                System.out.println(json.getString("msg"));
	            } else {
	                JSONArray resultarr = json.optJSONArray("result");
	                for (int i = 0; i < resultarr.size(); i++) {
	                    JSONObject obj = (JSONObject) resultarr.opt(i);
	                    String id = obj.getString("id");
	                    String name = obj.getString("name");
	                    /*String parentname = obj.getString("parentname");
	                    String areacode = obj.getString("areacode");
	                    String zipcode = obj.getString("zipcode");
	                    String depth = obj.getString("depth");*/
	                    System.out.println(id + " " + name );
	                }
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
}
