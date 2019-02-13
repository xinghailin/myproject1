/*******************************************************************************
 * Project   : car-ms
 * Class Name: com.yyq.car.portal.ms.app.service.NeedReportService
 * Created By: wangzh 
 * Created on: 2017年9月26日 下午7:57:13
 * Copyright © 2013-2014 YYQ All rights reserved.
 ******************************************************************************/
package com.yyq.car.portal.ms.app.service;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.apache.ibatis.session.RowBounds;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yyq.car.portal.common.dto.BizShopTermDto;
import com.yyq.car.portal.common.dto.PaymentPlanDto;
import com.yyq.car.portal.common.mapper.biz.BizShopTermMapper;
import com.yyq.car.portal.common.mapper.biz.BizpayplanMapper;
import com.yyq.car.portal.common.mapper.biz.PaymentPlanMapper;
import com.yyq.car.portal.common.model.biz.BatchpayPayResponse;
import com.yyq.car.portal.common.model.biz.Bizpayplan;
import com.yyq.car.portal.common.model.comm.Brand;
import com.yyq.car.portal.common.util.DateUtils;
import com.yyq.car.portal.ms.web.controller.BaofooAction;
import com.yyq.car.portal.ms.web.util.DateTimeUtil;
import com.yyq.car.portal.ms.web.util.UUIDTool;
import com.yyq.car.portal.ms.web.util.paybaofu.rsa.RsaCodingUtil;
import com.yyq.car.portal.ms.web.util.paybaofu.util.HttpUtil;
import com.yyq.car.portal.ms.web.util.paybaofu.util.JXMConvertUtil;
import com.yyq.car.portal.ms.web.util.paybaofu.util.PostParm;
import com.yyq.car.portal.ms.web.util.paybaofu.util.ZipUtils;


/**
 * <P>还款计划代扣款     </P>
 * @author liliang
 * 2018/05/10
 */
@Service
public class PaymentPlanService {

	@Autowired
	private PaymentPlanMapper paymentPlanMapper;
	@Autowired
	private BizpayplanMapper bizpayplanMapper;	
	
	
	private static Integer SUCCESS_STATUS = 1;
	
	private static Integer FAIL_STATUS = 2;
	
	private static Integer UNKNOW_STATUS = 3;

	private static String CER_PATH= "CER"+File.separator;
	
	private Logger log = LoggerFactory.getLogger(TaskPaymentService.class);
	/**
	* 
	* 还款计划代扣款
	* @param  通过查询条件 返回分页结果集
	* @param 查询条件  ,页码,页数 
	* @return  分页结果  
	* @author liliang
	 * @throws ParseException 
	*/
	public Map<String, Object> findPaymentPlaneByPaymentPlanDto(PaymentPlanDto record,String start,String pageSize) throws ParseException {
		Map<String, Object> map = new HashMap<String, Object>();
		int ps = Integer.parseInt(pageSize);
		int st = (Integer.parseInt(start) - 1) * ps;
		record.setPageSize(ps);
		record.setStart(st);
		if (StringUtils.isNotBlank(record.getPayStartDateString())) {
			record.setPayStartDate(DateUtils.parse(record.getPayStartDateString(), DateUtils.DEFAULT_DATE_FORMAT_DEFAULT));
		}
		if (StringUtils.isNotBlank(record.getPayEndDateString())) {
			record.setPayEndDate(DateUtils.parse(record.getPayEndDateString(), DateUtils.DEFAULT_DATE_FORMAT_DEFAULT));
		}
		List<PaymentPlanDto> lst = paymentPlanMapper.selectPaymentPlaneByPaymentPlanDto(record);
		int cmeet = paymentPlanMapper.countPaymentPlaneByPaymentPlanDto(record);
		map.put("result", lst);
		map.put("total", cmeet);
		return map;
	}
	
	
	
	
	
	/**
	* 
	* 还款计划代扣款    详情页  分页结果集
	* @param  通过查询条件 返回分页结果集
	* @param 查询条件  ,页码,页数    合同id contractId
	* @return  分页结果  
	* @author liliang
	 * @throws ParseException 
	*/
	public Map<String, Object> findPaymentPlaneDetailByPaymentPlanDto(PaymentPlanDto record,String start,String pageSize) throws ParseException {
		int ps = Integer.parseInt(pageSize);
		int st = (Integer.parseInt(start) - 1) * ps;
		record.setPageSize(ps);
		record.setStart(st);
		List<PaymentPlanDto> lst = paymentPlanMapper.selectPaymentPlaneDetailByPaymentPlanDto(record);
		int total = paymentPlanMapper.countPaymentPlaneDetailByPaymentPlanDto(record);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", lst);
		returnMap.put("total", total);
		return returnMap;
	}

	
	
