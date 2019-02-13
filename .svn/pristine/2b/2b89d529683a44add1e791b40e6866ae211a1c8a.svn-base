/*******************************************************************************
 * Project   : car-ms
 * Class Name: com.yyq.car.portal.ms.web.controller.MallSourceController
 * Created By: wangzh 
 * Created on: 2018年10月19日 下午4:11:30
 * Copyright © 2013-2014 YYQ All rights reserved.
 ******************************************************************************/
package com.yyq.car.portal.ms.web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.util.WebUtils;

import com.alibaba.fastjson.JSON;
import com.yyq.car.portal.common.dto.UserDTO;
import com.yyq.car.portal.common.model.jnd.jndSite;
import com.yyq.car.portal.common.model.mall.MallIssuingCompany;
import com.yyq.car.portal.common.model.mall.mallAreaBrand;
import com.yyq.car.portal.common.service.security.SecurityHelper;
import com.yyq.car.portal.ms.app.service.MallSourceService;
import com.yyq.car.portal.ms.web.command.CarSourceSaveCmd;
import com.yyq.car.portal.ms.web.constant.Url;


/**
 * <P>商城车源</P>
 * @author wangzh
 */
@Controller
public class MallSourceController {

	@Autowired
	MallSourceService sourceService;

	/**
	 * 
	 * <p>到车源首页</p>
	 * @param map
	 * @param currpage
	 * @param area
	 * @param brand
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.mallcarsourceindex, method = RequestMethod.GET)
	public String mallcarsourceindex(ModelMap map, String currpage) {
		if (StringUtils.isNotBlank(currpage)) {
			map.put("currpage", currpage);
		}
		UserDTO user = SecurityHelper.getAdminUserInfo();
		Integer cId = user.getCountry();
		if (cId != null) {
			map.put("country", cId);
			map.put("countryBean", sourceService.getSiteById(cId));
		} else {
			// 获取所有区域
			map.put("countryList", sourceService.getAllSites(true));
		}
		return "mall/carsourcelst";
	}

	/**
	 * 
	 * <p>车源编辑列表</p>
	 * @param map
	 * @param currpage
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.mallcarsourceeditindex, method = RequestMethod.GET)
	public String mallcarsourceeditindex(ModelMap map, String currpage) {
		if (StringUtils.isNotBlank(currpage)) {
			map.put("currpage", currpage);
		}
		// UserDTO user = SecurityHelper.getAdminUserInfo();
		// Integer cId = user.getCountry();
		// if (cId != null) {
		// map.put("country", cId);
		// map.put("countryBean", sourceService.getSiteById(cId));
		// } else {
		// 获取所有区域
		map.put("countryList", sourceService.getAllSites(true));
		// }
		return "mall/carsourceeditlst";
	}

	/**
	 * 
	 * <p>车源审核列表</p>
	 * @param map
	 * @param currpage
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.mallcarsourceauditindex, method = RequestMethod.GET)
	public String mallcarsourceauditindex(ModelMap map, String currpage) {
		if (StringUtils.isNotBlank(currpage)) {
			map.put("currpage", currpage);
		}
		// 获取所有区域
		map.put("countryList", sourceService.getAllSites(true));
		return "mall/carsourceauditlst";
	}

	/**
	 * 
	 * <p>车源分页查询</p>
	 * @param map
	 * @param area
	 * @param brand
	 * @param start
	 * @param pageSize
	 * @return
	 * @author wangzh
	 */
	@ResponseBody
	@RequestMapping(value = Url.mallcarsourcequery, method = RequestMethod.POST)
	public Map<String, Object> casemonitorquery(ModelMap map, Integer country, String area, String brand, Integer start, Integer pageSize) {
		Map<String, Object> returnMap = sourceService.mallcarsourcequery(country, area, brand, start, pageSize);
		return returnMap;
	}

	/**
	 * 
	 * <p>删除车源</p>
	 * @param map
	 * @param id
	 * @return
	 * @author wangzh
	 */
	@ResponseBody
	@RequestMapping(value = Url.mallcarsourcedel, method = RequestMethod.GET)
	public String mallcarsourcedel(ModelMap map, Integer id) {
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("status", false);
		try {
			sourceService.mallcarsourcedel(id);
			jsonObject.put("status", true);
		} catch (Exception e) {
			jsonObject.put("message", "该车源尚有关联数据，不可删除");
		}
		return jsonObject.toString();
	}

