
package com.yyq.car.portal.ms.app.service;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;

import com.yyq.car.portal.common.mapper.biz.BatchpayPayResponseMapper;
import com.yyq.car.portal.common.mapper.biz.BizpayplanMapper;
import com.yyq.car.portal.common.model.biz.BatchpayPayResponse;
import com.yyq.car.portal.common.model.biz.Bizpayplan;
import com.yyq.car.portal.ms.web.controller.BaofooAction;
import com.yyq.car.portal.ms.web.util.DateTimeUtil;
import com.yyq.car.portal.ms.web.util.paybaofu.rsa.RsaCodingUtil;
import com.yyq.car.portal.ms.web.util.paybaofu.util.HttpUtil;
import com.yyq.car.portal.ms.web.util.paybaofu.util.JXMConvertUtil;
import com.yyq.car.portal.ms.web.util.paybaofu.util.PostParm;
import com.yyq.car.portal.ms.web.util.paybaofu.util.ZipUtils;
/**
 * <P>定时任务  扣款</P>
 * @author liliang 
 * 2018-04-23
 * 以下接口使用宝付
 */
// @Service
//@Lazy(value = false)
public class TaskPaymentAction {
	@Autowired
	private BizpayplanMapper bizpayplanMapper;
	@Autowired
	private TaskPaymentService taskPaymentService;
	@Autowired
	private BatchpayPayResponseMapper batchpayPayResponseMapper;
	private static String CER_PATH= "CER"+File.separator;
	private Logger log = LoggerFactory.getLogger(TaskPaymentAction.class);

	
	private static Integer SUCCESS_STATUS = 1;
	
	private static Integer FAIL_STATUS = 2;
	
	private static Integer UNKNOW_STATUS = 3;
	
	@Value("${is_prduction}")
	private Boolean is_prduction;

	/**
	 * 当天 扣款
	 * @param 
	 * @param 
	 * @param 
	 * @return
	 * @author liliang
	 */
	//   @Scheduled(cron = "0 0 12 * * ? ")
	public void taskPaymentAct() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // 格式化日期
		log.info("定时任务...........  批量代扣  开始........taskPaymentAct start...");
		if(!is_prduction){
			log.info("不执行定时任务..  扣款类 .....is_prduction="+is_prduction);
			return;
		}
		Date d = new Date();
		Date paydate = DateTimeUtil.getDateBefore(d, 0);
		Bizpayplan record = new Bizpayplan();
		record.setPaytime(paydate);
		List<Bizpayplan> sendSmsBiz = bizpayplanMapper.selectByPaytimeForPay(record);// 查询出当天需要扣款的list
		log.info("..扣款日期..." + sdf.format(paydate)+".....需要扣款的个数为....." + sendSmsBiz.size());
		if (null != sendSmsBiz && sendSmsBiz.size() > 0) {
			taskPaymentService.taskPayment(sendSmsBiz, paydate);
		}
		