	/**
	* 
	*手动扣款 方法
	* @param  Bizpayplan   对象 id
	* @author liliang
	 * @throws ParseException 
	*/
	public Map<String, Object> payMoneyForId(Bizpayplan record) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss"); // 格式化日期
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", "失败了。。");
		returnMap.put("rescode", "0");
		Bizpayplan bizpp   =  bizpayplanMapper.selectByPrimaryKey(record.getId());
		List<String> paramsList = new ArrayList<String>();
	
			if (null != bizpp) {
				String txn_amt = String.valueOf(bizpp.getPrice().multiply(BigDecimal.valueOf(100)).setScale(0));// 支付金额转换成分
				String param = bizpp.getId() + "#" + sdf.format(new Date()) + "#"
						+ bizpp.getAccountcode().replace(" ", "") + "#" + bizpp.getAccountname() + "#" + "01" + "#"
						+ bizpp.getIdentify() + "#" + bizpp.getPhone() + "#" + txn_amt + "#";
				log.info("param................."+param);
				paramsList.add(param);
			}

		
		String[] array = new String[paramsList.size()];
		String[] info = paramsList.toArray(array);
		// String[] info = new
		// String[]{"1111111#20160724143907#6222021001012345555#王勇#01#310115200501018559#15026602139#0.01#1212","3333333#20160724143907#6228480444455553333#王宝#01#340101198108118016#15026602139#0.01#35566"};
		String trans_batch_id = UUIDTool.getUUID();
		String trans_serial_no = UUIDTool.getUUID();
		Map<String, Object> XMLArray = new HashMap<String, Object>();// 主体参数

		XMLArray.put("terminal_id", BaofooAction.getConstants().get("terminal.id"));
		XMLArray.put("member_id", BaofooAction.getConstants().get("member.id"));
		XMLArray.put("txn_sub_type", "32");
		XMLArray.put("trans_batch_id", trans_batch_id);
		XMLArray.put("trans_serial_no", trans_serial_no);

		String XmlOrJson = "";

		Map<String, Object> infomap = new HashMap<String, Object>();
		infomap.put("info", info);
		XMLArray.put("actual_info", infomap);// JSON样式
		JSONObject jsonObjectFromMap = JSONObject.fromObject(XMLArray);
		XmlOrJson = jsonObjectFromMap.toString();

		String pfxpath = BaofooAction.getWebRoot() + CER_PATH + BaofooAction.getConstants().get("pfx.name");// 商户私钥
		File pfxfile = new File(pfxpath);
		if (!pfxfile.exists()) {
			log.error("私钥文件不存在！");
		}
		String cerpath = BaofooAction.getWebRoot() + CER_PATH + BaofooAction.getConstants().get("cer.name");// 宝付公钥
		File cerfile = new File(cerpath);
		if (!cerfile.exists()) {// 判断宝付公钥是否为空
			log.error("宝付公钥文件不存在！");
		}

		log.info("序列化参数：" + XmlOrJson);

		byte[] gZipStr = null;
		try {
			gZipStr = ZipUtils.gZip(XmlOrJson.getBytes("UTF-8"));
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}// 先压缩数据

		String data_content = RsaCodingUtil.encryptByPriPfxFile(gZipStr, pfxpath,
				BaofooAction.getConstants().get("pfx.pwd"));	// 再RSA
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