	/**
	 * 
	 * <p>改变车源状态</p>
	 * @param map
	 * @param id
	 * @return
	 * @author wangzh
	 */
	@ResponseBody
	@RequestMapping(value = Url.mallcarsourcevalid, method = RequestMethod.GET)
	public String mallcarsourcevalid(ModelMap map, Integer id) {
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("status", false);
		try {
			sourceService.mallcarsourcevalid(id);
			jsonObject.put("status", true);
		} catch (Exception e) {
			jsonObject.put("message", "该车源尚有关联数据，不可删除");
		}
		return jsonObject.toString();
	}

	/**
	 * 
	 * <p>到车源新增页</p>
	 * @param map
	 * @param areaid
	 * @param currpage
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.mallcarsourcetoadd, method = RequestMethod.GET)
	public String mallcarsourcetoadd(ModelMap map, Integer areaid, String currpage) {
		if (StringUtils.isNotBlank(currpage)) {
			map.put("currpage", currpage);
		}
		// 获取区域
		jndSite site = sourceService.getSiteById(areaid);
		// 查询区域下的所有品牌
		List<mallAreaBrand> brands = sourceService.getAllBrandsByAreaId(areaid, true);
		// 查询开证公司
		List<MallIssuingCompany> cops = sourceService.getAllIssCops(true);
		map.addAttribute("site", site).addAttribute("brands", brands).addAttribute("companys", cops);
		return "mall/carsourceadd";
	}

	/**
	 * 
	 * <p>图片即时上传</p>
	 * @param model
	 * @param car
	 * @param filename
	 * @param request
	 * @param response
	 * @author wangzh
	 */
	// @ResponseBody
	@RequestMapping(value = Url.carsourcefileupload, method = RequestMethod.POST)
	public void uploadPic(ModelMap model, String car, String filename, HttpServletRequest request, HttpServletResponse response) {
		// 检测是否为上传请求
		Map<String, Object> reMap = new HashMap<String, Object>();
		reMap.put("status", 0);
		String contentType = request.getContentType();
		try {
			if (contentType != null && contentType.toLowerCase().startsWith("multipart/")) {
				MultipartHttpServletRequest multipartRequest = WebUtils.getNativeRequest(request, MultipartHttpServletRequest.class);
				MultipartFile file = multipartRequest.getFile(filename);

				String fileName = file.getOriginalFilename().toLowerCase();
				if (!fileName.endsWith("jpg") && !fileName.endsWith("png") && !fileName.endsWith("jpeg")) {
					reMap.put("message", "上传文件不是jpg,png,jpeg文件");
					printOut(reMap, response);
					return;
				}
				String picPath = null;
				if (StringUtils.isBlank(car)) {
					picPath = sourceService.uploadPic(file);// 车型图片
				} else {
					picPath = sourceService.uploadcarPic(file);// 车型图片
				}
				reMap.put("msg", "上传图片成功");
				reMap.put("status", 1);
				reMap.put("path", picPath);
			}
		} catch (IOException e) {
			reMap.put("message", "上传图片失败，请稍后再试！");
		}
		printOut(reMap, response);
	}

	private void printOut(Map<String, Object> map, HttpServletResponse response) {
		PrintWriter out;
		try {
			response.setContentType("text/html;charset=UTF-8");
			out = response.getWriter();
			out.print(JSON.toJSONString(map));
		} catch (IOException e) {
			e.printStackTrace();
			map.put("message", e.getCause().getMessage());
			return;
		}
	}

	/**
	 * 
	 * <p>车源新增保存</p>
	 * @param map
	 * @param cmd
	 * @param pics
	 * @param config
	 * @param configk
	 * @param configv
	 * @param decorates
	 * @return
	 * @author wangzh
	 */
	@ResponseBody
	@RequestMapping(value = Url.carsourcesave, method = RequestMethod.POST)
	public Map<String, Object> carsourcesave(ModelMap map, CarSourceSaveCmd cmd, @RequestParam(value = "pics[]", required = false) String[] pics,
			String config, String configk, String configv, String decorates, String colors) {
		return sourceService.carsourcesave(cmd, pics, config, configk, configv, decorates, colors);
	}

