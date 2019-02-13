/*******************************************************************************
 * Project   : car-ms
 * Class Name: com.yyq.car.portal.ms.web.controller.ShopController
 * Created By: wangzh 
 * Created on: 2017年5月13日 下午10:07:38
 * Copyright © 2013-2014 YYQ All rights reserved.
 ******************************************************************************/
package com.yyq.car.portal.ms.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.lang.StringUtils;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.yyq.car.portal.common.dto.UserDTO;
import com.yyq.car.portal.common.model.comm.Location;
import com.yyq.car.portal.common.model.product.Shop;
import com.yyq.car.portal.common.model.product.Store;
import com.yyq.car.portal.common.service.security.SecurityHelper;
import com.yyq.car.portal.ms.app.service.BizShopGroupService;
import com.yyq.car.portal.ms.app.service.GetDataByTypeMsService;
import com.yyq.car.portal.ms.app.service.ShopService;
import com.yyq.car.portal.ms.web.constant.Url;
import com.yyq.car.portal.ms.web.constant.View;


/**
 * <P>门店管理/仓库管理</P>
 * @author wangzh
 */
@Controller
public class ShopController {

	@Autowired
	private ShopService shopService;

	@Autowired
	private GetDataByTypeMsService getDataByTypeService;
	
	@Autowired
	private  BizShopGroupService shopGroupService;

