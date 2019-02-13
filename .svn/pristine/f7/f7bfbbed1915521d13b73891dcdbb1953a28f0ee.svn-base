
package com.yyq.car.portal.ms.app.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Lazy;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import com.alibaba.fastjson.JSON;
import com.yyq.car.portal.common.mapper.biz.BizcontractMapper;
import com.yyq.car.portal.common.mapper.biz.BizpayplanMapper;
import com.yyq.car.portal.common.mapper.biz.SmsReportMapper;
import com.yyq.car.portal.common.mapper.comm.MessageTemplateMapper;
import com.yyq.car.portal.common.model.biz.Bizcontract;
import com.yyq.car.portal.common.model.biz.Bizpayplan;
import com.yyq.car.portal.ms.web.util.DateTimeUtil;
import com.yyq.car.portal.ms.web.util.smschuanglan.ChuangLanSmsUtil;
import com.yyq.car.portal.ms.web.util.smschuanglan.PullResult;
import com.yyq.car.portal.ms.web.util.smschuanglan.SmsReportRequest;
import com.yyq.car.portal.ms.web.util.smschuanglan.SmsReportResponse;
/**
 * <P>定时任务  发催款类的短信</P>
 * @author liliang 
 * 以下短信接口使用 创蓝 接口
 */
 @Service
 @Lazy(value = false)
public class TaskSendMessageAction {
	@Autowired
	private MessageTemplateMapper messageTemplateMapper;
	@Autowired
	private BizpayplanMapper bizpayplanMapper;
	@Autowired
	private SmsReportMapper smsReportMapper;
	
	@Autowired
	private TaskSendMessageService taskSendMessageService;
	
	@Autowired
	private BizcontractMapper bizcontractMapper;

	private Logger log = LoggerFactory.getLogger(TaskSendMessageAction.class);
	public static final String charset = "utf-8";
	// 用户平台API账号(非登录账号,示例:N1234567)
	public static String account = "N7255763";
	// 用户平台API密码(非登录密码)
	public static String pswd = "ApaZ4bLSr16380";
	// 提交短信内容的url
	public static String smsVariableRequestUrl = "https://smssh1.253.com/msg/variable/json";
	// 拉取状态报告的url
	public static String smsReportRequestUrl = "https://smssh1.253.com/msg/pull/report";
	// 状态报告
	public static String report = "true";
	// 短信类型 ck 催款类短信
	public static String smsType = "ck";

	public static String splcon = "\\{\\$var\\}";

	public static String sppar = ",";
	// 提前天数 
	public static Integer day = 3; 
	
	// 短信模板id
	public static Integer templateId = 20;
	
	@Value("${is_prduction}")
	private Boolean is_prduction;

	/**
	 * 提前三天还款的短信提醒
	 * @param 
	 * @param 
	 * @param 
	 * @return
	 * @author liliang
	 */
	@Scheduled(cron = "0 10 12 * * ? ")
	public void smsReminderPaymentAct() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // 格式化日期
		log.info(" 定时任务...task.......发送短信状态开始...............start" );
		if(!is_prduction){
			log.info("不执行定时任务..短信提醒.....is_prduction="+is_prduction);
			return;
		}
		// 参数组
		// String params = "1502660213*,姓名,2018年06月16日,8655.00,第一期";
		// 获得 当前的日期 并且减三天 然后查询数据库符合条件的数据
	    Date d = new Date(); 
	    Date date = DateTimeUtil.getDateBefore(d, day);
	    // 以下是催款类短信
		Bizpayplan record = new Bizpayplan();
		record.setPaytime(date);
		List<Bizpayplan> sendSmsBiz = bizpayplanMapper.selectByPaytime(record);
		log.info(".....扣款日期(当前日期+3天)为"+sdf.format(date)+"发送催款短信的手机号码个数为....." + sendSmsBiz.size());
		for (Bizpayplan b : sendSmsBiz) {
			try {
				taskSendMessageService.smsReminderPayment(b);
			} catch (Exception e) {
				log.info("发送 催款类 短信信息时  出错。。"+b);
				e.printStackTrace();
			}	

		}
		 // 以下是保险类短信
		 Date now = new Date();
		 List<String> dates = new ArrayList<String>();
		 for (int i = 1; i < 11; i++) {
				int days = -(i * 365 -90);// materialoutboundtime 一年后,两年后....十年后...
				Date querydate = DateTimeUtil.getDateBefore(now,days);
               String datetime = sdf.format(querydate);
				dates.add(datetime);
			}
		 
