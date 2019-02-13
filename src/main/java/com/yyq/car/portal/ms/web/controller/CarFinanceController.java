package com.yyq.car.portal.ms.web.controller;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.ufa.log.Logger;
import org.ufa.log.LoggerFactory;

import com.yyq.car.portal.common.dto.CarFinanceDto;
import com.yyq.car.portal.common.dto.CarFinanceShopDto;
import com.yyq.car.portal.common.dto.UserDTO;
import com.yyq.car.portal.common.model.comm.Abrand;
import com.yyq.car.portal.common.service.security.SecurityHelper;
import com.yyq.car.portal.ms.app.service.BrandAndModelService;
import com.yyq.car.portal.ms.app.service.CarFinanceService;
import com.yyq.car.portal.ms.web.constant.Url;
import com.yyq.car.portal.ms.web.constant.View;
@Controller
public class CarFinanceController {
	private static final Logger log = LoggerFactory.getLogger(CarFinanceController.class);
	
	@Autowired
	private CarFinanceService carFinanceService;
	@Autowired
	private BrandAndModelService brandAndModelService;
	
	/**
	 * 
	 * <p>样车金融清单  页面</p>
	 * @param modelMap
	 * @return
	 * @author liliang
	 */
	@RequestMapping(value = Url.FINDLIST_CARFINANCE_PAGE, method = RequestMethod.GET)
	public String find(ModelMap map) {
		try {
			List<Abrand> brand = brandAndModelService.queryBrandinitial();
			map.put("brand", brand);
			// 封装好数据返回前台    包括   当前门店下的 所有未结清的车 到现在的利息
			CarFinanceShopDto dto=carFinanceService.getShopDtoInCarFinance();
			map.put("carFinanceShopDto", dto);
		} catch (Exception e) {
			log.error(" into样车金融清单  页面  出错了.."+e);
			e.printStackTrace();
		}
		return View.CARFINANCE_STATUS_FINANCEDETAILLIST;
	}
	
	
	
	
	/**
	 * 
	 * <p>样车金融清单     分页查询方法</p>
	 * @param modelMap
	 * @return
	 * @author liliang
	 */
	
