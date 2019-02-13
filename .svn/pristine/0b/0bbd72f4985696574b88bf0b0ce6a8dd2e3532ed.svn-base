package com.yyq.car.portal.ms.web.controller;

import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.ufa.log.Logger;
import org.ufa.log.LoggerFactory;
import com.yyq.car.portal.common.dto.PaymentPlanDto;
import com.yyq.car.portal.common.model.biz.Bizpayplan;
import com.yyq.car.portal.ms.app.service.PaymentPlanService;
import com.yyq.car.portal.ms.web.constant.Url;
import com.yyq.car.portal.ms.web.constant.View;
@Controller
public class PaymentPlanController {
	private static final Logger log = LoggerFactory.getLogger(PaymentPlanController.class);
	
	@Autowired
	private PaymentPlanService paymentPlanService;
	
	/**
	 * 
	 * <p>还款计划代扣款 页面</p>
	 * @param modelMap
	 * 2018-5-10
	 * @return
	 * @author liliang
	 */
	@RequestMapping(value = Url.FINDLIST_PAYMENTPLAN_PAGE, method = RequestMethod.GET)
	public String find(ModelMap map) {
		return View.PAYMENTPLAN_STATUS_PLANLIST;
	}
	
	
	
	
	/**
	 * 
	 * <p>还款计划代扣款    分页查询方法</p>
	 * @param modelMap
     * 2018-5-10
	 * @return
	 * @author liliang
	 */
	
	@RequestMapping(value = Url.FINDLISTMETHOD_PAYMENTPLAN_METHOD, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> findPurchasingFinanceByParameter(PaymentPlanDto dto,String start, String pageSize, ModelMap map) {
		Map<String, Object> returnMap = null;
			try {
				returnMap = paymentPlanService.findPaymentPlaneByPaymentPlanDto(dto,start,pageSize);
			} catch (ParseException e) {
				log.error("还款计划代扣款....分页查询方法 出错了.."+e);
				e.printStackTrace();
			}
		return returnMap;
	}
	
	
	
	
	
	/**
	 *   还款计划详情   页面
	 * <p>还款计划   页面  通过      进入  详情   页面</p>
	 * @param modelMap
	 * @return
	 * @author liliang
	 */
	@RequestMapping(value = Url.FINDLIST_PAYMENTPLANDETAIL_PAGE, method = RequestMethod.GET)
	public String findPrototypePayCarByShop(ModelMap map,String contractId) {
	       map.put("contractId", contractId);
		   return View.PAYMENTPLAN_STATUS_PLANDETAILLIST;
	}
	
	
	/**
	 *  还款计划 分页 方法
	 * <p> 还款计划     分页查询方法</p>
	 * @param modelMap
	 * @return
	 * @author liliang
	 */
	
	@RequestMapping(value = Url.FINDDETAILLISTMETHOD_PAYMENTPLAN_METHOD, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> findCarListByShopid(PaymentPlanDto dto,String start, String pageSize, ModelMap map) {
		Map<String, Object> returnMap = null;
			try {
				returnMap = paymentPlanService.findPaymentPlaneDetailByPaymentPlanDto(dto,start,pageSize);
			} catch (ParseException e) {
				log.error("还款计划   详情列表  分页查询   出错了.."+e);
				e.printStackTrace();
			}
		return returnMap;
	}
	
	
	
	
	/**
	 *  手动扣款   方法
	 * <p> 单个对象 </p>
	 * @param modelMap
	 * @return
	 * @author liliang
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, rollbackFor = Exception.class)
	@RequestMapping(value = Url.FINDDETAILLISTMETHOD_BEGINPAYMONEY_METHOD, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> payMoneyForId(Bizpayplan dto, ModelMap map) {
		log.info("into 手动扣款方法  payMoneyForId method...........start..");
		Map<String, Object> returnMap = null;
			try {
				returnMap = paymentPlanService.payMoneyForId(dto);
			} catch (ParseException e) {
				log.error("手动扣款    出错了.."+e);
				e.printStackTrace();
			}
		log.info("into 手动扣款方法  payMoneyForId method...........end..");
		return returnMap;
	}
	
	/**
	 *  更新状态   方法
	 * <p> 批量 </p>
	 * @param modelMap
	 * @return
	 * @author liliang
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, rollbackFor = Exception.class)
	@RequestMapping(value = Url.FINDDETAILLISTMETHOD_QUERYPAYSTATUS_METHOD, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> updatePayStatus(Bizpayplan dto, ModelMap map) {
		log.info("into 手动更新状态  扣款方法  updatePayStatus method...........start..");
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", "失败了。。");
		returnMap.put("rescode", "0");
		// 先查询出需要查询状态的对象
		List<Bizpayplan> list = paymentPlanService.findListPaymentByPaystatus();
		if (null != list && list.size() > 0) {
			for (Bizpayplan entity : list) {
				try {
					paymentPlanService.updatePayStatus(entity);
				} catch (ParseException e) {
					log.error("手动查询付款状态    出错了.." + e);
					e.printStackTrace();
				}
			}
		}

		returnMap.put("result", "成功了。。");
		returnMap.put("rescode", "1");
		log.info("into 手动更新状态  扣款方法  updatePayStatus method...........end..");
		return returnMap;
	}
	
	
	
	
	}
	

