package com.yyq.car.portal.ms.web.controller;

import java.text.ParseException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yyq.car.portal.common.model.mallcontract.MallOrderDetail;
import com.yyq.car.portal.common.vo.MallSealApplyVO;
import com.yyq.car.portal.ms.app.service.MallContractService;
import com.yyq.car.portal.ms.web.constant.Url;
import com.yyq.car.portal.ms.web.constant.View;


/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author liliang
 * @since 2018-11-5
 */
@Controller
public class MallContractController {
	@Autowired
	private MallContractService contractService;

	/**
	 * 
	 * <p>into  海外直采合同   列表页面</p>
	 * @return
	 * @author liangli
	 */
	@RequestMapping(value = Url.MALL_CONTRACT_LISTPAGE, method = RequestMethod.GET)
	public String orderDetailPage(ModelMap map) {
		return View.MALL_CONTRACT_LISTPAGE_VIEW;
	}

	/**
	 * 
	 * <p>海外直采合同   list    分页查询方法   </p>
	 * @param modelMap
	 * @return
	 * @author liliang
	 */

	@RequestMapping(value = Url.MALL_CONTRACT_METHOD, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> lookMethod(MallSealApplyVO pojo, String start, String pageSize) {
		Map<String, Object> returnMap = null;
		try {
			returnMap = contractService.list(pojo, start, pageSize);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return returnMap;
	}

	/**
	 * 
	 * <p>into  订单页面(一个合同下的订单页面)   通过海外直采合同code   列表页面</p>
	 * @return
	 * @author liangli
	 */
	@RequestMapping(value = Url.MALL_LOOKORDERBYCONTRACT_PAGE, method = RequestMethod.GET)
	public String lookOrderByContract(ModelMap map, String code) {
		map.put("sealapplycode", code);
		return View.MALL_ORDER_LISTPAGE_VIEW;
	}

	/**
	 * 
	 * <p>订单   list    分页查询方法   </p>
	 * @param modelMap
	 * @return
	 * @author liliang
	 */

	@RequestMapping(value = Url.MALL_LOOKORDERBYCONTRACT_METHOD, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> lookorderMethod(MallOrderDetail pojo, String start, String pageSize) {
		Map<String, Object> returnMap = null;
		try {
			returnMap = contractService.orderlist(pojo, start, pageSize);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return returnMap;
	}

	/**
	 * 
	 * <p>into 单辆汽车  列表页面</p>
	 * @return
	 * @author liangli
	 */
	@RequestMapping(value = Url.MALL_LOOKCARBYORDER_PAGE, method = RequestMethod.GET)
	public String lookCarByOrder(ModelMap map, String code, String currpage, String contract_code) {
		map.put("subordercode", code);
		map.put("currpage", currpage);
		map.put("contract_code", contract_code);
		return View.MALL_CAR_LISTPAGE_VIEW;
	}

	/**
	 * 
	 * <p>订单   list    分页查询方法   </p>
	 * @param modelMap
	 * @return
	 * @author liliang
	 */

	@RequestMapping(value = Url.MALL_LOOKCARBYORDER_METHOD, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> lookcarMethod(MallSealApplyVO pojo, String start, String pageSize) {
		Map<String, Object> returnMap = null;
		try {
			returnMap = contractService.carlist(pojo, start, pageSize);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return returnMap;
	}

	/**
	 * 
	 * @author xhl
	 * @param map
	 * @param currpage
	 * @param skucode
	 * @return
	 *2018年11月8日下午5:03:33
	 *
	 */
	// @RequestMapping(value = Url.mallDownPaymentAudit, method = RequestMethod.GET)
	public String downPaymentAydit(ModelMap map, String currpage, String skucode, String status) {
		map.put("currpage", currpage);
		return contractService.downPaymentAydit(map, skucode, status);
	}

	/**
	 * 
	 * @author xhl
	 * @param id
	 * @param currency
	 * @param receivedmoney
	 * @param rate
	 * @param status
	 * @return
	 *2018年11月8日下午5:03:41
	 *
	 */
	// @RequestMapping(value = Url.saveMallCarStatus, method = RequestMethod.POST)
	// @ResponseBody
	public Object saveMallCarStatus(String id, String currency, String receivedmoney, String rate, Integer status) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", false);
		try {
			contractService.saveMallCarStatus(id, currency, receivedmoney, rate, status);
			map.put("status", true);
		} catch (Exception e) {
			// TODO: handle exception
			map.put("msg", e.getMessage());
		}
		return map;
	}

}
