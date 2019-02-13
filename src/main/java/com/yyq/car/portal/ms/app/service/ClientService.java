/*******************************************************************************
 * Project   : car-ms
 * Class Name: com.yyq.car.portal.ms.app.service.ClientService
 * Created By: wangzh 
 * Created on: 2018年4月2日 下午7:27:36
 * Copyright © 2013-2014 YYQ All rights reserved.
 ******************************************************************************/
package com.yyq.car.portal.ms.app.service;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;
import org.ufa.log.Logger;
import org.ufa.log.LoggerFactory;

import com.yyq.car.portal.common.constant.Constants;
import com.yyq.car.portal.common.constant.FileTypeEnum;
import com.yyq.car.portal.common.constant.MasterDataType;
import com.yyq.car.portal.common.dto.ClientInfoDto;
import com.yyq.car.portal.common.dto.Riskfiledto;
import com.yyq.car.portal.common.dto.UserDTO;
import com.yyq.car.portal.common.exception.PortalAppUnCheckedException;
import com.yyq.car.portal.common.exception.PortalBizCheckedException;
import com.yyq.car.portal.common.mapper.auth.UserMapper;
import com.yyq.car.portal.common.mapper.biz.BizInvoiceFileMapper;
import com.yyq.car.portal.common.mapper.biz.BizInvoiceMapper;
import com.yyq.car.portal.common.mapper.biz.BizShopTermMapper;
import com.yyq.car.portal.common.mapper.biz.BizclientinfoMapper;
import com.yyq.car.portal.common.mapper.biz.BizcontractMapper;
import com.yyq.car.portal.common.mapper.biz.BizriskMapper;
import com.yyq.car.portal.common.mapper.biz.BizriskfileMapper;
import com.yyq.car.portal.common.mapper.biz.BizsaleborrowMapper;
import com.yyq.car.portal.common.mapper.biz.BizzeropurchaseMapper;
import com.yyq.car.portal.common.mapper.biz.CaseMonitorMapper;
import com.yyq.car.portal.common.mapper.biz.CasestepMapper;
import com.yyq.car.portal.common.mapper.biz.PayMoneyInterestMapper;
import com.yyq.car.portal.common.mapper.biz.RiskcaseMapper;
import com.yyq.car.portal.common.mapper.cif.CommunicateMapper;
import com.yyq.car.portal.common.mapper.product.CarMapper;
import com.yyq.car.portal.common.mapper.product.ShopMapper;
import com.yyq.car.portal.common.mapper.product.StoreMapper;
import com.yyq.car.portal.common.mapper.product.flowschemeMapper;
import com.yyq.car.portal.common.mapper.product.prosupplycarMapper;
import com.yyq.car.portal.common.mapper.product.prosupplycartableMapper;
import com.yyq.car.portal.common.mapper.wholesale.wholesaleCarMapper;
import com.yyq.car.portal.common.model.biz.BizInvoice;
import com.yyq.car.portal.common.model.biz.BizInvoiceFile;
import com.yyq.car.portal.common.model.biz.BizShopTerm;
import com.yyq.car.portal.common.model.biz.Bizclientinfo;
import com.yyq.car.portal.common.model.biz.Bizcontract;
import com.yyq.car.portal.common.model.biz.Bizrisk;
import com.yyq.car.portal.common.model.biz.Bizriskfile;
import com.yyq.car.portal.common.model.biz.Bizsaleborrow;
import com.yyq.car.portal.common.model.biz.Bizzeropurchase;
import com.yyq.car.portal.common.model.biz.CaseMonitor;
import com.yyq.car.portal.common.model.biz.Casestep;
import com.yyq.car.portal.common.model.biz.PayMoneyInterest;
import com.yyq.car.portal.common.model.biz.Riskcase;
import com.yyq.car.portal.common.model.cif.Communicate;
import com.yyq.car.portal.common.model.comm.Abrand;
import com.yyq.car.portal.common.model.product.Car;
import com.yyq.car.portal.common.model.product.Shop;
import com.yyq.car.portal.common.model.product.Store;
import com.yyq.car.portal.common.model.product.flowscheme;
import com.yyq.car.portal.common.model.product.prosupplycar;
import com.yyq.car.portal.common.model.product.prosupplycartable;
import com.yyq.car.portal.common.model.wholesale.WholesaleCar;
import com.yyq.car.portal.common.service.ResourcePersistenceService;
import com.yyq.car.portal.common.service.security.SecurityHelper;
import com.yyq.car.portal.common.util.CachFactory;
import com.yyq.car.portal.common.util.DateUtils;
import com.yyq.car.portal.common.util.StringUtil;
import com.yyq.car.portal.common.util.ValidationUtils;
import com.yyq.car.portal.ms.common.exception.PortalMsBizCheckedException;
import com.yyq.car.portal.ms.web.command.InvoiceAuditCmd;
import com.yyq.car.portal.ms.web.constant.CaseStepEnum;
import com.yyq.car.portal.ms.web.constant.View;
import com.yyq.car.portal.ms.web.util.UUIDTool;


/**
 * <P>新销售管理</P>
 * @author wangzh
 */
@Service
public class ClientService {

	private final static Logger logger = LoggerFactory.getLogger(ClientService.class);

	@Autowired
	BizclientinfoMapper clientinfomapper;

	@Autowired
	ShopMapper shopMapper;

	@Autowired
	StoreMapper storeMapper;

	@Autowired
	UserMapper userMapper;

	@Autowired
	CommunicateMapper communicateMapper;

	@Autowired
	BizcontractMapper contractMapper;

	@Autowired
	BizzeropurchaseMapper zeropurchaseMapper;

	@Autowired
	BizriskMapper riskMapper;

	@Autowired
	BizriskfileMapper riskfileMapper;

	@Autowired
	BrandAndModelService brandAndModelService;

	@Autowired
	CarMapper carMapper;

	@Autowired
	ResourcePersistenceService resourceService;

	@Autowired
	BizShopTermMapper bizShopTermMapper;

	@Autowired
	PayMoneyInterestMapper payMoneyInterestMapper;

	@Autowired
	prosupplycartableMapper prosupplycartableMapper;

	@Autowired
	prosupplycarMapper prosupplycarMapper;

	@Autowired
	BizInvoiceMapper invoiceMapper;

	@Autowired
	BizInvoiceFileMapper invoiceFileMapper;

	@Autowired
	BizsaleborrowMapper bizsaleborrowMapper;

	@Autowired
	RiskcaseMapper riskcaseMapper;

	@Autowired
	CasestepMapper casestepMapper;

	@Autowired
	CaseMonitorMapper caseMonitorMapper;

	@Autowired
	BizShopGroupService shopGroupService;

	@Autowired
	wholesaleCarMapper wholesaleCarMapper;

	@Autowired
	flowschemeMapper flowschemeMapper;

	@Autowired
	SellContractService sellContractService;

	/**
	 * <p>分页查询录入客户信息的列表和总数</p>
	 * @param dto
	 * @param start
	 * @param pageSize
	 * @return
	 * @author wangzh
	 */
	public Map<String, Object> clientFindListDo(ClientInfoDto dto, String start, String pageSize, String all) {
		Bizclientinfo clientinfo = new Bizclientinfo();
		Map<String, Object> map = new HashMap<String, Object>();
		if (StringUtils.isNotBlank((dto.getName()))) {// 客户姓名
			clientinfo.setName(dto.getName());
		}
		if (StringUtils.isNotBlank((dto.getClientLevel()))) {// 客户级别
			clientinfo.setClevel(dto.getClientLevel());
		}
		if (StringUtils.isNotBlank((dto.getPhone()))) {// 联系电话
			clientinfo.setPhone(dto.getPhone());
		}
		if (StringUtils.isNotBlank(dto.getComeshopTime()))// 进店日期
			clientinfo.setComeshoptime(DateUtils.parse(dto.getComeshopTime(), DateUtils.DEFAULT_DATE_FORMAT_DEFAULT));

		clientinfo.setClientype(dto.getWorkType());// 单位、个人

		if (StringUtils.isBlank(all)) {// 不是总览

			UserDTO userInfo = SecurityHelper.getAdminUserInfo();

			Collection<GrantedAuthority> as = userInfo.getAuthorities();
			boolean ismanager = false;

			for (Iterator<GrantedAuthority> iterator = as.iterator(); iterator.hasNext();) {
				GrantedAuthority grantedAuthority = iterator.next();
				if ("ROLE_SHOP_MANAGER".equals(grantedAuthority.toString())) {// ROLE_SHOP_MANAGER：店长角色
																				// 可以查看所有该店的店员签署的信息表
					ismanager = true;
					break;
				}
			}
			if (ismanager) {
				if (StringUtils.isNotBlank(userInfo.getShop()))
					clientinfo.setShopid(Integer.parseInt(userInfo.getShop()));
			} else {
				clientinfo.setSellid(userInfo.getId());
			}
		}
		int ps = Integer.parseInt(pageSize);
		List<Bizclientinfo> lst = clientinfomapper.selectByCriterialike(clientinfo, new RowBounds((Integer.parseInt(start) - 1) * ps, ps));

		map.put("result", lst);
		int size = clientinfomapper.countByCriterialike(clientinfo);
		map.put("total", size);
		return map;
	}

	/**
	 * <p>分页查询录入客户信息的列表和总数</p>
	 * @param dto
	 * @param start
	 * @param pageSize
	 * @return
	 * @author liliang
	 */
	public Map<String, Object> clientFindListDo_shopGroup(ClientInfoDto dto, String start, String pageSize, String all) {
		Bizclientinfo clientinfo = new Bizclientinfo();
		Map<String, Object> map = new HashMap<String, Object>();
		if (StringUtils.isNotBlank((dto.getName()))) {// 客户姓名
			clientinfo.setName(dto.getName());
		}
		if (StringUtils.isNotBlank((dto.getClientLevel()))) {// 客户级别
			clientinfo.setClevel(dto.getClientLevel());
		}
		if (StringUtils.isNotBlank((dto.getPhone()))) {// 联系电话
			clientinfo.setPhone(dto.getPhone());
		}
		if (StringUtils.isNotBlank(dto.getComeshopTime()))// 进店日期
			clientinfo.setComeshoptime(DateUtils.parse(dto.getComeshopTime(), DateUtils.DEFAULT_DATE_FORMAT_DEFAULT));

		clientinfo.setClientype(dto.getWorkType());// 单位、个人

		/*
		 * if (StringUtils.isBlank(all)) {// 不是总览 Collection<GrantedAuthority> as =
		 * userInfo.getAuthorities(); boolean ismanager = false; for (Iterator<GrantedAuthority>
		 * iterator = as.iterator(); iterator.hasNext();) { GrantedAuthority grantedAuthority =
		 * iterator.next(); if ("ROLE_SHOP_MANAGER".equals(grantedAuthority.toString())) {//
		 * ROLE_SHOP_MANAGER：店长角色 // 可以查看所有该店的店员签署的信息表 ismanager = true; break; } } if (ismanager) {
		 * if (StringUtils.isNotBlank(userInfo.getShop()))
		 * clientinfo.setShopid(Integer.parseInt(userInfo.getShop())); } else {
		 * clientinfo.setSellid(userInfo.getId()); } }
		 */
		UserDTO userInfo = SecurityHelper.getAdminUserInfo();
		Integer shopid = Integer.parseInt(userInfo.getShop()); // 登录门店id
		List<Integer> shopids = shopGroupService.queryShopGroupIdsByUseridandShopid(userInfo.getId(), shopid);
		clientinfo.setShopids(shopids);
		clientinfo.setShopid(null);
		int ps = Integer.parseInt(pageSize);
		List<Bizclientinfo> lst = clientinfomapper.selectAllByCriterialike(clientinfo, new RowBounds((Integer.parseInt(start) - 1) * ps, ps));

		map.put("result", lst);
		int size = clientinfomapper.countAllByCriterialike(clientinfo);
		map.put("total", size);
		return map;
	}

	/**
	 * 插入一条沟通信息和查询列表
	 * @param sellerId
	 * @param clientId
	 * @param content
	 * @author wangzh
	 */
	public void addCommuAndQuery(String sellerId, String clientId, String content, Map<String, Object> map) {
		Communicate c = new Communicate();
		if (StringUtils.isNotBlank(clientId))
			c.setNewclientid(Integer.parseInt(clientId));// 新业务信息表id
		else {
			throw new PortalMsBizCheckedException("客户信息表有误");
		}
		if (StringUtils.isNotBlank(sellerId))
			c.setSellerId(Integer.parseInt(sellerId));
		else {
			UserDTO userInfo = SecurityHelper.getAdminUserInfo();
			if (userInfo != null)
				c.setSellerId(userInfo.getId());
			// throw new PortalMsBizCheckedException("销售人员未知");
		}
		c.setContent(content);
		c.setCreateTime(new Date());
		communicateMapper.insert(c);
		map.putAll(CommuLstDo(clientId, "1", "10"));

	}

	/**
	 * 查询沟通列表和总数目
	 * @param infoId
	 * @param start
	 * @param pageSize
	 * @return
	 * @author wangzh
	 */
	public Map<String, Object> CommuLstDo(String infoId, String start, String pageSize) {
		Communicate record = new Communicate();
		if (StringUtils.isNotBlank(infoId))
			record.setNewclientid(Integer.parseInt(infoId));// 新业务信息表id
		Map<String, Object> map = new HashMap<String, Object>();
		int ps = Integer.parseInt(pageSize);
		List<Communicate> lst = communicateMapper.selectByCriteria(record, new RowBounds((Integer.parseInt(start) - 1) * ps, ps));
		int size = communicateMapper.countByCriteria(record);
		map.put("result", lst);
		map.put("total", size);
		return map;
	}

	/**
	 * 新增以及修改客户信息表
	 * @param dto
	 * @param type 1新增2修改
	 * @author wangzh
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public String UpdateSaveClients(ClientInfoDto dto, String worktype, String type, String shopName, ModelMap map) {
		String flag = "";
		if (StringUtils.isNotBlank(type)) {
			Integer loginId = SecurityHelper.getAdminUserInfo().getId();
			Bizclientinfo buyer = new Bizclientinfo();
			if (StringUtils.isNotBlank(dto.getId()))
				buyer.setId(Integer.parseInt(dto.getId()));
			if (StringUtils.isNotBlank(dto.getShopId()))
				buyer.setShopid(Integer.parseInt(dto.getShopId()));
			buyer.setName(dto.getName());
			buyer.setIdentify(dto.getIdentify());
			buyer.setPhone(dto.getPhone());
			buyer.setCompanyname(dto.getCompanyname());
			buyer.setBizlicense(dto.getBizlicense());
			buyer.setModel(dto.getModel());
			buyer.setNowcar(dto.getNowcar());
			buyer.setColor(dto.getColor());
			buyer.setVersion(dto.getVersion());
			buyer.setBrand(dto.getBrand());
			buyer.setInitials(dto.getInitials());
			buyer.setHeartprice(dto.getHeartprice());
			buyer.setOldintroduce(dto.getOldintroduce());
			buyer.setHaslicense(dto.getHaslicense());
			buyer.setClevel(dto.getClevel());
			buyer.setPrinciple(dto.getPrinciple());
			if ("1".equals(type)) {// 新增
				if ("G".equals(dto.getClevel())) {// 立即购买
					flag = "1";// 新增直接选G客户级别
					map.put("shopId", dto.getShopId());
					map.put("shopName", shopName);
					map.put("infoId", dto.getId());
					map.put("infoNum", dto.getFilenum());
					// 获取门店信息填充到合同甲方位置
					Shop sp = shopMapper.selectByPrimaryKey(buyer.getShopid());
					map.put("sp", sp);
					map.put("realworktype", dto.getWorkType());
				} else {// 不是立即购买
					flag = "2";// 新增没选或选了其他的客户级别
				}
				buyer.setFilecode(dto.getFilenum());
				buyer.setClientype(dto.getWorkType());
				if (StringUtils.isNotBlank(dto.getComeshoptime()))
					buyer.setComeshoptime(DateUtils.parse(dto.getComeshoptime(), DateUtils.DEFAULT_DATE_FORMAT_DEFAULT));
				buyer.setSellid(loginId);
				buyer.setShopname(dto.getShopName());// 门店名称
				buyer.setSellername(SecurityHelper.getAdminUserInfo().getName());// 销售人员名字
				buyer.setCreatetime(new Date());
				clientinfomapper.insertSelectiveWithKey(buyer);
			} else {// 修改
				if ("G".equals(dto.getClevel())) {// 立即购买
					flag = "1";// 新增直接选G客户级别
					map.put("shopId", dto.getShopId());
					map.put("shopName", shopName);
					map.put("infoId", dto.getId());
					map.put("infoNum", dto.getFilenum());
					// 获取门店信息填充到合同甲方位置
					Shop sp = shopMapper.selectByPrimaryKey(Integer.parseInt(dto.getShopId()));
					map.put("sp", sp);
					map.put("realworktype", worktype);
				} else {// 不是立即购买
					flag = "2";// 新增没选或选了其他的客户级别
				}
				buyer.setShopid(null);
				buyer.setFilecode(null);
				buyer.setShopname(null);
				buyer.setSellername(null);
				buyer.setSellid(null);
				if (StringUtils.isNotBlank(dto.getComeshoptime()))
					buyer.setComeshoptime(DateUtils.parse(dto.getComeshoptime(), DateUtils.DEFAULT_DATE_FORMAT_DEFAULT));
				clientinfomapper.updateByPrimaryKeySelective(buyer);
			}
		} else {
			throw new PortalMsBizCheckedException("缺少新增或者修改标示！");
		}
		return flag;
	}

	/**
	 * 根据主键获取要修改的客户
	 * @param id
	 * @return
	 * @author wangzh
	 */
	public void getEditClient(String id, ModelMap map) {
		if (StringUtils.isNotBlank(id)) {
			Bizclientinfo buyer = getViewAllClient(id, map);
			if (StringUtils.isNotBlank(buyer.getClevel()) && "G".equals(buyer.getClevel())) {// 本来就是G级别了
				Integer clientId = buyer.getId();
				Bizcontract contract = new Bizcontract();
				contract.setInfoid(clientId);
				int size = contractMapper.countByCriteria(contract);
				if (size > 0) {// 然后又有合同
					map.put("editstatus", "0");
				}
			}
		}
	}

	/**
	 * 
	 * <p>客户信息表总览查看</p>
	 * @param id
	 * @param map
	 * @author wangzh
	 */
	@SuppressWarnings("unchecked")
	public Bizclientinfo getViewAllClient(String id, ModelMap map) {
		if (StringUtils.isNotBlank(id)) {
			Bizclientinfo buyer = clientinfomapper.selectByPrimaryKey(Integer.parseInt(id));
			List<Abrand> initials = brandAndModelService.queryBrandinitial();// 查询所有品牌首字母
			map.put("initials", initials);
			List<Map<String, Object>> brandlst = brandAndModelService.queryBrand(buyer.getInitials());// 字母下的所有品牌
			map.put("brands", brandlst);
			Abrand lst = brandAndModelService.queryId(buyer.getBrand());
			if (lst != null) {
				List<Map<String, Object>> model = brandAndModelService.queryByBrandidModel(lst.getBrandid());// 品牌下的所有型号
				map.put("models", model);
			} else {
				map.put("models", null);
			}
			List<Map<String, Object>> version = brandAndModelService.queryVersion(buyer.getModel());
			if (version.size() > 0) {
				map.put("versions", version);
			} else {
				map.put("versions", null);
			}
			map.put("buyer", buyer);
			Map<String, Object> pMap = (Map<String, Object>) CachFactory.getInstance().get(Constants.MASTER_DATA_LIST);
			Map<String, Object> priceLst = (Map<String, Object>) pMap.get(MasterDataType.PRICE.getValue());// 价格
			map.put("priceLst", priceLst);
			if (buyer.getShopid() != null) {
				Shop shop = shopMapper.selectByPrimaryKey(buyer.getShopid());
				map.put("shop", shop);
			}
			return buyer;
		}
		return null;
	}

