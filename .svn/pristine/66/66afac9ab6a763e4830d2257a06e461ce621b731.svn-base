package com.yyq.car.portal.ms.app.service;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang.StringUtils;
import org.apache.ibatis.session.RowBounds;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.esotericsoftware.minlog.Log;
import com.timevale.esign.sdk.tech.bean.PosBean;
import com.timevale.esign.sdk.tech.bean.SignPDFStreamBean;
import com.timevale.esign.sdk.tech.bean.result.FileDigestSignResult;
import com.timevale.esign.sdk.tech.bean.result.Result;
import com.timevale.esign.sdk.tech.impl.constants.SignType;
import com.timevale.esign.sdk.tech.v3.client.ServiceClient;
import com.yyq.car.portal.common.constant.Constants;
import com.yyq.car.portal.common.constant.FileTypeEnum;
import com.yyq.car.portal.common.exception.PortalBizCheckedException;
import com.yyq.car.portal.common.mapper.biz.SmsReportMapper;
import com.yyq.car.portal.common.mapper.jnd.JndbuyMapper;
import com.yyq.car.portal.common.mapper.jnd.JndneedMapper;
import com.yyq.car.portal.common.mapper.jnd.JndsubneedMapper;
import com.yyq.car.portal.common.mapper.jnd.jndSiteMapper;
import com.yyq.car.portal.common.mapper.mall.CarsourceFileMapper;
import com.yyq.car.portal.common.mapper.mallcontract.JndCarorderDetailMapper;
import com.yyq.car.portal.common.mapper.mallcontract.MallCarorderDetailMapper;
import com.yyq.car.portal.common.mapper.mallcontract.MallOrderDetailMapper;
import com.yyq.car.portal.common.mapper.mallcontract.MallSealApplyMapper;
import com.yyq.car.portal.common.model.biz.SmsReport;
import com.yyq.car.portal.common.model.jnd.Jndbuy;
import com.yyq.car.portal.common.model.jnd.Jndneed;
import com.yyq.car.portal.common.model.jnd.Jndsubneed;
import com.yyq.car.portal.common.model.jnd.jndSite;
import com.yyq.car.portal.common.model.mall.CarsourceFile;
import com.yyq.car.portal.common.model.mallcontract.JndCarorderDetail;
import com.yyq.car.portal.common.model.mallcontract.MallOrderDetail;
import com.yyq.car.portal.common.model.mallcontract.MallSealApply;
import com.yyq.car.portal.common.service.ResourcePersistenceService;
import com.yyq.car.portal.common.service.SnowflakeIdWorker;
import com.yyq.car.portal.common.util.DateUtils;
import com.yyq.car.portal.common.util.StringTools;
import com.yyq.car.portal.common.util.StringUtil;
import com.yyq.car.portal.ms.web.util.BeanStatus;
import com.yyq.car.portal.ms.web.util.UUIDTool;
import com.yyq.car.portal.ms.web.util.smschuanglan.ChuangLanSmsUtil;
import com.yyq.car.portal.ms.web.util.smschuanglan.SmsSendRequest;
import com.yyq.car.portal.ms.web.util.smschuanglan.SmsVariableResponse;
import com.yyq.car.portal.ms.web.util.tsign.core.InitClientHelper;
import com.yyq.car.portal.ms.web.util.tsign.core.SignHelper;
import com.yyq.car.portal.ms.web.util.tsign.exception.TSignException;


/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author liliang
 * @since 2018-10-23
 */
@Service
public class MallSealApplyService {

	@Autowired
	private MallSealApplyMapper SealApplyMapper;

	@Autowired
	private ResourcePersistenceService resourceService;

	@Autowired
	private SnowflakeIdWorker snowflakeIdWorker;

	@Autowired
	private SmsReportMapper smsReportMapper;

	@Autowired
	private MallOrderDetailMapper orderDetailMapper;

	@Autowired
	private JndneedMapper jndneedMapper;

	@Autowired
	private JndbuyMapper jndbuyMapper;

	@Autowired
	private jndSiteMapper siteMapper;

	@Autowired
	private JndsubneedMapper subneedMapper;

	@Autowired
	private MallCarorderDetailMapper carorderDetailMapper;

	@Autowired
	private JndCarorderDetailMapper jndCarorderDetailMapper;
	
	@Autowired
	CarsourceFileMapper sourcefileMapper;

	// 短信类型gz 盖章类短信
	public String smsbxType = "gz_";
	// 状态报告
	public String report = "true";
	public static Integer SUCCESS_STATUS = 1;
	public static Integer FAIL_STATUS = 2;

	@Value("${PROJECT_ID}")
	private String PROJECT_ID;
	@Value("${organizeAccountId}")
	private String organizeAccountId;
	@Value("${organizeSealData}")
	private String organizeSealData;
	@Value("${ftp.address}")
	private String ftpaddress;
	@Value("${account}")
	private String account;
	@Value("${pswd}")
	private String pswd;
	@Value("${smsSingleRequestServerUrl}")
	private String smsSingleRequestServerUrl;

