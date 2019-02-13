/*******************************************************************************
 * Project   : decorate-portal-ms
 * Class Name: com.yyq.decorate.portal.ms.web.controller.system.BrandController
 * Created By: wangzh 
 * Created on: 2016年11月18日 下午2:31:28
 * Copyright © 2013-2014 YYQ All rights reserved.
 ******************************************************************************/
package com.yyq.car.portal.ms.web.controller.system;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yyq.car.portal.ms.app.service.BrandService;
import com.yyq.car.portal.ms.web.constant.Url;
import com.yyq.car.portal.ms.web.constant.View;
import com.yyq.car.portal.common.model.comm.Brand;


/**
 * <P>品牌管理</P>
 * @author wangzh
 */
@Controller
public class BrandController {

	@Autowired
	private BrandService brandService;

	@RequestMapping(value = Url.SYS_BRAND_INDEX_URL, method = RequestMethod.GET)
	public String Index() {
		return View.SYS_BRAND_INDEX;
	}

	@RequestMapping(value = Url.SYS_BRAND_QUERY_URL, method = RequestMethod.POST)
	public void query(ModelMap map, String startPage, String pageSize, String brandName) {

		Map<String, Object> returnMap = brandService.query(brandName, startPage, pageSize);
		map.put("lst", returnMap.get("lst"));
		map.put("total", returnMap.get("total"));
	}

	@RequestMapping(value = Url.SYS_BRAND_TO_ADD_URL, method = RequestMethod.GET)
	public String toAdd() {

		return View.SYS_BRAND_TO_ADD;

	}

	@RequestMapping(value = Url.SYS_BRAND_ADD_URL, method = RequestMethod.POST)
	public void add(ModelMap map, String brandName) {
		try {
			int returnInt = brandService.add(brandName);
			if (returnInt == -1) {
				map.put("status", 0);
				map.put("msg", "该品牌名已存在");
				return;
			}
			map.put("status", 1);
		} catch (Exception exception) {
			map.put("status", 0);
			map.put("msg", "稍后再试");
		}
	}

	@RequestMapping(value = Url.SYS_BRAND_TO_EDIT_URL, method = RequestMethod.GET)
	public String toEdit(ModelMap map, String id) {
		Integer idInteger = Integer.parseInt(id);
		Brand brand = brandService.queryById(idInteger);
		if (brand != null) {
			map.put("brandName", brand.getName());
			map.put("id", id);
		}
		List<Map<String, Object>> lst = brandService.queryMembersByBrandId(idInteger);
		if (lst != null && lst.size() > 0) {
			StringBuffer sb = new StringBuffer();
			for (Iterator<Map<String, Object>> iter = lst.iterator(); iter.hasNext();) {
				Map<String, Object> next = iter.next();
				sb.append(next.get("name").toString()).append(",");
			}
			String tempString = sb.toString();
			if (StringUtils.isNotBlank(tempString) && tempString.charAt(tempString.length() - 1) == ',') {
				tempString = tempString.substring(0, tempString.length() - 1);
				map.put("memberNames", tempString);
			}
		}
		return View.SYS_BRAND_TO_EDIT;

	}

	@RequestMapping(value = Url.SYS_BRAND_EDIT_URL, method = RequestMethod.POST)
	public void Edit(ModelMap map, String id, String brandName) {
		try {
			int returnInt = brandService.edit(Integer.parseInt(id), brandName);
			if (returnInt == -1) {
				map.put("status", 0);
				map.put("msg", "该品牌名已存在");
				return;
			}
			map.put("status", 1);
		} catch (Exception exception) {
			map.put("status", 0);
			map.put("msg", "稍后再试！");
		}

	}

	@RequestMapping(value = Url.SYS_BRAND_DEL_URL, method = RequestMethod.GET)
	public void delete(ModelMap map, String id) {
		try {
			int returnInt = brandService.delete(Integer.parseInt(id));
			if (returnInt == -1) {
				map.put("status", 0);
				map.put("msg", "该品牌有供应商关联，不可删除");
				return;
			}
			map.put("status", 1);
		} catch (Exception exception) {
			map.put("status", 0);
			map.put("msg", "稍后再试！！");
		}

	}
}