	/**
	 * <p>异步保存文件</p>
	 * @param file
	 * @return
	 * @throws IOException
	 * @author wangzh
	 */
	@SuppressWarnings("unused")
	private String uploadFileProcess(MultipartFile file, FileTypeEnum fte, boolean hasdot, String suffix) throws IOException {
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
			resourceService.asyncSaveFile(picPath, file.getInputStream(), true);
		}
		return picPath;
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
	 * 
	 * <p>保存合同</p>
	 * @param dto
	 * @param salecontract
	 * @param reportbill
	 * @param downposbill
	 * @author wangzh
	 * @throws IOException 
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void contractsave(Bizcontract dto, MultipartFile fsalecontract, MultipartFile freportbill, MultipartFile fdownposbill) throws Exception {
		Integer id = dto.getId();
		flowscheme flow = new flowscheme();
		if (id == null) {// 新增合同

			Bizcontract contract = new Bizcontract();
			contract.setInfoid(dto.getInfoid());
			int size = contractMapper.countByCriteria(contract);
			if (size > 0) {// 然后又有合同
				throw new PortalBizCheckedException("该信息表已经有对应的合同了，请返回列表查看！");
			}

			String name1 = fsalecontract.getOriginalFilename();
			boolean hasdot = false;
			if (StringUtils.isNotBlank(name1)) {
				int dot = name1.lastIndexOf(".");
				if (dot > 0) {
					hasdot = true;
					name1 = name1.substring(dot);
				}
			}
			String path1 = uploadFileTogether(fsalecontract, FileTypeEnum.newsalecontract, hasdot, name1);

			String name2 = freportbill.getOriginalFilename();
			hasdot = false;
			if (StringUtils.isNotBlank(name2)) {
				int dot = name2.lastIndexOf(".");
				if (dot > 0) {
					hasdot = true;
					name2 = name2.substring(dot);
				}
			}
			String path2 = uploadFileTogether(freportbill, FileTypeEnum.newreportbill, hasdot, name2);

			String name3 = fdownposbill.getOriginalFilename();
			hasdot = false;
			if (StringUtils.isNotBlank(name3)) {
				int dot = name3.lastIndexOf(".");
				if (dot > 0) {
					hasdot = true;
					name3 = name3.substring(dot);
				}
			}
			String path3 = uploadFileTogether(fdownposbill, FileTypeEnum.newdownpayposbill, hasdot, name3);

			dto.setSalecontract(path1);// 销售合同
			dto.setReportbill(path2);// 报价单
			dto.setDownposbill(path3);// 定金pos单

			dto.setCreatetime(new Date());

			Bizclientinfo bc = clientinfomapper.selectByPrimaryKey(dto.getInfoid());
			dto.setShopid(bc.getShopid());
			dto.setShopname(bc.getShopname());
			dto.setSellid(bc.getSellid());
			dto.setSellername(bc.getSellername());

			contractMapper.insertSelective(dto);
			flow.setTaskid(dto.getId());
			flow.setTaskname("新增销售合同");
		} else {// update合同
			Bizcontract loadbizcontract = contractMapper.selectByPrimaryKey(dto.getId());
			Bizcontract contract = new Bizcontract();
			contract.setId(dto.getId());
			// contract.setInfoid(dto.getInfoid());
			contract.setName(dto.getName());
			contract.setAddress(dto.getAddress());
			contract.setPrinciple(dto.getPrinciple());
			contract.setPhone(dto.getPhone());
			contract.setBname(dto.getBname());
			contract.setBaddress(dto.getBaddress());
			contract.setCompanyname(dto.getCompanyname());
			contract.setBphone(dto.getBphone());
			contract.setIdentify(dto.getIdentify());
			contract.setBrand(dto.getBrand());
			contract.setModel(dto.getModel());
			contract.setVersion(dto.getVersion());
			contract.setOutcolor(dto.getOutcolor());
			contract.setIncolor(dto.getIncolor());
			contract.setConfig(dto.getConfig());
			contract.setTransprice(dto.getTransprice());
			contract.setPlateprice(dto.getPlateprice());
			contract.setCinsurance(dto.getCinsurance());
			contract.setInsurance(dto.getInsurance());
			contract.setPurchasetax(dto.getPurchasetax());
			contract.setQualityprice(dto.getQualityprice());
			contract.setDelayprice(dto.getDelayprice());
			contract.setDecorateprice(dto.getDecorateprice());
			contract.setSaleprice(dto.getSaleprice());
			contract.setDownpay(dto.getDownpay());
			contract.setFinance(dto.getFinance());
			contract.setNote(dto.getNote());
			/*
			 * int size = contractMapper.countByCriteria(contract); if (size > 0) {// 然后又有合同 throw
			 * new PortalBizCheckedException("该信息表已经有对应的合同了，请返回列表查看！"); }
			 */
			boolean hasdot = false;
			if (!fsalecontract.isEmpty()) {
				String name1 = fsalecontract.getOriginalFilename();

				if (StringUtils.isNotBlank(name1)) {
					int dot = name1.lastIndexOf(".");
					if (dot > 0) {
						hasdot = true;
						name1 = name1.substring(dot);
					}
				}
				String path1 = uploadFileTogether(fsalecontract, FileTypeEnum.newsalecontract, hasdot, name1);
				contract.setSalecontract(path1);// 销售合同
			}
			if (!freportbill.isEmpty()) {
				String name2 = freportbill.getOriginalFilename();
				hasdot = false;
				if (StringUtils.isNotBlank(name2)) {
					int dot = name2.lastIndexOf(".");
					if (dot > 0) {
						hasdot = true;
						name2 = name2.substring(dot);
					}
				}
				String path2 = uploadFileTogether(freportbill, FileTypeEnum.newreportbill, hasdot, name2);
				contract.setReportbill(path2);// 报价单
			}

			if (!fdownposbill.isEmpty()) {
				String name3 = fdownposbill.getOriginalFilename();
				hasdot = false;
				if (StringUtils.isNotBlank(name3)) {
					int dot = name3.lastIndexOf(".");
					if (dot > 0) {
						hasdot = true;
						name3 = name3.substring(dot);
					}
				}
				String path3 = uploadFileTogether(fdownposbill, FileTypeEnum.newdownpayposbill, hasdot, name3);
				contract.setDownposbill(path3);// 定金pos单
			}
			// dto.setCreatetime(new Date()); 没有修改时间字段啊
			if ("1".equals(loadbizcontract.getFinance()) && StringUtils.isBlank(loadbizcontract.getDownposbill()) && "2".equals(contract.getFinance())
					&& StringUtils.isBlank(contract.getDownposbill())) {//
				throw new PortalBizCheckedException("金融购车从是修改为否时必须上传定金POS单！");
			}
			contractMapper.updateByPrimaryKeyandstatusnull(contract);

			Bizclientinfo bc = new Bizclientinfo();
			bc.setId(loadbizcontract.getCarid());
			bc.setInitials(dto.getInitials());
			bc.setBrand(dto.getBrand());
			bc.setModel(dto.getModel());
			bc.setVersion(dto.getVersion());
			clientinfomapper.updateByPrimaryKeySelective(bc);
			flow.setTaskid(dto.getId());
			flow.setTaskname("修改销售合同");
		}
		flow.setTasktype1(2);
		sellContractService.insertSelective(flow);
	}

	/**
	 * 
	 * <p>合同列表查询</p>
	 * @param map
	 * @param filecode
	 * @param name
	 * @param bname
	 * @param workType
	 * @param identify
	 * @param start
	 * @param pageSize
	 * @return
	 * @author wangzh
	 * @param type 
	 */
	public Map<String, Object> contractquery(String filecode, String name, String bname, String workType, String identify, Integer start, Integer ps,
			String all, String node) {
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> pmap = new HashMap<String, Object>();
		pmap.put("start", (start - 1) * ps);
		pmap.put("size", ps);
		if (StringUtils.isNotBlank(filecode)) {
			pmap.put("filecode", filecode);
		}
		if (StringUtils.isNotBlank(name)) {
			pmap.put("name", name);
		}
		if (StringUtils.isNotBlank(bname)) {
			pmap.put("bname", bname);
		}
		if (StringUtils.isNotBlank(workType)) {
			pmap.put("clientype", workType);
		}
		if (StringUtils.isNotBlank(identify)) {
			pmap.put("identify", identify);
		}
		// 权限控制
		if (StringUtils.isBlank(all) && StringUtils.isBlank(node)) {// 不是总览
			UserDTO userInfo = SecurityHelper.getAdminUserInfo();
			if (userInfo != null) {
				Collection<GrantedAuthority> as = userInfo.getAuthorities();
				boolean ismanager = false;

				for (Iterator<GrantedAuthority> iterator = as.iterator(); iterator.hasNext();) {
					GrantedAuthority grantedAuthority = iterator.next();
					if ("ROLE_SHOP_MANAGER".equals(grantedAuthority.toString())) {// ROLE_SHOP_MANAGER：店长角色
																					// 可以查看所有该店的店员签署的信息表
						ismanager = true;
						break;
					}
				}
				if (ismanager) {
					if (StringUtils.isNotBlank(userInfo.getShop()))
						pmap.put("shopid", userInfo.getShop());
				} else {
					pmap.put("sellid", userInfo.getId());
				}
			} else {
				return null;
			}
		}
		if (StringUtils.isNotBlank(node)) {
			pmap.put("node", node);
		}
		List<Map<String, Object>> lst = contractMapper.selectByMap(pmap);
		int size = contractMapper.countByMap(pmap);
		map.put("result", lst);
		map.put("total", size);
		return map;
	}

	/**
	 * 
	 * <p>获取合同内容</p>
	 * @param id
	 * @return
	 * @author wangzh
	 */
	public Bizcontract getcontractbyid(Integer id) {
		return contractMapper.selectByPrimaryKey(id);
	}

	/**
	 * 
	 * <p>获取合同内容供操作</p>
	 * @param map
	 * @param id
	 * @param node null门店操作 1门店部审核 2定金到账审核 3风控进件初审 4风控进件复审
	 * @author wangzh
	 */
	public String getcontractbyidforoperate(ModelMap map, Integer id, String node) {
		Bizcontract con = getcontractbyid(id);
		map.put("co", con);
		// map.put("in", getclientinfobyid(con.getInfoid()));
		// 获取上传文件地址 供下载时查看
		String a1 = con.getSalecontract();// 销售合同
		String a2 = con.getDownposbill();// 定金pos单
		String a3 = con.getReportbill();// 报价单
		if (StringUtils.isNotBlank(a1)) {
			a1 = a1.substring(a1.lastIndexOf('/') + 1);
			map.put("salecontractname", a1);
		}
		if (StringUtils.isNotBlank(a2)) {
			a2 = a2.substring(a2.lastIndexOf('/') + 1);
			map.put("downposbillname", a2);
		}
		if (StringUtils.isNotBlank(a3)) {
			a3 = a3.substring(a3.lastIndexOf('/') + 1);
			map.put("reportbillname", a3);
		}
		// 根据状态返回不同的页面
		String status = con.getStatus();
		String fin = con.getFinance();
		if (StringUtils.isBlank(node)) {// 门店操作
			// if ("3".equals(status)) {// 定金已到账
			// if ("2".equals(fin)) {// 全款
			// return "biz/contractvin";// 选车
			// }
			if ("1".equals(fin) && "1".equals(status)) {// 金融并且门店部审核通过
				return "biz/risk";// 金融时风控进件
			}
			if ("22".equals(status)) {// 金融并且门店部 驳回修改
				List<Abrand> initials = brandAndModelService.queryBrandinitial();// 查询所有品牌首字母
				map.put("initials", initials);
				Bizclientinfo bc = clientinfomapper.selectByPrimaryKey(con.getInfoid());
				map.put("bc", bc);
				List<Map<String, Object>> abrand = brandAndModelService.queryBrand(bc.getInitials());
				map.put("brands", abrand);

				Abrand lst = brandAndModelService.queryId(bc.getBrand());
				if (lst != null) {
					List<Map<String, Object>> model = brandAndModelService.queryByBrandidModel(lst.getBrandid());// 品牌下的所有型号
					map.put("models", model);
				} else {
					map.put("models", null);
				}
				List<Map<String, Object>> version = brandAndModelService.queryVersion(bc.getModel());
				if (version.size() > 0) {
					map.put("versions", version);
				} else {
					map.put("versions", null);
				}
				return "biz/contractupdate";// 金融时 驳回更新
			}
			// }
			if ("52".equals(status) || "55".equals(status)) {// 初审、复审补件
				// 获取合同相关文件
				getconfilesbyconid(id, map);
				return "biz/riskedit";
			}
			if ("54".equals(status)) {// 复审通过时
				// 获取首付各种金额 客户选择同意与否
				Bizrisk risk = new Bizrisk();
				risk.setContractid(id);
				List<Bizrisk> rlst = riskMapper.selectByCriteria(risk);
				if (rlst != null && rlst.size() > 0) {
					risk = rlst.get(0);
					map.put("risk", risk);
				}
				String table = risk.getApprovaltableurl();
				if (StringUtils.isNotBlank(table)) {
					table = table.substring(table.lastIndexOf('/') + 1);
					map.put("texturlname", table);
				}

				BigDecimal ap = risk.getAproveprice();// 审批金额
				BigDecimal msmy = risk.getMissmoney();// 缺少金额
				BigDecimal dyp = ap.multiply(new BigDecimal("0.01")).setScale(2, BigDecimal.ROUND_HALF_UP);// 动态监管费
				BigDecimal promise = ap.multiply(new BigDecimal("0.015")).setScale(2, BigDecimal.ROUND_HALF_UP);// 履约险
				BigDecimal tp = (msmy == null ? new BigDecimal("0") : msmy).add(dyp).add(promise).setScale(2, BigDecimal.ROUND_HALF_UP);// 首付
				if (con.getInsurance() != null) {// 交强险
					tp = tp.add(con.getInsurance());
				}
				if (con.getCinsurance() != null) {// 商业险
					tp = tp.add(con.getCinsurance());
				}
				if (con.getQualityprice() != null) {// 质保费
					tp = tp.add(con.getQualityprice());
				}
				// Map<String, BigDecimal> priceMap = new HashMap<String, BigDecimal>();
				// priceMap.put("dyp", dyp);
				// priceMap.put("promise", dyp);
				// priceMap.put("firstpay", tp);
				// map.put("priceMap", priceMap);
				map.put("dyp", dyp);
				map.put("promise", promise);
				map.put("firstpay", tp);
				return "biz/contractfinfirstpay";
			}
		} else if ("1".equals(node) && StringUtils.isBlank(status)) {// 门店部操作
			return "biz/contractshopaudit";// 门店部审核
		} else if ("2".equals(node) && "1".equals(status) && "2".equals(fin)) {// 定金到账审核 财务部操作
			return "biz/contractdownpayaudit";
		} else if ("2".equals(node) && "61".equals(status)) {// 金融合同定金到账审核 财务部操作
			Bizrisk risk1 = new Bizrisk();
			risk1.setContractid(con.getId());
			List<Bizrisk> risk = riskMapper.selectByCriteria(risk1);
			map.put("aproveprice", risk.get(0).getAproveprice());// 金融审批金额
			map.put("missmoney", risk.get(0).getMissmoney());// 金融缺额
			String table = risk.get(0).getApprovaltableurl();
			if (StringUtils.isNotBlank(table)) {
				table = table.substring(table.lastIndexOf('/') + 1);
				map.put("texturlname", table);
			}
			map.put("risk", risk.get(0));
			return "biz/contractdownpayaudit";
		} else if (("3".equals(node) && "4".equals(status)) || ("4".equals(node) && "51".equals(status))) {// 风控进件初审或复审
			getconfilesbyconid(id, map);
			return "biz/riskaudit";
		} else if ("5".equals(node) && "3".equals(status) && "2".equals(fin)) {// 全款合同选车
			return "biz/contractvin";// 选车
		}
		map.put("message", "合同状态已改变，请重新加载列表进行查看！");
		return "error.message";
	}

	/**
	 * 
	 * <p>获取合同查看信息</p>
	 * @param map
	 * @param id
	 * @return
	 * @author wangzh
	 * @param type 
	 * @param insurance 
	 */
	public String getbasecontractbyidforview(ModelMap map, Integer id, String type, String insurance) {
		Bizcontract con = getcontractbyid(id);
		map.put("co", con);
		map.put("type", type);
		map.put("insurance", insurance);
		// map.put("in", getclientinfobyid(con.getInfoid()));
		// 获取上传文件地址 供下载时查看

		String a1 = con.getSalecontract();// 销售合同
		String a2 = con.getDownposbill();// 定金pos单
		String a3 = con.getReportbill();// 报价单
		if (StringUtils.isNotBlank(a1)) {
			a1 = a1.substring(a1.lastIndexOf('/') + 1);
			map.put("salecontractname", a1);
		}
		if (StringUtils.isNotBlank(a2)) {
			a2 = a2.substring(a2.lastIndexOf('/') + 1);
			map.put("downposbillname", a2);
		}
		if (StringUtils.isNotBlank(a3)) {
			a3 = a3.substring(a3.lastIndexOf('/') + 1);
			map.put("reportbillname", a3);
		}
		if (("1").equals(type)) {
			// 根据状态返回不同的页面
			String status = con.getStatus();
			if (StringUtils.isBlank(status) || "1".equals(status) || "2".equals(status) || "3".equals(status) || "30".equals(status) || "61".equals(status)
					|| "63".equals(status)) {
				if ("61".equals(status) || "63".equals(status) || ("3".equals(status) && "1".equals(con.getFinance()))) {
					Bizrisk ri = new Bizrisk();
					ri.setContractid(id);
					List<Bizrisk> risk = riskMapper.selectByCriteria(ri);
					map.put("risk", risk.get(0));
					String table = risk.get(0).getApprovaltableurl();
					if (StringUtils.isNotBlank(table)) {
						table = table.substring(table.lastIndexOf('/') + 1);
						map.put("texturlname", table);
					}
				}
				return "biz/contractbaseview";// 合同原始信息查看
			}
			// if ("1".equals(status) || "2".equals(status)) {
			// // return "biz/contractshoppassview";// 门店部审核后查看
			// return "biz/contractbaseview";// 合同原始信息查看
			// }
			// if ("3".equals(status)||"30".equals(status)) {// 定金已到账
			// // return "biz/contractdownpayview";//
			// return "biz/contractbaseview";// 合同原始信息查看
			// }
			// if ("4".equals(status)) {// 金融时风控进件完待审核
			// // 获取合同相关文件
			// getconfilesbyconid(id, map);
			// return "biz/riskauditview";
			// }
			// if ("30".equals(status)) {// 全款时加入车架号成功
			// // 获取合同相关文件
			// getconfilesbyconid(id, map);
			// return "biz/contractvinview";
			// }
			if ("4".equals(status) || "51".equals(status) || "52".equals(status) || "53".equals(status) || "54".equals(status) || "55".equals(status)
					|| "56".equals(status)) {// 金融时风控进件相关
				// 获取合同相关文件
				getconfilesbyconid(id, map);
				return "biz/riskview";
			}
			return "biz/contractbaseview";
		} else {
			if (("1").equals(con.getFinance())) {
				Bizrisk ri = new Bizrisk();
				ri.setContractid(id);
				List<Bizrisk> risk = riskMapper.selectByCriteria(ri);
				map.put("risk", risk.get(0));
			}
			return "addleasebackcontract/contractvinview";
		}
	}

	/**
	 * 
	 * <p>获取合同关联的文件</p>
	 * @param id
	 * @param map
	 * @author wangzh
	 */
	public void getconfilesbyconid(Integer id, ModelMap map) {
		Bizrisk risk = new Bizrisk();
		risk.setContractid(id);
		List<Bizrisk> rlst = riskMapper.selectByCriteria(risk);
		if (rlst != null && rlst.size() > 0) {
			map.put("risk", rlst.get(0));
		} else {
			throw new PortalBizCheckedException("风控文件不存在");
		}
		// 处理贷审会审批表
		Bizrisk risk1 = rlst.get(0);
		String table = risk1.getApprovaltableurl();
		if (StringUtils.isNotBlank(table)) {
			table = table.substring(table.lastIndexOf('/') + 1);
			map.put("texturlname", table);
		}

		Bizriskfile rf = new Bizriskfile();
		// rf.setContractid(id);
		rf.setRiskid(risk1.getId());
		List<Bizriskfile> lst = riskfileMapper.selectByCriteria(rf);
		map.put("filelst", lst);
		List<Bizriskfile> lst2 = new ArrayList<Bizriskfile>(), lst5 = new ArrayList<Bizriskfile>(), lst6 = new ArrayList<Bizriskfile>(), lst7 = new ArrayList<Bizriskfile>(), lst8 = new ArrayList<Bizriskfile>(), lst10 = new ArrayList<Bizriskfile>();
		map.put("filelst2", lst2);// 2
		map.put("filelst5", lst5);// 5
		map.put("filelst6", lst6);// 6
		map.put("filelst7", lst7);// 7
		map.put("filelst8", lst8);// 8
		map.put("filelst10", lst10);// 10
		for (Bizriskfile bizriskfile : lst) {
			if ("2".equals(bizriskfile.getType())) {
				lst2.add(bizriskfile);
			} else if ("5".equals(bizriskfile.getType())) {
				lst5.add(bizriskfile);
			} else if ("6".equals(bizriskfile.getType())) {
				lst6.add(bizriskfile);
			} else if ("7".equals(bizriskfile.getType())) {
				lst7.add(bizriskfile);
			} else if ("8".equals(bizriskfile.getType())) {
				lst8.add(bizriskfile);
			} else if ("10".equals(bizriskfile.getType())) {
				lst10.add(bizriskfile);
			}
		}
	}

	/**
	 * 
	 * <p>获取客户信息表</p>
	 * @param id
	 * @return
	 * @author wangzh
	 */
	public Bizclientinfo getclientinfobyid(Integer id) {
		return clientinfomapper.selectByPrimaryKey(id);
	}

	/**
	 * 
	 * <p>合同门店部审核</p>
	 * @param id 合同主键
	 * @param pas 1通过2否       
	 * 22    驳回修改后   再提交  update by liang  2018-06-25
	 * @param zero 1零采2否
	 * @author wangzh
	 */
	public void contractshopaudit(Integer id, String pas, String zero, String reason) {
		Bizcontract bizcontract = new Bizcontract();
		bizcontract.setId(id);
		// 1门店部审核通过（定金还未到账，下一步是到账审核） 2不通过
		bizcontract.setStatus(pas);
		flowscheme flow = new flowscheme();
		flow.setTaskid(bizcontract.getId());
		if ("1".equals(pas)) {// 通过时更新是否零采字段
			flow.setTaskname("合同门店部审核通过");
			bizcontract.setZeropur(zero);
		} else if ("2".equals(pas)) {// 不通过
			flow.setTaskname("合同门店部审核不通过");
			bizcontract.setShopnopassreason(reason);
		} else if ("22".equals(pas)) {// 门店部驳回修改
			flow.setTaskname("合同门店部驳回修改");
			bizcontract.setShopnopassreason(reason);
		}
		flow.setTasktype1(2);
		sellContractService.insertSelective(flow);

		contractMapper.updateByPrimaryKeySelective(bizcontract);
	}

	/**
	 * 
	 * <p>定金到账审核</p>
	 * @param id
	 * @param rdp
	 * @author wangzh
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void contractdownpay(Integer id, String rdp) {
		if (StringUtils.isBlank(rdp)) {
			logger.error("提示用户：合同{}，参数实到定金{}", rdp);
			throw new PortalBizCheckedException("实到定金必填！");
		}
		Bizcontract biz = contractMapper.selectByPrimaryKey(id);

		if ("2".equals(biz.getFinance())) {
			if (!"1".equals(biz.getStatus())) {
				throw new PortalBizCheckedException("合同状态已改变，请返回列表查看");
			}
		}
		if ("1".equals(biz.getFinance())) {
			if (!"61".equals(biz.getStatus())) {
				throw new PortalBizCheckedException("合同状态已改变，请返回列表查看");
			}
		}
		Bizcontract bizcontract = new Bizcontract();
		bizcontract.setId(id);
		// 1门店部审核通过（定金还未到账，下一步是到账审核） 2不通过
		bizcontract.setStatus("3");// 定金已到账
		bizcontract.setRealdownpay(new BigDecimal(rdp));
		logger.debug("合同{}，{}", id, bizcontract.getRealdownpay());
		logger.info("合同{}，{}", id, bizcontract.getRealdownpay());
		logger.error("合同{}，{}，参数实到定金字符串{}", id, bizcontract.getRealdownpay(), rdp);
		contractMapper.updateByPrimaryKeySelective(bizcontract);
		// 触发零采任务
		String zero = biz.getZeropur();
		if ("1".equals(zero)) {// 是零采
			Bizzeropurchase zp = new Bizzeropurchase();
			zp.setContractid(id);
			zp.setBrand(biz.getBrand());
			zp.setModel(biz.getModel());
			zp.setVersion(biz.getVersion());
			zp.setOutcolor(biz.getOutcolor());
			zp.setIncolor(biz.getIncolor());
			zp.setConfig(biz.getConfig());
			zp.setCreatetime(new Date());
			zeropurchaseMapper.insertSelective(zp);
		}
		flowscheme flow = new flowscheme();
		flow.setTaskid(id);
		if (biz.getFinance().equals('1')) {
			flow.setTaskname("金融定金到账审核");
		} else {
			flow.setTaskname("全款定金到账审核");
		}
		flow.setTasktype1(1);
		sellContractService.insertSelective(flow);
	}

	/**
	 * 
	 * <p>零采列表查询</p>
	 * @param brand
	 * @param vin
	 * @param code
	 * @param start
	 * @param pageSize
	 * @return
	 * @author wangzh
	 */
	public Map<String, Object> zeropurquery(String brand, String vin, String code, String status, String start, String pageSize) {
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> pmap = new HashMap<String, Object>();
		int ps = Integer.parseInt(pageSize);
		pmap.put("start", (Integer.parseInt(start) - 1) * ps);
		pmap.put("size", ps);
		if (StringUtils.isNotBlank(brand)) {
			pmap.put("brand", brand);
		}
		if (StringUtils.isNotBlank(vin)) {
			pmap.put("vin", vin);
		}
		if (StringUtils.isNotBlank(code)) {
			pmap.put("filecode", code);
		}
		if (StringUtils.isNotBlank(status)) {
			pmap.put("status", status);
		}
		List<Map<String, Object>> lst = zeropurchaseMapper.selectByMap(pmap);
		int size = zeropurchaseMapper.countByMap(pmap);
		map.put("result", lst);
		map.put("total", size);
		return map;
	}

