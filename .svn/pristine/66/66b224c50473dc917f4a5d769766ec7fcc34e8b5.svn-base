package com.yyq.car.portal.ms.web.controller;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.ufa.log.Logger;
import org.ufa.log.LoggerFactory;
import com.yyq.car.portal.common.dto.SmsReportDTO;
import com.yyq.car.portal.ms.app.service.SmsService;
import com.yyq.car.portal.ms.web.constant.Url;
import com.yyq.car.portal.ms.web.constant.View;

@Controller
public class SmsController {
	
	@Autowired
	private SmsService smsService;
	/**
	 *进入短信状态 列表页
	 * <p>TODO</p>
	 * @param map
	 * @param shopId
	 * @return
	 * @author liliang
	 */
	@RequestMapping(value = Url.SMS_INDEX, method = RequestMethod.GET)
	public String  findMeetPage(ModelMap map,String currpage) {
		 map.put("currpage", currpage);
		 return View.MESSAGE_STATUS_INDEX;
	}
	
	
	/**
	 *  短信列表--查询
	 * <p>TODO</p>
	 * @param meet
	 * @param start
	 * @param pageSize
	 * @param map
	 * @return MANAGE_SmsReport
	 * @author liliang
	 */
	@RequestMapping(value = Url.IN_SMS, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> findSmsReport(SmsReportDTO smsReport, String start, String pageSize, ModelMap map) {
		Map<String, Object> returnMap = smsService.findAllSmsReport(smsReport, start, pageSize);
		return returnMap;
	}
}
