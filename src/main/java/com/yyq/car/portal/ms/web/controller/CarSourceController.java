package com.yyq.car.portal.ms.web.controller;

import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yyq.car.portal.common.dto.UserDTO;
import com.yyq.car.portal.common.mapper.comm.LocationMapper;
import com.yyq.car.portal.common.model.auth.User;
import com.yyq.car.portal.common.model.biz.bizcarsource;
import com.yyq.car.portal.common.model.comm.Location;
import com.yyq.car.portal.common.model.product.Shop;
import com.yyq.car.portal.common.service.security.SecurityHelper;
import com.yyq.car.portal.common.util.DateUtils;
import com.yyq.car.portal.ms.app.service.AssetRepositoryService;
import com.yyq.car.portal.ms.app.service.CarSourceService;
import com.yyq.car.portal.ms.app.service.ShopService;
import com.yyq.car.portal.ms.web.constant.Url;


@Controller
public class CarSourceController {

	@Autowired
	private CarSourceService carSourceService;
	@Autowired
	private ShopService shopService;
	@Autowired
	private LocationMapper locationMapper;
	
	@Autowired
	private AssetRepositoryService assetRepositoryService;
	
	/**
	 * 审核结果保存
	 * @param bizcarsource
	 * @param loginid
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping(value =Url.carSourcesavePass, method = RequestMethod.POST)
	public @ResponseBody Object  carSourcesavePass(bizcarsource bizcarsource,Integer loginid) throws ParseException{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", false);
		try {
			User user=carSourceService.user(loginid);
			bizcarsource.setAuditname(user.getName());
			carSourceService.carSourcesavePass(bizcarsource,loginid);
			map.put("status", true);
		} catch (Exception e) {
			map.put("msg", e.getMessage());
		}
		return map;
	}
	/**
	 * 到审核页面
	 * @param id
	 * @param currpage
	 * @param map
	 * @return
	 */
	@RequestMapping(value =Url.auditCarSource, method = RequestMethod.GET)
	public String  auditCarSource(Integer id,String currpage,ModelMap map,Integer loginid){
		
			bizcarsource carsource= carSourceService.auditCarSource(id);
			Shop shop=shopService.shop(carsource.getShopid());
			map.put("shop", shop);
			map.put("currpage", currpage);
			map.put("carsource", carsource);
			map.put("loginid", loginid);
			return "carsource/auditCarSource";
		
	}
	/**
	 * 车源信息保存
	 * @param map
	 * @param bizcarsource
	 * @param starttime
	 * @param endtime
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping(value =Url.carSourcesave, method = RequestMethod.POST)
	public @ResponseBody Object  carSourcesave(bizcarsource bizcarsource,String starttimes,String endtimes) throws ParseException{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", false);
		try {
			carSourceService.carSourcesave(bizcarsource,starttimes,endtimes);
			map.put("status", true);
		} catch (Exception e) {
			map.put("msg", e.getMessage());
		}
		return map;
	}
	/**
	 * 零采车源渠道审核情况列表页面
	 * @param map
	 * @param currpage
	 * @return
	 */
	@RequestMapping(value =Url.carSourcelistpage, method = RequestMethod.GET)
	public String carSourcelistpage(ModelMap map, String currpage,Integer type) {
		map.put("currpage", currpage);
		UserDTO user = SecurityHelper.getAdminUserInfo();
		List<Location> lo=locationMapper.selectByCriteria(getlocation());
		map.put("lo", lo);
		map.put("shopid", user.getShop());
		map.put("loginid", user.getId());
		if (type==1) {
			return "carsource/carSourcelistpage";
		}else if(type==2){
			return "carsource/auditCarSourcelistpage";
		}else{
			return "carsource/validCarSourcelistpage";
		}
		
		
	}
	/**
	 * 零采车源渠道审核情况列表查询
	 * @param bizcarsource
	 * @param start
	 * @param pageSize
	 * @return
	 */
	@RequestMapping(value =Url.carSourcelist, method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> carSourcelist(bizcarsource bizcarsource,String start, String pageSize){
		return carSourceService.carsourcelist(bizcarsource, start, pageSize);
	}
	
	@RequestMapping(value =Url.addCarSource, method = RequestMethod.GET)
	public String addCarSource(Integer loginid,ModelMap map){
		User user=carSourceService.user(loginid);
		Shop shop=shopService.shop(Integer.parseInt(user.getShop()));
		map.put("shop", shop);
		Integer key = assetRepositoryService.querySequenceValue(415);
		String now = DateUtils.formate(DateUtils.getCurrentTime(), "yyyyMMdd");
		map.put("car", "cjzjlcqd" + now.substring(2) + key);// 车源渠道编号
		List<Location> lo=locationMapper.selectByCriteria(getlocation());
		map.put("lo", lo);
		map.put("user", user);
		return "carsource/addCarSource";
	}
	public Location getlocation(){
		Location location=new Location();
		location.setType("0");
		return location;
	}
}