	private Logger logger = LoggerFactory.getLogger(MallSealApplyService.class);

	/**
	* 
	* 合同盖章       分页结果集
	* @param  通过查询条件 返回分页结果集
	* @param 查询条件  ,页码,页数   
	* @return  分页结果  
	* @author liliang
	*/
	public Map<String, Object> list(MallSealApply vo, String start, String pageSize) throws ParseException {
		int ps = Integer.parseInt(pageSize);
		vo.setStatus(BeanStatus.OK.getKey());
		List<MallSealApply> list = SealApplyMapper.selectByCriteria(vo, new RowBounds((Integer.parseInt(start) - 1) * ps, ps));
		int total = SealApplyMapper.countByCriteria(vo);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", list);
		returnMap.put("total", total);
		return returnMap;
	}

	/**
	 * <p>根据id 获取对象</p>
	 * @author liliang
	 * @throws Exception 
	 */
	public MallSealApply loadById(String id) {
		MallSealApply mallSealApply = SealApplyMapper.selectByPrimaryKey(id);
		return mallSealApply;
	}

	/**
	 * <p>根据参数  获取对象     的list</p>
	 * @author liliang
	 * @throws Exception 
	 */
	public List<MallSealApply> loadByParam(MallSealApply mallSealApply) {
		List<MallSealApply> mallSealApplyList = SealApplyMapper.selectByCriteria(mallSealApply);
		return mallSealApplyList;
	}

	/**
	 * <p>update  新建盖章合同</p>
	 * @author liliang
	 * @throws IOException 
	 * @throws Exception 
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, rollbackFor = Exception.class)
	public void update(MallSealApply pojo, String loginname) throws IOException {
		Date now = new Date();
		String orderids = pojo.getOrderids();
		List<MallOrderDetail> orderDetailList = new ArrayList<MallOrderDetail>();
		List<MallOrderDetail> orderDetailListnotContract = new ArrayList<MallOrderDetail>();
		MallOrderDetail orderDetailContract = null;// 已绑定合同
		String username = "";
		if (StringUtils.isNotEmpty(orderids)) {
			String[] orderids_s = orderids.split(",");
			List<String> orderidsList = Arrays.asList(orderids_s);
			orderDetailList = orderDetailMapper.selectListBycodes(orderidsList);
			for (MallOrderDetail loadorderdetail : orderDetailList) {
				if (1 == loadorderdetail.getIssealapply().intValue() && 3 == loadorderdetail.getOrderstatus().intValue()) {
					orderDetailListnotContract.add(loadorderdetail);
				} else {
					// 已绑定合同的赋值
					orderDetailContract = loadorderdetail;
				}
			}

			username = orderDetailList.get(0).getUsername();// 下单人
			if (orderDetailListnotContract.size() != orderidsList.size()) {
				throw new RuntimeException("此合同中 关联的订单有无效或者已绑定合同的, 不能保存 。请重新选择。有问题的订单code为" + orderDetailContract.getCode());
			}
			for (MallOrderDetail detail : orderDetailList) {
				if (detail.getIssealapply().intValue() == 2) {
					throw new RuntimeException("此合同中 关联的订单" + detail.getCode() + "已绑定合同了不能保存 ");
				}
			}

		} else {
			throw new RuntimeException(" 此合同关联的订单code 为空, 不能保存");
		}

		MallSealApply sealApply = new MallSealApply();
		sealApply.setId(UUIDTool.getUUID());
		if (!pojo.getContractfile().isEmpty()) {
			String name1 = pojo.getContractfile().getOriginalFilename();
			boolean hasdot = false;
			if (StringUtils.isNotBlank(name1)) {
				int dot = name1.lastIndexOf(".");
				if (dot > 0) {
					hasdot = true;
					name1 = name1.substring(dot);
				}
			}
			String path1 = uploadFileFTP(pojo.getContractfile(), FileTypeEnum.contract_one, hasdot, name1);
			sealApply.setContractfilename(path1);
		}

		sealApply.setCode(pojo.getCode());
		sealApply.setContracttype(pojo.getContracttype());
		sealApply.setOrderids(pojo.getOrderids());
		sealApply.setApplyer(pojo.getApplyer());
		sealApply.setApplytime(now);
		sealApply.setStatus(BeanStatus.OK.getKey());
		sealApply.setRemarks(pojo.getRemarks());
		sealApply.setUsername(username);
		sealApply.setCreatetime(now);
		SealApplyMapper.insertSelective(sealApply);

		for (MallOrderDetail detail : orderDetailList) {
			MallOrderDetail orderDetail = new MallOrderDetail();
			orderDetail.setId(detail.getId());
			orderDetail.setSealapplycode(pojo.getCode());
			orderDetail.setIssealapply(BeanStatus.LOSE.getKey());
			orderDetailMapper.updateByPrimaryKeySelective(orderDetail);
		}

	}

	/**
	 * <p>同步保存文件</p>
	 * @param file
	 * @return
	 * @throws IOException
	 * @author wangzh
	 */
	public String uploadFileTogether(MultipartFile file, FileTypeEnum fte, boolean hasdot, String suffix) throws IOException {
		String picPath = null;
		if (file != null && file.getSize() > 0) {
			if (file.getSize() > Constants.PROFILE_PHOTO_MAX_SIZE) {
				throw new PortalBizCheckedException("文件不能超过10M");
			}
			String targetFileName = StringUtil.createFileName();
			if (hasdot) {
				targetFileName = targetFileName + suffix;
			}
			String path = resourceService.getFilePath(fte);
			picPath = path + "/" + DateUtils.formateCurrent(DateUtils.COMPACT_DATE_FORMAT) + "/" + targetFileName;
			resourceService.syncSaveFile(picPath, file.getInputStream(), true);
		}
		return picPath;
	}

