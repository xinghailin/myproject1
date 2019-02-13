/*******************************************************************************
 * Project   : car-ms
 * Class Name: com.yyq.car.portal.ms.web.controller.CarTypeController
 * Created By: wangzh 
 * Created on: 2017年8月15日 下午11:04:09
 * Copyright © 2013-2014 YYQ All rights reserved.
 ******************************************************************************/
package com.yyq.car.portal.ms.web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.util.WebUtils;

import com.alibaba.fastjson.JSON;
import com.yyq.car.portal.common.model.comm.Abrand;
import com.yyq.car.portal.common.model.comm.Recommend;
import com.yyq.car.portal.common.model.product.CarType;
import com.yyq.car.portal.ms.app.service.BrandAndModelService;
import com.yyq.car.portal.ms.app.service.CarTypeService;
import com.yyq.car.portal.ms.app.service.RecommendCarModelService;
import com.yyq.car.portal.ms.web.constant.Url;


/**
 * <P>车型管理</P>
 * @author wangzh
 */
@Controller
public class CarTypeController {

	@Autowired
	private CarTypeService carTypeService;

	@Autowired
	private BrandAndModelService brandAndModelService;
	@Autowired
	private RecommendCarModelService recommendCarModelService;

	/**
	 * 匹配车型价格
	 * @param carType
	 * @return
	 */
	@RequestMapping(value = Url.querySellerPpriceByCar, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> querySellerPpriceByCar(CarType carType) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<CarType> lst = carTypeService.querySellerPpriceByCar(carType);
		String c = null;
		// for (int i = 0; i < lst.size(); i++) {
		// c = lst.get(i).getFirstMonthPay();
		// }
		if (lst.size() > 0) {
			c = lst.get(0).getFirstMonthPay();
		}
		map.put("sellerprice", c);
		return map;
	}
	/**
	 * <p>到车型查询页面</p>
	 * @param map
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.CARTYPE_INDEX, method = RequestMethod.GET)
	public String carTypeIndex(ModelMap map, String currpage) {
		// 从车型表里查询出所有品牌 用于三级联动的初始化
		List<Map<String, Object>> carTypeLst = carTypeService.findCarBrand();
		map.put("tl", carTypeLst);
		map.put("currpage", currpage);
		return "carTypeIndexView";
	}

	/**
	 * <p>查询do</p>
	 * @param brand 品牌
	 * @param model 型号
	 * @param version 版本
	 * @param page
	 * @param size
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.CARTYPE_QUERY, method = RequestMethod.POST)
	public Map<String, Object> carTypeQuery(String brand, String model, String version, Integer page, Integer size) {
		Map<String, Object> retMap = new HashMap<String, Object>();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("page", (page - 1) * size);
		map.put("size", size);
		if (StringUtils.isNotBlank(brand)) {
			map.put("brand", brand);
		}
		if (StringUtils.isNotBlank(model)) {
			map.put("model", model);
		}
		if (StringUtils.isNotBlank(version)) {
			map.put("version", version);
		}
		List<Map<String, Object>> lst = carTypeService.carTypeQuery(map);
		int total = carTypeService.carTypeCount(map);
		retMap.put("lst", lst);
		retMap.put("total", total);
		return retMap;
	}

	/**
	 * <p>到新增页</p>
	 * @param map
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.CARTYPE_ADD, method = RequestMethod.GET)
	public String carTypeAdd(ModelMap map) {
		List<Abrand> brand = brandAndModelService.queryBrandinitial();
		map.put("brand", brand);
		return "carTypeAddView";
	}

	/**
	 * <p>新增do</p>
	 * @param carType 车型model
	 * @param outpic 外观
	 * @param inpic 内饰
	 * @param detailpic 细节
	 * @param lightpic 亮点图
	 * @param title 亮点标题
	 * @param content 亮点内容
	 * @param map
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.CARTYPE_ADDDO, method = RequestMethod.POST)
	public String carTypeAddDo(CarType carType, String[] outpic, String[] inpic, String[] detailpic, String[] lightpic, String[] title, String[] content,
			ModelMap map) {
		carTypeService.addCarType(carType, outpic, inpic, detailpic, lightpic, title, content);
		map.put("msg", "新增成功");
		return carTypeAdd(map);
	}

	/**
	 * <p>到编辑页</p>
	 * @param id
	 * @param map
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.CARTYPE_EDIT, method = RequestMethod.GET)
	public String carTypeEdit(Integer id, ModelMap map, String currpage) {
		// 查询要编辑的车型
		carTypeService.getEditCarType(id, map);
		map.put("currpage", currpage);
		return "carTypeEditView";
	}

	/**
	 * <p>编辑do</p>
	 * @param carType
	 * @param outpic
	 * @param inpic
	 * @param detailpic
	 * @param lightpic
	 * @param title
	 * @param content
	 * @param map
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.CARTYPE_EDITDO, method = RequestMethod.POST)
	public String carTypeEditDo(CarType carType, String olddownPay, String[] outpic, String[] inpic, String[] detailpic, String[] lightpic, String[] title,
			String[] content, ModelMap map, String currpage) {
		carTypeService.editCarType(carType, olddownPay, outpic, inpic, detailpic, lightpic, title, content);
		Recommend car = new Recommend();
		car.setTypeid(carType.getId());
		car.setBrand(carType.getBrand());
		car.setModel(carType.getModel());
		car.setVersion(carType.getVersion());
		car.setEveryMonthPay(carType.getEveryMonthPay());
		car.setFirstMonthPay(carType.getFirstMonthPay());
		car.setFirstpay(carType.getFirstpay());
		car.setOneMonthPay(carType.getOneMonthPay());
		car.setThirteenthMonthPay(carType.getThirteenthMonthPay());
		car.setFourteenthMonthPay(carType.getFourteenthMonthPay());
		recommendCarModelService.updateByTypeidSelective(car);
		map.put("msg", "修改成功");
		// 从车型表里查询出所有品牌 用于三级联动的初始化
		List<Map<String, Object>> carTypeLst = carTypeService.findCarBrand();
		map.put("tl", carTypeLst);
		map.put("currpage", currpage);
		return "carTypeIndexView";
	}

	@RequestMapping(value = Url.CARTYPE_DELETE, method = RequestMethod.POST)
	public void carTypeDelete(Integer id, ModelMap map) {
		carTypeService.delete(id);
		map.put("msg", "删除成功");
		map.put("status", "1");
	}

	@RequestMapping(value = "/fileupload/{filename}", method = RequestMethod.POST)
	public void uploadPic(@PathVariable String filename, ModelMap model, HttpServletRequest request, HttpServletResponse response) {
		// 图片非空验证
		// if (file == null || file.getSize() == 0) {
		// model.addAttribute("message", "请上传图片");
		// model.addAttribute("status", 0);
		// printOut(model, response);
		// return;
		// }
		// 检测是否为上传请求
		String contentType = request.getContentType();
		try {
			if (contentType != null && contentType.toLowerCase().startsWith("multipart/")) {
				MultipartHttpServletRequest multipartRequest = WebUtils.getNativeRequest(request, MultipartHttpServletRequest.class);
				MultipartFile file = multipartRequest.getFile(filename);

				String fileName = file.getOriginalFilename().toLowerCase();
				if (!fileName.endsWith("jpg") && !fileName.endsWith("png") && !fileName.endsWith("jpeg") && !fileName.endsWith("gif")) {
					model.put("status", 0);
					model.put("message", "上传文件不是jpg,png,jpeg,gif文件");
					printOut(model, response);
					return;
				}
				String picPath = carTypeService.uploadPic(file);// 车型图片
				model.addAttribute("msg", "上传图片成功");
				model.addAttribute("status", 1);
				model.addAttribute("path", picPath);
			}
		} catch (IOException e) {
			model.addAttribute("message", "上传图片失败，请稍后再试！");
			model.addAttribute("status", 0);
		}
		printOut(model, response);
	}

	/**
	 * <p>输出到页面</p>
	 * @param modelMap
	 * @param response
	 * @author yyq
	 */
	private void printOut(ModelMap modelMap, HttpServletResponse response) {
		PrintWriter out;
		try {
			response.setContentType("text/html;charset=UTF-8");
			out = response.getWriter();
			out.print(JSON.toJSONString(modelMap));
		} catch (IOException e) {
			e.printStackTrace();
			// logger.error("输出到客户端出现异常：{}", modelMap);
			modelMap.put("message", e.getCause().getMessage());
			return;
		}
	}

	/**
	 * <p>批量修改数据库的老数据，根据金融本金计算1、2、13、14的月供</p>
	 * @param map
	 * @param id
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = "batchupdatecartype", method = RequestMethod.GET)
	public @ResponseBody Map<String, String> batchupdatecartype(ModelMap map, String id) {
		Map<String, String> reMap = new HashMap<String, String>();
		try {
			if (StringUtils.isNotBlank(id)) {// 全部更新
				carTypeService.updateAllCarType(Integer.parseInt(id));
			} else {
				carTypeService.updateAllCarType(null);
			}
			reMap.put("status", "成功");
		} catch (Exception e) {
			// TODO: handle exception
			reMap.put("status", e.getMessage() + e.getStackTrace());
		}
		return reMap;
	}
	
}
