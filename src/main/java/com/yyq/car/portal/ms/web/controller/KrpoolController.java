package com.yyq.car.portal.ms.web.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yyq.car.portal.common.model.auth.User;
import com.yyq.car.portal.common.model.kr.Krpool;
import com.yyq.car.portal.common.service.security.SecurityHelper;
import com.yyq.car.portal.ms.app.service.KrPoolService;
import com.yyq.car.portal.ms.web.constant.Url;
@Controller
public class KrpoolController {
	@Autowired
	private KrPoolService KrPoolService;
	/**
	 * 到库融列表页面
	 * @param currpage
	 * @param map
	 * @return
	 */
	@RequestMapping(value = Url.Poolmanagement, method = RequestMethod.GET)
	public String Poolmanagementpage(String currpage,ModelMap map,String type){
		map.put("currpage", currpage);
		User user=SecurityHelper.getAdminUserInfo();
		map.put("loginid", user.getLoginName());
		map.put("type", type);
		return "krcar/Poolmanagementpage";
	}
	/**
	 * 列表查询
	 * @param krpool
	 * @param pageSize
	 * @param start
	 * @return
	 */
	@RequestMapping(value=Url.Poolmanagementlist,method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> Poolmanagementlist(Krpool krpool,String pageSize,String start){
		return KrPoolService.Poolmanagementlist(krpool,pageSize,start);
		
	}
	/**
	 * 库融添加修改 type=1 添加 type=2 修改
	 * @param id
	 * @param type
	 * @param currpage
	 * @param map
	 * @return
	 */
	@RequestMapping(value=Url.addpool,method=RequestMethod.GET)
	public String addpool(String id,Integer type,String currpage,ModelMap map,String loginid){
		if (type==2) {
			Krpool pool=KrPoolService.getkrpool(id);
			map.put("pool", pool);
			map.put("currpage", currpage);
		}else if(type==3){//添加放款时间
			Krpool pool=KrPoolService.getkrpool(id);
			map.put("pool", pool);
			map.put("currpage", currpage);
			return "krcar/poolloantime";
		}
		map.put("loginid",loginid);
		map.put("id", id);
		return "krcar/addpool";
		
	}
	/**
	 * 添加修改保存
	 * @param krpool
	 * @return
	 */
	@RequestMapping(value=Url.addpoolsave,method=RequestMethod.POST)
	@ResponseBody
	public Object addpoolsave(Krpool krpool,String loginid,String loantime1){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", false);
		try {
			KrPoolService.addpoolsave(krpool,loginid,loantime1);
			map.put("status", true);
		} catch (Exception e) {
			map.put("msg", e.getMessage());
		}
		return map;
				
	}
	

	@RequestMapping(value=Url.pooldelete,method=RequestMethod.GET)
	@ResponseBody
	public Object pooldelete(String id,String loginid){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", false);
		try {
			KrPoolService.pooldelete(id,loginid);
			map.put("status", true);
		} catch (Exception e) {
			map.put("msg", e.getMessage());
		}
		return map;
	}

	
}