	/**
	 * 
	 * <p>获取零采内容</p>
	 * @param map
	 * @param id
	 * @author wangzh
	 */
	public void zeropuroperate(ModelMap map, Integer id) {
		Bizzeropurchase zp = zeropurchaseMapper.selectByPrimaryKey(id);
		map.put("zp", zp);
	}

	/**
	 * 
	 * <p>零采保存</p>
	 * @param map
	 * @param biz
	 * @author wangzh
	 */
	public void zeropursave(Bizzeropurchase biz) {
		Bizzeropurchase zp = zeropurchaseMapper.selectByPrimaryKey(biz.getId());
		String status = zp.getStatus();
		if (StringUtils.isBlank(status)) {// 初始添加vin时
			// 状态：
			// null初始状态
			// 1已流转到车辆部门
			// 2车辆部门已将零采车辆插入pro_car表
			// 3车辆审批通过已入库
			// 4审批入库未通过
			// 初始添加时判断vin是否重复
			if (StringUtils.isNotBlank(biz.getVin())) {
				Car record = new Car();
				record.setVin(biz.getVin());
				record.setIsStored(1);
				int c = carMapper.countByParam(record);
				if (c > 0) {
					throw new PortalBizCheckedException("车架号[" + biz.getVin() + "]已存在！");
				}
				biz.setStatus("1");
				zeropurchaseMapper.updateByPrimaryKeySelective(biz);
			}
		} else if ("1".equals(status) || "4".equals(status)) {// 编辑时或重新流转时
			// if (StringUtils.isNotBlank(zp.getVin()) && zp.getVin().equals(biz.getVin())) {//
			// vin未改变
			// } else {
			Car record = new Car();
			record.setVin(biz.getVin());
			record.setIsStored(1);
			int c = carMapper.countByParam(record);
			if (c > 0) {
				throw new PortalBizCheckedException("车架号[" + biz.getVin() + "]已存在！");
			}
			// }
			if ("4".equals(status)) {
				biz.setStatus("1");
			}
			zeropurchaseMapper.updateByPrimaryKeySelective(biz);
		} else {
			throw new PortalBizCheckedException("零采记录状态异常，请返回列表查看！");
		}
		flowscheme flow = new flowscheme();
		flow.setTaskid(zp.getId());
		flow.setTaskname("零采保存");
		flow.setTasktype1(4);
		sellContractService.insertSelective(flow);
	}

	public void checkvinishave(String vin) {
		Car record = new Car();
		record.setVin(vin);
		// record.setIsStored(1);
		int c = carMapper.countByParam(record);
		if (c > 0) {
			throw new PortalBizCheckedException("车架号[" + vin + "]的车辆已已存在车辆库中！");
		}
	}

	/**
	 * 
	 * <p>新增风控进件保存</p>
	 * @param id
	 * @param conid
	 * @param concode
	 * @param apply
	 * @param identify
	 * @param driver
	 * @param work
	 * @param credit
	 * @param card
	 * @param flow
	 * @param house
	 * @param marriage
	 * @param ensure
	 * @author wangzh
	 * @throws IOException 
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void saverisk(Integer conid, String concode, MultipartFile apply, MultipartFile[] identify, MultipartFile driver, MultipartFile work,
			MultipartFile[] credit, MultipartFile[] card, MultipartFile[] flow, MultipartFile[] house, MultipartFile marriage, MultipartFile[] ensure)
			throws IOException {
		// 查一下该合同有没有进件过
		// Bizrisk riskforquery = new Bizrisk();
		// riskforquery.setContractid(conid);
		// int rc = riskMapper.countByCriteria(riskforquery);
		// if (rc > 0) {
		// throw new PortalBizCheckedException("该合同已有对应的风控进件，请返回列表查看");
		// }
		Bizcontract biz = contractMapper.selectByPrimaryKey(conid);
		if (!"3".equals(biz.getStatus())) {
			throw new PortalBizCheckedException("合同状态已改变，请返回列表查看");
		}
		Date now = new Date();
		Bizrisk br = new Bizrisk();
		br.setContractid(conid);
		br.setFilecode(concode);
		br.setCreatetime(now);
		riskMapper.insertSelective(br);
		Bizrisk update = new Bizrisk();
		update.setId(br.getId());
		// 上传相关文件

		List<Riskfiledto> lst = new ArrayList<Riskfiledto>();
		List<Bizriskfile> lst1 = new ArrayList<Bizriskfile>();
		String _apply = resourceService.risksave(apply, FileTypeEnum.riskapply);
		update.setApplybill(_apply);// 1申请单
		Riskfiledto dto = new Riskfiledto();
		dto.setName(_apply);
		dto.setInput(apply.getInputStream());
		lst.add(dto);

		for (int i = 0; i < identify.length; i++) {
			Riskfiledto dto1 = new Riskfiledto();
			String add = resourceService.risksave(identify[i], FileTypeEnum.riskidentify);
			dto1.setName(add);
			dto1.setInput(identify[i].getInputStream());
			lst.add(dto1);
			Bizriskfile file = new Bizriskfile();
			file.setRiskid(br.getId());
			file.setContractid(conid);
			file.setFilecode(concode);
			file.setCreatetime(now);
			file.setAddress(add);
			file.setType("2");// 2身份证
			lst1.add(file);
		}
		String _driver = resourceService.risksave(driver, FileTypeEnum.riskdriver);
		update.setDriverprove(_driver);// 3驾驶证
		Riskfiledto dto11 = new Riskfiledto();
		dto11.setName(_driver);
		dto11.setInput(driver.getInputStream());
		lst.add(dto11);
		String _work = resourceService.risksave(work, FileTypeEnum.riskworkprove);
		update.setWorkprove(_work);// 4工作证明
		Riskfiledto dto2 = new Riskfiledto();
		dto2.setName(_work);
		dto2.setInput(work.getInputStream());
		lst.add(dto2);

		for (int i = 0; i < credit.length; i++) {
			Riskfiledto dto1 = new Riskfiledto();
			String add = resourceService.risksave(credit[i], FileTypeEnum.riskcreditreport);
			dto1.setName(add);
			dto1.setInput(credit[i].getInputStream());
			lst.add(dto1);
			Bizriskfile file = new Bizriskfile();
			file.setRiskid(br.getId());
			file.setContractid(conid);
			file.setFilecode(concode);
			file.setCreatetime(now);
			file.setAddress(add);
			file.setType("5");// 5征信报告
			lst1.add(file);
		}

		for (int i = 0; i < card.length; i++) {
			Riskfiledto dto1 = new Riskfiledto();
			String add = resourceService.risksave(card[i], FileTypeEnum.riskpaycard);
			dto1.setName(add);
			dto1.setInput(card[i].getInputStream());
			lst.add(dto1);
			Bizriskfile file = new Bizriskfile();
			file.setRiskid(br.getId());
			file.setContractid(conid);
			file.setFilecode(concode);
			file.setCreatetime(now);
			file.setAddress(add);
			file.setType("6");// 风控工资卡
			lst1.add(file);
		}

		for (int i = 0; i < flow.length; i++) {
			Riskfiledto dto1 = new Riskfiledto();
			String add = resourceService.risksave(flow[i], FileTypeEnum.riskflow);
			dto1.setName(add);
			dto1.setInput(flow[i].getInputStream());
			lst.add(dto1);
			Bizriskfile file = new Bizriskfile();
			file.setRiskid(br.getId());
			file.setContractid(conid);
			file.setFilecode(concode);
			file.setCreatetime(now);
			file.setAddress(add);
			file.setType("7");// 风控流水
			lst1.add(file);
		}

		for (int i = 0; i < house.length; i++) {
			Riskfiledto dto1 = new Riskfiledto();
			String add = resourceService.risksave(house[i], FileTypeEnum.riskhouse);
			dto1.setName(add);
			dto1.setInput(house[i].getInputStream());
			lst.add(dto1);
			Bizriskfile file = new Bizriskfile();
			file.setRiskid(br.getId());
			file.setContractid(conid);
			file.setFilecode(concode);
			file.setCreatetime(now);
			file.setAddress(add);
			file.setType("8");// 房产证
			lst1.add(file);
		}
		String _marriage = resourceService.risksave(marriage, FileTypeEnum.riskmarriage);
		update.setMarryprove(_marriage);// 9结婚证
		Riskfiledto dto3 = new Riskfiledto();
		dto3.setName(_marriage);
		dto3.setInput(marriage.getInputStream());
		lst.add(dto3);
		for (int i = 0; i < ensure.length; i++) {
			if (!ensure[i].isEmpty()) {
				Riskfiledto dto1 = new Riskfiledto();
				String add = resourceService.risksave(ensure[i], FileTypeEnum.riskensure);
				dto1.setName(add);
				dto1.setInput(ensure[i].getInputStream());
				lst.add(dto1);
				Bizriskfile file = new Bizriskfile();
				file.setRiskid(br.getId());
				file.setContractid(conid);
				file.setFilecode(concode);
				file.setCreatetime(now);
				file.setAddress(add);
				file.setType("10");// 担保人身份证
				lst1.add(file);
			}
		}
		riskMapper.updateByPrimaryKeySelective(update);
		for (Bizriskfile bizriskfile : lst1) {
			riskfileMapper.insertSelective(bizriskfile);
		}
		Bizcontract contract = new Bizcontract();
		contract.setId(conid);
		contract.setStatus("4");// 风控进件待审核
		contractMapper.updateByPrimaryKeySelective(contract);
		resourceService.asyncSaveFilesDirect(lst, true);
	}

	/**
	 * 
	 * <p>风控进件新增保存（图片单独上传）</p>
	 * @param conid
	 * @param concode
	 * @param str
	 * @throws IOException
	 * @author wangzh
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void saverisknew(Integer conid, String concode, String str) throws IOException {
		// 查一下该合同有没有进件过
		Bizcontract biz = contractMapper.selectByPrimaryKey(conid);
		if (!"1".equals(biz.getStatus())) {// 1是门店部审核合同通过之后
			throw new PortalBizCheckedException("合同状态已改变，请返回列表查看");
		}
		Date now = new Date();
		Bizrisk br = new Bizrisk();
		br.setContractid(conid);
		br.setFilecode(concode);// 加上冗余合同编码吧
		br.setCreatetime(now);
		riskMapper.insertSelective(br);
		Bizrisk update = new Bizrisk();
		update.setId(br.getId());
		// 上传相关文件

		if (StringUtils.isNotBlank(str)) {
			JSONArray jsonArray = JSONArray.fromObject(str);
			List<Bizriskfile> lst = new ArrayList<Bizriskfile>();
			for (int i = 0; i < jsonArray.size(); i++) {
				JSONObject job = jsonArray.getJSONObject(i);
				String type = job.get("type").toString();
				String add = job.getString("add");
				int pid = job.getInt("pid");
				if ("2".equals(type) || "5".equals(type) || "6".equals(type) || "7".equals(type) || "8".equals(type) || "10".equals(type)) {
					// 2身份证 5征信报告 6风控工资卡 7风控流水 8房产证 10担保人身份证
					Bizriskfile file = new Bizriskfile();
					file.setRiskid(br.getId());
					// file.setContractid(conid);
					// file.setFilecode(concode);
					file.setCreatetime(now);
					file.setAddress(add);
					file.setType(type);// 2身份证
					// file.setContractid(pid);// pir是前端的预览索引，暂时用来作为排序字段
					file.setSort(pid);
					// riskfileMapper.insertSelective(file);
					lst.add(file);
				} else {
					if ("1".equals(type)) {// 1申请单
						update.setApplybill(add);
					} else if ("3".equals(type)) {// 3驾驶证
						update.setDriverprove(add);
					} else if ("4".equals(type)) {// 4工作证明
						update.setWorkprove(add);
					} else if ("9".equals(type)) {// 9结婚证
						update.setMarryprove(add);
					}
				}
			}
			Collections.sort(lst);
			for (Bizriskfile bizriskfile : lst) {
				riskfileMapper.insertSelective(bizriskfile);
			}
		}
		riskMapper.updateByPrimaryKeySelective(update);
		Bizcontract contract = new Bizcontract();
		contract.setId(conid);
		contract.setStatus("4");// 风控进件待审核
		contractMapper.updateByPrimaryKeySelective(contract);
		flowscheme flow = new flowscheme();
		flow.setTaskid(conid);
		flow.setTaskname("风控进件保存");
		flow.setTasktype1(2);
		sellContractService.insertSelective(flow);
	}

	/**
	 * 
	 * <p>风控进件编辑保存</p>
	 * @param id
	 * @param conid
	 * @param dels
	 * @param str
	 * @throws IOException
	 * @author wangzh
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void saveriskforeditnew(Integer id, Integer conid, String dels, String str) throws IOException {
		Bizcontract biz = contractMapper.selectByPrimaryKey(conid);
		flowscheme flow = new flowscheme();
		flow.setTaskid(conid);
		if (!"52".equals(biz.getStatus()) && !"55".equals(biz.getStatus())) {
			throw new PortalBizCheckedException("合同状态已改变，请返回列表查看");
		}
		boolean hasupdate = false, delmarrige = false;
		// 根据id删除riskfile
		if (StringUtils.isNotBlank(dels)) {
			JSONArray jsonArray = JSONArray.fromObject(dels);
			for (int i = 0; i < jsonArray.size(); i++) {
				JSONObject job = jsonArray.getJSONObject(i);
				int delid = Integer.parseInt(job.get("id").toString());
				if (delid > -1) {
					riskfileMapper.deleteByPrimaryKey(delid);
				} else {
					delmarrige = true;
				}
			}
		}
		// 新增riskfile
		Date now = new Date();
		// Bizrisk br = new Bizrisk();
		// br.setContractid(conid);
		// br.setFilecode(concode);
		// br.setCreatetime(now);
		// riskMapper.insertSelective(br);
		Bizrisk update = new Bizrisk();
		update.setId(id);

		// 上传相关文件
		if (StringUtils.isNotBlank(str)) {
			JSONArray jsonArray = JSONArray.fromObject(str);
			List<Bizriskfile> lst = new ArrayList<Bizriskfile>();
			for (int i = 0; i < jsonArray.size(); i++) {
				JSONObject job = jsonArray.getJSONObject(i);
				String type = job.get("type").toString();
				String add = job.getString("add");
				int pid = job.getInt("pid");
				if ("2".equals(type) || "5".equals(type) || "6".equals(type) || "7".equals(type) || "8".equals(type) || "10".equals(type)) {
					// 2身份证 5征信报告 6风控工资卡 7风控流水 8房产证 10担保人身份证
					Bizriskfile file = new Bizriskfile();
					file.setRiskid(id);
					// file.setContractid(conid);
					// file.setFilecode(concode);
					file.setCreatetime(now);
					file.setAddress(add);
					file.setType(type);
					file.setSort(pid);
					// riskfileMapper.insertSelective(file);
					lst.add(file);
				} else {
					if ("1".equals(type)) {// 1申请单
						update.setApplybill(add);
						hasupdate = true;
					} else if ("3".equals(type)) {// 3驾驶证
						update.setDriverprove(add);
						hasupdate = true;
					} else if ("4".equals(type)) {// 4工作证明
						update.setWorkprove(add);
						hasupdate = true;
					} else if ("9".equals(type)) {// 9结婚证
						update.setMarryprove(add);
						hasupdate = true;
						delmarrige = false;
					}
				}
			}
			if (lst.size() > 0) {
				Collections.sort(lst);
				for (Bizriskfile bizriskfile : lst) {
					riskfileMapper.insertSelective(bizriskfile);
				}
			}
		}
		if (hasupdate) {
			riskMapper.updateByPrimaryKeySelective(update);
		}
		if (delmarrige) {
			riskMapper.setMarriageNullByPrimaryKey(id);
		}
		// Bizcontract contract = new Bizcontract();
		// contract.setId(conid);
		// contract.setStatus("4");// 风控进件待审核
		// contractMapper.updateByPrimaryKeySelective(contract);
		Bizcontract contract = new Bizcontract();
		contract.setId(conid);
		if ("52".equals(biz.getStatus())) {
			flow.setTaskname("风控进件初审补件保存");
			contract.setStatus("4");// 风控进件待审核
		} else if ("55".equals(biz.getStatus())) {
			flow.setTaskname("风控进件复审补件保存");
			contract.setStatus("51");// 风控进件初审通过
		}
		contractMapper.updateByPrimaryKeySelective(contract);
		// resourceService.asyncSaveFilesDirect(lst, true);
		flow.setTasktype1(2);
		sellContractService.insertSelective(flow);
	}

	/**
	 * 
	 * <p>单图上传</p>
	 * @param type
	 * @param file
	 * @return
	 * @throws Exception
	 * @author wangzh
	 */
	public String uploadonefile(Integer tp, MultipartFile file) throws Exception {
		String picPath = null;
		int type = tp.intValue();
		if (type == 1) {
			picPath = resourceService.uploadOneFileForRisk(file, FileTypeEnum.riskapply);
		} else if (type == 3) {
			picPath = resourceService.uploadOneFileForRisk(file, FileTypeEnum.riskdriver);
		} else if (type == 4) {
			picPath = resourceService.uploadOneFileForRisk(file, FileTypeEnum.riskworkprove);
		} else if (type == 9) {
			picPath = resourceService.uploadOneFileForRisk(file, FileTypeEnum.riskmarriage);
		} else if (type == 2) {
			picPath = resourceService.uploadOneFileForRisk(file, FileTypeEnum.riskidentify);
		} else if (type == 5) {
			picPath = resourceService.uploadOneFileForRisk(file, FileTypeEnum.riskcreditreport);
		} else if (type == 6) {
			picPath = resourceService.uploadOneFileForRisk(file, FileTypeEnum.riskpaycard);
		} else if (type == 7) {
			picPath = resourceService.uploadOneFileForRisk(file, FileTypeEnum.riskflow);
		} else if (type == 8) {
			picPath = resourceService.uploadOneFileForRisk(file, FileTypeEnum.riskhouse);
		} else if (type == 10) {
			picPath = resourceService.uploadOneFileForRisk(file, FileTypeEnum.riskensure);
		}
		return picPath;
	}

	/**
	 * 
	 * <p>开票单图上传</p>
	 * @param type
	 * @param file
	 * @return
	 * @throws Exception
	 * @author wangzh
	 */
	public String uploadoneinvoicefile(Integer tp, MultipartFile file) throws Exception {
		String picPath = null;
		// 开票文件类型 1营业执照 2转账银行流水/支付宝/微信流水截图 3代付款证明 4代付款人身份证正反面
		// 5身份证正反面
		int type = tp.intValue();
		if (type == 1) {
			picPath = resourceService.uploadOneFileForRisk(file, FileTypeEnum.invoicerun);
		} else if (type == 2) {
			picPath = resourceService.uploadOneFileForRisk(file, FileTypeEnum.invoiceflow);
		} else if (type == 3) {
			picPath = resourceService.uploadOneFileForRisk(file, FileTypeEnum.invoicereplace);
		} else if (type == 4) {
			picPath = resourceService.uploadOneFileForRisk(file, FileTypeEnum.invoicereplaceid);
		} else if (type == 5) {
			picPath = resourceService.uploadOneFileForRisk(file, FileTypeEnum.invoiceidentify);
		}
		return picPath;
	}

