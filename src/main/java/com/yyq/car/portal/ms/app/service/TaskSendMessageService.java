
package com.yyq.car.portal.ms.app.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import com.alibaba.fastjson.JSON;
import com.yyq.car.portal.common.mapper.biz.BizcontractMapper;
import com.yyq.car.portal.common.mapper.biz.BizpayplanMapper;
import com.yyq.car.portal.common.mapper.biz.SmsReportMapper;
import com.yyq.car.portal.common.mapper.comm.MessageTemplateMapper;
import com.yyq.car.portal.common.model.biz.Bizcontract;
import com.yyq.car.portal.common.model.biz.Bizpayplan;
import com.yyq.car.portal.common.model.biz.SmsReport;
import com.yyq.car.portal.common.model.comm.MessageTemplate;
import com.yyq.car.portal.ms.web.util.UUIDTool;
import com.yyq.car.portal.ms.web.util.smschuanglan.ChuangLanSmsUtil;
import com.yyq.car.portal.ms.web.util.smschuanglan.PullResult;
import com.yyq.car.portal.ms.web.util.smschuanglan.SmsSendRequest;
import com.yyq.car.portal.ms.web.util.smschuanglan.SmsVariableRequest;
import com.yyq.car.portal.ms.web.util.smschuanglan.SmsVariableResponse;
/**
 * <P>定时任务  发催款类的短信</P>
 * @author liliang 
 * 以下短信接口使用 创蓝 接口
 */
 @Service
public class TaskSendMessageService {
	@Autowired
	private MessageTemplateMapper messageTemplateMapper;
	@Autowired
	private BizpayplanMapper bizpayplanMapper;
	@Autowired
	private SmsReportMapper smsReportMapper;
	@Autowired
	private BizcontractMapper bizcontractMapper;

	private Logger log = LoggerFactory.getLogger(TaskSendMessageService.class);
	public static final String charset = "utf-8";
	// 用户平台API账号(非登录账号,示例:N1234567)
	public static String account = "N7255763";
	// 用户平台API密码(非登录密码)
	public static String pswd = "ApaZ4bLSr16380";
	// 提交短信内容的url  
	public static String smsSingleRequestServerUrl = "https://smssh1.253.com/msg/send/json";
	// 提交短信内容的url 变量短信
	public static String smsVariableRequestUrl = "https://smssh1.253.com/msg/variable/json";
	// 拉取状态报告的url
	public static String smsReportRequestUrl = "https://smssh1.253.com/msg/pull/report";
	// 状态报告
	public static String report = "true";
	// 短信类型 ck 催款类短信
	public static String smsckType = "ck_";
	// 短信类型 bx 保险类短信
	public static String smsbxType = "bx_";
	
	public static String splcon = "\\{\\$var\\}";

	public static String sppar = ",";
	// 提前天数 
	public static Integer day = 3; 
	
	// 短信模板id
	public static Integer templateId = 20;
	
	public static Integer SUCCESS_STATUS = 1; 
	public static Integer FAIL_STATUS = 2; 