	@RequestMapping(value=Url.shopcity,method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> getcity(String province){
		Map<String, Object> map = new HashMap<String, Object>();
		List<Location> lo1=shopService.getcity(province);
		map.put("lo1", lo1);
		return map;
	}
	/**
	 * 添加或编辑门店
	 * @param id
	 * @param currpage
	 * @param map
	 * @return
	 */
	@RequestMapping(value = Url.addshop, method = RequestMethod.GET)
	public String addshop(String id,String currpage,ModelMap map,String userrole){
		
		return shopService.addshop(id,currpage,map,userrole);
		
	}
	/**
	 * 
	 * <p>到门店列表首页</p>
	 * @param map
	 * @param type 1、查看；没有type代表管理 
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.SHOP_INDEX, method = RequestMethod.GET)
	public String ShopIndex(String type, ModelMap map,String currpage) {
		UserDTO user = SecurityHelper.getAdminUserInfo();
	    String userrole=shopService.queryuserrole(user.getLoginName()); 
		map.put("userrole", userrole);
		map.put("currpage", currpage);
		if (StringUtils.isNotBlank(type)) {
			// map.addAttribute("type", type);
			return View.SHOP_INDEX_VIEW;
		}
		return View.SHOP_INDEX;
	}

	
	/**
	 * 门店列表
	 * <p>TODO</p>
	 * @param map
	 * @param type 有值1代表查看
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.SHOP_LST, method = RequestMethod.POST)
	public void ShopLst(String me, Shop shop, String start, String pageSize, ModelMap map) {
		if (StringUtils.isNotBlank(me)) {
			UserDTO user = SecurityHelper.getAdminUserInfo();
			if (user != null) {
				String shopId = user.getShop();
				if (StringUtils.isNotBlank(shopId)) {
					shop.setId(Integer.parseInt(shopId));
				}
			}
		}
		List<Shop> lst = shopService.queryShopLst(shop, start, pageSize);
		int count = shopService.countShop(shop);
		map.put("result", lst);
		map.put("total", count);
	}
	
	
	/**
	 * 门店列表
	 * <p>TODO</p>
	 * @param map
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.SHOP_GROUP_LST, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> ShopGroupLst(String me, Shop shop, String start, String pageSize, ModelMap map) {
		UserDTO user = new UserDTO();
		if (StringUtils.isNotBlank(me)) {
			 user = SecurityHelper.getAdminUserInfo();
			if (user != null) {
				String shopId = user.getShop();
				if (StringUtils.isNotBlank(shopId)) {
					shop.setId(Integer.parseInt(shopId));
				}
			}
		}
		Map<String, Object> returnMap =shopService.queryAllShopLst(user,shop, start, pageSize);
		return returnMap;
	}

	/**
	 * 新增或编辑
	 * <p>TODO</p>
	 * @param shop
	 * @return
	 * @author wangzh
	 * @return 
	 */
	@RequestMapping(value = Url.SHOP_EDIT, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> ShopEdit(Shop shop, String snewtime ,String soldtime) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		try {
			shopService.shopEdit(shop,snewtime,soldtime);
			map.put("status", true);
		} catch (Exception e) {
			map.put("status", false);
			map.put("msg", e.getMessage());
		}
		return map;
	}

	/**
	 * 删除门店
	 * <p>TODO</p>
	 * @param id
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.SHOP_DEL, method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> ShopDelete(String theId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		try {
			shopService.shopDelete(theId);
			map.put("status", true);
		} catch (Exception e) {
			// TODO: handle exception
			map.put("status", false);
			map.put("message", e.getMessage());
		}
		return map;
	}

	/**
	 * 地名转为code
	 * <p>TODO</p>
	 * @param province
	 * @param city
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.LOCATION_TRANSFER, method = RequestMethod.POST)
	public Map<String, String> locationTransfer(String province, String city) {
		Map<String, String> map = shopService.nameTrasferCode(province, city);
		return map;
	}

	/**
	 * 获取省
	 * <p>TODO</p>
	 * @return
	 * @author wangzh
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = Url.DATA_GETPROVINCES, method = RequestMethod.POST)
	public @ResponseBody Map getProvinces() {
		Map map = new HashMap();
		List<Map> result = getDataByTypeService.getProvincesMessage();
		map.put("status", 1);
		map.put("result", result);
		return map;
	}

	/**
	 * 获取省下的市
	 * <p>TODO</p>
	 * @param provinceId
	 * @return
	 * @author wangzh
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = Url.DATA_GETCITIES, method = RequestMethod.POST)
	public @ResponseBody Map getCities(String provinceId) {
		Map map = new HashMap();
		List<Map> result = getDataByTypeService.getCityAndProvinceMessage(provinceId);
		map.put("status", 1);
		map.put("result", result);
		return map;
	}

	/**
	 * 
	 * <p>到仓库列表首页</p>
	 * @param map
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.STORE_INDEX, method = RequestMethod.GET)
	public String StoreIndex(ModelMap map) {
		return "store.index";
	}

	/**
	 * 仓库列表
	 * <p>TODO</p>
	 * @param map
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.STORE_LST, method = RequestMethod.POST)
	public void StoreLst(Store store, String start, String pageSize, ModelMap map) {
		List<Store> lst = shopService.queryStoreLst(store, start, pageSize);
		int count = shopService.countStore(store);
		map.put("result", lst);
		map.put("total", count);
	}

	/**
	 * 新增或编辑
	 * <p>TODO</p>
	 * @param shop
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.STORE_EDIT, method = RequestMethod.POST)
	public void StoreEdit(Store store, ModelMap map) {
		shopService.storeEdit(store);
		map.put("status", true);
	}

	/**
	 * 删除仓库
	 * <p>TODO</p>
	 * @param id
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.STORE_DEL, method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> StoreDelete(String theId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		try {
			shopService.storeDelete(theId);
			map.put("status", true);
		} catch (Exception e) {
			// TODO: handle exception
			map.put("status", false);
			map.put("message", e.getMessage());
		}
		return map;
	}

	/**
	 * 
	 * <p>门店导出</p>
	 * @param shop
	 * @param response
	 * @author wangzh
	 */
	@RequestMapping(value = Url.SHOP_EXCEL, method = RequestMethod.POST)
	public void SHOP_EXCEL(Shop shop, HttpServletResponse response) {
		try {
			response.setContentType("application/x-excel");
			response.setCharacterEncoding("UTF-8");
			response.setHeader("Content-Disposition", "attachment; filename=" + new String("门店列表".getBytes("UTF-8"), "iso-8859-1") + ".xls");

			Workbook wb = shopService.exportExcel(shop);
			wb.write(response.getOutputStream()); // 输出流控制workbook

			response.getOutputStream().flush();

			response.getOutputStream().close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