	/**
	 * 
	 * <p>风控进件编辑保存</p>
	 * @param id
	 * @param conid
	 * @param dels
	 * @param apply
	 * @param identify
	 * @param driver
	 * @param work
	 * @param credit
	 * @param card
	 * @param flow
	 * @param house
	 * @param marriage
	 * @param ensure
	 * @throws IOException
	 * @author wangzh
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void saveriskforedit(Integer id, Integer conid, String dels, MultipartFile apply, MultipartFile[] identify, MultipartFile driver,
			MultipartFile work, MultipartFile[] credit, MultipartFile[] card, MultipartFile[] flow, MultipartFile[] house, MultipartFile marriage,
			MultipartFile[] ensure) throws IOException {
		Bizcontract biz = contractMapper.selectByPrimaryKey(conid);
		if (!"52".equals(biz.getStatus()) && !"55".equals(biz.getStatus())) {
			throw new PortalBizCheckedException("合同状态已改变，请返回列表查看");
		}
		// 根据id删除riskfile
		if (StringUtils.isNotBlank(dels)) {
			JSONArray jsonArray = JSONArray.fromObject(dels);
			for (int i = 0; i < jsonArray.size(); i++) {
				JSONObject job = jsonArray.getJSONObject(i);
				riskfileMapper.deleteByPrimaryKey(Integer.parseInt(job.get("id").toString()));
			}
		}
		// 新增riskfile
		Date now = new Date();
		List<Riskfiledto> lst = new ArrayList<Riskfiledto>();
		List<Bizriskfile> lst1 = new ArrayList<Bizriskfile>();
		Bizrisk update = new Bizrisk();
		update.setId(id);
		if (apply != null && apply.getSize() > 0) {

			String _apply = resourceService.risksave(apply, FileTypeEnum.riskapply);
			update.setApplybill(_apply);// 1申请单
			Riskfiledto dto = new Riskfiledto();
			dto.setName(_apply);
			dto.setInput(apply.getInputStream());
			lst.add(dto);
		}
		for (int i = 0; i < identify.length; i++) {
			if (identify[i] != null && identify[i].getSize() > 0) {
				Riskfiledto dto1 = new Riskfiledto();
				String add = resourceService.risksave(identify[i], FileTypeEnum.riskidentify);
				dto1.setName(add);
				dto1.setInput(identify[i].getInputStream());
				lst.add(dto1);
				Bizriskfile file = new Bizriskfile();
				file.setRiskid(id);
				file.setContractid(conid);
				// file.setFilecode(concode);
				file.setCreatetime(now);
				file.setAddress(add);
				file.setType("2");// 2身份证
				lst1.add(file);
			}
		}
		if (driver != null && driver.getSize() > 0) {
			String _driver = resourceService.risksave(driver, FileTypeEnum.riskdriver);
			update.setDriverprove(_driver);// 3驾驶证
			Riskfiledto dto11 = new Riskfiledto();
			dto11.setName(_driver);
			dto11.setInput(driver.getInputStream());
			lst.add(dto11);
		}
		if (work != null && work.getSize() > 0) {
			String _work = resourceService.risksave(work, FileTypeEnum.riskworkprove);
			update.setWorkprove(_work);// 4工作证明
			Riskfiledto dto2 = new Riskfiledto();
			dto2.setName(_work);
			dto2.setInput(work.getInputStream());
			lst.add(dto2);
		}
		for (int i = 0; i < credit.length; i++) {
			if (credit[i] != null && credit[i].getSize() > 0) {
				Riskfiledto dto1 = new Riskfiledto();
				String add = resourceService.risksave(credit[i], FileTypeEnum.riskcreditreport);
				dto1.setName(add);
				dto1.setInput(credit[i].getInputStream());
				lst.add(dto1);
				Bizriskfile file = new Bizriskfile();
				file.setRiskid(id);
				file.setContractid(conid);
				// file.setFilecode(concode);
				file.setCreatetime(now);
				file.setAddress(add);
				file.setType("5");// 5征信报告
				lst1.add(file);
			}
		}
		for (int i = 0; i < card.length; i++) {
			if (card[i] != null && card[i].getSize() > 0) {
				Riskfiledto dto1 = new Riskfiledto();
				String add = resourceService.risksave(card[i], FileTypeEnum.riskpaycard);
				dto1.setName(add);
				dto1.setInput(card[i].getInputStream());
				lst.add(dto1);
				Bizriskfile file = new Bizriskfile();
				file.setRiskid(id);
				file.setContractid(conid);
				// file.setFilecode(concode);
				file.setCreatetime(now);
				file.setAddress(add);
				file.setType("6");// 风控工资卡
				lst1.add(file);
			}
		}
		for (int i = 0; i < flow.length; i++) {
			if (flow[i] != null && flow[i].getSize() > 0) {
				Riskfiledto dto1 = new Riskfiledto();
				String add = resourceService.risksave(flow[i], FileTypeEnum.riskflow);
				dto1.setName(add);
				dto1.setInput(flow[i].getInputStream());
				lst.add(dto1);
				Bizriskfile file = new Bizriskfile();
				file.setRiskid(id);
				file.setContractid(conid);
				// file.setFilecode(concode);
				file.setCreatetime(now);
				file.setAddress(add);
				file.setType("7");// 风控流水
				lst1.add(file);
			}
		}
		for (int i = 0; i < house.length; i++) {
			if (house[i] != null && house[i].getSize() > 0) {
				Riskfiledto dto1 = new Riskfiledto();
				String add = resourceService.risksave(house[i], FileTypeEnum.riskhouse);
				dto1.setName(add);
				dto1.setInput(house[i].getInputStream());
				lst.add(dto1);
				Bizriskfile file = new Bizriskfile();
				file.setRiskid(id);
				file.setContractid(conid);
				// file.setFilecode(concode);
				file.setCreatetime(now);
				file.setAddress(add);
				file.setType("8");// 房产证
				lst1.add(file);
			}
		}
		if (marriage != null && marriage.getSize() > 0) {
			String _marriage = resourceService.risksave(marriage, FileTypeEnum.riskmarriage);
			update.setMarryprove(_marriage);// 9结婚证
			Riskfiledto dto3 = new Riskfiledto();
			dto3.setName(_marriage);
			dto3.setInput(marriage.getInputStream());
			lst.add(dto3);
		}
		for (int i = 0; i < ensure.length; i++) {
			if (!ensure[i].isEmpty()) {
				Riskfiledto dto1 = new Riskfiledto();
				String add = resourceService.risksave(ensure[i], FileTypeEnum.riskensure);
				dto1.setName(add);
				dto1.setInput(ensure[i].getInputStream());
				lst.add(dto1);
				Bizriskfile file = new Bizriskfile();
				file.setRiskid(id);
				file.setContractid(conid);
				// file.setFilecode(concode);
				file.setCreatetime(now);
				file.setAddress(add);
				file.setType("10");// 担保人身份证
				lst1.add(file);
			}
		}
		riskMapper.updateByPrimaryKeySelective(update);
		for (Bizriskfile bizriskfile : lst1) {
			riskfileMapper.insertSelective(bizriskfile);
		}
		Bizcontract contract = new Bizcontract();
		contract.setId(conid);
		if ("52".equals(biz.getStatus())) {
			contract.setStatus("4");// 风控进件待审核
		} else if ("55".equals(biz.getStatus())) {
			contract.setStatus("51");// 风控进件初审通过
		}
		contractMapper.updateByPrimaryKeySelective(contract);
		resourceService.asyncSaveFilesDirect(lst, true);
	}

	/**
	 * 
	 * <p>合同增加车架号</p>
	 * @param id
	 * @param carid
	 * @param vin
	 * @author wangzh
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void contractvin(Integer id, Integer carid, String vin) {
		Bizcontract biz1 = contractMapper.selectByPrimaryKey(id);
		flowscheme flow = new flowscheme();
		Date now = new Date();
		if (!"3".equals(biz1.getStatus())) {
			throw new PortalBizCheckedException("合同状态已改变，请返回列表查看");
		}
		Car car = carMapper.selectByPrimaryKey(carid);
		Integer salestatus = car.getSaleStatus();
		if (salestatus != null) {
			throw new PortalMsBizCheckedException("该车辆已被锁定");
		}

		Bizcontract biz = new Bizcontract();
		biz.setId(id);
		biz.setCarid(carid);
		biz.setVin(vin);
		if ("1".equals(biz1.getFinance())) {
			biz.setStatus("62");// 金融选车完毕
		} else {
			biz.setStatus("30");// 全款时加入车架号成功
		}

		// String zeropur = biz1.getZeropur();
		// if ("1".equals(zeropur) && biz1.getCarid() != null && carid.equals(biz1.getCarid())) {//
		// 零采时入库车辆和最终选择的车辆一致时
		// biz.setChosecar("1");
		// }

		contractMapper.updateByPrimaryKeySelective(biz);
		Car car1 = new Car();
		car1.setId(carid);
		car1.setSaleStatus(1);
		carMapper.updateByPrimaryKeySelective(car1);
		// 操作利息======开始
		Shop shop = shopMapper.selectByPrimaryKey(biz1.getShopid());
		String shoptype = shop.getType();// 类型 0虚拟1自营2城市合伙人3寄售
		Integer financetype = shop.getFinanceType();// 1 样车 金融 2采购 金融
		if ("2".equals(shoptype) && financetype == null) {// 城市合伙人前提下 若不指定是样车还是采购则报异常
			throw new PortalMsBizCheckedException("[" + shop.getName() + "]金融类型（样车金融、采购金融）未指定");
		}
		if ("2".equals(shoptype) && 1 == financetype.intValue()) {// 城市合伙人并且是样车金融 才可以操作计息表

			PayMoneyInterest interest = new PayMoneyInterest();
			interest.setId(UUIDTool.getUUID());
			interest.setShopId(shop.getId());// 卖车的门店
			interest.setCarId(carid);
			interest.setPayStartDate(now);
			interest.setPayEndDate(now);
			interest.setCreateTime(now);
			interest.setIsSale(1);// 1是卖车的。 如果是卖车的 则不计算利息了
			payMoneyInterestMapper.insertSelective(interest);// 插一条卖车不计息的记录

			PayMoneyInterest temp = new PayMoneyInterest(), resultInterest = null;
			temp.setCarId(carid);
			List<PayMoneyInterest> lst = payMoneyInterestMapper.selectByCriteria(temp);
			for (PayMoneyInterest payMoneyInterest : lst) {
				Date endDate = payMoneyInterest.getPayEndDate();
				if (endDate == null) {
					resultInterest = payMoneyInterest;
					break;
				}
			}
			if (resultInterest != null) {
				PayMoneyInterest temp1 = new PayMoneyInterest();
				temp1.setId(resultInterest.getId());
				temp1.setPayEndDate(now);
				payMoneyInterestMapper.updateByPrimaryKeySelective(temp1);// 如果此车有未结息的记录 更新之
			}
		}
		// 操作配车=========开始
		Integer carshopid = car.getShopId();
		if (carshopid != null) {// 在门店中
			if (shop.getId().equals(carshopid)) {// 车就在卖车的这个门店里
				// 无须配车
			} else {
				prosupplycartable table = new prosupplycartable();
				Shop from = shopMapper.selectByPrimaryKey(carshopid);
				if (biz1.getFinance().equals("1")) {
					table.setName("自动配车（金融选车后），从门店[" + from.getName() + "]->门店[" + shop.getName() + "]，配车时间["
							+ DateUtils.formate(now, DateUtils.DEFAULT_DATETIME_FORMAT_SEC) + "]");
					flow.setTaskname("金融合同选车");
				} else {
					table.setName("自动配车（全款选车后），从门店[" + from.getName() + "]->门店[" + shop.getName() + "]，配车时间["
							+ DateUtils.formate(now, DateUtils.DEFAULT_DATETIME_FORMAT_SEC) + "]");
					flow.setTaskname("全款合同选车");
				}
				table.setCreatetime(now);
				table.setShopid(shop.getId());
				table.setShopname(shop.getName());
				table.setFinancialtype(shop.getFinanceType());
				table.setStatus(4);// 4超额的门店配车审核通过和没有超额门店的配车
				prosupplycartableMapper.insertSelective(table);

				prosupplycar detail = new prosupplycar();
				detail.setSupplycartableid(table.getId());
				detail.setCarid(carid);
				detail.setBrand(car.getBrand());
				detail.setModel(car.getModel());
				detail.setVersion(car.getVersion());
				detail.setVin(car.getVin());
				detail.setLeavefactorytime(car.getLeaveFactoryTime());
				detail.setOutcolor(car.getOutlookColor());
				detail.setIncolor(car.getInnerColor());
				detail.setShopid(carshopid);
				detail.setShopname(from.getName());
				detail.setNowaddress(from.getAddress());
				detail.setMoveshopid(shop.getId());
				detail.setMoveaddress(shop.getAddress());
				detail.setMoveshopname(shop.getName());
				detail.setCreatetime(now);
				if ("2".equals(shop.getType()) && shop.getFinanceType() == 2) {// 当是采购金融门店销售时取录入时的采购金融结算价
																				// 其他类型门店时
																				// 每日报价没值时取录入时的结算价
					if (car.getPurchasesettlementprice() == null) {
						throw new PortalBizCheckedException("您选择的车辆没有采购金融结算价，请核实！");
					}
					detail.setSettlementprice(car.getPurchasesettlementprice());
				} else {
					if (car.getSettlementprice() == null && car.getTypeinsettleprice() == null) {
						throw new PortalBizCheckedException("选择的车辆没有结算价不能选车！");
					} else {
						detail.setSettlementprice(car.getSettlementprice() != null ? car.getSettlementprice() : car.getTypeinsettleprice());
					}

				}

				detail.setSupplystatus(4);// 4超额的门店配车审核通过和没有超额门店的配车
				detail.setFinancialtype(shop.getFinanceType());
				prosupplycarMapper.insertSelective(detail);
			}
		} else {// 在仓库中
			Integer carstoreid = car.getStoreId();
			prosupplycartable table = new prosupplycartable();
			Store from = storeMapper.selectByPrimaryKey(carstoreid);
			if (biz1.getFinance().equals("1")) {
				table.setName("自动配车（金融选车后），从门店[" + from.getName() + "]->门店[" + shop.getName() + "]，配车时间["
						+ DateUtils.formate(now, DateUtils.DEFAULT_DATETIME_FORMAT_SEC) + "]");
				flow.setTaskname("金融合同选车");
			} else {
				table.setName("自动配车（全款选车后），从门店[" + from.getName() + "]->门店[" + shop.getName() + "]，配车时间["
						+ DateUtils.formate(now, DateUtils.DEFAULT_DATETIME_FORMAT_SEC) + "]");
				flow.setTaskname("全款合同选车");
			}
			table.setCreatetime(now);
			table.setShopid(shop.getId());
			table.setShopname(shop.getName());
			table.setFinancialtype(shop.getFinanceType());
			table.setStatus(4);// 4超额的门店配车审核通过和没有超额门店的配车
			prosupplycartableMapper.insertSelective(table);

			prosupplycar detail = new prosupplycar();
			detail.setSupplycartableid(table.getId());
			detail.setCarid(carid);
			detail.setBrand(car.getBrand());
			detail.setModel(car.getModel());
			detail.setVersion(car.getVersion());
			detail.setVin(car.getVin());
			detail.setLeavefactorytime(car.getLeaveFactoryTime());
			detail.setOutcolor(car.getOutlookColor());
			detail.setIncolor(car.getInnerColor());
			detail.setStoreid(carstoreid);
			detail.setShopname(from.getName());
			detail.setNowaddress(from.getAddress());
			detail.setMoveshopid(shop.getId());
			detail.setMoveaddress(shop.getAddress());
			detail.setMoveshopname(shop.getName());
			detail.setCreatetime(now);
			if ("2".equals(shop.getType()) && shop.getFinanceType() == 2) {// 当是采购金融门店销售时取录入时的采购结算价
																			// 其他类型门店 时
																			// 每日报价没值时取录入时的结算价
				if (car.getPurchasesettlementprice() == null) {
					throw new PortalBizCheckedException("您选择的车辆没有采购金融结算价，请核实");
				}
				detail.setSettlementprice(car.getPurchasesettlementprice());
			} else {
				if (car.getSettlementprice() == null && car.getTypeinsettleprice() == null) {
					throw new PortalBizCheckedException("选择的车辆没有结算价不能选车！");
				} else {
					detail.setSettlementprice(car.getSettlementprice() != null ? car.getSettlementprice() : car.getTypeinsettleprice());
				}
			}
			flow.setTaskid(id);
			flow.setTasktype1(2);
			sellContractService.insertSelective(flow);
			detail.setSupplystatus(4);// 4超额的门店配车审核通过和没有超额门店的配车
			detail.setFinancialtype(shop.getFinanceType());
			prosupplycarMapper.insertSelective(detail);
		}
	}

	/**
	 * 
	 * <p>风控进件审核</p>
	 * @param id
	 * @param ret
	 * @param node
	 * @author wangzh
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void contractriskaudit(Integer id, Integer riskid, BigDecimal aproveprice, BigDecimal missmoney, MultipartFile fapprovaltable, String ret,
			String repairreason, String refusereason, String node) {
		Bizcontract biz = contractMapper.selectByPrimaryKey(id);
		flowscheme flow = new flowscheme();
		flow.setTaskid(biz.getId());
		Bizrisk risk = new Bizrisk();
		risk.setId(riskid);
		Bizcontract biz1 = new Bizcontract();
		biz1.setId(id);
		if ("3".equals(node) && "4".equals(biz.getStatus())) {// 初审
			if ("1".equals(ret)) {// 通过
				biz1.setStatus("51");
				risk.setStatus("51");
				risk.setAproveprice(aproveprice);
				risk.setMissmoney(missmoney);
				risk.setRepairreason("");// 清空
				// 上传文件
				if (fapprovaltable != null && fapprovaltable.getSize() > 0) {
					try {
						String name = fapprovaltable.getOriginalFilename();
						boolean hasdot = false;
						if (StringUtils.isNotBlank(name)) {
							int dot = name.lastIndexOf(".");
							if (dot > 0) {
								hasdot = true;
								name = name.substring(dot);
							}
						}
						String path = uploadFileTogether(fapprovaltable, FileTypeEnum.riskapprovaltable, hasdot, name);
						// 获取文件后缀

						risk.setApprovaltableurl(path);
					} catch (IOException e) {
						throw new PortalAppUnCheckedException("file upload failed");
					}
				}
				flow.setTaskname("风控进初审通过");
			} else if ("2".equals(ret)) {// 补件
				biz1.setStatus("52");
				risk.setStatus("52");
				flow.setTaskname("风控进初审补件");
				risk.setRepairreason(repairreason);
			} else if ("3".equals(ret)) {// 拒单
				biz1.setStatus("53");
				risk.setStatus("53");
				risk.setRepairreason("");// 清空
				risk.setRefusereason(refusereason);
				flow.setTaskname("风控进初审拒单");
			}
			contractMapper.updateByPrimaryKeySelective(biz1);
			riskMapper.updateByPrimaryKeySelective(risk);
		} else if ("4".equals(node) && "51".equals(biz.getStatus())) {
			if ("1".equals(ret)) {// 通过
				flow.setTaskname("风控复审通过");
				biz1.setStatus("54");
				risk.setStatus("54");
				risk.setRepairreason("");// 清空
			} else if ("2".equals(ret)) {// 补件
				flow.setTaskname("风控复审补件");
				biz1.setStatus("55");
				risk.setStatus("55");
				risk.setRepairreason(repairreason);
			} else if ("3".equals(ret)) {// 拒单
				flow.setTaskname("风控复审拒单 ");
				biz1.setStatus("56");
				risk.setStatus("56");
				risk.setRepairreason("");// 清空
				risk.setRefusereason(refusereason);
			}
			contractMapper.updateByPrimaryKeySelective(biz1);
			riskMapper.updateByPrimaryKeySelective(risk);
		} else {
			throw new PortalBizCheckedException("合同状态已改变，请返回列表查看");
		}
		flow.setTasktype1(2);
		sellContractService.insertSelective(flow);
	}

	/**
	 * 
	 * <p>零采入库列表查询</p>
	 * @param brand
	 * @param vin
	 * @param status
	 * @param start
	 * @param pageSize
	 * @return
	 * @author wangzh
	 */
	public Map<String, Object> zeropurstorequery(String brand, String vin, String status, String start, String pageSize) {
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> pmap = new HashMap<String, Object>();
		int ps = Integer.parseInt(pageSize);
		pmap.put("start", (Integer.parseInt(start) - 1) * ps);
		pmap.put("size", ps);
		if (StringUtils.isNotBlank(brand)) {
			pmap.put("brand", brand);
		}
		if (StringUtils.isNotBlank(vin)) {
			pmap.put("vin", vin);
		}
		if (StringUtils.isNotBlank(status)) {
			pmap.put("status", status);
		} else {
			pmap.put("status", "8");// 特殊值 查询不为null的记录
		}
		List<Map<String, Object>> lst = zeropurchaseMapper.selectBaseByMap(pmap);
		int size = zeropurchaseMapper.countBaseByMap(pmap);
		map.put("result", lst);
		map.put("total", size);
		return map;
	}

	/**
	 * 
	 * <p>获取零采内容</p>
	 * @param id
	 * @return
	 * @author wangzh
	 */
	public Bizzeropurchase zeropurstore(Integer id) {
		Bizzeropurchase bizzeropurchase = zeropurchaseMapper.selectByPrimaryKey(id);
		return bizzeropurchase;
	}

	// public Bizzeropurchase zeropurstoretosave(Integer id) {
	// Bizzeropurchase bizzeropurchase = zeropurchaseMapper.selectByPrimaryKey(id);
	// return bizzeropurchase;
	// }

	/**
	 * 
	 * <p>组查询</p>
	 * @param name
	 * @param start
	 * @param pageSize
	 * @return
	 * @author wangzh
	 */
	public Map<String, Object> termquery(String name, String start, String pageSize) {
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> pmap = new HashMap<String, Object>();
		int ps = Integer.parseInt(pageSize);
		pmap.put("start", (Integer.parseInt(start) - 1) * ps);
		pmap.put("size", ps);
		if (StringUtils.isNotBlank(name)) {
			pmap.put("name", name);
		}
		List<Map<String, Object>> lst = bizShopTermMapper.selectBaseByMap(pmap);
		int size = bizShopTermMapper.countBaseByMap(pmap);
		map.put("result", lst);
		map.put("total", size);
		return map;
	}

	/**
	 * 
	 * <p>通过金融类型获取门店列表</p>
	 * @param financetype
	 * @param isnew 是否新增 1是2编辑
	 * @return
	 * @author wangzh
	 */
	public List<Shop> queryshoplstbyfinancetype(ModelMap map, Integer termid) {
		Map<String, Object> param = new HashMap<String, Object>();
		// map.put("financetype", 2);//1 样车 金融 2采购 金融
		if (termid != null) {// 编辑
			BizShopTerm term = bizShopTermMapper.selectByPrimaryKey(termid);
			map.put("term", term);
			param.put("termid", termid);
		} else {
		}
		List<Shop> lst = shopMapper.selectShopsByTermid(param);
		if (termid != null) {
			for (Shop shop : lst) {
				if (shop.getTermid() != null) {
					shop.setFlag("1");
				}
			}
		}
		return lst;
	}

