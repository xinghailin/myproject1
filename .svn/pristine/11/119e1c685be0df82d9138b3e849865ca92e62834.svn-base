package com.yyq.car.portal.ms.web.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.codehaus.plexus.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.yyq.car.portal.common.exception.PortalAppUnCheckedException;
import com.yyq.car.portal.common.mapper.mall.mallAreaBrandMapper;
import com.yyq.car.portal.common.model.comm.Abrand;
import com.yyq.car.portal.common.model.jnd.jndSite;
import com.yyq.car.portal.common.model.mall.Carsource;
import com.yyq.car.portal.common.model.mall.mallAreaBrand;
import com.yyq.car.portal.ms.app.service.BrandAndModelService;
import com.yyq.car.portal.ms.app.service.CanadaNeedService;
import com.yyq.car.portal.ms.app.service.MallAreaBrandService;
import com.yyq.car.portal.ms.web.constant.Url;
import com.yyq.car.portal.ms.web.util.CurrencyEnum;

/**
 * 
 * @author xhl
 *2018年10月19日上午11:26:05
 *
 */
@Controller
public class MallAreaBrandController {

	@Autowired
	private MallAreaBrandService mallAreaBrandService;
	@Autowired
	private CanadaNeedService canadaNeedService;
	@Autowired
	private BrandAndModelService brandAndModelService;
	@Autowired
	private mallAreaBrandMapper mallAreaBrandMapper;
	/**
	 * 
	 * @author xhl
	 * @param map
	 * @param currpage
	 * @return
	 *2018年10月19日下午5:22:27
	 *
	 */
	@RequestMapping(value=Url.MallAreaBrandListPage)
	public String areaBrangListPage(ModelMap map,String currpage){
		map.put("currpage", currpage);
		return "mallArea/mallAreaBrandListPage";
		/*List<mallAreaBrand> list=mallAreaBrandMapper.selectByCriteria(new mallAreaBrand());
		map.put("list", list);
		return "mallArea/addcarcase";*/
	}

