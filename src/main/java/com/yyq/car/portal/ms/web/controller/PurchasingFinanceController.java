package com.yyq.car.portal.ms.web.controller;

import java.text.ParseException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.ufa.log.Logger;
import org.ufa.log.LoggerFactory;
import com.yyq.car.portal.common.dto.BizShopTermDto;
import com.yyq.car.portal.ms.app.service.PurchasingFinanceService;
import com.yyq.car.portal.ms.web.constant.Url;
import com.yyq.car.portal.ms.web.constant.View;
@Controller
public class PurchasingFinanceController {
	private static final Logger log = LoggerFactory.getLogger(PurchasingFinanceController.class);
	
	@Autowired
	private PurchasingFinanceService purchasingFinanceService;
	
	/**
	 * 
	 * <p>采购金融 页面</p>
	 * @param modelMap
	 * 2018-5-10
	 * @return
	 * @author liliang
	 */
	@RequestMapping(value = Url.FINDLIST_PURCHASINGFINANCE_PAGE, method = RequestMethod.GET)
	public String find(ModelMap map) {
		return View.PURCHASINGFINANCE_STATUS_FINANCEDETAILLIST;
	}
	
	
	
	
	/**
	 * 
	 * <p>采购金融    分页查询方法</p>
	 * @param modelMap
     * 2018-5-10
	 * @return
	 * @author liliang
	 */
	
	@RequestMapping(value = Url.FINDLISTMETHOD_PURCHASINGFINANCE_METHOD, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> findPurchasingFinanceByParameter(BizShopTermDto dto,String start, String pageSize, ModelMap map) {
		Map<String, Object> returnMap = null;
			try {
				returnMap = purchasingFinanceService.findPurchasingFinanceByParameter(dto,start,pageSize);
			} catch (ParseException e) {
				log.error("采购金融....分页查询方法 出错了.."+e);
				e.printStackTrace();
			}
		return returnMap;
	}
	
	
	
	
	

	
	
	

	
	}
	

