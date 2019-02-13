package com.yyq.car.portal.ms.web.controller;

import java.io.IOException;
import java.text.ParseException;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.yyq.car.portal.common.dto.UserDTO;
import com.yyq.car.portal.common.dto.WholesaleCarDTO;
import com.yyq.car.portal.common.model.auth.User;
import com.yyq.car.portal.common.model.product.Car;
import com.yyq.car.portal.common.model.wholesale.WholesaleCar;
import com.yyq.car.portal.common.service.security.SecurityHelper;
import com.yyq.car.portal.ms.app.service.WholesalecarService;
import com.yyq.car.portal.ms.app.service.auth.AuthUserService;
import com.yyq.car.portal.ms.web.constant.Url;
import com.yyq.car.portal.ms.web.constant.View;


@Controller
public class WholesalecarController {

	@Autowired
	private WholesalecarService wholesalecarService;
	@Autowired
	private AuthUserService authUserService;

	/**
	 * 可批发车辆库表 
	 * @param currpage
	 * @param map
	 * @return
	 */
	@RequestMapping(value = Url.wholesaleCarLibrary, method = RequestMethod.GET)
	public String wholesaleCarLibrary(String currpage, ModelMap map) {
		map.put("currpage", currpage);
		User user = SecurityHelper.getAdminUserInfo();
		map.put("loginName", user.getLoginName());
		return "wholesale/wholesalecarlibrarylistpage";
	}

	/**
	 * 可批发车辆库表查询
	 * @param car
	 * @param start
	 * @param pageSize
	 * @return
	 */
	@RequestMapping(value = Url.wholesalecarlibrarylist, method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> wholesalecarlibrarylist(Car car, String start, String pageSize) {
		return wholesalecarService.wholesalecarlibrarylist(car, start, pageSize);
	}

	/**
	 * 到上传水单提交页面
	 * @param currpage
	 * @param loginName
	 * @param id
	 * @param map
	 * @return 
	 */
	@RequestMapping(value = Url.wholesaleCar, method = RequestMethod.GET)
	public String wholesaleCar(String currpage, String loginName, Integer id, ModelMap map) {
		map.put("currpage", currpage);
		map.put("loginName", loginName);
		Car car = wholesalecarService.selectcar(id);
		if (car.getSettlementprice() == null) {
			car.setSettlementprice(car.getTypeinsettleprice());
		}
		map.put("car", car);
		return "wholesale/wholesaleCar";

	}

	@RequestMapping(value = Url.wholesaleCarsave, method = RequestMethod.POST)
	@ResponseBody
	public Object wholesaleCarsave(Integer id, String loginName, MultipartFile monads, WholesaleCar wholesaleCar) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", false);
		try {
			wholesalecarService.wholesaleCarsave(id, loginName, monads, wholesaleCar);
			map.put("status", true);
		} catch (Exception e) {
			// TODO: handle exception
			map.put("msg", e.getMessage());
		}

		return map;

	}

	// ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	/**
	 * 
	 * <p>门店审核list    查看页面  针对门店</p>
	 * @param modelMap
	 * @return
	 * @author liliang
	 */
	@RequestMapping(value = Url.WHOLESALE_CHECKCARLISTFORSTORE_URL, method = RequestMethod.GET)
	public String checkcarlistforstore(ModelMap map) {
		return View.WHOLESALE_CHECKLISTFORSTORE_VIEW;
	}

	/**
	 * 
	 * <p>门店审核list    分页查询方法     针对门店</p>
	 * @param modelMap
	 * @return
	 * @author liliang
	 */