	/**
	 * 
	 * <p>组新增保存</p>
	 * @param name
	 * @param totalmoney
	 * @param bigScale
	 * @param principal
	 * @param shopFirstCreatTime
	 * @param shopId
	 * @author wangzh
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, rollbackFor = Exception.class)
	public void termaddsave(String name, BigDecimal totalmoney, BigDecimal bigScale, String principal, String shopFirstCreatTime, String[] shopId) {
		BizShopTerm term = new BizShopTerm();
		term.setTotalmoney(totalmoney);
		term.setName(name);
		term.setBigScale(bigScale);
		term.setPrincipal(principal);
		if (StringUtils.isNotBlank(shopFirstCreatTime)) {
			term.setShopFirstCreatTime(DateUtils.parse(shopFirstCreatTime, DateUtils.DEFAULT_DATE_FORMAT_DEFAULT));
		} else {
			// 需求待定
		}
		term.setCreatetime(Calendar.getInstance().getTime());
		term.setType("2");// 1样车2采购
		bizShopTermMapper.insertSelective(term);
		for (int i = 0; i < shopId.length; i++) {
			Shop shop = new Shop();
			shop.setId(Integer.parseInt(shopId[i]));
			shop.setTermid(term.getId());
			shopMapper.updateByPrimaryKeySelective(shop);
		}
	}

	/**
	 * 
	 * <p>组编辑保存</p>
	 * @param id
	 * @param name
	 * @param totalmoney
	 * @param bigScale
	 * @param principal
	 * @param shopFirstCreatTime
	 * @param shopId
	 * @author wangzh
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void termeditsave(Integer id, String name, BigDecimal totalmoney, BigDecimal bigScale, String principal, String shopFirstCreatTime, String[] shopId) {
		BizShopTerm term = new BizShopTerm();
		term.setId(id);
		term.setTotalmoney(totalmoney);
		term.setName(name);
		term.setBigScale(bigScale);
		term.setPrincipal(principal);
		if (StringUtils.isNotBlank(shopFirstCreatTime)) {
			term.setShopFirstCreatTime(DateUtils.parse(shopFirstCreatTime, DateUtils.DEFAULT_DATE_FORMAT_DEFAULT));
		} else {
			// 需求待定
		}
		// term.setCreatetime(Calendar.getInstance().getTime());
		// term.setType("2");// 1样车2采购
		bizShopTermMapper.updateByPrimaryKeySelective(term);
		shopMapper.clearTermid(id);
		for (int i = 0; i < shopId.length; i++) {
			Shop shop = new Shop();
			shop.setId(Integer.parseInt(shopId[i]));
			shop.setTermid(term.getId());
			shopMapper.updateByPrimaryKeySelective(shop);
		}
	}

	/**
	 * 
	 * <p>门店确认客户是否同意金融审批结果</p>
	 * @param id
	 * @param riskid
	 * @param ret
	 * @param dontagreereason
	 * @param downpay
	 * @param fdownposbill
	 * @throws IOException
	 * @author wangzh
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void bizcontractfinfirstpay(Integer id, Integer riskid, String ret, String dontagreereason, BigDecimal downpay, MultipartFile fdownposbill)
			throws IOException {
		flowscheme flow = new flowscheme();
		flow.setTaskid(id);
		if ("1".equals(ret)) {// 同意
			Bizcontract con = new Bizcontract();
			con.setId(id);
			con.setDownpay(downpay);
			con.setStatus("61");// 客户同意该审批金额了
			// 上传文件
			String name1 = fdownposbill.getOriginalFilename();
			boolean hasdot = false;
			if (StringUtils.isNotBlank(name1)) {
				int dot = name1.lastIndexOf(".");
				if (dot > 0) {
					hasdot = true;
					name1 = name1.substring(dot);
				}
			}
			String path1 = uploadFileTogether(fdownposbill, FileTypeEnum.newdownpayposbill, hasdot, name1);
			con.setDownposbill(path1);
			contractMapper.updateByPrimaryKeySelective(con);
			Bizrisk risk = new Bizrisk();
			risk.setId(riskid);
			risk.setStatus("61");
			riskMapper.updateByPrimaryKeySelective(risk);
			flow.setTaskname("门店确认客户同意金融审批结果");
		} else if ("2".equals(ret)) {
			Bizcontract con = new Bizcontract();
			con.setId(id);
			con.setStatus("63");// 客户不同意该审批金额了
			contractMapper.updateByPrimaryKeySelective(con);
			Bizrisk risk = new Bizrisk();
			risk.setId(riskid);
			risk.setStatus("63");
			risk.setDontagreereason(dontagreereason);
			riskMapper.updateByPrimaryKeySelective(risk);
			flow.setTaskname("门店确认客户不同意金融审批结果");
		} else {
			throw new PortalBizCheckedException("同意与否字段缺失");
		}
		flow.setTasktype1(1);
		sellContractService.insertSelective(flow);
	}

	/**
	 * 
	 * <p>获取可开票的合同列表</p>
	 * @param name
	 * @param vin
	 * @param status
	 * @param start
	 * @param pageSize
	 * @return
	 * @author wangzh
	 */
	public Map<String, Object> invoicequery(String code, String name, String vin, String status, Integer start, Integer pageSize, int step) {
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> pmap = new HashMap<String, Object>();
		pmap.put("start", (start - 1) * pageSize);
		pmap.put("size", pageSize);
		if (StringUtils.isNotBlank(code)) {
			pmap.put("code", code);
		}
		if (StringUtils.isNotBlank(name)) {
			pmap.put("name", name);
		}
		if (StringUtils.isNotBlank(vin)) {
			pmap.put("vin", vin);
		}
		switch (step) {
			case 1:
				if (StringUtils.isNotBlank(status)) {
					pmap.put("status", status);
				}
				break;
			case 2:
				if (StringUtils.isNotBlank(status)) {
					pmap.put("status", status);
				} else
					pmap.put("status", "88");// 特殊值 用於查詢門店部默認列表
				break;
			case 3:
				if (StringUtils.isNotBlank(status)) {
					pmap.put("status", status);
				} else
					pmap.put("status", "99");// 特殊值 用於查詢財務部默認列表
				break;
		}
		List<Map<String, Object>> lst = invoiceMapper.selectByMap(pmap);
		int size = invoiceMapper.countByMap(pmap);
		map.put("result", lst);
		map.put("total", size);
		return map;
	}

	/**
	 * 
	 * <p>获取门店部开票列表</p>
	 * @param code
	 * @param name
	 * @param vin
	 * @param status
	 * @param start
	 * @param pageSize
	 * @return
	 * @author wangzh
	 */
	public Map<String, Object> invoiceshopquery(String code, String name, String vin, String status, Integer start, Integer pageSize) {
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> pmap = new HashMap<String, Object>();
		pmap.put("start", (start - 1) * pageSize);
		pmap.put("size", pageSize);
		if (StringUtils.isNotBlank(code)) {
			pmap.put("code", code);
		}
		if (StringUtils.isNotBlank(name)) {
			pmap.put("name", name);
		}
		if (StringUtils.isNotBlank(vin)) {
			pmap.put("vin", vin);
		}
		if (StringUtils.isNotBlank(status)) {
			pmap.put("status", status);
		} else {

		}
		List<Map<String, Object>> lst = invoiceMapper.selectByMap(pmap);
		int size = invoiceMapper.countByMap(pmap);
		map.put("result", lst);
		map.put("total", size);
		return map;
	}

	/**
	 * 
	 * <p>开票操作</p>
	 * @param map
	 * @param id 合同主键
	 * @param currpage
	 * @param view
	 * @return
	 * @author wangzh
	 */
	public String invoiceoperate(ModelMap map, String process, Integer id, String currpage, String view) {
		if (StringUtils.isNotBlank(currpage)) {
			map.put("currpage", currpage);
		}
		Bizcontract con = contractMapper.selectByPrimaryKey(id);
		ValidationUtils.notNull(con, "合同不存在！");
		map.put("co", con);

		String a1 = con.getSalecontract();// 销售合同
		if (StringUtils.isNotBlank(a1)) {
			a1 = a1.substring(a1.lastIndexOf('/') + 1);
			map.put("salecontractname", a1);
		}

		String finance = con.getFinance();// 金融购车（是1否2）
		boolean isfin = "1".equals(finance);// true 金融购车
		if (isfin) {
			Bizrisk risk = new Bizrisk();
			risk.setContractid(id);
			List<Bizrisk> rList = riskMapper.selectByCriteria(risk);
			if (rList.size() > 0) {
				Bizrisk risk1 = rList.get(0);
				map.put("risk", risk1);
				// 处理贷审会审批表
				String table = risk1.getApprovaltableurl();
				if (StringUtils.isNotBlank(table)) {
					table = table.substring(table.lastIndexOf('/') + 1);
					map.put("texturlname", table);
				}
			}

			Bizsaleborrow sale = new Bizsaleborrow();
			sale.setContractid(id);
			List<Bizsaleborrow> sList = bizsaleborrowMapper.selectByCriteria(sale);

			if (sList.size() > 0) {
				sale = sList.get(0);
				map.put("sale", sale);
				String a2 = sale.getSaleborrowfile1();// 金融合同第一年
				String a3 = sale.getSaleborrowfile2();// 金融合同第2-4年
				if (StringUtils.isNotBlank(a2)) {
					a2 = a2.substring(a2.lastIndexOf('/') + 1);
					map.put("firtyear", a2);
				}
				if (StringUtils.isNotBlank(a3)) {
					a3 = a3.substring(a3.lastIndexOf('/') + 1);
					map.put("secondyear", a3);
				}
			}
		}
		// 获取开票信息
		BizInvoice invoice = new BizInvoice();
		invoice.setConid(id);
		List<BizInvoice> iLst = invoiceMapper.selectByCriteria(invoice);
		boolean hasinvoice = iLst.size() > 0;// 是否有对应开票记录
		if (hasinvoice) {
			map.put("invoice", iLst.get(0));
		}
		if ("1".equals(process)) {// 申请开票步骤
			map.put("process", 1);
			if (hasinvoice) {// 有开票记录
				// 获取开票状态
				int instatus = iLst.get(0).getStatus();
				getinvoicefilesbyinvoiceid(map, iLst.get(0));
				// 1待审核 2门店部补填 3门店部不通过 4门店部通过 5财务补填 6财务不通过 7财务通过并开票
				if (StringUtils.isNotBlank(view)) {// 查看时 就让其只查看
					// 获取开票相关文件
					if (isfin) {
						return "biz/invoiceview1";
					} else {
						return "biz/invoiceview2";
					}
				} else {// 编辑时
					if (2 == instatus) {
						if (isfin) {
							return "biz/invoiceedit1";
						} else {
							return "biz/invoiceedit2";
						}
					} else if (3 == instatus) {
						// 按钮：申请开票
						if (isfin) {
							return "biz/invoice1";
						} else {
							return "biz/invoice2";
						}
					} else {
						view = "1";
						if (isfin) {
							return "biz/invoiceview1";
						} else {
							return "biz/invoiceview2";
						}
					}
				}
			} else {// 无开票记录
					// 按钮：申请开票
				if (isfin) {
					return "biz/invoice1";
				} else {
					return "biz/invoice2";
				}
			}
		} else if ("2".equals(process)) {// 门店部填写结算表步骤
			// 获取开票状态
			int instatus = iLst.get(0).getStatus();
			getinvoicefilesbyinvoiceid(map, iLst.get(0));
			// 1待审核 5财务部补填
			// if (StringUtils.isNotBlank(view)) {// 查看时 就让其只查看
			// 获取开票相关文件
			// if (isfin) {
			// return "biz/invoiceeditshop1";
			// } else {
			// return "biz/invoiceeditshop2";
			// }
			// }
			// else
			// {
			if (1 == instatus) {// 1待审核
				if (isfin) {
					Object object = map.get("risk");
					Bizrisk maprisk = object == null ? null : (Bizrisk) object;
					if (maprisk != null) {
						BigDecimal ap = maprisk.getAproveprice();// 审批金额
						BigDecimal dyp = ap.multiply(new BigDecimal("0.01")).setScale(2, BigDecimal.ROUND_HALF_UP);// 动态监管费
						BigDecimal promise = ap.multiply(new BigDecimal("0.015")).setScale(2, BigDecimal.ROUND_HALF_UP);// 履约险
						con.setDelayprice(dyp);// 临时用此字段放一下动态监管费
						con.setDecorateprice(promise);// 同上
						// 计算保险
						BigDecimal insu = con.getInsurance();// 交强险
						BigDecimal cinsu = con.getCinsurance();// 商业险
						BigDecimal totalBigDecimal = BigDecimal.ZERO;
						totalBigDecimal = totalBigDecimal.add(insu == null ? BigDecimal.ZERO : insu);
						totalBigDecimal = totalBigDecimal.add(cinsu == null ? BigDecimal.ZERO : cinsu);
						con.setInsurance(totalBigDecimal.compareTo(BigDecimal.ZERO) > 0 ? totalBigDecimal : null);
						return "biz/invoiceeditshop1";
					}
					map.put("message", "此合同为金融合同，但缺少风控相关内容");
					return View.ERROR_MESSAGE;
				} else {
					// 计算保险
					BigDecimal insu = con.getInsurance();// 交强险
					BigDecimal cinsu = con.getCinsurance();// 商业险
					BigDecimal totalBigDecimal = BigDecimal.ZERO;
					totalBigDecimal = totalBigDecimal.add(insu == null ? BigDecimal.ZERO : insu);
					totalBigDecimal = totalBigDecimal.add(cinsu == null ? BigDecimal.ZERO : cinsu);
					con.setInsurance(totalBigDecimal.compareTo(BigDecimal.ZERO) > 0 ? totalBigDecimal : null);
					return "biz/invoiceeditshop2";
				}
			} else if (5 == instatus) {// 5财务部补填
				if (isfin) {
					return "biz/invoiceeditshop1";
				} else {
					return "biz/invoiceeditshop2";
				}
			} else {
				map.put("message", "此合同的开票状态已改变，请返回列表查看");
				return View.ERROR_MESSAGE;
			}
			// }
		} else if ("3".equals(process)) {// 财务部部填写结算表并开票步骤
			map.put("process", 3);
			// 获取开票状态
			int instatus = iLst.get(0).getStatus();
			getinvoicefilesbyinvoiceid(map, iLst.get(0));
			// 4门店部通过 5财务补填 6财务不通过 7财务通过并开票
			if (StringUtils.isNotBlank(view)) {// 查看时 就让其只查看
				// 获取开票相关文件
				if (isfin) {
					return "biz/invoiceview1";
				} else {
					return "biz/invoiceview2";
				}
			} else {// 编辑时
				if (4 == instatus) {
					if (isfin) {
						return "biz/invoiceeditfinance1";
					} else {
						return "biz/invoiceeditfinance2";
					}
				} else {
					view = "1";
					if (isfin) {
						return "biz/invoiceview1";
					} else {
						return "biz/invoiceview2";
					}
				}
			}
		}
		if (StringUtils.isNotBlank(view)) {
			map.put("view", view);
		}
		return View.ERROR_MESSAGE;
	}

	/**
	 * 
	 * <p>通过开票id获取开票相关联图片</p>
	 * @param map
	 * @param ivid
	 * @author wangzh
	 */
	public void getinvoicefilesbyinvoiceid(ModelMap map, BizInvoice invoice) {
		BizInvoiceFile file = new BizInvoiceFile();
		file.setInvoiceid(invoice.getId());
		List<BizInvoiceFile> lst = invoiceFileMapper.selectByCriteria(file);
		List<BizInvoiceFile> lst1 = new ArrayList<BizInvoiceFile>(), lst2 = new ArrayList<BizInvoiceFile>(), lst3 = new ArrayList<BizInvoiceFile>(), lst4 = new ArrayList<BizInvoiceFile>(), lst5 = new ArrayList<BizInvoiceFile>();
		if (lst.size() > 0) {
			/*
			 * 开票文件类型 1营业执照 2转账银行流水/支付宝/微信流水截图 3代付款证明 4代付款人身份证正反面 5身份证正反面
			 */
			for (int i = 0; i < lst.size(); i++) {
				int type = lst.get(i).getType().intValue();
				switch (type) {
					case 1:
						lst1.add(lst.get(i));
						break;
					case 2:
						lst2.add(lst.get(i));
						break;
					case 3:
						lst3.add(lst.get(i));
						break;
					case 4:
						lst4.add(lst.get(i));
						break;
					case 5:
						lst5.add(lst.get(i));
						break;
				}
			}
		}
		map.put("lst1", lst1);
		map.put("lst2", lst2);
		map.put("lst3", lst3);
		map.put("lst4", lst4);
		map.put("lst5", lst5);
	}

	/**
	 * 
	 * <p>开票保存</p>
	 * @param conid
	 * @param money
	 * @param name
	 * @param phone
	 * @param cardId
	 * @param arr
	 * @author wangzh
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void invoicesave(Integer id, Integer conid, Integer big, Integer small, BigDecimal money, String name, String phone, String cardId, String tax,
			String bank, String bankCard, String address, String arr, String replace) {
		Bizcontract co = contractMapper.selectByPrimaryKey(conid);
		if (id == null) {// 新增开票
			BizInvoice invoice = new BizInvoice();
			invoice.setConid(conid);
			List<BizInvoice> invoices = invoiceMapper.selectByCriteria(invoice);
			// boolean shopnopass=false;//有没有门店部不通过 默认没有
			if (invoices.size() > 0) {
				Integer statusInteger = invoices.get(0).getStatus();
				if (3 == statusInteger.intValue()) {// 3门店部不通过
					// shopnopass=true;
					invoiceMapper.deleteByPrimaryKey(invoices.get(0).getId());// 删除上次开票记录
					invoice.setNopassreason(invoices.get(0).getNopassreason());// 上次不通过的原因copy过来
				} else
					throw new PortalBizCheckedException("该合同已开过票了，请返回列表查看");
			}
			String fin = co.getFinance();
			Date now = new Date();
			invoice.setAmount(money);
			invoice.setCompanyname(name);
			invoice.setPhone(phone);
			// 1待审核 2门店部补填 3门店部不通过 4门店部通过 5财务补填 6财务不通过 7财务通过并开票
			invoice.setStatus(1);
			invoice.setCreatetime(now);
			UserDTO userDTO = SecurityHelper.getAdminUserInfo();
			if (userDTO != null) {// 如果登陆信息不失效 则记录 测试下到底session过期怎么回事
				invoice.setCreator(userDTO.getLoginName());
			}
			if ("1".equals(fin)) {// 1金融
				invoice.setIdentify(cardId);
				invoice.setTypebig(2);// 开票类型大类 1增值税发票 2机动车专用发票
				invoice.setTypesmall(1);// 对应于大类2的细分类型：1个人 2企业
			} else if ("2".equals(fin)) {// 2全款
				if (big.intValue() == 1) {// 增值税发票
					invoice.setTaxnum(tax);
					invoice.setOpenbank(bank);
					invoice.setBanknum(bankCard);
					invoice.setRunaddress(address);
					invoice.setTypebig(1);// 开票类型大类 1增值税发票 2机动车专用发票
				} else if (big.intValue() == 2) {// 机动车专用发票
					if (small.intValue() == 1) {// 个人
						invoice.setIdentify(cardId);
						invoice.setTypebig(2);// 开票类型大类 1增值税发票 2机动车专用发票
						invoice.setTypesmall(1);// 对应于大类2的细分类型：1个人 2企业
					} else {// 企业
						invoice.setTaxnum(tax);
						invoice.setOpenbank(bank);
						invoice.setBanknum(bankCard);
						invoice.setRunaddress(address);
						invoice.setTypebig(2);// 开票类型大类 1增值税发票 2机动车专用发票
						invoice.setTypesmall(2);// 对应于大类2的细分类型：1个人 2企业
					}
				}
			}
			invoiceMapper.insertSelective(invoice);
			boolean bl = StringUtils.isBlank(replace);
			// 上传相关文件
			if (StringUtils.isNotBlank(arr)) {
				JSONArray jsonArray = JSONArray.fromObject(arr);
				List<BizInvoiceFile> lst = new ArrayList<BizInvoiceFile>();
				for (int i = 0; i < jsonArray.size(); i++) {
					JSONObject job = jsonArray.getJSONObject(i);
					// 开票文件类型 1营业执照 2转账银行流水/支付宝/微信流水截图 3代付款证明 4代付款人身份证正反面
					// 5身份证正反面
					int type = job.getInt("type");
					String add = job.getString("add");
					int pid = job.getInt("pid");
					BizInvoiceFile file = new BizInvoiceFile();
					file.setInvoiceid(invoice.getId());
					file.setCreatetime(now);
					file.setAddress(add);
					file.setType(type);
					file.setSort(pid);
					if (bl && (3 == type || 4 == type)) {
						continue;
					}
					lst.add(file);
				}
				if (lst.size() > 0) {
					Collections.sort(lst);
					for (BizInvoiceFile bizfile : lst) {
						invoiceFileMapper.insertSelective(bizfile);
					}
				}
			}
			if (!bl) {
				BizInvoice invoice1 = new BizInvoice();
				invoice1.setId(invoice.getId());
				invoice1.setBehalfpay("1");// 是否代付款 1是
				invoiceMapper.updateByPrimaryKeySelective(invoice1);
			}
		}
	}

	/**
	 * 
	 * <p>开票审核</p>
	 * @param cmd
	 * @author wangzh
	 */
	public void invoiceaudit(InvoiceAuditCmd cmd) {
		String shopfin = cmd.getShopfin();// 1门店部2财务部
		String ret = cmd.getRet();// 1通过2补填3不通过
		Integer id = cmd.getId();// 开票id
		if ("1".equals(shopfin)) {// 1门店部
			BizInvoice invoice = new BizInvoice();
			invoice.setId(id);
			if ("1".equals(ret)) {// 操作通过
				invoice.setSettlementcarprice(cmd.getSettlementcarprice());
				invoice.setPurchasetax(cmd.getPurchasetax());
				invoice.setInsurance(cmd.getInsurance());
				invoice.setDynamicsupervise(cmd.getDynamicsupervise());
				invoice.setAppointinsurance(cmd.getAppointinsurance());
				invoice.setPlateprice(cmd.getPlateprice());
				if (cmd.getOther1price() != null && StringUtils.isNotBlank(cmd.getOther1description())) {
					invoice.setOther1price(cmd.getOther1price());
					invoice.setOther1description(cmd.getOther1description());
				}
				if (cmd.getOther2price() != null && StringUtils.isNotBlank(cmd.getOther2description())) {
					invoice.setOther2price(cmd.getOther2price());
					invoice.setOther2description(cmd.getOther2description());
				}
				invoice.setStatus(4);// 门店部通过
				invoice.setBackreason("");// 清空补填原因
				invoice.setNopassreason("");// 清空不通过原因
			} else if ("2".equals(ret)) {// 操作补填
				invoice.setBackreason(cmd.getBackreason());
				invoice.setNopassreason("");// 清空不通过原因
				invoice.setStatus(2);// 门店部补填
			} else if ("3".equals(ret)) {// 操作不通过
				invoice.setNopassreason(cmd.getNopassreason());
				invoice.setStatus(3);// 门店部不通过
				// 删除开票记录 让其重新申请开票
				// invoiceMapper.deleteByPrimaryKey(id);
			}
			invoiceMapper.updateByPrimaryKeySelective(invoice);
		} else if ("2".equals(shopfin)) {// 2财务部
			BizInvoice invoice = new BizInvoice();
			invoice.setId(id);
			if ("1".equals(ret)) {
				invoice.setFsettlementcarprice(cmd.getFsettlementcarprice());
				invoice.setFpurchasetax(cmd.getFpurchasetax());
				invoice.setFinsurance(cmd.getFinsurance());
				invoice.setFdynamicsupervise(cmd.getFdynamicsupervise());
				invoice.setFappointinsurance(cmd.getFappointinsurance());
				invoice.setFplateprice(cmd.getFplateprice());
				if (cmd.getFother1price() != null && StringUtils.isNotBlank(cmd.getFother1description())) {
					invoice.setFother1price(cmd.getFother1price());
					invoice.setFother1description(cmd.getFother1description());
				}
				if (cmd.getFother2price() != null && StringUtils.isNotBlank(cmd.getFother2description())) {
					invoice.setFother2price(cmd.getFother2price());
					invoice.setFother2description(cmd.getFother2description());
				}
				invoice.setStatus(7);// 财务部通过
				invoice.setFbackreason("");// 清空补填内容
			} else if ("2".equals(ret)) {
				invoice.setFbackreason(cmd.getFbackreason());
				invoice.setStatus(5);// 财务部补填
			} else if ("3".equals(ret)) {
				invoice.setNopassreason(cmd.getNopassreason());
				invoice.setStatus(6);// 财务部不通过
			}
			invoiceMapper.updateByPrimaryKeySelective(invoice);
		}
	}