	/**
	 * <p>同步保存文件     FTP方式</p>
	 * @param file
	 * @return
	 * @throws IOException
	 * @author liliang
	 */
	public String uploadFileFTP(MultipartFile file, FileTypeEnum fte, boolean hasdot, String suffix) throws IOException {
		String picPath = null;
		if (file != null && file.getSize() > 0) {
			if (file.getSize() > Constants.PROFILE_FILE_MAX_SIZE) {
				throw new PortalBizCheckedException("文件不能超过10M");
			}
			String targetFileName = snowflakeIdWorker.nextId() + "";
			if (hasdot) {
				targetFileName = targetFileName + suffix;
			}
			String path = resourceService.getFilePath(fte);
			picPath = path + "/" + DateUtils.formateCurrent(DateUtils.COMPACT_DATE_FORMAT) + "/" + targetFileName;
			resourceService.saveFileFtp(picPath, file.getInputStream(), true);
		}
		return picPath;
	}

	/**
	 * <p>update   sealstatus</p>
	 * @author liliang
	 * @throws IOException 
	 * @throws Exception 
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, rollbackFor = Exception.class)
	public void updateStatus(MallSealApply pojo, String loginname) throws IOException {
		Date now = new Date();
		MallSealApply sealApply = new MallSealApply();
		sealApply.setId(pojo.getId());
		sealApply.setSealstatus(pojo.getSealstatus());
		pojo.setAuditer1(loginname);
		pojo.setAuditime1(now);
		pojo.setReason(pojo.getReason());
		SealApplyMapper.updateByPrimaryKeySelective(pojo);
	}

	public MallSealApply loadSealApply(MallSealApply pojo) {

		return SealApplyMapper.selectByPrimaryKey(pojo.getId());
	}

	/**
	 * 合同盖章提醒
	 * @param MallSealApply
	 * @return
	 * @author liliang
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, rollbackFor = Exception.class, timeout = 3)
	public void smsReminderSealApply(MallSealApply pojo) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmm"); // 格式化日期 发短信是用
		Date now = new Date();

		// 短信内容
		String msg = "尊敬的客户你好,你在超级座驾商城上购买的汽车,合同甲方盖章已完成。请尽快下载合同，并盖章上传。";
		// 手机号码
		String phone = pojo.getUsername();
		if (null == pojo || StringUtils.isEmpty(phone)) {
			logger.error("发送短信的  盖章提醒 手机号码为空 ....没有要发送的号码.");
			return;
		}
		logger.info("发送短信的  盖章提醒  phone....." + phone);
		String uid = smsbxType + UUIDTool.getUUID();
		String sendtime = sdf.format(now);
		/*
		 * logger.info("account.."+account); logger.info("pswd.."+pswd);
		 * logger.info("report.."+report);
		 */
		SmsSendRequest smsSingleRequest = new SmsSendRequest(account, pswd, msg, phone, sendtime, report, uid);
		String requestJson = JSON.toJSONString(smsSingleRequest);
		logger.info("smsSingleRequest" + smsSingleRequest);
		String response = ChuangLanSmsUtil.sendSmsByPost(smsSingleRequestServerUrl, requestJson);

		SmsReport smsReport = new SmsReport();
		smsReport.setUid(uid);
		smsReport.setMobile(phone);
		smsReport.setContent(msg);
		smsReport.setContentprefix(smsbxType);
		smsReport.setContenttype(3); // 3 盖章
		smsReport.setCreatetime(now);// 创建时间 也是提交运营商时间
		smsReport.setPayplanid(pojo.getId());
		// 存入 mall_seal_apply 表id