		 log.info("日期...."+dates.toString());
		/* bizcontract.setFinance("1"); */ // 金融构成的才发
		 List<Bizcontract> sendSmsBizcontract =bizcontractMapper.selectByCriteriaforSMS(dates); 
		 log.info("发送保险短信的手机号码个数为....." + sendSmsBizcontract.size());
		 for (Bizcontract pojo : sendSmsBizcontract) {
			   try {
					taskSendMessageService.smsReminderPaysafe(pojo);
				} catch (Exception e) {
					log.info("发送保险类 时  出错。。");
					e.printStackTrace();
				}
		 }
		
		
		log.info(" 定时任务...task.......发送短信状态结束...............end" );
	}

	/**
	 * 拉取短信状态
	 * @param 
	 * @param 
	 * @param 
	 * @return
	 * @author liliang
	 */
	@Scheduled(cron = "0 0 13 * * ? ")
	public void smsPullReqortAct() {
		
		log.info(" 定时任务...task.......拉取短信状态开始...............start" );
		if(!is_prduction){
			log.info("不执行定时任务..。.... 拉取短信状态...is_prduction="+is_prduction);
			return;
		}
		// 状态报告拉取条数
		String count = "100";

		SmsReportRequest smsReportRequest = new SmsReportRequest(account, pswd, count);
		String requestJson = JSON.toJSONString(smsReportRequest);

		log.info(" 进入拉取短信状态报告  before request string is: " + requestJson);
		Boolean issend = true;// 标记是否还要去请求拉取数据；
		do {
           log.info("into while 循环..........................................................");
			String response = ChuangLanSmsUtil.sendSmsByPost(smsReportRequestUrl, requestJson);
          // String response ="{\"ret\":0,\"result\":[{\"uid\":\"ck_6c00271f3d4844649b2e8e8f47f0d365\",\"statusDesc\":\"短信发送成功\",\"notifyTime\":\"180523161748\",\"mobile\":\"18516510080\",\"msgId\":\"18052316174422898\",\"reportTime\":\"1805231617\",\"status\":\"DELIVRD\"}]}";

			log.info("短信状态 返回信息.......... "+response);
			if (null != response) {// 说明 HTTP_OK =200 连接成功
				// log.info("response after request result is : " + response);
				SmsReportResponse smsReportRespnse = JSON.parseObject(response, SmsReportResponse.class);
				if ("0".equals(smsReportRespnse.getRet())) {// 请求状态。0成功 其他状态为失败
					List<PullResult> resultList = smsReportRespnse.getResult();
					log.info("拉取短信状态报告个数为....."+resultList.size());
					if (resultList.size() > 0) { // 说明有对象。可以开始解析
						for (PullResult p : resultList) {
							try {
								taskSendMessageService.pullReqort(p);
							} catch (Exception e) {
								System.out.println("保存 拉取短信信息时 出错。。"+p);
								e.printStackTrace();
							}

						}
					} else {// 请求成功并且没有数据可以拉取时
						issend = false;
					}
				} else {
					issend = false;
					log.error("短信拉取获取失败...返回值对象smsReportRespnse为..." + smsReportRespnse.toString());
				}
			} else {
				issend = false;
				log.error("短信拉取请求失败 requestJson为..." + requestJson + "返回值response为..." + response);
			}

		} while (issend);
		log.info(" 定时任务...task.......拉取短信状态结束...............end" );
	}

	/*
	 * @param content "温馨提醒：{$var}您好，您融资租赁租金于{$var}到期，请在银行卡中有足额资金，金额为{$var}元{$var}。";
	 * @param spc "\\{\\$var\\}";
	 * @param params "李良,2018-05-26,856.33,第四十八期";
	 * @param spp ","; return sub 温馨提醒：李良您好，您融资租赁租金于2018-05-26到期，请在银行卡中有足额资金，金额为856.33元第四十八期 根据
	 * 短信模板和参数 拼接成内容 返回 存入到 短信状态表 (sms_report)
	 */

	static String getParam(String content, String spc, String params, String spp) {
		String sub = new String();
		String[] d = content.split(spc);
		String[] c = params.split(spp);
		for (int i = 0; i < c.length; i++) {
			sub = sub + d[i] + c[i];

		}
		return sub;

	}

}