	@RequestMapping(value = Url.FINDLISTMETHOD_CARFINANCE_METHOD, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> findCarFinanceByParameter(CarFinanceShopDto dto,String start, String pageSize, ModelMap map) {
		Map<String, Object> returnMap = null;
			try {
				returnMap = carFinanceService.findCarFinanceByParameter(dto,start,pageSize);
			} catch (Exception e) {
				log.error("样车金融 ....分页查询方法 出错了.."+e);
				e.printStackTrace();
			}
		return returnMap;
	}
	
	
	
	
	
	/**
	 * 
	 * <p>门店 样车金融    页面</p>
	 * @param modelMap
	 * @return
	 * @author liliang
	 */
	@RequestMapping(value = Url.SHOPLOOK_CARFINANCE_PAGE, method = RequestMethod.GET)
	public String storelook(ModelMap map) {
		 
		UserDTO user = SecurityHelper.getAdminUserInfo();
	
		try {
			// 通过登录用户查找到门店信息
			CarFinanceShopDto entity=carFinanceService.selectShopByUser(user);
			
			CarFinanceShopDto dto = null;
			if(null != entity){
				CarFinanceShopDto param = new CarFinanceShopDto();
				param.setShopId(entity.getShopId());
				// 通过门店id 查找到 该门店下 所有未结清的(包括已结清) 车 的list
				List<CarFinanceDto> listCarFinance = carFinanceService.findAllListCarByShopid(param);
				// 封装好数据返回前台    包括   当前门店下的 所有未结清的车 到现在的利息
				dto=carFinanceService.getShopDto(entity,listCarFinance);
				dto.setCredit(entity.getCredit());
				map.put("carFinanceShopDto", dto);
			}
		} catch (ParseException e) {
			log.error("进入 门店 样车金融 出错了.."+e);
			e.printStackTrace();
		}
			 return View.CARFINANCE_STATUS_FINANCESHOPLIST;
	}
	
	
	
	
	
	
	
	/**
	 * 
	 * <p>门店样车金融查看     分页查询方法</p>
	 * @param modelMap
	 * @return
	 * @author liliang
	 */
	
	@RequestMapping(value = Url.FINDSTORELISTMETHOD_CARFINANCE_METHOD, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> findSoreCarFinanceByParameter(CarFinanceShopDto dto,  String start, String pageSize,ModelMap map) {

		Map<String, Object> returnMap = new HashMap<String, Object>();
		try {
			if(StringUtils.isNotBlank(dto.getShopId())){
				returnMap = carFinanceService.findSoreCarFinanceByParameter(dto,start,pageSize);
			}else{
				List<CarFinanceDto> lst = new ArrayList<CarFinanceDto>();
				returnMap.put("result", lst);
				returnMap.put("total", 0);
			}
			
		} catch (Exception e) {
			log.error(" 门店样车金融查看     分页查询方法 出错了.."+e);
			e.printStackTrace();
		}
		return returnMap;
	
	}
	
	
	
	/**
	 * 
	 * <p>财务样车金融  门店list     页面</p>
	 * @param modelMap
	 * @return
	 * @author liliang
	 */
	@RequestMapping(value = Url.PROTOTYPEPAY_CARFINANCE_PAGE, method = RequestMethod.GET)
	public String findprototypepay(ModelMap map) {
			 return View.CARFINANCE_STATUS_FINANCEPAYSHOPLIST;
	}
	
	
	
	
	/**
	 * 
	 * <p>财务   样车金融结算     分页查询方法</p>
	 * @param modelMap
	 * @return
	 * @author liliang
	 */
	
	@RequestMapping(value = Url.FINDPROTOTYPEPAYLISTMETHOD_CARFINANCE_METHOD, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> findShopListByParameter(CarFinanceShopDto dto,String start, String pageSize, ModelMap map) {
		Map<String, Object> returnMap = null;
			try {
				returnMap = carFinanceService.findShopListByParameter(dto,start,pageSize);
			} catch (ParseException e) {
				log.error("财务   样车金融结算     分页查询方法 出错了.."+e);
				e.printStackTrace();
			}
		return returnMap;
	}
	
	
	
	
	
	/**
	 * 汽车列表  页面
	 * <p>财务样车金融  汽车详情  通过   门店列表   进入     页面</p>
	 * @param modelMap
	 * @return
	 * @author liliang
	 */
	@RequestMapping(value = Url.PROTOTYPEPAYCAR_CARFINANCE_PAGE, method = RequestMethod.GET)
	public String findPrototypePayCarByShop(ModelMap map,String shopId) {
		     try {
				CarFinanceShopDto record = new  CarFinanceShopDto();
				 record.setShopId(shopId);
				  List<CarFinanceDto> allCar = carFinanceService.findAllListCarByShopid(record);
				  CarFinanceShopDto entity =  new CarFinanceShopDto();
				  entity.setShopId(shopId);
				  CarFinanceShopDto  dto=carFinanceService.getPayCarShopDto(entity,allCar); // 封装对象  总利息 (上个月份的第一天到最后一天) 计息开始时间   计息结束时间
				  map.put("carFinanceShopDto", dto);
				  List<Abrand> brand = brandAndModelService.queryBrandinitial();
				  map.put("brand", brand);
			} catch (Exception e) {
				log.error("财务样车金融  汽车详情  通过   门店列表   进入     页面  出错了.."+e);
				e.printStackTrace();
			}
			 return View.CARFINANCE_STATUS_FINANCEPAYCARLISTBYSHOP;
	}
	
	
	/**
	 * 汽车列表  分页 方法
	 * <p>财务   样车金融结算     分页查询方法</p>
	 * @param modelMap
	 * @return
	 * @author liliang
	 */
	
	@RequestMapping(value = Url.FINDPAYCARLISTBYSHOPMETHOD_CARFINANCE_METHOD, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> findCarListByShopid(CarFinanceShopDto dto,String start, String pageSize, ModelMap map) {
		Map<String, Object> returnMap = null;
			try {
				returnMap = carFinanceService.findCarListByShopid(dto,start,pageSize);
			} catch (ParseException e) {
				log.error("财务样车金融  汽车列表  分页查询   出错了.."+e);
				e.printStackTrace();
			}
		return returnMap;
	}
	
	/**
	 * 汽车列表  结算 方法
	 * <p>财务   样车金融结算     </p>
	 * @param modelMap
	 * @return
	 * @author liliang
	 */
	
	@RequestMapping(value = Url.PAYALLSHOPMONEYBYSHOPMETHOD_CARFINANCE_METHOD, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> payAllShopMoneyByShopid(CarFinanceShopDto dto, ModelMap map) {
		Map<String, Object> returnMap = null;
			try {
				returnMap = carFinanceService.payAllShopMoneyByShopid(dto);
			} catch (Exception e) {
				log.error("财务样车金融  汽车列表  结算 方法 出错了.."+e);
				e.printStackTrace();
			}
		return returnMap;
	}	
	
	
	
	
	
	
	
	

	
	}
	

