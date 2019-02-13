package com.yyq.car.portal.ms.web.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.ufa.log.Logger;
import org.ufa.log.LoggerFactory;

import com.yyq.car.portal.ms.app.service.TaskInventoryQuotationAction;
import com.yyq.car.portal.ms.app.service.TaskKbCarAction;
import com.yyq.car.portal.ms.app.service.TaskPaymentAction;
import com.yyq.car.portal.ms.app.service.TaskProcurementWeeklyAction;
import com.yyq.car.portal.ms.app.service.TaskSendMessageAction;
//@Controller
public class TestSmsDelegateController {
	private static final Logger logger = LoggerFactory.getLogger(TestSmsDelegateController.class);
	@Autowired
	private TaskSendMessageAction taskSendMessageAction;
	@Autowired
	private TaskPaymentAction taskPaymentAction;
	@Autowired
	private TaskInventoryQuotationAction taskInventoryQuotationAction;
	
	@Autowired
	private TaskKbCarAction taskKbCarAction;
	
	@Autowired
	private TaskProcurementWeeklyAction taskProcurementWeeklyAction;
	
	/*@RequestMapping(value ="/testSend" ,method= RequestMethod.GET)
	@ResponseBody
	public HashMap testSend(ModelMap map) {
		logger.info("发送短信测试开始", "test");
		taskSendMessageAction.smsReminderPaymentAct();
		logger.info("发送短信测试结束", "test");
		   HashMap s = new HashMap();
	       s.put("aaa", "你好啊");
	       return s;
			
		
	}
	
	@RequestMapping(value ="/testPull" ,method= RequestMethod.GET)
	@ResponseBody
	public HashMap testPull(ModelMap map) {
		logger.info("拉取短信状态开始", "test");
		taskSendMessageAction.smsPullReqortAct();
		logger.info("拉取短信状态结束", "test");
		
		   HashMap s = new HashMap();
	       s.put("aaa", "你好啊");
	       return s;
			
		
	}
	@RequestMapping(value ="/pay" ,method= RequestMethod.GET)
	@ResponseBody
	public HashMap pay(ModelMap map) {
		logger.info("进入扣款", "into");
		taskPaymentAction.taskPaymentAct();
		logger.info("进入扣款", "into");
		
		   HashMap s = new HashMap();
	       s.put("aaa", "你好啊");
	       return s;
			
		
	}
	
		
	@RequestMapping(value ="/paypull" ,method= RequestMethod.GET)
	@ResponseBody
	public HashMap paypull(ModelMap map) {
		logger.info("拉取扣款 记录 start", "into");
		taskPaymentAction.SmsPullReqortAct();
		logger.info("拉取扣款 记录 end", "into");
		
		   HashMap s = new HashMap();
	       s.put("aaa", "你好啊");
	       return s;
			
		
	}
	
	@RequestMapping(value ="/test001" ,method= RequestMethod.GET)
	@ResponseBody
	public HashMap test001(ModelMap map) {

		taskInventoryQuotationAction.taskInventoryQuotationAct();
		   HashMap s = new HashMap();
	       s.put("aaa", "你好啊");
	       return s;
			
		
	}
	@RequestMapping(value ="/test002" ,method= RequestMethod.GET)
	@ResponseBody
	public HashMap test002(ModelMap map) {

		taskKbCarAction.taskKbCarAct();
		   HashMap s = new HashMap();
	       s.put("aaa", "你好啊");
	       return s;
			
		
	}
	
	@RequestMapping(value ="/taskWeekly" ,method= RequestMethod.GET)
	@ResponseBody
	public HashMap taskWeekly(ModelMap map) {

		taskProcurementWeeklyAction.taskProcurementWeeklyAct();
		   HashMap s = new HashMap();
	       s.put("aaa", "你好啊");
	       return s;
			
		
	}*/
	
	
	
}