	/**
	 * 提前三天还款的短信提醒
	 * @param 
	 * @param 
	 * @param 
	 * @return
	 * @author liliang
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, rollbackFor = Exception.class, timeout = 3)
	public void smsReminderPayment(Bizpayplan b) {
		  MessageTemplate messageTemplate = messageTemplateMapper.selectByPrimaryKey(templateId);
		  String msg = messageTemplate.getContent();
		  SimpleDateFormat sdfChina = new SimpleDateFormat("yyyy年MM月dd日"); // 格式化日期
		  Date now = new Date();
			// 从数据库中取出参数值
			String id = b.getId();
			String phone = b.getPhone();
			String name = b.getName();
			String paytime = sdfChina.format(b.getPaytime());
			String price = b.getPrice().toString();
			String term = b.getTerm();
			String uid = smsckType+UUIDTool.getUUID();
			// 参数组
			String params = phone + "," + name + "," + paytime + "," + price + "," + term;
			// 参数组
			String paramsContent = name + "," + paytime + "," + price + "," + term;
			log.info("发送短信的params....." + params);
				SmsVariableRequest smsVariableRequest = new SmsVariableRequest(account, pswd, msg, params, report, uid);
				String requestJson = JSON.toJSONString(smsVariableRequest);
				String response = ChuangLanSmsUtil.sendSmsByPost(smsVariableRequestUrl, requestJson);
				
				
				// 短信成功提交之后 在拉取短信状态表 sms_report 中 插入一条数据。
				SmsReport smsReport = new SmsReport();
				smsReport.setUid(uid);
				smsReport.setMobile(phone);
				String content = getParam(msg, splcon, paramsContent, sppar);
				smsReport.setContent(content);
				smsReport.setContentprefix(smsckType);
				smsReport.setContenttype(1);// 催款类的短信
				smsReport.setCreatetime(now);//创建时间 也是提交运营商时间
				smsReport.setPaydate(b.getPaytime());
				smsReport.setPayplanid(id);//存入 payplan表id   
				Bizpayplan entity = new Bizpayplan();
				entity.setId(id);
				entity.setSmssubmittime(now);// 定时任务提交时间
				entity.setSmsuid(uid);
				
				if (null != response) {// 说明 HTTP_OK =200 连接成功
					// log.info("response after request result is : " + response);
					SmsVariableResponse smsVariableResponse = JSON.parseObject(response, SmsVariableResponse.class);
					if ("1".equals(smsVariableResponse.getSuccessNum()) && "0".equals(smsVariableResponse.getFailNum())) {
						// 提交短信成功 以下是要在数据库表 biz_payplan 中更改 提交状态的
						entity.setSubmitstatus(SUCCESS_STATUS);// 设置提交短信状态为 1 成功
						entity.setSendstatus(FAIL_STATUS);// 设置用户接收短信状态为 2 失败
						
						smsReport.setSubmitstatus(SUCCESS_STATUS);// 设置提交短信状态为 1 成功
						smsReport.setSendstatus(FAIL_STATUS);// 2为失败
						
					} else {
						// 提交短信失败 以下是要在数据库表 biz_payplan 中更改 提交状态的	
						entity.setSubmitstatus(FAIL_STATUS);// 设置提交短信状态为 2 失败	
					//	entity.setSendstatus(FAIL_STATUS);
						smsReport.setSubmitstatus(FAIL_STATUS);// 2为失败
						log.error("提交短信运营商   http请求成功 但是  响应 失败...返回值response为..." + smsVariableResponse);
					}
					bizpayplanMapper.updateByPrimaryKeySelective(entity);
					smsReportMapper.insertSelective(smsReport);
					//  计划表中 保存对象
					
				} else {
					// 提交短信失败 以下是要在数据库表 biz_payplan 中更改 提交状态的	
					entity.setSubmitstatus(FAIL_STATUS);// 设置提交短信状态为 2 失败	
					bizpayplanMapper.updateByPrimaryKeySelective(entity);
					smsReport.setSubmitstatus(FAIL_STATUS);// 2为失败
					smsReportMapper.insertSelective(smsReport);
					log.error("提交短信 运营商 http请求失败 失败 requestJson为..." + requestJson + "返回值response为..." + response);
				}

		}
	

	/**
	 * 拉取短信状态
	 * @param 
	 * @param 
	 * @param 
	 * @return
	 * @author liliang
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, rollbackFor = Exception.class, timeout = 3)
	public void pullReqort(PullResult p) {
		
		Date now = new Date();
		String status = p.getStatus();
		// 更新 表sms_report 信息
		SmsReport smsReport = new SmsReport();
		String uid = p.getUid();
		String prefix = uid.substring(0, 3);
		
		

	    String msgid = p.getMsgId();
		smsReport.setUid(uid);
		smsReport.setMobile(p.getMobile());
		smsReport.setMsgid(msgid);
		smsReport.setReporttime(p.getReportTime());
		smsReport.setStatus(p.getStatus());
		smsReport.setStatusdesc(p.getStatusDesc());
		smsReport.setNotifytime(p.getNotifyTime());
		smsReport.setModefytime(now);
	
		if(smsckType.equals(prefix)){
			// 以下 是去biz_payplan 表中 改用户接收状态
			Bizpayplan b = new Bizpayplan();  // 催款
			b.setSmsuid(uid);
		    b.setSmsmodifytime(now);  // 更新时间
		    b.setSmsmsgid(msgid);
		    if ("DELIVRD".equals(status)) {// 说明 用户接收短信成功。
				smsReport.setSendstatus(SUCCESS_STATUS);// 1 为成功
				b.setSendstatus(SUCCESS_STATUS);// 设置为1 为成功
			} else {// 说明 用户接收短信失败。
				smsReport.setSendstatus(FAIL_STATUS); // 2 为失败
				b.setSendstatus(FAIL_STATUS);// 设置为2 失败
			}
			smsReportMapper.updateByPrimaryKeySelective(smsReport);
			bizpayplanMapper.updateBySmsUidAndTimeSelective(b);
		
		}else if(smsbxType.equals(prefix)){
			Bizcontract b = new Bizcontract();// 保险
			b.setSmsuid(uid);
		    b.setSmsmodifytime(now);  // 更新时间
		    b.setSmsmsgid(msgid);
		    if ("DELIVRD".equals(status)) {// 说明 用户接收短信成功。
				smsReport.setSendstatus(SUCCESS_STATUS);// 1 为成功
				b.setSendstatus(SUCCESS_STATUS);// 设置为1 为成功
			} else {// 说明 用户接收短信失败。
				smsReport.setSendstatus(FAIL_STATUS); // 2 为失败
				b.setSendstatus(FAIL_STATUS);// 设置为2 失败
			}
			smsReportMapper.updateByPrimaryKeySelective(smsReport);
			bizcontractMapper.updateBySmsUidSelective(b);
		}else{
			log.error("接收短信 出现异常类型。。。。"+uid);
		    if ("DELIVRD".equals(status)) {// 说明 用户接收短信成功。
				smsReport.setSendstatus(SUCCESS_STATUS);// 1 为成功
			
			} else {// 说明 用户接收短信失败。
				smsReport.setSendstatus(FAIL_STATUS); // 2 为失败
				
			}
			smsReportMapper.updateByPrimaryKeySelective(smsReport);
			
		}
		
		
		

	}
	
	
	
	

	/**
	 * 金融车 买保险提醒
	 * @param 
	 * @param 
	 * @param 
	 * @return
	 * @author liliang
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, rollbackFor = Exception.class, timeout = 3)
	public void smsReminderPaysafe(Bizcontract pojo) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmm"); // 格式化日期  发短信是用
		 Date now = new Date();
			
		// 短信内容
	    String msg = "尊贵的车主，您购买的车辆使用金融方案，故还款期内车险须在我司购买。您的车险即将到期，我司保险部电话4001008310";
		//手机号码
		String phone = pojo.getBphone();
		if(null ==pojo ||  StringUtils.isEmpty(phone)){
			log.info("发送短信的  保险提醒 手机号码为空 ....没有要发送的号码." );
			return ;
		}
		log.info("发送短信的  保险提醒  phone....." + phone);
	
		String uid = smsbxType+UUIDTool.getUUID();
		String sendtime = sdf.format(now);
    //    SmsSendRequest smsSingleRequest = new SmsSendRequest(account, pswd, msg, phone,report);
        SmsSendRequest smsSingleRequest = new SmsSendRequest(account, pswd, msg, phone,sendtime,report,uid);
		
		String requestJson = JSON.toJSONString(smsSingleRequest);
		
		String response = ChuangLanSmsUtil.sendSmsByPost(smsSingleRequestServerUrl, requestJson);
		
		
		SmsReport smsReport = new SmsReport();
		smsReport.setUid(uid);
		smsReport.setMobile(phone);
		smsReport.setContent(msg);
		smsReport.setContentprefix(smsbxType);
		smsReport.setContenttype(2); // 2 保险类型
		smsReport.setCreatetime(now);//创建时间 也是提交运营商时间
		smsReport.setPaydate(pojo.getMaterialoutboundtime());
		smsReport.setContractid(pojo.getId());//存入 Contract表id   
		
		Bizcontract entity = new Bizcontract();
		entity.setId(pojo.getId());
		entity.setSmssubmittime(now);// 定时任务提交时间
		entity.setSmsuid(uid);
		
		
		if (null != response) {// 说明 HTTP_OK =200 连接成功
			// log.info("response after request result is : " + response);
			SmsVariableResponse smsVariableResponse = JSON.parseObject(response, SmsVariableResponse.class);
			
			if ("0".equals(smsVariableResponse.getCode())) {
				   // 提交短信成功 以下是要在数据库表 biz_contract 中更改 提交状态的			
					// 短信成功提交之后 在拉取短信状态表 sms_report 中 插入一条数据。				
					entity.setSubmitstatus(SUCCESS_STATUS);// 设置提交短信状态为 1 成功
					entity.setSendstatus(FAIL_STATUS);// 设置用户接收短信状态为 2 失败
					smsReport.setSubmitstatus(SUCCESS_STATUS);// 设置提交短信状态为 1 成功
					smsReport.setSendstatus(FAIL_STATUS);// 2为失败
					
					bizcontractMapper.updateByPrimaryKeySelective(entity);
					smsReportMapper.insertSelective(smsReport);	
			} else {
				  // 提交短信失败 以下是要在数据库表 biz_contract 中更改 提交状态的	
					// 短信成功提交之后 在拉取短信状态表 sms_report 中 插入一条数据。
					entity.setSubmitstatus(FAIL_STATUS);// 设置提交短信状态为 2 失败	
					smsReport.setSubmitstatus(FAIL_STATUS);// 2为失败
					
					bizcontractMapper.updateByPrimaryKeySelective(entity);
					smsReportMapper.insertSelective(smsReport);
				log.error("提交短信运营商   http请求成功 但是  响应 失败...返回值response为..." + smsVariableResponse);
			}	
			//  计划表中 保存对象	
		} else {
				// 提交短信失败 以下是要在数据库表 biz_payplan 中更改 提交状态的	
				entity.setSubmitstatus(FAIL_STATUS);// 设置提交短信状态为 2 失败	
				bizcontractMapper.updateByPrimaryKeySelective(entity);
				smsReport.setSubmitstatus(FAIL_STATUS);// 2为失败
				smsReportMapper.insertSelective(smsReport);
			
			 log.error("提交短信 运营商 http请求失败 失败 requestJson为..." + requestJson + "返回值response为..." + response);
		}

		
		
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
