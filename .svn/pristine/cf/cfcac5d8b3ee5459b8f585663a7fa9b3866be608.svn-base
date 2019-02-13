package com.yyq.car.portal.ms.app.service;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.yyq.car.portal.common.mapper.biz.BatchpayPayResponseMapper;
import com.yyq.car.portal.common.mapper.biz.BizpayplanMapper;
import com.yyq.car.portal.common.model.biz.BatchpayPayResponse;
import com.yyq.car.portal.common.model.biz.Bizpayplan;
import com.yyq.car.portal.ms.web.controller.BaofooAction;
import com.yyq.car.portal.ms.web.util.UUIDTool;
import com.yyq.car.portal.ms.web.util.paybaofu.rsa.RsaCodingUtil;
import com.yyq.car.portal.ms.web.util.paybaofu.util.HttpUtil;
import com.yyq.car.portal.ms.web.util.paybaofu.util.JXMConvertUtil;
import com.yyq.car.portal.ms.web.util.paybaofu.util.PostParm;
import com.yyq.car.portal.ms.web.util.paybaofu.util.ZipUtils;


/**
 * <P>定时任务  扣款</P>
 * @author liliang 
 * 以下接口使用宝付
 */
@Service
public class TaskPaymentService {
	@Autowired
	private BizpayplanMapper bizpayplanMapper;
	@Autowired
	private BatchpayPayResponseMapper batchpayPayResponseMapper;

	private Logger log = LoggerFactory.getLogger(TaskPaymentService.class);

	private static Integer SUCCESS_STATUS = 1;

	private static Integer FAIL_STATUS = 2;

	private static Integer UNKNOW_STATUS = 3;

	private static String CER_PATH = "CER" + File.separator;

