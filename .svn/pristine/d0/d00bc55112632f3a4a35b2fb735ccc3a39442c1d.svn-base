package com.yyq.car.portal.ms.web.controller;

import java.util.HashMap;
import java.util.Map;

import org.codehaus.plexus.util.StringUtils;
import org.omg.CORBA.OBJ_ADAPTER;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mongodb.util.Hash;
import com.yyq.car.portal.common.exception.PortalAppUnCheckedException;
import com.yyq.car.portal.common.model.mall.MallIssuingCompany;
import com.yyq.car.portal.ms.app.service.MallIssuingCompanyService;
import com.yyq.car.portal.ms.web.constant.Url;
/**
 * 
 * @author xhl
 *2018年10月25日下午5:21:42
 *
 */
@Controller
public class MallIssuingCompanyController {

	@Autowired
	private MallIssuingCompanyService mallIssuingCompanyService;
	/**
	 * 
	 * @author xhl
	 * @param map
	 * @param currpage
	 * @return
	 *2018年10月25日下午5:21:47
	 *
	 */
	@RequestMapping(value=Url.issuingCompany)
	public String issuingCompanyListPage(ModelMap map, String currpage){
		map.put("currpage", currpage);
		return "MallissuingCompany/issuingCompanyListPage";
	}
	/**
	 * 
	 * @author xhl
	 * @param mallIssuingCompany
	 * @param start
	 * @param pageSize
	 * @return
	 *2018年10月25日下午5:21:52
	 *
	 */
	@RequestMapping(value=Url.issuingCompanyList,method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> issuingCompanyList(MallIssuingCompany mallIssuingCompany,Integer start, Integer pageSize){
		return mallIssuingCompanyService.issuingCompanyList(mallIssuingCompany,start,pageSize);
	}
	/**
	 * 
	 * @author xhl
	 * @param map
	 * @param currpage
	 * @param id
	 * @return
	 *2018年10月25日下午5:46:43
	 *
	 */
	@RequestMapping(value=Url.addIssuingCompany)
	public String addIssuingCompany(ModelMap map,String currpage,String id){
		if (StringUtils.isNotBlank(id)) {
			MallIssuingCompany issuingCompany=mallIssuingCompanyService.SelectIssuingCompany(id);
			map.put("issuingCompany", issuingCompany);
		}
		map.put("currpage", currpage);
		return "MallissuingCompany/addIssuingCompany";
		
	}
	/**
	 * 
	 * @author xhl
	 * @param mallIssuingCompany
	 * @return
	 *2018年10月25日下午6:09:11
	 *
	 */
	@RequestMapping(value=Url.saveIssuingCompany,method=RequestMethod.POST)
	@ResponseBody
	public Object saveIssuingCompany(MallIssuingCompany mallIssuingCompany){
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("status", false);
		try {
			mallIssuingCompanyService.saveIssuingCompany(mallIssuingCompany);
			map.put("status", true);
		} catch (PortalAppUnCheckedException e) {
			map.put("msg", e.getMessage());
		}
		return map;
	}
	/**
	 * 
	 * @author xhl
	 * @param id
	 * @return
	 *2018年10月26日上午10:38:46
	 *
	 */
	@RequestMapping(value=Url.deleteIssuingCompany,method=RequestMethod.POST)
	@ResponseBody
	public Object deleteIssuingCompany(Integer id){
		Map<String, Object> map=new HashMap<String,Object>();
		map.put("status", false);
		try {
			mallIssuingCompanyService.deleteIssuingCompany(id);
			map.put("status", true);
		} catch (PortalAppUnCheckedException e) {
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
	 *2018年10月26日上午10:38:42
	 *
	 */
	@RequestMapping(value=Url.issuingCompanyCarSource)
	public String issuingCompanyCarSource(ModelMap map,String currpage,String id){
		map.put("currpage", currpage);
		map.put("id", id);
		return "MallissuingCompany/issuingCompanyCarSource";
	}
}