	@RequestMapping(value = Url.WHOLESALE_CHECKCARLISTFORSTORE_METHOD, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> checkcarlistforstoreMethod(WholesaleCarDTO dto, String start, String pageSize, ModelMap map) {
		Map<String, Object> returnMap = null;
		try {
			returnMap = wholesalecarService.checkcarlistforstore(dto, start, pageSize);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return returnMap;
	}

	/**
	 * 
	 * <p>门店审核未通过  list    查看页面  针对门店</p>
	 * @param modelMap
	 * @return
	 * @author liliang
	 */
	@RequestMapping(value = Url.WHOLESALE_NOPASSLISTFORSTORE_URL, method = RequestMethod.GET)
	public String nopasslistforstore(ModelMap map) {
		return View.WHOLESALE_NOPASSLISTFORSTORE_VIEW;
	}

	/**
	 * 
	 * <p>门店审核未通过  list    分页查询方法     针对门店</p>
	 * @param modelMap
	 * @return
	 * @author liliang
	 */

	@RequestMapping(value = Url.WHOLESALE_NOPASSLISTFORSTORE_METHOD, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> nopassforstoreMethod(WholesaleCarDTO dto, String start, String pageSize, ModelMap map) {
		Map<String, Object> returnMap = null;
		try {
			returnMap = wholesalecarService.nopasslistforstore(dto, start, pageSize);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return returnMap;
	}

	/**
	 * 
	 * <p>财务审核list    查看页面  </p>
	 * @param modelMap
	 * @return
	 * @author liliang
	 */
	@RequestMapping(value = Url.WHOLESALE_CHECKCARLISTFORFINANCE_URL, method = RequestMethod.GET)
	public String checkcarlistforfinance(ModelMap map) {
		return View.WHOLESALE_CHECKLISTFORFINANCE_VIEW;
	}

	/**
	 * 
	 * <p>财务审核list    分页查询方法   </p>
	 * @param modelMap
	 * @return
	 * @author liliang
	 */

	@RequestMapping(value = Url.WHOLESALE_CHECKCARLISTFORFINANCE_METHOD, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> checkcarlistforfinanceMethod(WholesaleCarDTO dto, String start, String pageSize, ModelMap map) {
		Map<String, Object> returnMap = null;
		try {
			returnMap = wholesalecarService.checkcarlistforfinance(dto, start, pageSize);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return returnMap;
	}

	/**
	 * 
	 * <p>财务审核未通过   list    查看页面  </p>
	 * @param modelMap
	 * @return
	 * @author liliang
	 */
	@RequestMapping(value = Url.WHOLESALE_NOPASSLISTFORFINANCE_URL, method = RequestMethod.GET)
	public String nopasslistforfinance(ModelMap map) {
		return View.WHOLESALE_NOPASSLISTFORFINANCE_VIEW;
	}

	/**
	 * 
	 * <p>财务审核未通过  list    分页查询方法   </p>
	 * @param modelMap
	 * @return
	 * @author liliang
	 */

	@RequestMapping(value = Url.WHOLESALE_NOPASSLISTFORFINANCE_METHOD, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> nopasslistforfinanceMethod(WholesaleCarDTO dto, String start, String pageSize, ModelMap map) {
		Map<String, Object> returnMap = null;
		try {
			returnMap = wholesalecarService.nopasslistforfinance(dto, start, pageSize);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return returnMap;
	}

	/**
	 * 
	 * <p>门店审核page   页面 </p>
	 * @param modelMap
	 * @return
	 * @author liliang
	 */
	@RequestMapping(value = Url.WHOLESALE_STORECHECK_PAGE, method = RequestMethod.GET)
	public String storecheckpage(ModelMap map, String id) {
		// 获取仓库列表
		WholesaleCarDTO wholesaleCar = wholesalecarService.findById(id);
		String monad = wholesaleCar.getMonad();// 水单
		if (StringUtils.isNotBlank(monad)) {
			monad = monad.substring(monad.lastIndexOf('/') + 1);
			wholesaleCar.setMonadname(monad);
		}
		map.put("wholesaleCar", wholesaleCar);
		return View.WHOLESALE_STORECHECK_VIEW;
	}

	/**
	 * 
	 * <p>财务 审核page   页面 </p>
	 * @param modelMap
	 * @return
	 * @author liliang
	 */
	@RequestMapping(value = Url.WHOLESALE_FINANCECHECK_PAGE, method = RequestMethod.GET)
	public String financecheckpage(ModelMap map, String id) {
		// 获取仓库列表
		WholesaleCarDTO wholesaleCar = wholesalecarService.findById(id);
		String monad = wholesaleCar.getMonad();// 水单
		if (StringUtils.isNotBlank(monad)) {
			monad = monad.substring(monad.lastIndexOf('/') + 1);
			wholesaleCar.setMonadname(monad);
		}
		map.put("wholesaleCar", wholesaleCar);
		return View.WHOLESALE_FINANCECHECK_VIEW;
	}

	/**
	 * 门店审核方法
	 * 
	 * @param dto
	 * @author liang
	 */
	@RequestMapping(value = Url.WHOLESALE_STORECHECKCAR_URL, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> storecheckcarinto(WholesaleCarDTO dto, ModelMap map) {
		Map<String, Object> returnMap = null;
		UserDTO user = SecurityHelper.getAdminUserInfo();
		User loginuse = authUserService.queryUserByLoginname(user.getLoginName());
		dto.setModifyuser(loginuse.getId());
		returnMap = wholesalecarService.storecheckcarMethod(dto);
		return returnMap;

	}

	/**
	 * 财务审核方法
	 * 
	 * @param dto
	 * @author liang
	 */
	@RequestMapping(value = Url.WHOLESALE_FINANCECHECKCAR_URL, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> financecheckcarinto(WholesaleCarDTO dto, ModelMap map) {
		Map<String, Object> returnMap = null;
		UserDTO user = SecurityHelper.getAdminUserInfo();
		User loginuse = authUserService.queryUserByLoginname(user.getLoginName());
		dto.setModifyuser(loginuse.getId());
		returnMap = wholesalecarService.financecheckcarMethod(dto);
		return returnMap;

	}

	/**
	 * 
	 * <p>审核未通过  更新 page   页面 </p>
	 * @param modelMap
	 * @return
	 * @author liliang
	 */
	@RequestMapping(value = Url.WHOLESALE_UPDATEMESSAGE_PAGE, method = RequestMethod.GET)
	public String updatemessage(ModelMap map, String id, String type) {

		if (StringUtils.isNotBlank(type)) {
			WholesaleCarDTO wholesaleCar = wholesalecarService.findById(id);
			if ("1".equals(type)) {
				wholesaleCar.setReason(wholesaleCar.getReason1());
			} else if ("2".equals(type)) {
				wholesaleCar.setReason(wholesaleCar.getReason2());

			}
			wholesaleCar.setType(type);// 判断是 门店的还是财务的未通过
			String monad = wholesaleCar.getMonad();// 水单
			if (StringUtils.isNotBlank(monad)) {
				monad = monad.substring(monad.lastIndexOf('/') + 1);
				wholesaleCar.setMonadname(monad);
			}
			map.put("wholesaleCar", wholesaleCar);
		}

		return View.WHOLESALE_UPDATEMESSAGE_VIEW;
	}

	/**
	 * 审核不通过  保存 方法
	 * 
	 * @param dto
	 * @author liang
	 */
	@RequestMapping(value = Url.WHOLESALE_UPDATEMESSAGE_URL, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> update(WholesaleCarDTO dto, MultipartFile monads, ModelMap map) {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		UserDTO user = SecurityHelper.getAdminUserInfo();
		User loginuse = authUserService.queryUserByLoginname(user.getLoginName());
		dto.setModifyuser(loginuse.getId());
		try {
			returnMap = wholesalecarService.update(dto, monads);
		} catch (IOException e) {
			returnMap.put("result", e.getMessage());
			returnMap.put("rescode", "0");
			e.printStackTrace();
		}
		return returnMap;

	}

	/**
	 * 
	 * <p>资产库   list    查看页面  </p>
	 * @param modelMap
	 * @return
	 * @author liliang
	 */
	@RequestMapping(value = Url.WHOLESALE_CARLOOK_URL, method = RequestMethod.GET)
	public String lookurl(ModelMap map) {
		return View.WHOLESALE_CARLOOK_VIEW;
	}

	/**
	 * 
	 * <p>资产库  list    分页查询方法   </p>
	 * @param modelMap
	 * @return
	 * @author liliang
	 */

	@RequestMapping(value = Url.WHOLESALE_CARLOOK_METHOD, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> lookMethod(WholesaleCarDTO dto, String start, String pageSize, ModelMap map) {
		Map<String, Object> returnMap = null;
		try {
			returnMap = wholesalecarService.carlooklist(dto, start, pageSize);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return returnMap;
	}

}