		log.info("定时任务...........  批量代扣  结束........taskPaymentAct end...");
		
	}

	/**
	 * 批量代扣批次查询
	 * @param 
	 * @param 
	 * @param 
	 * @return
	 * @author liliang
	 */
   //	@Scheduled(cron = "0 0 9 * * ? ")
	public void SmsPullReqortAct() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // 格式化日期
		log.info("定时任务...........  批量代扣批次查询 开始........SmsPullReqortAct start...");
		if(!is_prduction){
			log.info("不执行定时任务..  批量代扣批次查询类 .....is_prduction="+is_prduction);
			return;
		}
		BatchpayPayResponse record = new BatchpayPayResponse();
		Date d = new Date();
		// 第二天查询返回结果 故减一天
		Date paydate = DateTimeUtil.getDateBefore(d, -1);
		record.setPayDate(paydate);
		record.setPayType(SUCCESS_STATUS);// 发送成功
		record.setQueryType(FAIL_STATUS);// 查询失败
		List<BatchpayPayResponse> batchpayList = batchpayPayResponseMapper.selectByCriteria(record);
		log.info("..查询扣款日期." + sdf.format(paydate)+".....查询结果list为."+batchpayList.size());
		BatchpayPayResponse atchpayQuery = new BatchpayPayResponse();
		if (batchpayList.size() > 0) {
			String batchpayid="";
			atchpayQuery = batchpayList.get(0);
			batchpayid = atchpayQuery.getId();
			String trans_batch_id = atchpayQuery.getTransBatchId(); // 商户批次号：
			String batch_id = atchpayQuery.getBatchId();  // 宝付批次号：
			Map<String, Object> XMLArray = new HashMap<String, Object>();// 主体参数
			XMLArray.put("terminal_id", BaofooAction.getConstants().get("terminal.id"));
			XMLArray.put("member_id", BaofooAction.getConstants().get("member.id"));
			XMLArray.put("txn_sub_type", "19");
			XMLArray.put("batch_id", batch_id);
			XMLArray.put("trans_batch_id", trans_batch_id);
			XMLArray.put("trans_serial_no", "TISN" + System.currentTimeMillis());
			String XmlOrJson = "";
			JSONObject jsonObjectFromMap = JSONObject.fromObject(XMLArray);
			XmlOrJson = jsonObjectFromMap.toString();
			log.info("序列化参数：" + XmlOrJson);
			String pfxpath = BaofooAction.getWebRoot() + CER_PATH + BaofooAction.getConstants().get("pfx.name");// 商户私钥
			log.info("私钥文件路径"+pfxpath);
			log.error("私钥文件路径"+pfxpath);
			File pfxfile = new File(pfxpath);
			if (!pfxfile.exists()) {
				log.error("私钥文件不存在！");
			} else {
				String cerpath = BaofooAction.getWebRoot() + CER_PATH + BaofooAction.getConstants().get("cer.name");// 宝付公钥
				log.info("宝付公钥文件"+cerpath);
				log.error("宝付公钥文件"+cerpath);
				File cerfile = new File(cerpath);
				if (!cerfile.exists()) {// 判断宝付公钥是否为空
					log.error("宝付公钥文件不存在！");
				} else {
					byte[] gZipStr = null;
					try {
						gZipStr = ZipUtils.gZip(XmlOrJson.getBytes("UTF-8"));
					} catch (UnsupportedEncodingException e) {
						e.printStackTrace();
					}// 先压缩数据

					String data_content = RsaCodingUtil.encryptByPriPfxFile(gZipStr, pfxpath, BaofooAction
							.getConstants().get("pfx.pwd"));	// 再RSA
					String InterFace_Url = BaofooAction.getConstants().get("requestapi.url");
					String PostString = HttpUtil.RequestForm(InterFace_Url,
							PostParm.GetParmStr(XMLArray.get("txn_sub_type").toString(), data_content));
					if (PostString.isEmpty() || (null == PostString)) {
						log.error("数据返回为空值！");
					} else {

						byte[] PostStringByte = RsaCodingUtil.decryptByPubCerFileByte(PostString, cerpath);
						if (PostString.isEmpty()) {// 判断解密是否正确。如果为空则宝付公钥不正确
							log.error("=====检查解密公钥是否正确！");

						} else {

							try {
								PostString = new String(ZipUtils.unZip(PostStringByte), "UTF-8");
							} catch (UnsupportedEncodingException e) {
								e.printStackTrace();
							}
							log.info("=====返回查询数据解密结果:" + PostString);

							Map<String, Object> ArrayDataString = JXMConvertUtil.JsonConvertHashMap(PostString);// 将JSON转化为Map对象。

							log.info("转换为MAP对象：" + ArrayDataString);

							String ReturnStr = "";
							if (!ArrayDataString.containsKey("resp_code")) {
								log.error("返回参数异常！XML解析参数[resp_code]不存在");
							} else {
								if (ArrayDataString.get("resp_code").toString().equals("0000")) {
									ReturnStr = "状态码：" + ArrayDataString.get("resp_code") + ",Msg:"
											+ ArrayDataString.get("resp_msg");
									if (!ArrayDataString.containsKey("actual_info")) {
										log.error("返回参数异常！XML解析参数[actual_info]不存在");
									} else {
										Map<String, Object> Tempinfo = (Map<String, Object>) ArrayDataString.get("actual_info");
										List<Map<String, Object>> OrderList = (List<Map<String, Object>>) Tempinfo.get("info");
										if (OrderList.size() > 0) {
											for (Map<String, Object> key : OrderList) {// 分析订单相关信息
												for (String Pkey : key.keySet()) {
													String value = (String) key.get(Pkey);
													try {
														taskPaymentService.SmsPullReqort(value);
													} catch (Exception e) {
														log.error("更新 付款状态出错  出错信息为...." + value);
														e.printStackTrace();
													}
												
												}
											}
										}
										BatchpayPayResponse updaterecord = new BatchpayPayResponse();
										updaterecord.setId(batchpayid);
										updaterecord.setQueryType(SUCCESS_STATUS);// 更新表的查询状态
										updaterecord.setModifyTime(new Date());
										batchpayPayResponseMapper.updateByPrimaryKeySelective(updaterecord);

									}
								} else {
									ReturnStr = "状态码：" + ArrayDataString.get("resp_code") + ",Msg:"+ ArrayDataString.get("resp_msg");
									log.error("批量代扣批次查询 返回 状态码错误 ...错误信息.." + ReturnStr);
								}
								log.info("批量代扣批次查询 返回 状态码信息.." + ReturnStr);
								log.info("定时任务...........  批量代扣批次查询 结束........SmsPullReqortAct end...");
							}
						}
					}
				}

			}
		}
	}		


	
	
	
	

}