		if (null != response) {// 说明 HTTP_OK =200 连接成功
			// log.info("response after request result is : " + response);
			SmsVariableResponse smsVariableResponse = JSON.parseObject(response, SmsVariableResponse.class);

			if ("0".equals(smsVariableResponse.getCode())) {

				// 短信成功提交之后 在拉取短信状态表 sms_report 中 插入一条数据。
				smsReport.setSubmitstatus(SUCCESS_STATUS);// 设置提交短信状态为 1 成功
				smsReport.setSendstatus(FAIL_STATUS);// 2为失败

				smsReportMapper.insertSelective(smsReport);
			} else {
				// 短信成功提交之后 在拉取短信状态表 sms_report 中 插入一条数据。

				smsReport.setSubmitstatus(FAIL_STATUS);// 2为失败
				smsReportMapper.insertSelective(smsReport);
				logger.error("提交短信运营商   http请求成功 但是  响应 失败...返回值response为..." + smsVariableResponse);
			}
			// 计划表中 保存对象
		} else {
			// 提交短信失败 要在数据库表 中更改 提交状态的
			smsReport.setSubmitstatus(FAIL_STATUS);// 2为失败
			smsReportMapper.insertSelective(smsReport);

			logger.error("提交短信 运营商 http请求失败 失败 requestJson为..." + requestJson + "返回值response为..." + response);
		}

	}

	/**
	 * <p>update   sealstatus</p>
	 * @author liliang
	 * @throws Exception 
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, rollbackFor = Exception.class)
	public void updateSeal(MallSealApply pojo, String loginname) throws Exception {

		Log.info("----<场景演示：个人客户和企业客户进行合同签署(以PDF文件字节流方式)>----");

		// 获取已初始化的客户端以便可以正常调用SDK提供的各种电子签名服务,做全局使用只获取一次即可
		ServiceClient serviceClient = InitClientHelper.doGetServiceClient(PROJECT_ID);
		// 个人客户账户AccountId,可将该AccountId保存到贵司数据库以便日后直接使用,只创建一次即可
		String personAccountId = "";

		// 个人客户印章SealData,可将该SealData保存到贵司数据库以便日后直接使用,只创建一次即可
		String personSealData = "";

		// 企业客户账户AccountId,可将该AccountId保存到贵司数据库以便日后直接使用,只创建一次即可
		String organize_AccountId = organizeAccountId;

		// 企业客户印章SealData,可将该SealData保存到贵司数据库以便日后直接使用,只创建一次即可
		String organize_SealData = organizeSealData;
		// 一 盖章 1 单页章 2 骑缝章
		String path1 = null;
		try {
			path1 = doSign_PersonWithOrganize(serviceClient, personAccountId, personSealData, organize_AccountId, organize_SealData,
					pojo.getContractfilename(), loginname ,pojo.getPhonecode());
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("盖章失败了"+e.getMessage());
		}

		Date now = new Date();
		// 二 修改合同状态
		MallSealApply sealApply = new MallSealApply();
		sealApply.setId(pojo.getId());
		sealApply.setTempcontractfilename(path1);
		sealApply.setSealstatus(5);
		sealApply.setAuditer1(loginname);
		sealApply.setAuditime1(now);
		sealApply.setSealer(loginname);
		sealApply.setSealtime(now);
		SealApplyMapper.updateByPrimaryKeySelective(sealApply);

	}

	/**
	 * <p>合同生成需求单   </p>
	 * @author liliang
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, rollbackFor = Exception.class)
	public void applyMakeJndNeed(MallSealApply pojo) {

		Date now = new Date();
		MallSealApply loadsealApply = SealApplyMapper.selectByPrimaryKey(pojo.getId());
		String orderids = loadsealApply.getOrderids();
		Integer siteid = null; // 区域id
		Integer num = new Integer(0);
		List<MallOrderDetail> orderDetailList = new ArrayList<MallOrderDetail>();
		if (StringUtils.isNotEmpty(orderids)) {
			String[] orderids_s = orderids.split(",");
			List<String> orderidsList = Arrays.asList(orderids_s);
			orderDetailList = orderDetailMapper.selectListBycodes(orderidsList);
			if (orderDetailList.size() != orderidsList.size()) { // 合同关联几个订单 一定要生成几个需求单
				throw new RuntimeException("此合同中 关联的订单有无效的,请重新选择订单 ");
			}
			siteid = orderDetailList.get(0).getAreaid();
			for (MallOrderDetail detail : orderDetailList) {
				num += detail.getNum();
			}

			jndSite site = siteMapper.selectByPrimaryKey(siteid);
			String name = DateUtils.formateCurrent(DateUtils.BIAS_DATE_FORMAT_DEFAULT) + "商城采购";
			String code = pojo.getCode().replace("mallContract", "");
			Jndneed jneed = new Jndneed();
			jneed.setCode(code);
			jneed.setMallcontractcode(pojo.getCode());
			jneed.setCountry(site.getCountry());
			jneed.setCurrency(site.getCurrency());
			jneed.setCreatetime(now);
			jneed.setName(name);
			jneed.setNeeder("商城采购");
			jneed.setNeedtype(BeanStatus.LOSE.getKey());
			jneed.setStatus(BeanStatus.DEL.getKey());// 商城采购未审核状态
			jneed.setNum(num);
			jndneedMapper.insertSelective(jneed);
			int jndneedid = jneed.getId();
			for (MallOrderDetail detail : orderDetailList) {
				// num += detail.getNum();
				Jndsubneed jndsu = new Jndsubneed();
				jndsu.setNeedid(jndneedid);
				jndsu.setBrand(detail.getBrand());
				jndsu.setModel(detail.getModel());
				jndsu.setVersion(detail.getVersion());
				jndsu.setNum(detail.getNum());
				jndsu.setCreatetime(now);
				jndsu.setCurrency(jneed.getCurrency());
				jndsu.setCountry(jneed.getCountry());
				// jndsu.setMallcontractcode(jneed.getCode());
				jndsu.setMallcontractcode(pojo.getCode());// 应该是商城的合同编号
				jndsu.setMallordercode(detail.getCode());
				//  设置   外观和颜色
				CarsourceFile f1 = new CarsourceFile();
				f1.setSourceid(detail.getSourceid());
				f1.setType(4);// decorate
				List<CarsourceFile> ds = sourcefileMapper.selectByCriteria(f1);
				if (null != ds && ds.size() > 0) {
					CarsourceFile carsourceFile = ds.get(0);
					if(null !=carsourceFile){
						jndsu.setOutcolor(carsourceFile.getTitle());
						jndsu.setIncolor(carsourceFile.getDetail());
					}
				}
				subneedMapper.insertSelective(jndsu);
				BigDecimal oneprice = detail.getTotalprice().divide(new BigDecimal(detail.getNum()), 2, RoundingMode.HALF_UP);
				for (int i = 0; i < detail.getNum(); i++) {

					JndCarorderDetail jcarorderDetail = new JndCarorderDetail();
					jcarorderDetail.setId(UUIDTool.getUUID());
					jcarorderDetail.setContractcode(loadsealApply.getCode());
					jcarorderDetail.setOrdercode(detail.getOrderid());
					jcarorderDetail.setSourceid(detail.getSourceid());
					jcarorderDetail.setSubordercode(detail.getCode());
					// jcarorderDetail.setVerifystatus(BeanStatus.OK.getKey());
					jcarorderDetail.setCreatetime(now);
					jcarorderDetail.setSkucode(detail.getCode() + "-" + (i + 1));
					jcarorderDetail.setUnit(detail.getUnit());
					jcarorderDetail.setAreaid(detail.getAreaid());
					jcarorderDetail.setAreaname(detail.getAreaname());
					jcarorderDetail.setTotalprice(oneprice);
					jndCarorderDetailMapper.insertSelective(jcarorderDetail);

				}

			}

		}
	}

	/**
	 * <p>del   合同失效</p>
	 * @author liliang
	 * @throws IOException 
	 * @throws Exception 
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, rollbackFor = Exception.class)
	public void delSeal(String id, String loginname) throws TSignException, IOException {
		Date now = new Date();
		MallSealApply sealApply = SealApplyMapper.selectByPrimaryKey(id);
		String orderids = sealApply.getOrderids();
		List<MallOrderDetail> orderDetailList = new ArrayList<MallOrderDetail>();
		if (StringUtils.isNotEmpty(orderids)) {
			String[] orderids_s = orderids.split(",");
			List<String> orderidsList = Arrays.asList(orderids_s);
			orderDetailList = orderDetailMapper.selectListBycodes(orderidsList);

			for (MallOrderDetail detail : orderDetailList) {
				MallOrderDetail orderdetail = new MallOrderDetail();
				orderdetail.setId(detail.getId());
				orderdetail.setIssealapply(BeanStatus.OK.getKey()); // 状态改为未创建合同
				orderdetail.setSealapplycode("2");
				orderdetail.setStatus(BeanStatus.DEL.getKey());
				orderdetail.setOrderstatus(BeanStatus.LOSE.getKey());
				orderdetail.setUpdatetime(now);
				orderdetail.setUpdatename(loginname);
				orderDetailMapper.updateByPrimaryKeySelective(orderdetail);

			}
		}
		Jndneed jneed = new Jndneed();
		jneed.setMallcontractcode(sealApply.getCode());
		List<Jndneed> jneeedList = jndneedMapper.selectByCriteria(jneed);
		for (Jndneed jndneed : jneeedList) {

			Jndbuy record = new Jndbuy();
			record.setNeedid(jndneed.getId());
			List<Jndbuy> buyList = jndbuyMapper.selectByCriteria(record);
			for (Jndbuy loadbuy : buyList) {
				Jndbuy buy_n = new Jndbuy();
				buy_n.setId(loadbuy.getId());
				buy_n.setCode(loadbuy.getCode() + "(已失效)");
				buy_n.setName(loadbuy.getName() + "(已失效)");
				jndbuyMapper.updateByPrimaryKeySelective(buy_n);
			}

			Jndneed jneed_new = new Jndneed();
			jneed_new.setId(jndneed.getId());
			jneed_new.setStatus(BeanStatus.OK.getKey());// 1 失效
			jneed_new.setCode(jndneed.getCode() + "(已失效)");
			jneed_new.setName(jndneed.getName() + "(已失效)");
			jndneedMapper.updateByPrimaryKeySelective(jneed_new);

		}

		MallSealApply apply = new MallSealApply();
		apply.setId(sealApply.getId());
		apply.setStatus(BeanStatus.DEL.getKey());
		apply.setAuditer1(loginname);
		apply.setAuditime1(now);
		SealApplyMapper.updateByPrimaryKeySelective(apply);

	}

	/***
	 * <ul>
	 * <li>方法名称：演示个人客户和企业客户进行合同签署</li>
	 * <li>文件方式：本地文件路径</li>
	 * <li>方法用途：演示双方签署</li>
	 * <li>Demo封装方法：doSign_PersonWithOrganize</li>
	 * </ul>
	 * 
	 * @param serviceClient
	 * @param personAccountId
	 * @param personSealData
	 * @param organizeAccountId
	 * @param organizeSealData
	 * @throws Exception 
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, rollbackFor = Exception.class)
	public String doSign_PersonWithOrganize(ServiceClient serviceClient, String personAccountId, String personSealData, String organizeAccountId,
			String organizeSealData, String fileurl,String loginname ,String phonecode) throws Exception {
		String path1 = "";
		// 待签署PDF文件路径
		// String root_pateh = ftpaddress;
		// String srcPdfPath = fileurl;
		// 签署后PDF文件存放目录
		// 签署后PDF文件保存路径
		String outSignedPdfPath = "";

		// 文档名称,此文档名称用于在e签宝服务端记录签署日志时用,非签署后PDF文件中的文件名.若为空则取待签署PDF文件中的文件名称
		String signLogFileName = "";
		// 文档编辑密码,如果待签署PDF文件设置了编辑密码时需要填写编辑密码,否则请传入null
		String ownerPWD = null;
		// logger.info("*****" +fileurl);
		// 获取个人客户签署时待签署PDF文件的字节流
		byte[] srcPdfBytes = resourceService.downloadFileFtp(fileurl);

		// 个人客户签署盖章
		/*
		 * FileDigestSignResult personSignResult = doSign_PersonByPDFBytes(serviceClient,
		 * personAccountId, personSealData, srcPdfBytes, null, signLogFileName, ownerPWD); //
		 * 企业客户签署时的待签署PDF文件字节流,即个人客户签署盖章成功后的PDF文件字节流 byte[] organizeSrcPdfBytes =
		 * personSignResult.getStream();
		 */

		// 企业客户签署 骑缝章
		FileDigestSignResult organizeSignResult_Edges = null;
			// 企业客户签署 单页章
			FileDigestSignResult organizeSignResult_Single = doSign_OrganizeByPDFBytes_Single(serviceClient, organizeAccountId, organizeSealData, srcPdfBytes,
					null, signLogFileName, ownerPWD,loginname , phonecode);
			if(0 ==organizeSignResult_Single.getErrCode()){// 成功后签署骑缝章
				organizeSignResult_Edges = doSign_OrganizeByPDFBytes_Edges(serviceClient, organizeAccountId, organizeSealData,
						organizeSignResult_Single.getStream(), null, signLogFileName, ownerPWD);
			}else{
				throw new Exception(organizeSignResult_Single.getMsg());
			}

			
		

		byte[] AllSignedPdfBytes = organizeSignResult_Edges.getStream();
		// 改好章后的文件转为inputstream
		InputStream AllSignedPdf = new ByteArrayInputStream(AllSignedPdfBytes);
		path1 = uploadSealFile(AllSignedPdf, FileTypeEnum.contract_one, FileTypeEnum.contract_two, fileurl);

		return path1;
	}

	/**
	 * <p>盖章后的文件上传</p>                          
	 * @param file
	 * @return
	 * @throws IOException
	 * @author wangzh
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, rollbackFor = Exception.class)
	public String uploadSealFile(InputStream AllSignedPdf, FileTypeEnum first, FileTypeEnum end, String fileurl) throws IOException {
		String picPath = "";
		String pathfirst = resourceService.getFilePath(first);
		String pathend = resourceService.getFilePath(end);
		picPath = fileurl.replace(pathfirst, pathend);
		resourceService.saveFileFtp(picPath, AllSignedPdf, true);
		return picPath;
	}

	/**
	* 
	* 合同生效       分页结果集
	* @param  通过查询条件 返回分页结果集
	* @param 查询条件  ,页码,页数   
	* @return  分页结果  
	* @author liliang
	*/
	public Map<String, Object> effective_list(MallSealApply vo, String start, String pageSize) throws ParseException {
		int ps = Integer.parseInt(pageSize);
		vo.setStatus(BeanStatus.OK.getKey());
		vo.setSealstatus(6);
		List<MallSealApply> list = SealApplyMapper.selectByCriteria(vo, new RowBounds((Integer.parseInt(start) - 1) * ps, ps));
		int total = SealApplyMapper.countByCriteria(vo);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", list);
		returnMap.put("total", total);
		return returnMap;
	}

	/**
	* 
	* 合同盖章回传        分页结果集
	* @param  通过查询条件 返回分页结果集
	* @param 查询条件  ,页码,页数   
	* @return  分页结果  
	* @author liliang
	*/
	public Map<String, Object> backcheck_list(MallSealApply vo, String start, String pageSize) throws ParseException {
		int ps = Integer.parseInt(pageSize);
		vo.setStatus(BeanStatus.OK.getKey());
		vo.setSealstatus(5);
		vo.setUploadstatus(BeanStatus.OK.getKey());
		List<MallSealApply> list = SealApplyMapper.selectByCriteria(vo, new RowBounds((Integer.parseInt(start) - 1) * ps, ps));
		int total = SealApplyMapper.countByCriteria(vo);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", list);
		returnMap.put("total", total);
		return returnMap;
	}

	/**
	 * <p>backcheck_update</p>
	 * @author liliang  盖章合同回传  审核通过方法
	 * @throws IOException 
	 * @throws Exception 
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, rollbackFor = Exception.class)
	public void backcheck_update(MallSealApply sealApply_param, String loginname) throws IOException {
		Date now = new Date();
		MallSealApply sealApply_n = new MallSealApply();

		sealApply_n.setId(sealApply_param.getId());
		sealApply_n.setAuditer1(loginname);
		sealApply_n.setAuditime1(now);
		sealApply_n.setSealstatus(6);

		if (!sealApply_param.getBackcheckfile().isEmpty()) {
			String name1 = sealApply_param.getBackcheckfile().getOriginalFilename();
			boolean hasdot = false;
			if (StringUtils.isNotBlank(name1)) {
				int dot = name1.lastIndexOf(".");
				if (dot > 0) {
					hasdot = true;
					name1 = name1.substring(dot);
				}
			}
			String path1 = uploadFileFTP(sealApply_param.getBackcheckfile(), FileTypeEnum.contract_three, hasdot, name1);
			sealApply_n.setFinalcontractfilename(path1);
		}

		SealApplyMapper.updateByPrimaryKeySelective(sealApply_n);

		// 三 生成需求单
		MallSealApply loadsealApply = SealApplyMapper.selectByPrimaryKey(sealApply_param.getId());
		applyMakeJndNeed(loadsealApply);

	}

	/***
	 * <ul>  单页 盖章方法
	 * <li>方法名称：企业客户签署盖章</li>
	 * <li>文件方式：PDF文件字节流</li>
	 * <li>方法用途：演示企业客户加盖公章</li>
	 * <li>Demo封装方法：doSign_OrganizeByPDFBytes</li>
	 * </ul>
	 * 
	 * @return fileDigestSignResult
	 * @throws TSignException 
	 * @throws DemoException
	 */
	public static FileDigestSignResult doSign_OrganizeByPDFBytes_Single(ServiceClient serviceClient, String accountId, String sealData, byte[] pdfBytes,
			String outPdfPath, String signLogFileName, String ownerPWD, String loginname ,String phonecode) throws TSignException  {

		SignPDFStreamBean signPDFStreamBean = null;

		// 签署后PDF文件本地保存路径,如果希望签署后依然返回PDF文件字节流时请设置该属性为空
		if (StringTools.isNotNull(outPdfPath)) {
			// 设置企业客户签署PDF文档信息,此时签署后不返回PDF文件字节流而是直接按照outPdfPath参数的地址保存签署后的PDF文件
			signPDFStreamBean = SignHelper.doSetSignPDFStreamBean(pdfBytes, outPdfPath, signLogFileName, ownerPWD);
		} else {
			// 设置企业客户签署PDF文档信息,此时签署后直接返回PDF文件字节流,需要接口调用方获取文件字节流后按照实际业务处理(保存为本地文件或传递到其他位置)
			signPDFStreamBean = SignHelper.doSetSignPDFStreamBean(pdfBytes, null, signLogFileName, ownerPWD);
		}
		// 签章类型,Single-单页签章、Multi-多页签章、Edges-骑缝章、Key-关键字签章
		SignType signType = SignType.Single;
		// 签署页码,单页签署时页码格式为"1";若为多页签署时，支持页码格式"1-3,5,8"
		String page = "3";
		// 签署位置Y坐标,默认值为0,以pdf页面的左下角作为原点,控制距离页面底端的纵向移动距离,单位为px
		float posX = 220F;
		// 签署位置Y坐标,默认值为0,以pdf页面的左下角作为原点,控制距离页面底端的纵向移动距离,单位为px
		float posY = 150F;
		// 印章图片在PDF文件中的等比缩放大小,公章标准大小为4.2厘米即159px
		float widthScaling = 159F;
		// 印章SealData
		String organizeSealData = sealData;

		// 设置企业客户签章位置信息
		PosBean posBean = SignHelper.doSetXYPosBean(signType, page, posX, posY, widthScaling);

		// 企业客户签署盖章
		FileDigestSignResult fileDigestSignResult = SignHelper.doUserLocalSafeSignPDF3rd(serviceClient, accountId, organizeSealData, signPDFStreamBean, posBean,
				signType, loginname , phonecode);
		return fileDigestSignResult;
	}

	/***
	 * <ul>  骑缝章 盖章方法
	 * <li>方法名称：企业客户签署盖章</li>
	 * <li>文件方式：PDF文件字节流</li>
	 * <li>方法用途：演示企业客户加盖公章</li>
	 * <li>Demo封装方法：doSign_OrganizeByPDFBytes</li>
	 * </ul>
	 * 
	 * @return fileDigestSignResult
	 * @throws DemoException
	 */
	public static FileDigestSignResult doSign_OrganizeByPDFBytes_Edges(ServiceClient serviceClient, String accountId, String sealData, byte[] pdfBytes,
			String outPdfPath, String signLogFileName, String ownerPWD) throws TSignException {

		SignPDFStreamBean signPDFStreamBean = null;

		// 签署后PDF文件本地保存路径,如果希望签署后依然返回PDF文件字节流时请设置该属性为空
		if (StringTools.isNotNull(outPdfPath)) {
			// 设置企业客户签署PDF文档信息,此时签署后不返回PDF文件字节流而是直接按照outPdfPath参数的地址保存签署后的PDF文件
			signPDFStreamBean = SignHelper.doSetSignPDFStreamBean(pdfBytes, outPdfPath, signLogFileName, ownerPWD);
		} else {
			// 设置企业客户签署PDF文档信息,此时签署后直接返回PDF文件字节流,需要接口调用方获取文件字节流后按照实际业务处理(保存为本地文件或传递到其他位置)
			signPDFStreamBean = SignHelper.doSetSignPDFStreamBean(pdfBytes, null, signLogFileName, ownerPWD);
		}
		// 签章类型,Single-单页签章、Multi-多页签章、Edges-骑缝章、Key-关键字签章
		SignType signType = SignType.Edges;
		// 签署页码,单页签署时页码格式为"1";若为多页签署时，支持页码格式"1-3,5,8"
		String page = "1,2,3,4,5,6,7,8";
		// 签署位置Y坐标,默认值为0,以pdf页面的左下角作为原点,控制距离页面底端的纵向移动距离,单位为px
		float posX = 120F;
		// 签署位置Y坐标,默认值为0,以pdf页面的左下角作为原点,控制距离页面底端的纵向移动距离,单位为px
		float posY = 300F;
		// 印章图片在PDF文件中的等比缩放大小,公章标准大小为4.2厘米即159px
		float widthScaling = 159F;
		// 印章SealData
		String organizeSealData = sealData;

		// 设置企业客户签章位置信息
		PosBean posBean = SignHelper.doSetXYPosBean_notime(signType, page, posX, posY, widthScaling);

		// 企业客户签署盖章
		FileDigestSignResult fileDigestSignResult = SignHelper.doUserLocalSignPDF(serviceClient, accountId, organizeSealData, signPDFStreamBean, posBean,
				signType);
		return fileDigestSignResult;
	}
	
	
	/**
	 * <p>发送手机号码 获得短信验证码</p>
	 * @author liliang
	 * @throws TSignException 
	 * @throws IOException 
	 * @throws Exception 
	 */
	public Result getPhoneCode(String loginname) throws TSignException  {
		String organize_AccountId = organizeAccountId;
		/*System.out.println(loginname);
		loginname="15026602139";*/
		if(isMobileNO(loginname)){
			
		}
		// 获取已初始化的客户端以便可以正常调用SDK提供的各种电子签名服务,做全局使用只获取一次即可
		ServiceClient serviceClient = InitClientHelper.doGetServiceClient(PROJECT_ID);
		Result rs2 = serviceClient.mobileService().sendSignMobileCode3rd(organize_AccountId,loginname);
		return rs2;
		
		
	}
	
	public  boolean isMobileNO(String mobiles) {
        Pattern p = Pattern.compile("^((17[0-9])|(14[0-9])|(13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$");
        Matcher m = p.matcher(mobiles);
        return m.matches();
    }

}