	/**
	 * 
	 * <p>开票编辑保存</p>
	 * @param id
	 * @param conid
	 * @param dels
	 * @param str
	 * @param money
	 * @param name
	 * @param phone
	 * @param cardId
	 * @param tax
	 * @param bank
	 * @param bankCard
	 * @param address
	 * @author wangzh
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void invoiceeditsave(Integer id, Integer conid, String dels, String arr, BigDecimal money, String name, String phone, String cardId, String tax,
			String bank, String bankCard, String address) {
		Bizcontract co = contractMapper.selectByPrimaryKey(conid);
		ValidationUtils.notNull(co, "合同不存在");
		BizInvoice bi = invoiceMapper.selectByPrimaryKey(id);
		ValidationUtils.notNull(bi, "开票记录不存在");
		Integer istatus = bi.getStatus();
		if (2 != istatus.intValue()) {// 2门店部补填
			throw new PortalBizCheckedException("该开票状态已改变，请返回列表查看");
		}
		boolean isfin = "1".equals(co.getFinance());// true 金融购车
		BizInvoice invoice = new BizInvoice();
		if (isfin) {// 金融
			// 操作普通字段
			invoice.setAmount(money);
			invoice.setCompanyname(name);
			invoice.setPhone(phone);
			invoice.setIdentify(cardId);
			invoice.setStatus(1);// 待审核
			invoice.setId(id);
			invoiceMapper.updateByPrimaryKeySelective(invoice);
			// 操作图片
			// 操作删除的图片
			if (StringUtils.isNotBlank(dels)) {
				JSONArray jsonArray = JSONArray.fromObject(dels);
				for (int i = 0; i < jsonArray.size(); i++) {
					JSONObject job = jsonArray.getJSONObject(i);
					int delid = Integer.parseInt(job.get("id").toString());
					invoiceFileMapper.deleteByPrimaryKey(delid);
				}
			}
			// 新增图片
			Date now = new Date();
			if (StringUtils.isNotBlank(arr)) {
				JSONArray jsonArray = JSONArray.fromObject(arr);
				List<BizInvoiceFile> lst = new ArrayList<BizInvoiceFile>();
				for (int i = 0; i < jsonArray.size(); i++) {
					JSONObject job = jsonArray.getJSONObject(i);
					int type = job.getInt("type");
					String add = job.getString("add");
					int pid = job.getInt("pid");
					BizInvoiceFile file = new BizInvoiceFile();
					file.setInvoiceid(id);
					file.setCreatetime(now);
					file.setAddress(add);
					file.setType(type);
					file.setSort(pid);
					lst.add(file);
				}
				if (lst.size() > 0) {
					Collections.sort(lst);
					for (BizInvoiceFile item : lst) {
						invoiceFileMapper.insertSelective(item);
					}
				}
			}
		} else {// 全款
			Integer big = bi.getTypebig();
			Integer small = bi.getTypesmall();
			int fieldshort = 0;
			if (big.intValue() == 1 || (big.intValue() == 2 && small != null && small.intValue() == 2)) {// 增值税或（机动车、企业）
				// 字段很多的一种
			} else if (big.intValue() == 2 && small != null && small.intValue() == 1) {
				fieldshort = 1;
			} else {
				throw new PortalMsBizCheckedException("开票类型有误");
			}
			// 操作普通字段
			if (fieldshort == 1) {
				invoice.setAmount(money);
				invoice.setCompanyname(name);
				invoice.setPhone(phone);
				invoice.setIdentify(cardId);
			} else {// 字段多
				invoice.setAmount(money);
				invoice.setCompanyname(name);
				invoice.setTaxnum(tax);
				invoice.setOpenbank(bank);
				invoice.setBanknum(bankCard);
				invoice.setRunaddress(address);
				invoice.setPhone(phone);
			}
			invoice.setStatus(1);// 待审核
			invoice.setId(id);
			invoiceMapper.updateByPrimaryKeySelective(invoice);
			// 操作图片
			// 操作删除的图片
			if (StringUtils.isNotBlank(dels)) {
				JSONArray jsonArray = JSONArray.fromObject(dels);
				for (int i = 0; i < jsonArray.size(); i++) {
					JSONObject job = jsonArray.getJSONObject(i);
					int delid = Integer.parseInt(job.get("id").toString());
					invoiceFileMapper.deleteByPrimaryKey(delid);
				}
			}
			// 新增图片
			Date now = new Date();
			if (StringUtils.isNotBlank(arr)) {
				JSONArray jsonArray = JSONArray.fromObject(arr);
				List<BizInvoiceFile> lst = new ArrayList<BizInvoiceFile>();
				for (int i = 0; i < jsonArray.size(); i++) {
					JSONObject job = jsonArray.getJSONObject(i);
					int type = job.getInt("type");
					String add = job.getString("add");
					int pid = job.getInt("pid");
					BizInvoiceFile file = new BizInvoiceFile();
					file.setInvoiceid(id);
					file.setCreatetime(now);
					file.setAddress(add);
					file.setType(type);
					file.setSort(pid);
					lst.add(file);
				}
				if (lst.size() > 0) {
					Collections.sort(lst);
					for (BizInvoiceFile item : lst) {
						invoiceFileMapper.insertSelective(item);
					}
				}
			}
		}
	}

	/**
	 * 
	 * <p>合同列表查询</p>
	 * @param map
	 * @param filecode
	 * @param name
	 * @param bname
	 * @param workType
	 * @param identify
	 * @param start
	 * @param pageSize
	 * @return
	 * @author liang
	 * @param type 
	 */
	public Map<String, Object> contractpandectquery(String filecode, String bphone, String bname, String identify, Integer start, Integer ps) {
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> pmap = new HashMap<String, Object>();
		pmap.put("start", (start - 1) * ps);
		pmap.put("size", ps);
		if (StringUtils.isNotBlank(filecode)) {
			pmap.put("filecode", filecode);
		}
		if (StringUtils.isNotBlank(bname)) {
			pmap.put("bname", bname);
		}
		if (StringUtils.isNotBlank(bphone)) {
			pmap.put("bphone", bphone);
		}
		if (StringUtils.isNotBlank(identify)) {
			pmap.put("identify", identify);
		}
		List<Map<String, Object>> lst = contractMapper.selectpandectByMap(pmap);
		int size = contractMapper.countpandectByMap(pmap);
		map.put("result", lst);
		map.put("total", size);
		return map;
	}

	/**
	 * 
	 * <p>获取合同查看信息</p>
	 * @param map
	 * @param id
	 * @return
	 * @author liang
	 * @param type 
	 * @param insurance 
	 */
	public String getpandectbasecontractbyidforview(ModelMap map, Integer id) {
		Bizcontract con = getcontractbyid(id);
		map.put("co", con);

		String a1 = con.getSalecontract();// 销售合同
		String a2 = con.getDownposbill();// 定金pos单
		String a3 = con.getReportbill();// 报价单
		if (StringUtils.isNotBlank(a1)) {
			a1 = a1.substring(a1.lastIndexOf('/') + 1);
			map.put("salecontractname", a1);
		}
		if (StringUtils.isNotBlank(a2)) {
			a2 = a2.substring(a2.lastIndexOf('/') + 1);
			map.put("downposbillname", a2);
		}
		if (StringUtils.isNotBlank(a3)) {
			a3 = a3.substring(a3.lastIndexOf('/') + 1);
			map.put("reportbillname", a3);
		}
		// 金融时风控进件相关
		// 获取合同相关文件
		getconfilesbyconid(id, map);
		return "biz/pandectview";

	}

	/**
	 * 
	 * <p>立案查询</p>
	 * @param type 类型 1逾期 2二抵 3其他
	 * @param name 案件名称
	 * @param bname 乙方
	 * @param start
	 * @param pageSize
	 * @return
	 * @author wangzh
	 */
	public Map<String, Object> casequery(int type, String name, String bname, Integer start, Integer pageSize) {
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> pmap = new HashMap<String, Object>();
		pmap.put("start", (start - 1) * pageSize);
		pmap.put("size", pageSize);
		// pmap.put("type", type);
		if (StringUtils.isNotBlank(name)) {
			pmap.put("name", name);
		}
		if (StringUtils.isNotBlank(bname)) {
			pmap.put("bname", bname);
		}
		List<Map<String, Object>> lst = riskcaseMapper.selectByMap(pmap);
		int size = riskcaseMapper.countByMap(pmap);
		map.put("result", lst);
		map.put("total", size);
		return map;
	}

	public Map<String, Object> caseotherquery(String name, Integer start, Integer pageSize) {
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> pmap = new HashMap<String, Object>();
		pmap.put("start", (start - 1) * pageSize);
		pmap.put("size", pageSize);
		// pmap.put("type", type);
		if (StringUtils.isNotBlank(name)) {
			pmap.put("name", name);
		}
		List<Map<String, Object>> lst = riskcaseMapper.selectOtherByMap(pmap);
		int size = riskcaseMapper.countOtherByMap(pmap);
		map.put("result", lst);
		map.put("total", size);
		return map;
	}

	/**
	 * 
	 * <p>为立案查询售后回租合同</p>
	 * @param filecode
	 * @param firstcode
	 * @param bname
	 * @param start
	 * @param pageSize
	 * @return
	 * @author wangzh
	 */
	public Map<String, Object> sbforcasechoosequery(String filecode, String firstcode, String bname, Integer start, Integer pageSize) {
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> pmap = new HashMap<String, Object>();
		pmap.put("start", (start - 1) * pageSize);
		pmap.put("size", pageSize);
		if (StringUtils.isNotBlank(filecode)) {
			pmap.put("filecode", filecode);
		}
		if (StringUtils.isNotBlank(firstcode)) {
			pmap.put("firstcode", firstcode);
		}
		if (StringUtils.isNotBlank(bname)) {
			pmap.put("bname", bname);
		}
		List<Map<String, Object>> lst = riskcaseMapper.selectsaleborrowforriskcase(pmap);
		int size = riskcaseMapper.countsaleborrowforriskcase(pmap);
		map.put("result", lst);
		map.put("total", size);
		return map;
	}

	/**
	 * 
	 * <p>到逾期立案页</p>
	 * @param map
	 * @param id 售后回租合同id
	 * @return
	 * @author wangzh
	 */
	public String case1toadd(ModelMap map, Integer id) {
		Bizsaleborrow sb = bizsaleborrowMapper.selectByPrimaryKey(id);
		Bizcontract con = contractMapper.selectByPrimaryKey(sb.getContractid());
		map.addAttribute("co", sb).addAttribute("con", con);
		getconfilesbyconid(sb.getContractid(), map);
		return "biz/case1add";
	}