	/**
	 * 当天 扣款 service
	 * @param 
	 * @param 
	 * @param 
	 * @return
	 * @author liliang
	 * 
	 * 加商户流水号和批次号
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, rollbackFor = Exception.class)
	public void taskPayment(List<Bizpayplan> bizplanList, Date paydate) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss"); // 格式化日期
		Date now = new Date();
		StringBuffer ids = new StringBuffer();
		ids.append(",");
		if (bizplanList.size() > 0 && bizplanList.size() < 5000) {
			List<String> paramsList = new ArrayList<String>();
			for (Bizpayplan bizpp : bizplanList) {
				if (null != bizpp) {
					ids.append(bizpp.getId() + ",");
					String txn_amt = String.valueOf(bizpp.getPrice().multiply(BigDecimal.valueOf(100)).setScale(0));// 支付金额转换成分
					String param = bizpp.getId() + "#" + sdf.format(new Date()) + "#" + bizpp.getAccountcode().replace(" ", "") + "#" + bizpp.getAccountname()
							+ "#" + "01" + "#" + bizpp.getIdentify() + "#" + bizpp.getPhone() + "#" + txn_amt + "#";
					paramsList.add(param);
				}

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

			// String pfxpath = BaofooAction.getWebRoot() + "CER\\" +
			// BaofooAction.getConstants().get("pfx.name");// 商户私钥
			String pfxpath = BaofooAction.getWebRoot() + CER_PATH + BaofooAction.getConstants().get("pfx.name");// 商户私钥
			File pfxfile = new File(pfxpath);
			log.info("私钥文件地址....！" + pfxpath);
			log.error("私钥文件地址....！" + pfxpath);
			if (!pfxfile.exists()) {
				log.error("私钥文件不存在！");
			}
			String cerpath = BaofooAction.getWebRoot() + CER_PATH + BaofooAction.getConstants().get("cer.name");// 宝付公钥
			File cerfile = new File(cerpath);
			log.info("宝付公钥地址....！" + cerpath);
			log.error("宝付公钥地址....！" + cerpath);
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

			String data_content = RsaCodingUtil.encryptByPriPfxFile(gZipStr, pfxpath, BaofooAction.getConstants().get("pfx.pwd"));	// 再RSA
			String InterFace_Url = BaofooAction.getConstants().get("requestapi.url");
			String PostString = HttpUtil.RequestForm(InterFace_Url, PostParm.GetParmStr(XMLArray.get("txn_sub_type").toString(), data_content));
			if (PostString.isEmpty() || (null == PostString)) {
				for (Bizpayplan bizpp : bizplanList) {
					bizpp.setSendPayStatus(FAIL_STATUS);// 标记 是否发送成功
					bizpp.setPayStatus(FAIL_STATUS);//
					bizpp.setPaysubmittime(now);
					bizpp.setTransBatchId(trans_batch_id);
					bizpp.setTransSerialNo(trans_serial_no);
					bizpayplanMapper.updateByPrimaryKeySelective(bizpp);
				}
				log.error("数据返回为空值！");
			} else {
				byte[] PostStringByte = RsaCodingUtil.decryptByPubCerFileByte(PostString, cerpath);
				if (PostString.isEmpty()) {// 判断解密是否正确。如果为空则宝付公钥不正确
					for (Bizpayplan bizpp : bizplanList) {
						bizpp.setSendPayStatus(FAIL_STATUS);// 标记 是否发送成功
						bizpp.setPayStatus(FAIL_STATUS);//
						bizpp.setPaysubmittime(now);
						bizpp.setTransBatchId(trans_batch_id);
						bizpp.setTransSerialNo(trans_serial_no);
						bizpayplanMapper.updateByPrimaryKeySelective(bizpp);
					}
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
						for (Bizpayplan bizpp : bizplanList) {
							bizpp.setSendPayStatus(FAIL_STATUS);// 标记 是否发送成功
							bizpp.setPayStatus(FAIL_STATUS);//
							bizpp.setPaysubmittime(now);
							bizpp.setTransBatchId(trans_batch_id);
							bizpp.setTransSerialNo(trans_serial_no);
							bizpayplanMapper.updateByPrimaryKeySelective(bizpp);
						}

						log.error("返回参数异常！XML解析参数[resp_code]不存在");
					} else {

						BatchpayPayResponse batchpayPayres = new BatchpayPayResponse();
						Integer paytype = FAIL_STATUS;
						Integer planpaystatus = UNKNOW_STATUS;
						batchpayPayres.setId(UUIDTool.getUUID());
						batchpayPayres.setBatchId(ArrayDataString.get("batch_id").toString());
						batchpayPayres.setCreatTime(now);
						batchpayPayres.setMemberId(ArrayDataString.get("member_id").toString());
						batchpayPayres.setPayids(ids.toString());// 批次id集合
						batchpayPayres.setRespCode(ArrayDataString.get("resp_code").toString());
						batchpayPayres.setRespMsg(ArrayDataString.get("resp_msg").toString());
						batchpayPayres.setTerminalId(ArrayDataString.get("terminal_id").toString());
						if (ArrayDataString.get("resp_code").toString().equals("0000")) { // 判断发送成功还是失败
							paytype = SUCCESS_STATUS;// 成功
						} else {
							paytype = FAIL_STATUS;// 失败
							planpaystatus = FAIL_STATUS;
							log.error("批量 扣款 提交 失败 requestJson为" + ArrayDataString.get("resp_code"));
						}

						batchpayPayres.setPayType(paytype);// 发送状态
						batchpayPayres.setQueryType(FAIL_STATUS);// 查询状态 默认2
						batchpayPayres.setTransBatchId(trans_batch_id);// 商户批次号
						batchpayPayres.setPayDate(paydate);
						batchpayPayResponseMapper.insertSelective(batchpayPayres); //

						for (Bizpayplan bizpp : bizplanList) {
							bizpp.setSendPayStatus(paytype);
							bizpp.setPayStatus(planpaystatus);    // 扣款为2 失败或者 3 提交成功 但不知道扣款是否成功的状态
							bizpp.setPaysubmittime(now);
							bizpp.setTransBatchId(trans_batch_id);
							bizpp.setTransSerialNo(trans_serial_no);
							bizpayplanMapper.updateByPrimaryKeySelective(bizpp);
						}
					}
				}

			}

		} else {
			log.error("扣款记录数不符合要求  大于5000 或者小于0" + bizplanList.size());
		}

	}

	/**
	 * 保存查询状态  即 更新biz_payplan 表字段
	 * @param 
	 * @param 
	 * @param 
	 * @return
	 * @author liliang
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, rollbackFor = Exception.class)
	public void SmsPullReqort(String value) {
		String[] splitvalue = value.split("#");
		if (splitvalue.length >= 4) {
			Bizpayplan bizpayplan = new Bizpayplan();
			bizpayplan.setId(splitvalue[0]);
			String order_stat = splitvalue[1];
			if ("S".equals(order_stat)) {// 成功
				bizpayplan.setPayStatus(SUCCESS_STATUS);
			} else if ("F".equals(order_stat)) {// 失败
				bizpayplan.setPayStatus(FAIL_STATUS);
			} else {
				bizpayplan.setPayStatus(UNKNOW_STATUS);
			}
			bizpayplan.setQueryPayOrderStat(order_stat);
			bizpayplan.setQueryPayRespCode(splitvalue[2]);
			bizpayplan.setQueryPayRespMsg(splitvalue[3]);
			bizpayplan.setPaymodifytime(new Date());
			bizpayplanMapper.updateByPrimaryKeySelective(bizpayplan);
		}
	}

}
