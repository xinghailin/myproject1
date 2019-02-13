/*******************************************************************************
 * Project   : car-ms
 * Class Name: com.yyq.car.portal.ms.web.controller.BannerController
 * Created By: wangzh 
 * Created on: 2017年8月7日 下午4:54:04
 * Copyright © 2013-2014 YYQ All rights reserved.
 ******************************************************************************/
package com.yyq.car.portal.ms.web.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.yyq.car.portal.ms.app.service.BannerService;
import com.yyq.car.portal.ms.web.constant.Url;


/**
 * <P>banner管理</P>
 * @author wangzh
 */
@Controller
public class BannerController {

	@Autowired
	private BannerService bannerService;

	/**
	 * <p>到banner管理首页</p>
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.BANNER_INDEX, method = RequestMethod.GET)
	public String index() {
		return "bannerIndexView";
	}

	/**
	 * <p>分页查询</p>
	 * @param startPage
	 * @param pageSize
	 * @param map
	 * @author wangzh
	 */
	@RequestMapping(value = Url.BANNER_QUERY, method = RequestMethod.POST)
	public void query(Integer startPage, Integer pageSize, ModelMap map) {
		int s = (startPage - 1) * pageSize;
		List<Map<String, Object>> lst = bannerService.query(s, pageSize);
		int size = bannerService.count();
		map.put("lst", lst);
		map.put("total", size);
	}

	/**
	 * <p>新增、编辑</p>
	 * @param id
	 * @param uri
	 * @param sort
	 * @param pic
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.BANNER_EDIT, method = RequestMethod.POST)
	public String edit(Integer id, String uri, Integer sort, MultipartFile pic) {
		try {
			bannerService.save(id, uri, sort, pic);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "bannerIndexView";
	}

	/**
	 * <p>删除</p>
	 * @param id
	 * @param modelMap
	 * @author wangzh
	 */
	@RequestMapping(value = Url.BANNER_DELETE, method = RequestMethod.POST)
	public void delete(Integer id, ModelMap modelMap) {
		bannerService.deleteById(id);
		modelMap.put("status", true);
	}
}