				if (!ArrayDataString.containsKey("resp_code")) {
					log.error("返回参数异常！XML解析参数[resp_code]不存在");
				} else {

				
					Integer paytype = FAIL_STATUS;
					if (ArrayDataString.get("resp_code").toString().equals("0000")) {
						paytype = SUCCESS_STATUS;// 成功
					} else {
						log.error("批量 扣款 提交 失败 requestJson为" + ArrayDataString.get("resp_code"));
					}
					Date now = new Date();
					   Bizpayplan bizppnew = new Bizpayplan();
					   bizppnew.setId(bizpp.getId());
					   bizppnew.setSendPayStatus(paytype);//标记 是否发送成功
					   bizppnew.setPaysubmittime(now); 
					   bizppnew.setTransBatchId(trans_batch_id);
					   bizppnew.setTransSerialNo(trans_serial_no);
					   bizppnew.setBatchId(ArrayDataString.get("batch_id").toString());
					   bizppnew.setBatchId(ArrayDataString.get("member_id").toString());
					   bizppnew.setPayType(2);//手动扣款 标记为
					   bizppnew.setPayStatus(UNKNOW_STATUS);// 方便查询 状态
					   bizppnew.setPaymodifytime(null);
					   bizpayplanMapper.updateByPrimaryKeySelective(bizppnew);
					
				}
			}

		}
		
		returnMap.put("result", "成功了。。");
		returnMap.put("rescode", "1");
		return returnMap;
	}
	
	
	/**
	* 
	*  付款状态为 处理中 3   的结果集
	* @param  通过查询条件 返回分页结果集
	* @return  分页结果  
	* @author liliang
	 * @throws ParseException 
	*/
	public List<Bizpayplan> findListPaymentByPaystatus()  {
		Bizpayplan  entity = new Bizpayplan();
		entity.setPayStatus(3);
		List<Bizpayplan> lst = bizpayplanMapper.selectByCriteria(entity);
		return lst;
	}

	
	
	
	/**
	* 
	*  更新状态方法
	* @param  Bizpayplan   
	* @author liliang
	 * @throws ParseException 
	*/
	public void updatePayStatus(Bizpayplan bizpayplan) throws ParseException {
		
			String trans_id=bizpayplan.getId();//商户订单号
			Map<String, Object> XMLArray = new HashMap<String, Object>();// 主体参数
			XMLArray.put("txn_sub_type", "20");
	        XMLArray.put("terminal_id", BaofooAction.getConstants().get("terminal.id"));
	        XMLArray.put("member_id", BaofooAction.getConstants().get("member.id"));         
	        XMLArray.put("trans_id", trans_id);
	        XMLArray.put("trans_serial_no", "TISN"+System.currentTimeMillis()); 
	        
	        
	        
			String XmlOrJson = "";
			JSONObject jsonObjectFromMap = JSONObject.fromObject(XMLArray);
			XmlOrJson = jsonObjectFromMap.toString();
			log.info("序列化参数：" + XmlOrJson);
			String pfxpath = BaofooAction.getWebRoot() + CER_PATH + BaofooAction.getConstants().get("pfx.name");// 商户私钥
			File pfxfile = new File(pfxpath);
			if (!pfxfile.exists()) {
				log.error("私钥文件不存在！");
			} else {
				String cerpath = BaofooAction.getWebRoot() + CER_PATH + BaofooAction.getConstants().get("cer.name");// 宝付公钥
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
									ReturnStr = "状态码：" + ArrayDataString.get("resp_code") + ",Msg:"+ ArrayDataString.get("resp_msg");
									if (!ArrayDataString.containsKey("order_info")) {
										log.error("返回参数异常！XML解析参数[order_info]不存在");
									} else {
										Map<String, Object> Tempinfo = (Map<String, Object>) ArrayDataString.get("order_info");
										log.info("Tempinfo...."+Tempinfo);
                                        String order_stat = (String) Tempinfo.get("order_stat");
                                        String resp_code = (String) Tempinfo.get("resp_code");
                                        String resp_msg = (String) Tempinfo.get("resp_msg");
                                        Bizpayplan bizpayplannew = new Bizpayplan();
                                        bizpayplannew.setId(bizpayplan.getId());
										if ("S".equals(order_stat)) {// 成功
											bizpayplannew.setPayStatus(SUCCESS_STATUS);
										} else if("F".equals(order_stat)){// 失败
											bizpayplannew.setPayStatus(FAIL_STATUS);
										} else {
											bizpayplannew.setPayStatus(UNKNOW_STATUS);
										}
										bizpayplannew.setQueryPayOrderStat(order_stat);
										bizpayplannew.setQueryPayRespCode(resp_code);
										bizpayplannew.setQueryPayRespMsg(resp_msg);
										bizpayplannew.setPaymodifytime(new Date());
										bizpayplanMapper.updateByPrimaryKeySelective(bizpayplannew);
										
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
