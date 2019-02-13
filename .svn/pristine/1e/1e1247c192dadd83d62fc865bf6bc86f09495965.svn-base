package com.yyq.car.portal.ms.web.controller;

import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yyq.car.portal.common.dto.KrcarDTO;
import com.yyq.car.portal.common.dto.UserDTO;
import com.yyq.car.portal.common.model.comm.Abrand;
import com.yyq.car.portal.common.model.kr.Krcar;
import com.yyq.car.portal.common.model.kr.Krpool;
import com.yyq.car.portal.common.model.product.Store;
import com.yyq.car.portal.common.service.security.SecurityHelper;
import com.yyq.car.portal.ms.app.service.AssetRepositoryService;
import com.yyq.car.portal.ms.app.service.BrandAndModelService;
import com.yyq.car.portal.ms.app.service.KrCarService;
import com.yyq.car.portal.ms.web.constant.Url;
import com.yyq.car.portal.ms.web.constant.View;


/**
 * <P>北汽金融Service</P>
 * @author liang
 */

@Controller
public class KrCarController {

	@Autowired
	private AssetRepositoryService assetRepositoryService;
	@Autowired
	private BrandAndModelService brandAndModelService;
	@Autowired
	private KrCarService krCarService;

	private Logger log = LoggerFactory.getLogger(KrCarController.class);

	/**
	 * 
	 * <p>到车辆录入页</p>
	 * @return
	 * @author liang
	 */
	@RequestMapping(value = Url.LOOK_KRCARENTER_PAGE, method = RequestMethod.GET)
	public String CarTypein(ModelMap map) {
		// 获取仓库列表
		List<Store> storeLst = assetRepositoryService.queryAllStore();
		map.put("storeLst", storeLst);
		List<Abrand> brand = brandAndModelService.queryBrandinitial();
		map.put("brand", brand);
		List<Krpool> poolList = krCarService.findAllPoolList();
		map.put("poolList", poolList);
		return View.KRCAR_TYPEIN_VIEW;
	}

	/**
	 * 车辆信息保存
	 * 
	 * @param dto
	 * @param map
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.KRCAR_TYPEIN_SUBMIT, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> CarTypeinSubmit(Krcar dto, ModelMap map) {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", "失败了。。");
		returnMap.put("rescode", "0");
		try {
			returnMap = krCarService.saveCar(dto);
		} catch (Exception e) {
			e.printStackTrace();
			returnMap.put("result", e.getMessage());
		}
		return returnMap;

	}

	/**
	 * 
	 * <p>车辆审核入库 list页面</p>
	 * @return
	 * @author liang
	 */
	@RequestMapping(value = Url.CHECKINTOLIST_KRCARENTER_PAGE, method = RequestMethod.GET)
	public String checkinto(ModelMap map) {
		List<Krpool> poolList = krCarService.findAllPoolList();
		map.put("poolList", poolList);
		return View.KRCAR_TYPEIN_CHECKINTOLIST;
	}

	/**
	 * 
	 * <p> 车辆审核入库 list  分页方法</p>
	 * @param modelMap
	 * @author liliang
	 */

	@RequestMapping(value = Url.CHECKINTOLIST_KRCARENTER_URL, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> checkIntoListByParameter(KrcarDTO dto, String start, String pageSize, int batnum, ModelMap map) {
		Map<String, Object> returnMap = null;
		try {
			returnMap = krCarService.checkIntoListByParameter(dto, start, pageSize, batnum);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return returnMap;
	}

	/**
	 * 
	 * <p>车辆审核入库   单个车辆信息 page页面</p>
	 * @return
	 * @author liang
	 */
	@RequestMapping(value = Url.CHECKINTOPAGE_KRCARENTER_PAGE, method = RequestMethod.GET)
	public String checkintopage(String id, ModelMap map) {
		// 获取仓库列表
		Krcar krcar = krCarService.findById(id);
		map.put("krcar", krcar);
		return View.KRCAR_TYPEIN_CHECKINTOVIEW;
	}

	/**
	 * 
	 * <p>into  库融车查看页面 </p>
	 * @param modelMap
	 * @return
	 * @author liliang
	 */
	@RequestMapping(value = Url.LOOK_KRCARENTER_LOOK, method = RequestMethod.GET)
	public String look(ModelMap map) {
		List<Krpool> poolList = krCarService.findAllPoolList();
		map.put("poolList", poolList);
		return View.KRCAR_TYPEIN_LOOKVIEW;
	}

	/**
	 * 
	 * <p> 库融车  分页方法</p>
	 * @param modelMap
	 * @return
	 * @author liliang
	 */

	@RequestMapping(value = Url.LOOK_KRCARENTER_URL, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> lookByParameter(KrcarDTO dto, String start, String pageSize, int batnum, ModelMap map) {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		try {
			returnMap = krCarService.lookByParameter(dto, start, pageSize, batnum);
		} catch (Exception e) {
			returnMap.put("status", false);
			returnMap.put("msg", e.getMessage());
			log.error(e.getMessage());
			e.printStackTrace();
			return returnMap;
		}
		return returnMap;
	}

	/**
	 * 审核方法
	 * 
	 * @param dto
	 * @author liang
	 */
	@RequestMapping(value = Url.CHECKINTOMETHOD_KRCARENTER_URL, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> checkcarinto(KrcarDTO dto, ModelMap map) {
		Map<String, Object> returnMap = null;
		UserDTO user = SecurityHelper.getAdminUserInfo();
		dto.setAuditor(user.getId().toString());
		returnMap = krCarService.checkcarinto(dto);
		return returnMap;

	}

	/**
	 * 
	 * <p>into  库融车  审核情况 </p>
	 * @param modelMap
	 * @return
	 * @author liliang
	 */
	@RequestMapping(value = Url.LOOKCHECK_KRCAR_URL, method = RequestMethod.GET)
	public String lookcheck(ModelMap map) {
		List<Krpool> poolList = krCarService.findAllPoolList();
		map.put("poolList", poolList);
		return View.KRCAR_LOOKCHECK_VIEW;
	}

	/**
	 * 
	 * <p> 库融车审核情况  分页方法</p>
	 * @param modelMap
	 * @return
	 * @author liliang
	 */

	@RequestMapping(value = Url.LOOKCHECK_KRCAR_LIST, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> lookcheckByParameter(KrcarDTO dto, String start, String pageSize, int batnum, ModelMap map) {
		Map<String, Object> returnMap = null;
		returnMap = krCarService.lookcheckByParameter(dto, start, pageSize, batnum);
		return returnMap;
	}

}