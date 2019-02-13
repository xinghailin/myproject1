package com.yyq.car.portal.ms.web.controller;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
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

import com.yyq.car.portal.common.dto.InventoryQuotationDTO;
import com.yyq.car.portal.common.dto.UserDTO;
import com.yyq.car.portal.common.model.biz.ProcurementWeeklyQuotation;
import com.yyq.car.portal.common.service.security.SecurityHelper;
import com.yyq.car.portal.ms.app.service.ProcurementWeeklyService;
import com.yyq.car.portal.ms.web.constant.Url;
import com.yyq.car.portal.ms.web.constant.View;
@Controller
public class ProcurementWeeklyController {
	private static final Logger logger = LoggerFactory.getLogger(ProcurementWeeklyController.class);
	@Autowired
	private ProcurementWeeklyService procurementWeeklyService;
	
	/**
	 * 
	 * <p>每周采购报价新增页面</p>
	 * @param modelMap
	 * @return
	 * @author liliang
	 */
	@RequestMapping(value = Url.ADD_PROCUREMENTWEEKLY_PAGE, method = RequestMethod.GET)
	public String supplierSave(ModelMap map) {
			 return View.PROCUREMENTWEEKLY_STATUS_ADD;
		}
	

	
	/**
	 * 
	 * <p>保存    每周采购数据</p>
	 * @param modelMap
	 * @return
	 * @author liliang
	 */
	@RequestMapping(value = Url.SAVE_PROCUREMENTWEEKLY, method = RequestMethod.POST)
	public @ResponseBody  Map<String, Object> saveProcurementWeekly(String dateList,String quoteName,String quoteDate){
		Map<String, Object> map = new HashMap<String, Object>();
		//[{"brand":"1","model":"3","version":"3","config":"3","color":"3","num":"","type":"3","endPrice":"3","sellPrice":"3"},{"brand":"","model":"","version":"","config":"","color":"","num":"","type":"","endPrice":"","sellPrice":""},{"brand":"","model":"","version":"","config":"","color":"","num":"","type":"","endPrice":"","sellPrice":""},{"brand":"","model":"","version":"","config":"","color":"","num":"","type":"","endPrice":"","sellPrice":""}].quoteName...11...quoteDate..null
		map.put("res", 1);
		map.put("msg", "失败");
		try {
			if(StringUtils.isBlank(quoteName)){
				map.put("msg", "报价名称不能为空");
				return map;
			}
			if(StringUtils.isBlank(quoteDate)){
				map.put("msg", "报价日期不能为空");
				return map;
			}
			if(StringUtils.isNotBlank(quoteDate)){
				if(!isMonday(quoteDate)){
					map.put("msg", "报价日期只能为每周一");
					return map;
				}
			}
			UserDTO user = SecurityHelper.getAdminUserInfo();
			Integer usreid = user.getId();
			procurementWeeklyService.saveInventoryQuotationList(dateList, quoteName, quoteDate, usreid);
			map.put("res", 0);
			map.put("msg", "成功");
		} catch (Exception e) {
			logger.info("e..."+e.getMessage());
			map.put("res", 1);
			map.put("msg", e.getMessage());
			e.printStackTrace();
		}
		
		return map;
	}
	
	
	
	/**
	 * 
	 * <p>查询数据库最新  报价信息  作为新增时的参考</p>
	 * @param modelMap
	 * @return
	 * @author liliang
	 */
	@RequestMapping(value = Url.FINLISTMAXDATE_PROCUREMENTWEEKLY, method = RequestMethod.POST)
	public @ResponseBody  List<ProcurementWeeklyQuotation> selectByMaxDate(){
		List<ProcurementWeeklyQuotation> listdate = null;
		try {
			listdate = procurementWeeklyService.selectByMaxDate();
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return listdate;
	}
	
	
	
	
	/**
	 * 
	 * <p>每日报价查看页面  针对合伙门店</p>
	 * @param modelMap
	 * @return
	 * @author liliang
	 */
	@RequestMapping(value = Url.LOOK_PROCUREMENTWEEKLY_PAGE, method = RequestMethod.GET)
	public String look(ModelMap map) {
			 return View.PROCUREMENTWEEKLY_STATUS_LOOK;
	}
	
	
	
	/**
	 * 
	 * <p>每周报价查看页面  针对合伙门店</p>
	 * @param modelMap
	 * @return
	 * @author liliang
	 */
	
	@RequestMapping(value = Url.LOOK_PROCUREMENTWEEKLY_URL, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> lookByCurrentDate(InventoryQuotationDTO dto, String start, String pageSize, ModelMap map) {
		Map<String, Object> returnMap = null;
		try {
			returnMap = procurementWeeklyService.lookByCurrentDate(dto, start, pageSize);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return returnMap;
	}
	
	
	
	
	
	
	
	
	
	
	/**
	 * 
	 * <p>每周采购报价 查询页面</p>
	 * @param modelMap
	 * @return
	 * @author liliang
	 */
	@RequestMapping(value = Url.FIND_PROCUREMENTWEEKLY_PAGE, method = RequestMethod.GET)
	public String find(ModelMap map) {
			 return View.PROCUREMENTWEEKLY_STATUS_FIND;
	}
	
	/**
	 * 
	 * <p>每周报价查查询方法</p>
	 * @param modelMap
	 * @return
	 * @author liliang
	 */
	
	@RequestMapping(value = Url.FIND_PROCUREMENTWEEKLY_URL, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> findByParameter(InventoryQuotationDTO dto, String start, String pageSize, ModelMap map) {
		Map<String, Object> returnMap = null;
		try {
			returnMap = procurementWeeklyService.lookByParameter(dto, start, pageSize);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return returnMap;
	}
	
	
	
	/**
	 * 
	 * <p> 查询一个车的  所有信息     在折线图上显示</p>
	 * @param month
	 * @return
	 * @author liliang
	 */
	@RequestMapping(value = Url.FINLISTONE_PROCUREMENTWEEKLY, method = RequestMethod.POST)
	public @ResponseBody  List<ProcurementWeeklyQuotation> finOneListByMonth(ProcurementWeeklyQuotation entity,String month){
		if(StringUtils.isBlank(month)){
			month = "1";
		}
		String start ="1";
		List<ProcurementWeeklyQuotation> listdate = null;
		try {
			listdate = procurementWeeklyService.finOneListByMonth(entity,start,month);
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return listdate;
	}
	
	
	
	
	/**
	 * 
	 * <p>进入结算价和市场价的页面 </p>
	 * @param modelMap
	 * @return
	 * @author liliang
	 */
	@RequestMapping(value = Url.FINDTWOPRICE_PROCUREMENTWEEKLY_PAGE, method = RequestMethod.GET)
	public String findTwoPrice(ModelMap map,String id,String type) {
		     map.put("id", id);
		     if("1".equals(type)){// 根据type 来区分跳转页面 如果type 为1  则为 进入结算价的 为2 是结算价和市场价的
		    	 return View.PROCUREMENTWEEKLY_STATUS_FINDONEPRICE;
		     }else{
		    	 return View.PROCUREMENTWEEKLY_STATUS_FINDTWOPRICE;
		     }
			
	}
	
	
	
	public Boolean isMonday(String date){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Boolean b =false;
        Calendar c=Calendar.getInstance();
        try {
			c.setTime(sdf.parse(date));
		} catch (ParseException e) {
			e.printStackTrace();
		}
        int weekday=c.get(Calendar.DAY_OF_WEEK);
        if(2==weekday){
        	 b = true;
        }else{
        	b = false;
        }
        return b;
	}
	
	
	
	
	}
	