	/**
	 * 
	 * <p>车源编辑保存</p>
	 * @param map
	 * @param cmd
	 * @param pics
	 * @param picdel
	 * @param picedit
	 * @param config
	 * @param configk
	 * @param configv
	 * @param decorates
	 * @param dede
	 * @param deed
	 * @return
	 * @author wangzh
	 */
	@ResponseBody
	@RequestMapping(value = Url.carsourceeditsave, method = RequestMethod.POST)
	public Map<String, Object> carsourceeditsave(ModelMap map, CarSourceSaveCmd cmd, @RequestParam(value = "pics[]", required = false) String[] pics,
			@RequestParam(value = "picdel[]", required = false) String[] picdel, @RequestParam(value = "picedit[]", required = false) String[] picedit,
			String config, String configk, String configv, String decorates, @RequestParam(value = "dede[]", required = false) String[] dede, String deed,
			String colors, @RequestParam(value = "colordel[]", required = false) String[] colordel, String coloredit) {
		return sourceService.carsourceeditsave(cmd, pics, picdel, picedit, config, configk, configv, decorates, dede, deed, colors, colordel, coloredit);
	}

	/**
	 * 
	 * <p>车源编辑页</p>
	 * @param map
	 * @param id
	 * @param currpage
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.mallcarsourceedit, method = RequestMethod.GET)
	public String mallcarsourceedit(ModelMap map, Integer id, String currpage) {
		if (StringUtils.isNotBlank(currpage)) {
			map.put("currpage", currpage);
		}
		sourceService.mallcarsourceedit(map, id);
		return "mall/carsourceedit";
	}

	/**
	 * 
	 * <p>车源审核页</p>
	 * @param map
	 * @param id
	 * @param currpage
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.mallcarsourceaudit, method = RequestMethod.GET)
	public String mallcarsourceaudit(ModelMap map, Integer id, String currpage) {
		if (StringUtils.isNotBlank(currpage)) {
			map.put("currpage", currpage);
		}
		sourceService.mallcarsourceedit(map, id);
		return "mall/carsourceaudit";
	}

	/**
	 * 
	 * <p>车源查看</p>
	 * @param map
	 * @param id
	 * @param currpage
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.mallcarsourceview, method = RequestMethod.GET)
	public String mallcarsourceview(ModelMap map, Integer id, String currpage) {
		if (StringUtils.isNotBlank(currpage)) {
			map.put("currpage", currpage);
		}
		sourceService.mallcarsourceedit(map, id);
		return "mall/carsourceview";
	}

	/**
	 * 
	 * <p>审核保存</p>
	 * @param map
	 * @param id
	 * @param issuingprice
	 * @return
	 * @author wangzh
	 */
	@ResponseBody
	@RequestMapping(value = Url.carsourceauditsave, method = RequestMethod.POST)
	public Map<String, Object> carsourceauditsave(ModelMap map, Integer id, BigDecimal issuingprice) {
		Map<String, Object> reMap = new HashMap<String, Object>();
		reMap.put("status", true);
		sourceService.carsourceauditsave(id, issuingprice);
		return reMap;
	}

	/**
	 * 
	 * <p>到商城审批流程时获取车辆审核内容页面</p>
	 * @param map
	 * @param sku 传入id 主键
	 * @param currpage
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.contractordercaraudit, method = RequestMethod.GET)
	public String contractordercaraudit(ModelMap map, String sku, String currpage) {
		if (StringUtils.isNotBlank(currpage)) {
			map.put("currpage", currpage);
		}
		return sourceService.contractordercaraudit(map, sku);
	}

	/**
	 * 
	 * <p>车辆步骤审核保存</p>
	 * @param map
	 * @param id
	 * @param status
	 * @param realmoney
	 * @param currency
	 * @param rate
	 * @return
	 * @author wangzh
	 */
	@ResponseBody
	@RequestMapping(value = Url.contractordercarsave, method = RequestMethod.POST)
	public Map<String, Object> contractordercarsave(ModelMap map, String id, String status, BigDecimal realmoney, String currency, String rate) {
		Map<String, Object> reMap = new HashMap<String, Object>();
		reMap.put("status", true);
		sourceService.contractordercarsave(id, status, realmoney, currency, rate);
		return reMap;
	}
}