	/**
	 * 
	 * @author xhl
	 * @param start
	 * @param pageSize
	 * @param name
	 * @param status
	 * @return
	 *2018年10月19日下午5:22:20
	 *
	 */
	@RequestMapping(value=Url.MallAreaBrandlist,method = RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> MallAreaBrandlist(String name, String status,Integer start, Integer pageSize){
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("page", (start - 1) * 10);
		map.put("size", start * pageSize);
		if (StringUtils.isNotBlank(name)) {
			map.put("name", name);
		}
		if (StringUtils.isNotBlank(status)) {
			map.put("status", status);
		}
		return mallAreaBrandService.MallAreaBrandlist(map);
	}
	/**
	 * 
	 * @author xhl
	 * @param id
	 * @return
	 *2018年10月19日下午5:22:13
	 *
	 */
	@RequestMapping(value=Url.deleteArea,method=RequestMethod.POST)
	@ResponseBody
	public Object deleteArea(Integer id){
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("status", false);
		try {
			mallAreaBrandService.deleteArea(id);
			map.put("status", true);
		} catch (PortalAppUnCheckedException e) {
			// TODO: handle exception
			map.put("msg", e.getMessage());
		}
		return map;
	}
	/**
	 * 
	 * @author xhl
	 * @param map
	 * @param currpage
	 * @param id
	 * @return
	 *2018年10月22日下午2:32:56
	 *
	 */
	@RequestMapping(value=Url.addArea)
	public String addArea(ModelMap map,String currpage,String id){
		map.put("currpage", currpage);
		if (StringUtils.isNotBlank(id)) {
			jndSite area = mallAreaBrandService.selectSite(Integer.parseInt(id));
			map.put("area", area);
		}
		@SuppressWarnings("rawtypes")
		List Currency = CurrencyEnum.getCurrencyEnumName();
		map.put("Currency", Currency);
		return "mallArea/addArea";
	}
	/**
	 * 
	 * @author xhl
	 * @param jndSite
	 * @param picurls
	 * @return
	 * @throws Exception
	 *2018年10月22日下午2:32:49
	 *
	 */
	@ResponseBody
	@RequestMapping(value=Url.saveArea,method=RequestMethod.POST)
	public Object saveArea(jndSite jndSite,MultipartFile picurls) throws Exception {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("status", false);
		try {
			mallAreaBrandService.saveArea(jndSite,picurls);
			map.put("status", true);
		} catch (PortalAppUnCheckedException e) {
			// TODO: handle exception
			map.put("msg", e.getMessage());
		}
		return map;
	}
	/**
	 * 
	 * @author xhl
	 * @param currpage
	 * @param id
	 * @return
	 *2018年10月22日下午2:33:01
	 *
	 */
	@RequestMapping(value=Url.areaBrand)
	public String areaBrand(ModelMap map,String currpage ,Integer id,String brandid){
		map.put("currpage", currpage);
		mallAreaBrand brand=null;
		if (StringUtils.isNotBlank(brandid)) {
			brand=mallAreaBrandService.selectBrand(Integer.parseInt(brandid));
			id=brand.getAreaid();
			Abrand abrand=brandAndModelService.queryId(brand.getBrand());
			map.put("abrand", abrand);
		}
		jndSite site=mallAreaBrandService.selectSite(id);
		map.put("site", site);
		map.put("brand", brand);
		return "mallArea/addAreaBrand";
	}
	
	/**
	 * 保存区域品牌
	 * @author xhl
	 * @param mallAreaBrand
	 * @param logourls
	 * @return
	 *2018年10月22日下午5:34:43
	 * @throws IOException 
	 *
	 */
	@RequestMapping(value=Url.saveAreaBrand,method=RequestMethod.POST)
	@ResponseBody
	public Object saveAreaBrand(mallAreaBrand mallAreaBrand,MultipartFile logourls) throws IOException{
		Map<String, Object> map=new HashMap<String,Object>();
		map.put("status", false);
		try {
			mallAreaBrandService.saveAreaBrand(mallAreaBrand,logourls);
			map.put("status", true);
		} catch (PortalAppUnCheckedException e) {
			// TODO: handle exception
			map.put("msg", e.getMessage());
		}
		return map;
	}
	/***
	 * 
	 * @author xhl
	 * @param map
	 * @param currpage
	 * @param id
	 * @return
	 *2018年10月22日下午8:44:12
	 *
	 */
	@RequestMapping(value=Url.carsoure)
	public String carsoure(ModelMap map,String currpage,Integer id){
		map.put("currpage", currpage);
		map.put("id", id);
		return "mallArea/carsoure";
	}
	/***
	 * 
	 * @author xhl
	 * @param carsource
	 * @param start
	 * @param pageSize
	 * @return
	 *2018年10月22日下午8:44:08
	 *
	 */
	@RequestMapping(value=Url.carSourelist,method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> carSourelist(Carsource carsource,Integer start, Integer pageSize){
		return mallAreaBrandService.carSourelist(carsource, start,  pageSize);
	}
	
	/**
	 * 区域品牌页面
	 * @author xhl
	 * @param map
	 * @param currpage
	 * @return
	 *2018年10月22日下午8:44:05
	 *
	 */
	@RequestMapping(value=Url.areaBrandListPage)
	public String areaBrandListPage(ModelMap map,String currpage){
		map.put("currpage", currpage);
		List<jndSite> list=canadaNeedService.querysite();
		map.put("list", list);
		return "mallArea/areaBrandListPage";
	}
	/**
	 * 区域品牌列表查询
	 * @author xhl
	 * @param mallAreaBrand
	 * @param start
	 * @param pageSize
	 * @return
	 *2018年10月22日下午8:44:18
	 *
	 */
	@RequestMapping(value=Url.areaBrandlist,method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> areaBrandlist(String  name,String brand,Integer start, Integer pageSize){
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("page", (start - 1) * 10);
		map.put("size", start * pageSize);
		if (StringUtils.isNotBlank(name)) {
			map.put("name", name);
		}
		if (StringUtils.isNotBlank(brand)) {
			map.put("brand", brand);
		}
		return mallAreaBrandService.areaBrandlist(map);
		
	}
	/**
	 * 删除区域品牌
	 * @author xhl
	 * @param id
	 * @return
	 *2018年10月23日上午10:28:38
	 *
	 */
	@RequestMapping(value=Url.deleteAreaBrand,method=RequestMethod.POST)
	@ResponseBody
	public Object deleteAreaBrand(int id){
		Map<String, Object> map=new HashMap<String,Object>();
		map.put("status", false);
		try {
			mallAreaBrandService.deleteAreaBrand(id);
			map.put("status", true);
		} catch (PortalAppUnCheckedException e) {
			// TODO: handle exception
			map.put("msg", e.getMessage());
		}
		return map;
		
	}
	
}
