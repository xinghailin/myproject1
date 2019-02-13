/*******************************************************************************
 * Project   : car-ms
 * Class Name: com.yyq.car.portal.ms.web.controller.BizClient
 * Created By: liliang 
 * Created on: 2018年8月2日 下午2:59:48
 * Copyright © 2013-2014 YYQ All rights reserved.
 ******************************************************************************/
package com.yyq.car.portal.ms.web.controller;

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
import com.yyq.car.portal.common.model.auth.User;
import com.yyq.car.portal.common.model.biz.BizShopGroup;
import com.yyq.car.portal.common.model.product.Shop;
import com.yyq.car.portal.common.service.security.SecurityHelper;
import com.yyq.car.portal.ms.app.service.BizShopGroupService;
import com.yyq.car.portal.ms.app.service.auth.AuthUserService;
import com.yyq.car.portal.ms.web.constant.Url;


/**
 * <P>门店分组   组管理</P>
 * @author liliang
 */
@Controller
class BizShopGroupController {

	@Autowired
	private BizShopGroupService ShopGroupService;
	@Autowired
	private AuthUserService authUserService;

	/**
	 * 
	 * <p>到门店组管理首页</p>
	 * @param map
	 * @param currpage
	 * @return
	 * @author liliang
	 */
	@RequestMapping(value = Url.bizshopgroupindex, method = RequestMethod.GET)
	public String bizshoptermindex(ModelMap map, String currpage) {
		map.put("currpage", currpage);
		return "bizshopgrouplstview";
	}
	
	/**
	 * 
	 * <p>组表数据查询</p>
	 * @param dto
	 * @param start
	 * @param pageSize
	 * @param map
	 * @return
	 * @author liliang
	 */
	@RequestMapping(value = Url.bizshopgroupquery, method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> bizshoptermquery(ModelMap map, String name, String start, String pageSize) {
		Map<String, Object> returnMap = ShopGroupService.shopquery(name, start, pageSize);
		return returnMap;
	}
	
	/**
	 * 
	 * <p>到组添加页面</p>
	 * @param map
	 * @param currpage
	 * @return
	 * @author liliang
	 */
	@RequestMapping(value = Url.bizshopgrouptoadd, method = RequestMethod.GET)
	public String bizshopgrouptoadd(ModelMap map) {
		List<Shop> lst = ShopGroupService.queryshoplst(map);// 
		map.put("shopList", lst);
		return "bizshopgroupaddview";
	}
	
	
	/**
	 * 
	 * <p>组新增保存</p>
	 * @param map
	 * @param name
	 * @param totalmoney
	 * @param bigScale
	 * @param principal
	 * @param shopFirstCreatTime
	 * @param shopId
	 * @return
	 * @throws Exception
	 * @author liliang
	 */
	@RequestMapping(value = Url.bizshopgroupadd, method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> bizshoptermadd(ModelMap map, BizShopGroup shopGroup) throws Exception {
		Map<String, Object> reMap = new HashMap<String, Object>();
		UserDTO user = SecurityHelper.getAdminUserInfo();
		User loginuse = authUserService.queryUserByLoginname(user.getLoginName());
		shopGroup.setCreateuser(loginuse.getId());
		reMap =ShopGroupService.groupaddsave(map,shopGroup);
		return reMap;
	}
	
	/**
	 * 
	 * <p>到组编辑页</p>
	 * @param map
	 * @param id 组id
	 * @return
	 * @author liliang
	 */
	@RequestMapping(value = Url.bizshopgrouptoedit, method = RequestMethod.GET)
	public String bizshopgrouptoedit(ModelMap map, Integer id) {
		BizShopGroup bizShopGroup = ShopGroupService.queryshopGroupById(id);
		map.put("shopGroup", bizShopGroup);
		List<Shop> lst =ShopGroupService.querysignshoplst(id);
		map.put("shopList", lst);
		return "bizshopgroupeditview";
	}

	
	/**
	 * 
	 * <p>组编辑保存</p>
	 * @param map
	 * @param id
	 * @param name
	 * @param shopId
	 * @return
	 * @throws Exception
	 * @author liliang
	 */
	@RequestMapping(value = Url.bizshopgroupedit, method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> bizshopgroupedit(ModelMap map, BizShopGroup shopGroup) throws Exception {
		Map<String, Object> reMap = new HashMap<String, Object>();
		UserDTO user = SecurityHelper.getAdminUserInfo();
		User loginuse = authUserService.queryUserByLoginname(user.getLoginName());
		shopGroup.setModifyuser(loginuse.getId());
		reMap =ShopGroupService.groupeditsave(shopGroup);
		return reMap;
	}
	
	
	/**
	 * 删除仓库
	 * <p>TODO</p>
	 * @param id
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.bizshopgrouptodel, method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> StoreDelete(String theId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		try {
			ShopGroupService.groupDelete(theId);
			map.put("status", true);
		} catch (Exception e) {
			map.put("status", false);
			map.put("message", e.getMessage());
		}
		return map;
	}
}