	/**
	 * 
	 * <p>立案保存</p>
	 * @param id 售后回租合同id
	 * @param type
	 * @param f1
	 * @param f2
	 * @param f3
	 * @param note
	 * @author wangzh
	 * @throws IOException 
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void casesave(String casename, String type, Integer id, MultipartFile f1, MultipartFile f2, MultipartFile f3, String note) throws IOException {
		UserDTO userDTO = SecurityHelper.getAdminUserInfo();
		ValidationUtils.notNull(userDTO, "会话过期，请重新登录...");
		Riskcase cs = new Riskcase();
		if ("1".equals(type)) {
			cs.setCid(id);
			int c = riskcaseMapper.countByCriteria(cs);
			if (c > 0) {
				throw new PortalBizCheckedException("该合同已立案过了");
			}
			cs.setType(1);// 金融逾期类型
		} else {
			cs.setType(2);// 二抵、其他案件
		}
		cs.setCasename(casename);
		if (StringUtils.isNotBlank(note)) {
			cs.setNote(note);
		}

		String name1 = f1.getOriginalFilename();
		boolean hasdot = false;
		if (StringUtils.isNotBlank(name1)) {
			int dot = name1.lastIndexOf(".");
			if (dot > 0) {
				hasdot = true;
				name1 = name1.substring(dot);
			}
		}
		String path1 = uploadFileTogether(f1, FileTypeEnum.riskcase, hasdot, name1);
		if (StringUtils.isNotBlank(path1)) {
			cs.setF1(path1);
		}

		String name2 = f2.getOriginalFilename();
		hasdot = false;
		if (StringUtils.isNotBlank(name2)) {
			int dot = name2.lastIndexOf(".");
			if (dot > 0) {
				hasdot = true;
				name2 = name2.substring(dot);
			}
		}
		String path2 = uploadFileTogether(f2, FileTypeEnum.riskcase, hasdot, name2);
		cs.setF2(path2);
		String name3 = f3.getOriginalFilename();
		hasdot = false;
		if (StringUtils.isNotBlank(name3)) {
			int dot = name3.lastIndexOf(".");
			if (dot > 0) {
				hasdot = true;
				name3 = name3.substring(dot);
			}
		}
		String path3 = uploadFileTogether(f3, FileTypeEnum.riskcase, hasdot, name3);
		cs.setF3(path3);

		Date nowDate = Calendar.getInstance().getTime();
		cs.setCreatetime(nowDate);
		cs.setCreator(userDTO.getName());
		cs.setCreatorid(userDTO.getId());

		/*
		 * 状态： 1、风控提交 2、法务接收材料（我司资产二抵、其他时没此状态） 3、立案 4、确定开庭时间 5、判决 6、是否二审 7、二审开庭时间 8、二审判决 9、申请执行
		 * 10、执行结果
		 */
		cs.setStatus(CaseStepEnum.risksubmit.getValue());// 风控提交
		riskcaseMapper.insertSelective(cs);
		// 插入操作步骤
		Casestep step = new Casestep();
		step.setCaseid(cs.getId());
		step.setCasename(CaseStepEnum.risksubmit.getName());// 步骤名称
		step.setStatus(CaseStepEnum.risksubmit.getValue());
		step.setCreateid(userDTO.getId());
		step.setCreator(userDTO.getName());
		step.setCreatetime(nowDate);
		step.setDetail("将材料提交给法务");
		casestepMapper.insert(step);
	}

	/**
	 * 
	 * <p>立案法务查询</p>
	 * @param name
	 * @param bname
	 * @param start
	 * @param pageSize
	 * @return
	 * @author wangzh
	 */
	// public Map<String, Object> caselawquery(int type, String name, String bname, Integer start,
	// Integer pageSize) {
	// Map<String, Object> map = new HashMap<String, Object>();
	// Map<String, Object> pmap = new HashMap<String, Object>();
	// pmap.put("start", (start - 1) * pageSize);
	// pmap.put("size", pageSize);
	// pmap.put("type", type);
	// if (StringUtils.isNotBlank(name)) {
	// pmap.put("name", name);
	// }
	// if (StringUtils.isNotBlank(bname)) {
	// pmap.put("bname", bname);
	// }
	// List<Map<String, Object>> lst = riskcaseMapper.selectByMap(pmap);
	// int size = riskcaseMapper.countByMap(pmap);
	// map.put("result", lst);
	// map.put("total", size);
	// return map;
	// }
	public void riskcaseflow(ModelMap map, Integer id) {
		Riskcase rc = riskcaseMapper.selectByPrimaryKey(id);
		map.put("riskcase", rc);
		Casestep step = new Casestep();
		step.setCaseid(id);
		List<Casestep> lst = casestepMapper.selectByCriteria(step);
		map.put("steps", lst);
	}

	/**
	 * 
	 * <p>操作页面</p>
	 * @param map
	 * @param id
	 * @param view
	 * @return
	 * @author wangzh
	 */
	public String riskcaseoperate(ModelMap map, Integer id/* , String view */) {
		Riskcase riskcase = riskcaseMapper.selectByPrimaryKey(id);
		if (riskcase.getCid() != null) {
			case1toadd(map, riskcase.getCid());
		}
		int type = riskcase.getType();
		map.put("riskcase", riskcase);
		Integer st = riskcase.getStatus();
		if (CaseStepEnum.risksubmit.getValue().equals(st)) {// 开始-》风控提交完成后点处理到法务接收材料页
			return type == 1 ? "biz/caseoperate2" : "biz/case2operate2";
		}
		if (CaseStepEnum.lawreceivematerial.getValue().equals(st)) {// 到立案页
			return type == 1 ? "biz/caseoperate3" : "biz/case2operate3";
		}
		if (CaseStepEnum.savecase.getValue().equals(st)) {// 到确定一审开庭时间页
			return type == 1 ? "biz/caseoperate4" : "biz/case2operate4";
		}
		if (CaseStepEnum.surecourttime.getValue().equals(st)) {// 到判决页
			return type == 1 ? "biz/caseoperate5" : "biz/case2operate5";
		}
		if (CaseStepEnum.judge.getValue().equals(st)) {// 到是否二审页
			return type == 1 ? "biz/caseoperate6" : "biz/case2operate6";
		}
		if (CaseStepEnum.issecondaudit.getValue().equals(st)) {// 此时状态为6
			Integer j2 = riskcase.getNeed2judge();
			if (1 == j2.intValue()) {// 是二审
				// 到7二审开庭时间
				return type == 1 ? "biz/caseoperate7" : "biz/case2operate7";
			} else {
				// 到9申请执行
				return type == 1 ? "biz/caseoperate9" : "biz/case2operate9";
			}
		}
		if (CaseStepEnum.secondeaudittime.getValue().equals(st)) {// 到二审判决页
			return type == 1 ? "biz/caseoperate8" : "biz/case2operate8";
		}
		if (CaseStepEnum.secondjudge.getValue().equals(st)) {// 到二审申请执行页
			return type == 1 ? "biz/caseoperate9" : "biz/case2operate9";
		}
		if (CaseStepEnum.applyexecute.getValue().equals(st)) {// 此时状态为9
			Integer j2 = riskcase.getNeed2judge();
			if (2 == j2.intValue()) {// 不是二审
				if (1 == riskcase.getApplyexecute()) {// 申请执行
					return type == 1 ? "biz/caseoperate10" : "biz/case2operate10";
				} else {// 申请执行时选了否
					return type == 1 ? "biz/caseoperate9" : "biz/case2operate9";// 重新编辑是否申请执行
				}
			} else {
				if (1 == riskcase.getApplyexecute2()) {// 申请执行
					return type == 1 ? "biz/caseoperate10" : "biz/case2operate10";
				} else {// 申请执行时选了否
					return type == 1 ? "biz/caseoperate9" : "biz/case2operate9";// 重新编辑是否申请执行
				}
			}
		}
		if (CaseStepEnum.executeresult.getValue().equals(st)) {// 此时状态为10
			return type == 1 ? "biz/caseoperate10" : "biz/case2operate10";
		}
		return type == 1 ? "biz/caseview" : "biz/casetheview";
	}

	/**
	 * 
	 * <p>立案查看</p>
	 * @param map
	 * @param id
	 * @return
	 * @author wangzh
	 */
	public String riskcaseview(ModelMap map, Integer id/* , String view */) {
		Riskcase riskcase = riskcaseMapper.selectByPrimaryKey(id);
		map.put("riskcase", riskcase);
		if (riskcase.getCid() != null) {// 逾期类
			case1toadd(map, riskcase.getCid());
			return "biz/caseview";
		}
		return "biz/casetheview";
	}

	/**
	 * 
	 * <p>检测立案状态是否一致</p>
	 * @param id
	 * @param status
	 * @author wangzh
	 */
	public void checkriskcasestatus(Integer id, Integer status) {
		Riskcase rc = riskcaseMapper.selectByPrimaryKey(id);
		if (!status.equals(rc.getStatus())) {
			throw new PortalBizCheckedException("跟进状态已改变，请返回列表查看");
		}
	}

	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public boolean caseoperatesave2(Integer id, Integer status, String prefixsafe, MultipartFile pf1, MultipartFile pf2, MultipartFile pf3, String pnote)
			throws IOException {
		UserDTO userDTO = SecurityHelper.getAdminUserInfo();
		ValidationUtils.notNull(userDTO, "会话过期，请重新登录...");
		Riskcase rc = riskcaseMapper.selectByPrimaryKey(id);
		if (status.equals(rc.getStatus())) {
			Riskcase riskcase = new Riskcase();
			riskcase.setId(id);

			riskcase.setStatus(CaseStepEnum.lawreceivematerial.getValue());// 法务接收材料

			riskcase.setPrefixsafe(prefixsafe);
			Date nowDate = Calendar.getInstance().getTime();

			// 插入操作步骤
			Casestep step = new Casestep();
			step.setCaseid(id);
			step.setCasename(CaseStepEnum.lawreceivematerial.getName());// 步骤名称
			step.setStatus(CaseStepEnum.lawreceivematerial.getValue());
			step.setCreateid(userDTO.getId());
			step.setCreator(userDTO.getName());
			step.setCreatetime(nowDate);
			step.setDetail("诉前保全状态：" + ("1".equals(prefixsafe) ? "是" : "否"));
			casestepMapper.insert(step);

			if (prefixsafe.equals("1")) {
				if (StringUtils.isNotBlank(pnote)) {
					riskcase.setPnote(pnote);
				}

				String name1 = pf1.getOriginalFilename();
				boolean hasdot = false;
				if (StringUtils.isNotBlank(name1)) {
					int dot = name1.lastIndexOf(".");
					if (dot > 0) {
						hasdot = true;
						name1 = name1.substring(dot);
					}
				}
				String path1 = uploadFileTogether(pf1, FileTypeEnum.riskcase, hasdot, name1);
				if (StringUtils.isNotBlank(path1)) {
					riskcase.setPf1(path1);
				}

				String name2 = pf2.getOriginalFilename();
				hasdot = false;
				if (StringUtils.isNotBlank(name2)) {
					int dot = name2.lastIndexOf(".");
					if (dot > 0) {
						hasdot = true;
						name2 = name2.substring(dot);
					}
				}
				String path2 = uploadFileTogether(pf2, FileTypeEnum.riskcase, hasdot, name2);
				riskcase.setPf2(path2);
				String name3 = pf3.getOriginalFilename();
				hasdot = false;
				if (StringUtils.isNotBlank(name3)) {
					int dot = name3.lastIndexOf(".");
					if (dot > 0) {
						hasdot = true;
						name3 = name3.substring(dot);
					}
				}
				String path3 = uploadFileTogether(pf3, FileTypeEnum.riskcase, hasdot, name3);
				riskcase.setPf3(path3);
			}
			riskcaseMapper.updateByPrimaryKeySelective(riskcase);
		} else {
			throw new PortalBizCheckedException("跟进状态已改变，请返回列表查看");
		}
		return rc.getType().intValue() == 1;// 逾期类型
	}

	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public boolean caseoperatesave3(Integer id, Integer status, String suffixsafe, Integer type2, MultipartFile sf1, MultipartFile sf2, MultipartFile sf3,
			String snote) throws IOException {
		UserDTO userDTO = SecurityHelper.getAdminUserInfo();
		ValidationUtils.notNull(userDTO, "会话过期，请重新登录...");
		Riskcase rc = riskcaseMapper.selectByPrimaryKey(id);
		if (status.equals(rc.getStatus())) {
			Riskcase riskcase = new Riskcase();
			riskcase.setId(id);

			riskcase.setStatus(CaseStepEnum.savecase.getValue());// 立案
			riskcase.setType2(type2);
			riskcase.setSuffixsafe(suffixsafe);
			Date nowDate = Calendar.getInstance().getTime();

			// 插入操作步骤
			Casestep step = new Casestep();
			step.setCaseid(id);
			step.setCasename(CaseStepEnum.savecase.getName());// 步骤名称
			step.setStatus(CaseStepEnum.savecase.getValue());
			step.setCreateid(userDTO.getId());
			step.setCreator(userDTO.getName());
			step.setCreatetime(nowDate);
			step.setDetail("立案：" + (type2.intValue() == 1 ? "民事立案" : "刑事立案") + "；诉讼保全状态：" + ("1".equals(suffixsafe) ? "是" : "否"));
			casestepMapper.insert(step);

			if (suffixsafe.equals("1")) {
				if (StringUtils.isNotBlank(snote)) {
					riskcase.setSnote(snote);
				}

				String name1 = sf1.getOriginalFilename();
				boolean hasdot = false;
				if (StringUtils.isNotBlank(name1)) {
					int dot = name1.lastIndexOf(".");
					if (dot > 0) {
						hasdot = true;
						name1 = name1.substring(dot);
					}
				}
				String path1 = uploadFileTogether(sf1, FileTypeEnum.riskcase, hasdot, name1);
				if (StringUtils.isNotBlank(path1)) {
					riskcase.setSf1(path1);
				}

				String name2 = sf2.getOriginalFilename();
				hasdot = false;
				if (StringUtils.isNotBlank(name2)) {
					int dot = name2.lastIndexOf(".");
					if (dot > 0) {
						hasdot = true;
						name2 = name2.substring(dot);
					}
				}
				String path2 = uploadFileTogether(sf2, FileTypeEnum.riskcase, hasdot, name2);
				riskcase.setSf2(path2);
				String name3 = sf3.getOriginalFilename();
				hasdot = false;
				if (StringUtils.isNotBlank(name3)) {
					int dot = name3.lastIndexOf(".");
					if (dot > 0) {
						hasdot = true;
						name3 = name3.substring(dot);
					}
				}
				String path3 = uploadFileTogether(sf3, FileTypeEnum.riskcase, hasdot, name3);
				riskcase.setSf3(path3);
			}
			riskcaseMapper.updateByPrimaryKeySelective(riskcase);
		} else {
			throw new PortalBizCheckedException("跟进状态已改变，请返回列表查看");
		}
		return rc.getType().intValue() == 1;// 是逾期类
	}

	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public boolean caseoperatesave4(Integer id, Integer status, String instancetime, String casetime) throws IOException {
		// HttpServletRequest request = ((ServletRequestAttributes)
		// RequestContextHolder.getRequestAttributes()).getRequest();
		UserDTO userDTO = SecurityHelper.getAdminUserInfo();
		ValidationUtils.notNull(userDTO, "会话过期，请重新登录...");
		Riskcase rc = riskcaseMapper.selectByPrimaryKey(id);
		if (status.equals(rc.getStatus())) {
			Riskcase riskcase = new Riskcase();
			riskcase.setId(id);
			riskcase.setStatus(CaseStepEnum.surecourttime.getValue());// 确定开庭时间
			riskcase.setInstancetime(DateUtils.parse(instancetime, DateUtils.DEFAULT_DATETIME_FORMAT_SEC));
			if (StringUtils.isNotBlank(casetime)) {
				riskcase.setCasetime(DateUtils.parse(casetime, DateUtils.DEFAULT_DATETIME_FORMAT_SEC));// 新加字段立案时间
			}
			Date nowDate = Calendar.getInstance().getTime();

			// 插入操作步骤
			Casestep step = new Casestep();
			step.setCaseid(id);
			step.setCasename(CaseStepEnum.surecourttime.getName());// 步骤名称
			step.setStatus(CaseStepEnum.surecourttime.getValue());
			step.setCreateid(userDTO.getId());
			step.setCreator(userDTO.getName());
			step.setCreatetime(nowDate);
			step.setDetail("开庭时间：" + instancetime);
			casestepMapper.insert(step);

			riskcaseMapper.updateByPrimaryKeySelective(riskcase);
		} else {
			throw new PortalBizCheckedException("跟进状态已改变，请返回列表查看");
		}
		return rc.getType().intValue() == 1;// 逾期类型
	}

	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public boolean caseoperatesave5(Integer id, Integer status, String judgeresult, MultipartFile book, String judgetime1) throws IOException {
		UserDTO userDTO = SecurityHelper.getAdminUserInfo();
		ValidationUtils.notNull(userDTO, "会话过期，请重新登录...");
		Riskcase rc = riskcaseMapper.selectByPrimaryKey(id);
		if (status.equals(rc.getStatus())) {
			Riskcase riskcase = new Riskcase();
			riskcase.setId(id);
			riskcase.setStatus(CaseStepEnum.judge.getValue());// 判决
			riskcase.setJudgeresult(judgeresult);// 判决结果
			if (StringUtils.isNotBlank(judgetime1)) {
				riskcase.setJudgetime1(DateUtils.parse(judgetime1, DateUtils.DEFAULT_DATETIME_FORMAT_SEC));// 新加字段判决1生效时间
			}
			Date nowDate = Calendar.getInstance().getTime();

			// 插入操作步骤
			Casestep step = new Casestep();
			step.setCaseid(id);
			step.setCasename(CaseStepEnum.judge.getName());// 步骤名称
			step.setStatus(CaseStepEnum.judge.getValue());
			step.setCreateid(userDTO.getId());
			step.setCreator(userDTO.getName());
			step.setCreatetime(nowDate);
			step.setDetail("已判决");
			casestepMapper.insert(step);

			String name1 = book.getOriginalFilename();
			boolean hasdot = false;
			if (StringUtils.isNotBlank(name1)) {
				int dot = name1.lastIndexOf(".");
				if (dot > 0) {
					hasdot = true;
					name1 = name1.substring(dot);
				}
			}
			String path1 = uploadFileTogether(book, FileTypeEnum.riskcase, hasdot, name1);
			if (StringUtils.isNotBlank(path1)) {
				riskcase.setBook(path1);
			}

			riskcaseMapper.updateByPrimaryKeySelective(riskcase);
		} else {
			throw new PortalBizCheckedException("跟进状态已改变，请返回列表查看");
		}
		return rc.getType().intValue() == 1;// 逾期类型
	}

	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public boolean caseoperatesave6(Integer id, Integer status, Integer need2judge) throws IOException {
		UserDTO userDTO = SecurityHelper.getAdminUserInfo();
		ValidationUtils.notNull(userDTO, "会话过期，请重新登录...");
		Riskcase rc = riskcaseMapper.selectByPrimaryKey(id);
		if (status.equals(rc.getStatus())) {
			Riskcase riskcase = new Riskcase();
			riskcase.setId(id);
			riskcase.setStatus(CaseStepEnum.issecondaudit.getValue());// 是否二审
			riskcase.setNeed2judge(need2judge);
			Date nowDate = Calendar.getInstance().getTime();

			// 插入操作步骤
			Casestep step = new Casestep();
			step.setCaseid(id);
			step.setCasename(CaseStepEnum.issecondaudit.getName());// 步骤名称
			step.setStatus(CaseStepEnum.issecondaudit.getValue());
			step.setCreateid(userDTO.getId());
			step.setCreator(userDTO.getName());
			step.setCreatetime(nowDate);
			step.setDetail("二审：" + (need2judge.intValue() == 1 ? "是" : "否"));
			casestepMapper.insert(step);

			riskcaseMapper.updateByPrimaryKeySelective(riskcase);
		} else {
			throw new PortalBizCheckedException("跟进状态已改变，请返回列表查看");
		}
		return rc.getType().intValue() == 1;// 逾期类型
	}

	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public boolean caseoperatesave7(Integer id, Integer status, String instancetime2) throws IOException {
		UserDTO userDTO = SecurityHelper.getAdminUserInfo();
		ValidationUtils.notNull(userDTO, "会话过期，请重新登录...");
		Riskcase rc = riskcaseMapper.selectByPrimaryKey(id);
		if (status.equals(rc.getStatus())) {
			Riskcase riskcase = new Riskcase();
			riskcase.setId(id);
			riskcase.setStatus(CaseStepEnum.secondeaudittime.getValue());// 确定二审开庭时间
			riskcase.setInstancetime2(DateUtils.parse(instancetime2, DateUtils.DEFAULT_DATETIME_FORMAT_SEC));

			Date nowDate = Calendar.getInstance().getTime();

			// 插入操作步骤
			Casestep step = new Casestep();
			step.setCaseid(id);
			step.setCasename(CaseStepEnum.secondeaudittime.getName());// 步骤名称
			step.setStatus(CaseStepEnum.secondeaudittime.getValue());
			step.setCreateid(userDTO.getId());
			step.setCreator(userDTO.getName());
			step.setCreatetime(nowDate);
			step.setDetail("开庭时间：" + instancetime2);
			casestepMapper.insert(step);

			riskcaseMapper.updateByPrimaryKeySelective(riskcase);
		} else {
			throw new PortalBizCheckedException("跟进状态已改变，请返回列表查看");
		}
		return rc.getType().intValue() == 1;// 逾期类型
	}

	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public boolean caseoperatesave8(Integer id, Integer status, String judgeresult2, MultipartFile book2, String judgetime2) throws IOException {
		UserDTO userDTO = SecurityHelper.getAdminUserInfo();
		ValidationUtils.notNull(userDTO, "会话过期，请重新登录...");
		Riskcase rc = riskcaseMapper.selectByPrimaryKey(id);
		if (status.equals(rc.getStatus())) {
			Riskcase riskcase = new Riskcase();
			riskcase.setId(id);
			riskcase.setStatus(CaseStepEnum.secondjudge.getValue());// 二审判决
			riskcase.setJudgeresult2(judgeresult2);// 判决结果
			if (StringUtils.isNotBlank(judgetime2)) {
				riskcase.setJudgetime2(DateUtils.parse(judgetime2, DateUtils.DEFAULT_DATETIME_FORMAT_SEC));// 新加字段判决2生效时间
			}
			Date nowDate = Calendar.getInstance().getTime();

			// 插入操作步骤
			Casestep step = new Casestep();
			step.setCaseid(id);
			step.setCasename(CaseStepEnum.secondjudge.getName());// 步骤名称
			step.setStatus(CaseStepEnum.secondjudge.getValue());
			step.setCreateid(userDTO.getId());
			step.setCreator(userDTO.getName());
			step.setCreatetime(nowDate);
			step.setDetail("已判决");
			casestepMapper.insert(step);

			String name1 = book2.getOriginalFilename();
			boolean hasdot = false;
			if (StringUtils.isNotBlank(name1)) {
				int dot = name1.lastIndexOf(".");
				if (dot > 0) {
					hasdot = true;
					name1 = name1.substring(dot);
				}
			}
			String path1 = uploadFileTogether(book2, FileTypeEnum.riskcase, hasdot, name1);
			if (StringUtils.isNotBlank(path1)) {
				riskcase.setBook2(path1);
			}

			riskcaseMapper.updateByPrimaryKeySelective(riskcase);
		} else {
			throw new PortalBizCheckedException("跟进状态已改变，请返回列表查看");
		}
		return rc.getType().intValue() == 1;// 逾期类型
	}

	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public boolean caseoperatesave9(Integer id, Integer status, Integer applyexecute, Integer applyexecute2, String applyexe1, String applyexe2)
			throws IOException {
		UserDTO userDTO = SecurityHelper.getAdminUserInfo();
		ValidationUtils.notNull(userDTO, "会话过期，请重新登录...");
		Riskcase rc = riskcaseMapper.selectByPrimaryKey(id);
		if (status.equals(rc.getStatus())) {
			Riskcase riskcase = new Riskcase();
			riskcase.setId(id);

			if (CaseStepEnum.applyexecute.getValue().equals(status)) {// 原来是不申请执行，后来重新编辑保存了
				if (applyexecute != null) {
					if (applyexecute.intValue() == 2) {

					} else {// 申请执行选择是
						if (rc.getApplyexecute().intValue() == 1) {// 已经是申请执行了
							throw new PortalBizCheckedException("申请执行状态已经被其他用户抢先保存成是了，你的本次操作不能生效了，请知悉！");
						} else {
							Casestep step = new Casestep();
							step.setCaseid(id);
							step.setStatus(CaseStepEnum.applyexecute.getValue());
							List<Casestep> steps = casestepMapper.selectByCriteria(step);
							if (steps.size() > 0) {
								Casestep up = new Casestep();
								up.setId(steps.get(0).getId());
								up.setDetail("申请执行：是");
								casestepMapper.updateByPrimaryKeySelective(up);
								riskcase.setApplyexecute(1);// 申请执行
								if (StringUtils.isNotBlank(applyexe1)) {
									riskcase.setApplyexe1(DateUtils.parse(applyexe1, DateUtils.DEFAULT_DATETIME_FORMAT_SEC));// 新加字段判决1申请执行时间
								}
								riskcaseMapper.updateByPrimaryKeySelective(riskcase);
							}
						}
					}
				} else if (applyexecute2 != null) {
					if (applyexecute2.intValue() == 2) {

					} else {// 申请执行选择是
						if (rc.getApplyexecute2().intValue() == 1) {// 已经是申请执行了
							throw new PortalBizCheckedException("二审的申请执行状态已经被其他用户抢先保存成是了，你的本次操作不能生效了，请知悉！");
						} else {
							Casestep step = new Casestep();
							step.setCaseid(id);
							step.setStatus(CaseStepEnum.applyexecute.getValue());
							List<Casestep> steps = casestepMapper.selectByCriteria(step);
							if (steps.size() > 0) {
								Casestep up = new Casestep();
								up.setId(steps.get(0).getId());
								up.setDetail("申请执行：是");
								casestepMapper.updateByPrimaryKeySelective(up);
								riskcase.setApplyexecute2(1);// 申请执行
								if (StringUtils.isNotBlank(applyexe2)) {
									riskcase.setApplyexe2(DateUtils.parse(applyexe2, DateUtils.DEFAULT_DATETIME_FORMAT_SEC));// 新加字段判决2申请执行时间
								}
								riskcaseMapper.updateByPrimaryKeySelective(riskcase);
							}
						}
					}
				}
			} else {
				riskcase.setStatus(CaseStepEnum.applyexecute.getValue());// 申请执行
				if (CaseStepEnum.issecondaudit.getValue().equals(status) && applyexecute != null) {
					riskcase.setApplyexecute(applyexecute);
					if (StringUtils.isNotBlank(applyexe1)) {
						riskcase.setApplyexe1(DateUtils.parse(applyexe1, DateUtils.DEFAULT_DATETIME_FORMAT_SEC));// 新加字段判决1申请执行时间
					}
				} else if (CaseStepEnum.secondjudge.getValue().equals(status) && applyexecute2 != null) {
					riskcase.setApplyexecute2(applyexecute2);
					if (StringUtils.isNotBlank(applyexe2)) {
						riskcase.setApplyexe2(DateUtils.parse(applyexe2, DateUtils.DEFAULT_DATETIME_FORMAT_SEC));// 新加字段判决2申请执行时间
					}
				}
				Date nowDate = Calendar.getInstance().getTime();

				// 插入操作步骤
				Casestep step = new Casestep();
				step.setCaseid(id);
				step.setCasename(CaseStepEnum.applyexecute.getName());// 步骤名称
				step.setStatus(CaseStepEnum.applyexecute.getValue());
				step.setCreateid(userDTO.getId());
				step.setCreator(userDTO.getName());
				step.setCreatetime(nowDate);
				if (applyexecute != null) {
					step.setDetail("申请执行：" + (applyexecute.intValue() == 1 ? "是" : "否"));
				} else if (applyexecute2 != null) {
					step.setDetail("申请执行：" + (applyexecute2.intValue() == 1 ? "是" : "否"));
				}
				casestepMapper.insert(step);
				riskcaseMapper.updateByPrimaryKeySelective(riskcase);
			}
		} else {
			throw new PortalBizCheckedException("跟进状态已改变，请返回列表查看");
		}
		return rc.getType().intValue() == 1;// 逾期类型
	}

	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public boolean caseoperatesave10(Integer id, Integer status, Integer excecuteresult, Integer excecuteresult2, Integer excecute2result,
			Integer excecute2result2, String excecute1) throws IOException {
		UserDTO userDTO = SecurityHelper.getAdminUserInfo();
		ValidationUtils.notNull(userDTO, "会话过期，请重新登录...");
		Riskcase rc = riskcaseMapper.selectByPrimaryKey(id);
		if (status.equals(rc.getStatus())) {
			Riskcase riskcase = new Riskcase();
			riskcase.setId(id);
			if (rc.getNeed2judge().intValue() == 2) {// 不需要二审
				if (rc.getStatus().intValue() == 9) {// 往下一步执行
					riskcase.setStatus(CaseStepEnum.executeresult.getValue());// 执行结果
					if (excecuteresult.intValue() == 2) {// 终止执行
						if (excecuteresult2.intValue() == 1) {// 和解
							riskcase.setExcecuteresult(2);// 1、正常执行 2、终止执行和解 3、终止执行法院要求 4、恢复执行
							if (StringUtils.isNotBlank(excecute1)) {
								riskcase.setExcecute2(excecute1);
							}
							// 執行完毕 1代表完毕
							riskcase.setFinished(1);
						} else {// 法院要求
							riskcase.setExcecuteresult(3);
							if (StringUtils.isNotBlank(excecute1)) {
								riskcase.setExcecute3(excecute1);
							}
						}
					} /*
					 * else if (excecuteresult.intValue() == 3) { riskcase.setExcecuteresult(4);//
					 * 4、恢复执行 }
					 */else if (excecuteresult.intValue() == 1) {
						riskcase.setExcecuteresult(1);// 1、正常执行
						if (StringUtils.isNotBlank(excecute1)) {
							riskcase.setExcecute1(excecute1);
						}
						// 執行完毕 1代表完毕
						riskcase.setFinished(1);
					}
					Date nowDate = Calendar.getInstance().getTime();

					// 插入操作步骤
					Casestep step = new Casestep();
					step.setCaseid(id);
					step.setCasename(CaseStepEnum.executeresult.getName());// 步骤名称
					step.setStatus(CaseStepEnum.executeresult.getValue());
					step.setCreateid(userDTO.getId());
					step.setCreator(userDTO.getName());
					step.setCreatetime(nowDate);
					int er = riskcase.getExcecuteresult();
					step.setDetail("执行结果：" + (er == 1 ? "正常执行" : er == 2 ? "终止执行-和解" : er == 3 ? "终止执行-法院要求" : er == 4 ? "恢复执行" : ""));
					casestepMapper.insert(step);
				} else if (rc.getStatus().intValue() == 10 && rc.getExcecuteresult().intValue() == 3) {
					// 编辑当前步骤 只当法院要求时可编辑 excecuteresult为3
					if (StringUtils.isNotBlank(rc.getExcecute1())) {
						riskcase.setExcecute1("");
					}
					if (StringUtils.isNotBlank(rc.getExcecute2())) {
						riskcase.setExcecute2("");
					}
					if (StringUtils.isNotBlank(rc.getExcecute3())) {
						riskcase.setExcecute3("");
					}
					if (excecuteresult.intValue() == 2) {// 终止执行
						if (excecuteresult2.intValue() == 1) {// 和解
							riskcase.setExcecuteresult(2);// 1、正常执行 2、终止执行和解 3、终止执行法院要求 4、恢复执行
							// if (StringUtils.isNotBlank(excecute1)) {
							riskcase.setExcecute2(excecute1);
							// }
							// 執行完毕 1代表完毕
							riskcase.setFinished(1);
						} else {// 法院要求
							riskcase.setExcecuteresult(3);
							// if (StringUtils.isNotBlank(excecute1)) {
							riskcase.setExcecute3(excecute1);
							// }
						}
					} /*
					 * else if (excecuteresult.intValue() == 3) { riskcase.setExcecuteresult(4);//
					 * 4、恢复执行 }
					 */else if (excecuteresult.intValue() == 1) {
						riskcase.setExcecuteresult(1);// 1、正常执行
						// if (StringUtils.isNotBlank(excecute1)) {
						riskcase.setExcecute1(excecute1);
						// }
						// 執行完毕 1代表完毕
						riskcase.setFinished(1);
					}
					// 更新操作步骤
					Casestep step = new Casestep();
					step.setCaseid(id);
					step.setStatus(10);// 执行结果步骤
					List<Casestep> steps = casestepMapper.selectByCriteria(step);
					if (steps.size() > 0) {
						Casestep updatestep = new Casestep();
						updatestep.setId(steps.get(0).getId());
						int er = riskcase.getExcecuteresult();
						updatestep.setDetail("执行结果：" + (er == 1 ? "正常执行" : er == 2 ? "终止执行-和解" : er == 3 ? "终止执行-法院要求" : ""));
						casestepMapper.updateByPrimaryKeySelective(updatestep);
					}
				} else {
					throw new PortalBizCheckedException("状态已改变！请返回列表查看");
				}
			} else {// 有二审
				if (rc.getStatus().intValue() == 9) {// 往下一步执行
					riskcase.setStatus(CaseStepEnum.executeresult.getValue());// 执行结果
					if (excecute2result.intValue() == 2) {// 终止执行
						if (excecute2result2.intValue() == 1) {// 和解
							riskcase.setExcecute2result(2);// 1、正常执行 2、终止执行和解 3、终止执行法院要求 4、恢复执行
							if (StringUtils.isNotBlank(excecute1)) {
								riskcase.setEx2cecute2(excecute1);
							}
							// 執行完毕 1代表完毕
							riskcase.setFinished(1);
						} else {// 法院要求
							riskcase.setExcecute2result(3);
							if (StringUtils.isNotBlank(excecute1)) {
								riskcase.setEx2cecute3(excecute1);
							}
						}
					} /*
					 * else if (excecuteresult.intValue() == 3) { riskcase.setExcecuteresult(4);//
					 * 4、恢复执行 }
					 */else if (excecute2result.intValue() == 1) {
						riskcase.setExcecute2result(1);// 1、正常执行
						if (StringUtils.isNotBlank(excecute1)) {
							riskcase.setEx2cecute1(excecute1);
						}
						// 執行完毕 1代表完毕
						riskcase.setFinished(1);
					}
					Date nowDate = Calendar.getInstance().getTime();

					// 插入操作步骤
					Casestep step = new Casestep();
					step.setCaseid(id);
					step.setCasename(CaseStepEnum.executeresult.getName());// 步骤名称
					step.setStatus(CaseStepEnum.executeresult.getValue());
					step.setCreateid(userDTO.getId());
					step.setCreator(userDTO.getName());
					step.setCreatetime(nowDate);
					int er = riskcase.getExcecute2result();
					step.setDetail("执行结果：" + (er == 1 ? "正常执行" : er == 2 ? "终止执行-和解" : er == 3 ? "终止执行-法院要求" : ""));
					casestepMapper.insert(step);
				} else if (rc.getStatus().intValue() == 10 && rc.getExcecute2result().intValue() == 3) {
					// 编辑当前步骤 只当法院要求时可编辑 excecuteresult为3
					if (StringUtils.isNotBlank(rc.getEx2cecute1())) {
						riskcase.setEx2cecute1("");
					}
					if (StringUtils.isNotBlank(rc.getEx2cecute2())) {
						riskcase.setEx2cecute2("");
					}
					if (StringUtils.isNotBlank(rc.getEx2cecute3())) {
						riskcase.setEx2cecute3("");
					}
					if (excecute2result.intValue() == 2) {// 终止执行
						if (excecute2result2.intValue() == 1) {// 和解
							riskcase.setExcecute2result(2);// 1、正常执行 2、终止执行和解 3、终止执行法院要求 4、恢复执行
							// if (StringUtils.isNotBlank(excecute1)) {
							riskcase.setEx2cecute2(excecute1);
							// }
							// 執行完毕 1代表完毕
							riskcase.setFinished(1);
						} else {// 法院要求
							riskcase.setExcecute2result(3);
							// if (StringUtils.isNotBlank(excecute1)) {
							riskcase.setEx2cecute3(excecute1);
							// }
						}
					} /*
					 * else if (excecuteresult.intValue() == 3) { riskcase.setExcecuteresult(4);//
					 * 4、恢复执行 }
					 */else if (excecute2result.intValue() == 1) {
						riskcase.setExcecute2result(1);// 1、正常执行
						// if (StringUtils.isNotBlank(excecute1)) {
						riskcase.setEx2cecute1(excecute1);
						// }
						// 執行完毕 1代表完毕
						riskcase.setFinished(1);
					}
					// 更新操作步骤
					Casestep step = new Casestep();
					step.setCaseid(id);
					step.setStatus(10);// 执行结果步骤
					List<Casestep> steps = casestepMapper.selectByCriteria(step);
					if (steps.size() > 0) {
						Casestep updatestep = new Casestep();
						updatestep.setId(steps.get(0).getId());
						int er = riskcase.getExcecute2result();
						updatestep.setDetail("执行结果：" + (er == 1 ? "正常执行" : er == 2 ? "终止执行-和解" : er == 3 ? "终止执行-法院要求" : ""));
						casestepMapper.updateByPrimaryKeySelective(updatestep);
					}
				} else {
					throw new PortalBizCheckedException("状态已改变！请返回列表查看！");
				}
			}
			riskcaseMapper.updateByPrimaryKeySelective(riskcase);
		} else {
			throw new PortalBizCheckedException("跟进状态已改变，请返回列表查看");
		}
		return rc.getType().intValue() == 1;// 逾期类型
	}

	public Map<String, Object> casemonitorquery(Integer type, String name, String bname, Integer start, Integer pageSize) {
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> pmap = new HashMap<String, Object>();
		pmap.put("start", (start - 1) * pageSize);
		pmap.put("size", pageSize);
		pmap.put("type", type);
		if (StringUtils.isNotBlank(name)) {
			pmap.put("name", name);
		}
		if (StringUtils.isNotBlank(bname)) {
			pmap.put("bname", bname);
		}
		if (type.intValue() == 1) {// 逾期类
			List<Map<String, Object>> lst = caseMonitorMapper.selectcaseByMap(pmap);
			int size = caseMonitorMapper.countcaseByMap(pmap);
			map.put("result", lst);
			map.put("total", size);
		} else {
			List<Map<String, Object>> lst = caseMonitorMapper.selectcase2ByMap(pmap);
			int size = caseMonitorMapper.countcase2ByMap(pmap);
			map.put("result", lst);
			map.put("total", size);
		}
		return map;
	}

	public void casemonitorviewlist(LinkedHashMap<String, Object> map, Integer rscid) {
		Riskcase riskcase = riskcaseMapper.selectByPrimaryKey(rscid);
		CaseMonitor cm = new CaseMonitor();
		cm.setRscid(rscid);
		map.put("lst", caseMonitorMapper.selectByCriteria(cm));
		map.put("riskcase", riskcase);
	}

	public void uploadcasemonitor(LinkedHashMap<String, Object> map, Integer rscid) {
		Riskcase riskcase = riskcaseMapper.selectByPrimaryKey(rscid);
		map.put("riskcase", riskcase);
	}

	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public boolean uploadcasemonitorsave(ModelMap map, Integer rscid, String property, String person) {
		Riskcase riskcase = riskcaseMapper.selectByPrimaryKey(rscid);
		Integer status = riskcase.getStatus();
		boolean ok = false;
		if (CaseStepEnum.applyexecute.getValue().equals(status)) {// 申请执行
			ok = true;
		} else if (CaseStepEnum.executeresult.getValue().equals(status)) {// 执行结果
			Casestep step = new Casestep();
			step.setCaseid(rscid);
			step.setStatus(CaseStepEnum.executeresult.getValue());// 执行结果步骤
			List<Casestep> steps = casestepMapper.selectByCriteria(step);
			if (steps.size() > 0) {
				step = steps.get(0);
				String detail = step.getDetail();
				if (!"执行结果：终止执行-法院要求".equals(detail)) {
					throw new PortalBizCheckedException("本案件[" + riskcase.getCasename() + "]已执行完毕，不能再资产上传条件");
				}
				ok = true;
			} else {
				throw new PortalBizCheckedException("案件[" + riskcase.getCasename() + "]缺失执行步骤，请联系管理员确认！");
			}
		} else {
			throw new PortalBizCheckedException("本案件[" + riskcase.getCasename() + "]不符合资产上传条件");
		}
		if (ok) {
			CaseMonitor cm = new CaseMonitor();
			cm.setRscid(rscid);
			cm.setProperty(property);
			cm.setPerson(person);
			cm.setCreatetime(new Date());
			UserDTO userInfo = SecurityHelper.getAdminUserInfo();
			if (userInfo == null) {
				throw new PortalBizCheckedException("会话过期，请重新登录！");
			}
			cm.setCreator(userInfo.getName());
			caseMonitorMapper.insert(cm);
			Integer moni = riskcase.getMonitor();
			if (moni == null) {// 若没有监控标示
				Riskcase riskcase1 = new Riskcase();
				riskcase1.setId(rscid);
				riskcase1.setMonitor(1);
				riskcaseMapper.updateByPrimaryKeySelective(riskcase1);// 则加入监控标示
			}
		}
		return riskcase.getType().intValue() == 1;
	}

	/**
	 * 
	 * <p>合同列表查询</p>
	 * @param map
	 * @param filecode
	 * @param name
	 * @param bname
	 * @param workType
	 * @param identify
	 * @param start
	 * @param pageSize
	 * @return
	 * @author wangzh
	 * @param type 
	 */
	public Map<String, Object> contractquery_shopgroup(UserDTO user, String filecode, String name, String bname, String workType, String identify,
			Integer start, Integer ps, String all, String node) {
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> pmap = new HashMap<String, Object>();
		pmap.put("start", (start - 1) * ps);
		pmap.put("size", ps);
		if (StringUtils.isNotBlank(filecode)) {
			pmap.put("filecode", filecode);
		}
		if (StringUtils.isNotBlank(name)) {
			pmap.put("name", name);
		}
		if (StringUtils.isNotBlank(bname)) {
			pmap.put("bname", bname);
		}
		if (StringUtils.isNotBlank(workType)) {
			pmap.put("clientype", workType);
		}
		if (StringUtils.isNotBlank(identify)) {
			pmap.put("identify", identify);
		}
		// 权限控制
		/*
		 * if (StringUtils.isBlank(all) && StringUtils.isBlank(node)) {// 不是总览 UserDTO userInfo =
		 * SecurityHelper.getAdminUserInfo(); if (userInfo != null) { Collection<GrantedAuthority>
		 * as = userInfo.getAuthorities(); boolean ismanager = false; for
		 * (Iterator<GrantedAuthority> iterator = as.iterator(); iterator.hasNext();) {
		 * GrantedAuthority grantedAuthority = iterator.next(); if
		 * ("ROLE_SHOP_MANAGER".equals(grantedAuthority.toString())) {// ROLE_SHOP_MANAGER：店长角色 //
		 * 可以查看所有该店的店员签署的信息表 ismanager = true; break; } } if (ismanager) { if
		 * (StringUtils.isNotBlank(userInfo.getShop())) pmap.put("shopid", userInfo.getShop()); }
		 * else { pmap.put("sellid", userInfo.getId()); } } else { return null; } }
		 */
		if (StringUtils.isNotBlank(node)) {
			pmap.put("node", node);
		}
		List<Integer> shopids = shopGroupService.queryShopGroupIdsByUseridandShopid(user.getId(), Integer.valueOf(user.getShop()));
		pmap.put("shopids", shopids);
		List<Map<String, Object>> lst = contractMapper.selectAllByMap(pmap);
		int size = contractMapper.countAllByMap(pmap);
		map.put("result", lst);
		map.put("total", size);
		return map;
	}

	/***
	 * 
	 * <p>车辆批发开票查询</p>
	 * @param brand
	 * @param vin
	 * @param start
	 * @param pageSize
	 * @param type
	 * @return
	 * @author wangzh
	 */
	public Map<String, Object> batchinvoicequery(String brand, String vin, String status, Integer start, Integer pageSize, int step) {
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> pmap = new HashMap<String, Object>();
		pmap.put("start", (start - 1) * pageSize);
		pmap.put("size", pageSize);
		if (StringUtils.isNotBlank(brand)) {
			pmap.put("brand", brand);
		}
		if (StringUtils.isNotBlank(vin)) {
			pmap.put("vin", vin);
		}
		switch (step) {
			case 1:
				if (StringUtils.isNotBlank(status)) {
					pmap.put("status", status);
				}
				break;
			case 2:
				if (StringUtils.isNotBlank(status)) {
					pmap.put("status", status);
				} else
					pmap.put("status", "88");// 特殊值 用於查詢門店部默認列表
				break;
			case 3:
				if (StringUtils.isNotBlank(status)) {
					pmap.put("status", status);
				} else
					pmap.put("status", "99");// 特殊值 用於查詢財務部默認列表
				break;
		}
		List<Map<String, Object>> lst = invoiceMapper.selectBatchByMap(pmap);
		int size = invoiceMapper.countBatchByMap(pmap);
		map.put("result", lst);
		map.put("total", size);
		return map;
	}

	/**
	 * 
	 * <p>车辆批发开票操作</p>
	 * @param map
	 * @param id wholesale_car主键uuid
	 * @param currpage
	 * @param view
	 * @return
	 * @author wangzh
	 */
	public String batchinvoiceoperate(ModelMap map, String process, String id, String currpage, String view) {
		if (StringUtils.isNotBlank(process)) {
			map.put("process", process);
		}
		if (StringUtils.isNotBlank(currpage)) {
			map.put("currpage", currpage);
		}
		if (StringUtils.isNotBlank(view)) {
			map.put("view", view);
		}
		WholesaleCar ws = wholesaleCarMapper.selectByPrimaryKey(id);
		ValidationUtils.notNull(ws, "该批发记录不存在！");
		map.put("ws", ws);
		Car car = carMapper.selectByPrimaryKey(ws.getCarid());
		ValidationUtils.notNull(car, "批发车辆不存在！");
		map.put("car", car);
		BizInvoice invoice = new BizInvoice();
		invoice.setWsid(id);
		List<BizInvoice> ilst = invoiceMapper.selectByCriteria(invoice);
		boolean hasinvoice = false;
		Integer istatus = null;
		if (ilst.size() > 0) {
			hasinvoice = true;
			invoice = ilst.get(0);
			istatus = invoice.getStatus();
			map.put("invoice", invoice);
		}
		// 上面基础工作已就位，下面开始看看用户点击的什么操作吧
		// 按process来梳理
		if ("1".equals(process)) {// 第一个菜单 申请开票
			// 所有操作：申请开票、查看、编辑
			// 开票状态 默认null未开票 1待审核 2门店部补填 3门店部不通过 4门店部通过 5财务补填 6财务不通过 7财务通过并开票
			// null、3申请开票
			// 1 4 5 6 7查看
			// 2编辑
			if (StringUtils.isNotBlank(view)) {// 前端说要查看时
				// 就让他查看好了
				getinvoicefilesbyinvoiceid(map, invoice);
				return "biz/wsview";
			} else {// 其他操作
				if (hasinvoice) {
					if (istatus != null) {
						if (istatus.intValue() == 2) {
							getinvoicefilesbyinvoiceid(map, invoice);
							return "biz/wsedit";
						} else if (istatus.intValue() == 3) {
							return "biz/wsadd";
						}
					}
				} else {// 申请开票
					return "biz/wsadd";
				}
			}
		} else if ("2".equals(process)) {// 门店部填写结算表
			// 1审核 5编辑
			if (istatus != null) {
				if (istatus.intValue() == 1) {
					getinvoicefilesbyinvoiceid(map, invoice);
					return "biz/wsshopauditedit";
				} else if (istatus.intValue() == 5) {
					getinvoicefilesbyinvoiceid(map, invoice);
					return "biz/wsshopauditedit";
				}
			}
		} else if ("3".equals(process)) {// 财务部填写结算表并结算
			// 4审核 7查看
			if (istatus != null) {
				if (istatus.intValue() == 4) {
					getinvoicefilesbyinvoiceid(map, invoice);
					return "biz/wsfinanceaudit";
				} else if (istatus.intValue() == 7) {
					getinvoicefilesbyinvoiceid(map, invoice);
					return "biz/wsview";
				}
			}
		}
		map.put("message", "该开票记录状态已改变，请返回列表重新操作");
		return View.ERROR_MESSAGE;
	}

	// 车辆批发开票保存 conid这里是指批发主键
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void batchinvoicesave(Integer id, String conid, Integer big, Integer small, BigDecimal money, String name, String phone, String cardId, String tax,
			String bank, String bankCard, String address, String arr, String replace) {
		WholesaleCar ws = wholesaleCarMapper.selectByPrimaryKey(conid);
		if (id == null) {// 新增开票
			BizInvoice invoice = new BizInvoice();
			invoice.setWsid(conid);
			invoice.setCarid(ws.getCarid());// 冗余字段 车辆id
			List<BizInvoice> invoices = invoiceMapper.selectByCriteria(invoice);
			// boolean shopnopass=false;//有没有门店部不通过 默认没有
			if (invoices.size() > 0) {
				Integer statusInteger = invoices.get(0).getStatus();
				if (3 == statusInteger.intValue()) {// 3门店部不通过
					// shopnopass=true;
					invoiceMapper.deleteByPrimaryKey(invoices.get(0).getId());// 删除上次开票记录
					invoice.setNopassreason(invoices.get(0).getNopassreason());// 上次不通过的原因copy过来
				} else
					throw new PortalBizCheckedException("该合同已开过票了，请返回列表查看");
			}
			Date now = new Date();
			invoice.setAmount(money);
			invoice.setCompanyname(name);
			invoice.setPhone(phone);
			// 1待审核 2门店部补填 3门店部不通过 4门店部通过 5财务补填 6财务不通过 7财务通过并开票
			invoice.setStatus(1);
			invoice.setCreatetime(now);
			UserDTO userDTO = SecurityHelper.getAdminUserInfo();
			if (userDTO != null) {// 如果登陆信息不失效 则记录 测试下到底session过期怎么回事
				invoice.setCreator(userDTO.getLoginName());
			}
			if (big.intValue() == 1) {// 增值税发票
				invoice.setTaxnum(tax);
				invoice.setOpenbank(bank);
				invoice.setBanknum(bankCard);
				invoice.setRunaddress(address);
				invoice.setTypebig(1);// 开票类型大类 1增值税发票 2机动车专用发票
			} else if (big.intValue() == 2) {// 机动车专用发票
				if (small.intValue() == 1) {// 个人
					invoice.setIdentify(cardId);
					invoice.setTypebig(2);// 开票类型大类 1增值税发票 2机动车专用发票
					invoice.setTypesmall(1);// 对应于大类2的细分类型：1个人 2企业
				} else {// 企业
					invoice.setTaxnum(tax);
					invoice.setOpenbank(bank);
					invoice.setBanknum(bankCard);
					invoice.setRunaddress(address);
					invoice.setTypebig(2);// 开票类型大类 1增值税发票 2机动车专用发票
					invoice.setTypesmall(2);// 对应于大类2的细分类型：1个人 2企业
				}
			}
			invoiceMapper.insertSelective(invoice);
			boolean bl = StringUtils.isBlank(replace);
			// 上传相关文件
			if (StringUtils.isNotBlank(arr)) {
				JSONArray jsonArray = JSONArray.fromObject(arr);
				List<BizInvoiceFile> lst = new ArrayList<BizInvoiceFile>();
				for (int i = 0; i < jsonArray.size(); i++) {
					JSONObject job = jsonArray.getJSONObject(i);
					// 开票文件类型 1营业执照 2转账银行流水/支付宝/微信流水截图 3代付款证明 4代付款人身份证正反面
					// 5身份证正反面
					int type = job.getInt("type");
					String add = job.getString("add");
					int pid = job.getInt("pid");
					BizInvoiceFile file = new BizInvoiceFile();
					file.setInvoiceid(invoice.getId());
					file.setCreatetime(now);
					file.setAddress(add);
					file.setType(type);
					file.setSort(pid);
					if (bl && (3 == type || 4 == type)) {
						continue;
					}
					lst.add(file);
				}
				if (lst.size() > 0) {
					Collections.sort(lst);
					for (BizInvoiceFile bizfile : lst) {
						invoiceFileMapper.insertSelective(bizfile);
					}
				}
			}
			if (!bl) {
				BizInvoice invoice1 = new BizInvoice();
				invoice1.setId(invoice.getId());
				invoice1.setBehalfpay("1");// 是否代付款 1是
				invoiceMapper.updateByPrimaryKeySelective(invoice1);
			}
		}
	}

	// 门店部要求补填时 编辑保存功能
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void batchinvoiceeditsave(Integer id, String conid, String dels, String arr, BigDecimal money, String name, String phone, String cardId, String tax,
			String bank, String bankCard, String address) {
		WholesaleCar ws = wholesaleCarMapper.selectByPrimaryKey(conid);
		ValidationUtils.notNull(ws, "批发记录不存在");
		BizInvoice bi = invoiceMapper.selectByPrimaryKey(id);
		ValidationUtils.notNull(bi, "开票记录不存在");
		Integer istatus = bi.getStatus();
		if (2 != istatus.intValue()) {// 2门店部补填
			throw new PortalBizCheckedException("该开票状态已改变，请返回列表查看");
		}
		Integer big = bi.getTypebig();
		Integer small = bi.getTypesmall();
		int fieldshort = 0;
		if (big.intValue() == 1 || (big.intValue() == 2 && small != null && small.intValue() == 2)) {// 增值税或（机动车、企业）
			// 字段很多的一种
		} else if (big.intValue() == 2 && small != null && small.intValue() == 1) {
			fieldshort = 1;
		} else {
			throw new PortalMsBizCheckedException("开票类型有误");
		}
		BizInvoice invoice = new BizInvoice();
		invoice.setAmount(money);
		invoice.setCompanyname(name);
		invoice.setPhone(phone);
		// 操作普通字段
		if (fieldshort == 1) {
			invoice.setIdentify(cardId);
		} else {// 字段多
			invoice.setTaxnum(tax);
			invoice.setOpenbank(bank);
			invoice.setBanknum(bankCard);
			invoice.setRunaddress(address);
		}
		invoice.setStatus(1);// 待审核
		invoice.setId(id);
		invoiceMapper.updateByPrimaryKeySelective(invoice);
		// 操作图片
		// 操作删除的图片
		if (StringUtils.isNotBlank(dels)) {
			JSONArray jsonArray = JSONArray.fromObject(dels);
			for (int i = 0; i < jsonArray.size(); i++) {
				JSONObject job = jsonArray.getJSONObject(i);
				invoiceFileMapper.deleteByPrimaryKey(job.getInt("id"));
			}
		}
		// 新增图片
		Date now = new Date();
		if (StringUtils.isNotBlank(arr)) {
			JSONArray jsonArray = JSONArray.fromObject(arr);
			List<BizInvoiceFile> lst = new ArrayList<BizInvoiceFile>();
			for (int i = 0; i < jsonArray.size(); i++) {
				JSONObject job = jsonArray.getJSONObject(i);
				int type = job.getInt("type");
				String add = job.getString("add");
				int pid = job.getInt("pid");
				BizInvoiceFile file = new BizInvoiceFile();
				file.setInvoiceid(id);
				file.setCreatetime(now);
				file.setAddress(add);
				file.setType(type);
				file.setSort(pid);
				lst.add(file);
			}
			if (lst.size() > 0) {
				Collections.sort(lst);
				for (BizInvoiceFile item : lst) {
					invoiceFileMapper.insertSelective(item);
				}
			}
		}
	}
}
