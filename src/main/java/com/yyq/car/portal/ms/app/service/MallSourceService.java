/*******************************************************************************
 * Project   : car-ms
 * Class Name: com.yyq.car.portal.ms.app.service.MallSourceService
 * Created By: wangzh 
 * Created on: 2018年10月19日 下午4:13:36
 * Copyright © 2013-2014 YYQ All rights reserved.
 ******************************************************************************/
package com.yyq.car.portal.ms.app.service;

import java.io.IOException;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;

import com.yyq.car.portal.common.constant.FileTypeEnum;
import com.yyq.car.portal.common.dto.UserDTO;
import com.yyq.car.portal.common.exception.PortalBizCheckedException;
import com.yyq.car.portal.common.mapper.comm.ModelMapper;
import com.yyq.car.portal.common.mapper.jnd.jndSiteMapper;
import com.yyq.car.portal.common.mapper.mall.CarsourceFileMapper;
import com.yyq.car.portal.common.mapper.mall.CarsourceMapper;
import com.yyq.car.portal.common.mapper.mall.MallIssuingCompanyMapper;
import com.yyq.car.portal.common.mapper.mall.MallshoppingcartMapper;
import com.yyq.car.portal.common.mapper.mall.mallAreaBrandMapper;
import com.yyq.car.portal.common.mapper.mall.mallUserMapper;
import com.yyq.car.portal.common.mapper.mallcontract.JndCarorderDetailMapper;
import com.yyq.car.portal.common.mapper.mallcontract.MallCarorderDetailMapper;
import com.yyq.car.portal.common.mapper.mallcontract.MallDisplacementTaxMapper;
import com.yyq.car.portal.common.mapper.mallcontract.MallOrderDetailMapper;
import com.yyq.car.portal.common.mapper.product.CarMapper;
import com.yyq.car.portal.common.model.jnd.jndSite;
import com.yyq.car.portal.common.model.mall.Carsource;
import com.yyq.car.portal.common.model.mall.CarsourceFile;
import com.yyq.car.portal.common.model.mall.MallIssuingCompany;
import com.yyq.car.portal.common.model.mall.Mallshoppingcart;
import com.yyq.car.portal.common.model.mall.mallAreaBrand;
import com.yyq.car.portal.common.model.mall.mallUser;
import com.yyq.car.portal.common.model.mallcontract.JndCarorderDetail;
import com.yyq.car.portal.common.model.mallcontract.MallCarorderDetail;
import com.yyq.car.portal.common.model.mallcontract.MallDisplacementTax;
import com.yyq.car.portal.common.model.mallcontract.MallOrderDetail;
import com.yyq.car.portal.common.model.product.Car;
import com.yyq.car.portal.common.service.ResourcePersistenceService;
import com.yyq.car.portal.common.service.security.SecurityHelper;
import com.yyq.car.portal.ms.web.command.CarSourceSaveCmd;
import com.yyq.car.portal.ms.web.util.UUIDTool;


/**
 * <P>服务类</P>
 * @author wangzh
 */
@Service
public class MallSourceService {

	@Autowired
	ResourcePersistenceService resourceService;

	@Autowired
	CarsourceMapper carsourceMapper;

	@Autowired
	CarsourceFileMapper sourcefileMapper;

	@Autowired
	jndSiteMapper siteMapper;

	@Autowired
	mallAreaBrandMapper areaBrandMapper;

	@Autowired
	MallIssuingCompanyMapper companyMapper;

	@Autowired
	MallshoppingcartMapper shoppingcartMapper;

	@Autowired
	MallOrderDetailMapper orderDetailMapper;

	@Autowired
	ModelMapper modelMapper;

	@Autowired
	MallDisplacementTaxMapper displacementTaxMapper;

	@Autowired
	JndCarorderDetailMapper jndCarorderDetailMapper;

	@Autowired
	MallCarorderDetailMapper mallCarorderDetailMapper;

	@Autowired
	mallUserMapper mallUserMapper;

	@Autowired
	CarMapper carMapper;

	/**
	 * 
	 * <p>获取所有区域</p>
	 * @param invalid 是否获取有效记录 true有效 false全部
	 * @return List<jndSite>
	 * @author wangzh
	 */
	public List<jndSite> getAllSites(boolean invalid) {
		jndSite site = new jndSite();
		if (invalid) {
			site.setStatus(1);// 获取有效记录
		}
		return siteMapper.selectByCriteria(site);
	}

	/**
	 * 
	 * <p>根据id获取区域</p>
	 * @param id
	 * @return
	 * @author wangzh
	 */
	public jndSite getSiteById(Integer id) {
		return siteMapper.selectByPrimaryKey(id);
	}

	/**
	 * 
	 * <p>根据区域id获取该区域下的所有品牌</p>
	 * @param areaId
	 * @param invalid 是否获取有效 true有效记录 false全部
	 * @return List<mallAreaBrand>
	 * @author wangzh
	 */
	public List<mallAreaBrand> getAllBrandsByAreaId(Integer areaId, boolean invalid) {
		if (areaId == null) {
			return null;
		}
		mallAreaBrand brand = new mallAreaBrand();
		brand.setAreaid(areaId);
		if (invalid) {
			brand.setStatus(1);// 获取有效记录
		}
		return areaBrandMapper.selectByCriteria(brand);
	}

	/**
	 * 
	 * <p>获取所有开证公司</p>
	 * @param invalid
	 * @return
	 * @author wangzh
	 */
	public List<MallIssuingCompany> getAllIssCops(boolean invalid) {
		MallIssuingCompany record = new MallIssuingCompany();
		if (invalid) {
			record.setStatus(1);// 获取有效记录
		}
		return companyMapper.selectByCriteria(record);
	}

	/**
	 * 
	 * <p>车源列表查询</p>
	 * @param area
	 * @param brand
	 * @param start
	 * @param pageSize
	 * @return
	 * @author wangzh
	 */
	public Map<String, Object> mallcarsourcequery(Integer country, String area, String brand, Integer start, Integer pageSize) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("start", (start - 1) * pageSize);
		param.put("size", pageSize);
		if (StringUtils.isNotBlank(area)) {
			param.put("area", area);
		}
		if (StringUtils.isNotBlank(brand)) {
			param.put("brand", brand);
		}
		if (null != country) {
			param.put("areaid", country);
		}
		List<Map<String, Object>> lst = carsourceMapper.selectByMap(param);
		int c = carsourceMapper.countByMap(param);
		param.clear();
		param.put("result", lst);
		param.put("total", c);
		return param;
	}

	/**
	 * 
	 * <p>根据id改变车源有效状态</p>
	 * @param id
	 * @author wangzh
	 */
	public void mallcarsourcevalid(Integer id) {
		Carsource source = carsourceMapper.selectByPrimaryKey(id);
		if (source == null) {
			throw new PortalBizCheckedException("该车源已不存在，请确认");
		}
		Integer st = source.getStatus();
		if (st == 1) {// normal
			// 就认为前端页面也显示为正常，客户想要变为无效
			// 判断该车源是否加入购物车、订单
			// Mallshoppingcart cart = new Mallshoppingcart();
			// cart.setSourceid(id);
			// int i1 = shoppingcartMapper.countByCriteria(cart);
			// if (i1 > 0) {
			// throw new PortalBizCheckedException("购物车尚有与该车源关联的数据，不可变为无效");
			// }
			// MallOrderDetail order = new MallOrderDetail();
			// order.setSourceid(id);
			// int i2 = orderDetailMapper.countByCriteria(order);
			// if (i2 > 0) {
			// throw new PortalBizCheckedException("订单尚有与该车源关联的数据，不可变为无效");
			// }
			Carsource s2 = new Carsource();
			s2.setId(id);
			s2.setStatus(2);// 无效
			carsourceMapper.updateByPrimaryKeySelective(s2);
		} else if (st == 2) {// 无效
			Carsource s2 = new Carsource();
			s2.setId(id);
			s2.setStatus(1);// 有效
			carsourceMapper.updateByPrimaryKeySelective(s2);
		}
	}

	/**
	 * 
	 * <p>车源删除</p>
	 * @param id
	 * @author wangzh
	 */
	public void mallcarsourcedel(Integer id) {
		// 判断该车源是否加入购物车、订单
		Mallshoppingcart cart = new Mallshoppingcart();
		cart.setSourceid(id);
		int i1 = shoppingcartMapper.countByCriteria(cart);
		if (i1 > 0) {
			throw new PortalBizCheckedException("购物车尚有与该车源关联的数据，不可删除");
		}
		MallOrderDetail order = new MallOrderDetail();
		order.setSourceid(id);
		int i2 = orderDetailMapper.countByCriteria(order);
		if (i2 > 0) {
			throw new PortalBizCheckedException("订单尚有与该车源关联的数据，不可删除");
		}
		carsourceMapper.deleteByPrimaryKey(id);
	}

	/**
	 * 
	 * <p>上传车源配置图片</p>
	 * @param file
	 * @return
	 * @throws IOException
	 * @author wangzh
	 */
	public String uploadPic(MultipartFile file) throws IOException {
		// 上传图片
		return // resourceService.uploadOneFileForRisk(file, FileTypeEnum.carsource);
		resourceService.ftpSave(file, FileTypeEnum.carsource);
	}

	/**
	 * 
	 * <p>上传车源图片</p>
	 * @param file
	 * @return
	 * @throws IOException
	 * @author wangzh
	 */
	public String uploadcarPic(MultipartFile file) throws IOException {
		return resourceService.ftpSave(file, FileTypeEnum.carsourcepic);
	}

	/**
	 * 
	 * <p>车源新增保存</p>
	 * @param cmd
	 * @param carpics
	 * @param config
	 * @param configv
	 * @param decorates
	 * @return
	 * @author wangzh
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public Map<String, Object> carsourcesave(CarSourceSaveCmd cmd, String[] pics, String config, String configk, String configv, String decorates, String colors) {
		Map<String, Object> reMap = new HashMap<String, Object>();
		// 获取登陆用户
		UserDTO userInfo = SecurityHelper.getAdminUserInfo();// 放置在前面 如果登陆超时 直接报错退出
		Carsource c = new Carsource();
		Date now = new Date();
		// 必填项
		c.setCreator(userInfo.getName());
		c.setCreatetime(now);
		c.setAreaid(cmd.getAreaid());
		c.setAreaname(cmd.getAreaname());
		c.setUnit(cmd.getUnit());
		c.setBrandid(cmd.getBrands());
		c.setBrand(cmd.getBrandname());
		c.setModel(cmd.getModel());
		c.setDisplacement(cmd.getDisplacement());
		c.setCarprice(cmd.getCarprice());
		// c.setStatus(1);//数据库默认值 无需设置
		c.setType(cmd.getType());
		c.setDownpayscale(cmd.getDownpayscale());
		// 非必填项
		c.setDecorateprice(cmd.getDecorateprice());
		c.setOversea4sprice(cmd.getOversea4sprice());
		c.setFavor(cmd.getFavor());
		c.setCmsn(cmd.getCmsn());
		c.setOverseadrayage(cmd.getOverseadrayage());
		c.setOverseashotinsurance(cmd.getOverseashotinsurance());
		c.setSeatransportprice(cmd.getSeatransportprice());
		c.setSeatransportinsurance(cmd.getSeatransportinsurance());
		c.setStoragenum(cmd.getStoragenum());
		c.setIssuingid(cmd.getIssuingid());
		if (StringUtils.isNotBlank(cmd.getIssuingcompany())) {
			c.setIssuingcompany(cmd.getIssuingcompany());
		}
		// c.setOutcolor(cmd.getOutcolor());
		// c.setIncolor(cmd.getIncolor());
		c.setServiceprice(cmd.getServiceprice());
		carsourceMapper.insertSelective(c);
		Integer id = c.getId();
		// 处理车源图片
		// String[] pics = cmd.getPics();
		Carsource c1 = new Carsource();
		c1.setId(id);
		if (null != pics && pics.length > 0) {
			CarsourceFile file = new CarsourceFile();
			file.setSourceid(id);
			file.setUnit(cmd.getUnit());
			file.setType(1);// 类型1车辆图片2配置图片3加装包
			file.setCreator(userInfo.getName());
			file.setCreatetime(now);
			for (int i = 0; i < pics.length; i++) {
				file.setPicurl(pics[i]);
				sourcefileMapper.insertSelective(file);
			}
			c1.setCoverpic(pics[0]);
		}
		// 处理配置
		if (StringUtils.isNotBlank(config)) {
			// Carsource source = new Carsource();
			// source.setId(id);
			c1.setConfig(config);// 逗号隔开的格式
			List<Map<String, String>> lst = new ArrayList<Map<String, String>>();
			// 组装json字符串
			if (StringUtils.isNotBlank(configk) && StringUtils.isNotBlank(configv)) {
				JSONArray array = JSONArray.fromObject(configk);
				JSONArray array1 = JSONArray.fromObject(configv);
				if (array.size() == array1.size()) {
					for (int i = 0; i < array.size(); i++) {
						String k = array.getString(i);
						Map<String, String> mmp = new HashMap<String, String>();
						mmp.put("k", k);
						mmp.put("v", array1.getString(i));
						lst.add(mmp);
						c1.setVersion(k);
					}
					c1.setConfigv(com.alibaba.fastjson.JSONObject.toJSONString(lst));
				}
				// ArrayUtils.
				// Array.
			}
			// for (int i = 0; i < configk.length; i++) {// 根据版本个数
			// Map<String, String> mmp = new HashMap<String, String>();
			// mmp.put("k", configk[i]);
			// mmp.put("v", configv[i]);
			// lst.add(mmp);
			// }

			// carsourceMapper.updateByPrimaryKeySelective(source);
		}
		// 处理加装包
		if (decorates != null && decorates.length() > 0) {
			BigDecimal total = BigDecimal.ZERO;// 总加装费
			BigDecimal decorate = BigDecimal.ZERO;// 加装费
			JSONArray array = JSONArray.fromObject(decorates);
			for (int i = 0; i < array.size(); i++) {
				CarsourceFile file = new CarsourceFile();
				file.setSourceid(id);
				file.setUnit(cmd.getUnit());
				file.setType(3);// 类型1车辆图片2配置图片3加装包
				file.setCreator(userInfo.getName());
				file.setCreatetime(now);
				JSONObject object = array.getJSONObject(i);
				file.setTitle(object.getString("name"));
				file.setDetail(object.getString("con"));
				String price = object.getString("price");
				if (StringUtils.isNotBlank(price)) {
					file.setPrice(new BigDecimal(price));
					total = total.add(file.getPrice());
				}
				file.setPicurl(object.getString("pic"));
				String deflt = object.getString("ck");
				if (StringUtils.isNotBlank(deflt)) {
					file.setDeflt(Integer.parseInt(deflt));// default是否是默认配置 1是2不是
					if (file.getDeflt().intValue() == 1 && file.getPrice() != null) {
						decorate = decorate.add(file.getPrice());
					}
				}
				sourcefileMapper.insertSelective(file);
			}
			// Carsource source = new Carsource();
			// source.setId(id);
			c1.setTotaldecorateprice(total);
			c1.setDecorateprice(decorate);
			// carsourceMapper.updateByPrimaryKeySelective(source);
		}
		// 处理颜色、价格
		if (StringUtils.isNotBlank(colors)) {
			JSONArray array = JSONArray.fromObject(colors);
			for (int i = 0, len = array.size(); i < len; i++) {
				CarsourceFile file = new CarsourceFile();
				file.setSourceid(id);
				file.setUnit(cmd.getUnit());
				file.setType(4);// 类型1车辆图片2配置图片3加装包4颜色
				file.setCreator(userInfo.getName());
				file.setCreatetime(now);
				JSONObject object = array.getJSONObject(i);
				file.setTitle(object.getString("outcolor"));
				file.setDetail(object.getString("incolor"));
				String price = object.getString("price");
				if (StringUtils.isNotBlank(price)) {
					file.setPrice(new BigDecimal(price));
				}
				sourcefileMapper.insertSelective(file);
			}
		}
		// 处理税率（在新建时计算税率）
		/*
		 * 税率表：if(定金类别==非美产){ if (this.cc <= 1000) return 0.3475 else if (this.cc < 1500) return
		 * 0.3753 else if (this.cc < 2000) return 0.4042 else if (this.cc < 2500) return 0.4659 else
		 * if (this.cc < 3000) return 0.5159 else if (this.cc < 4000) return 0.7787 else if (this.cc
		 * >= 4000) return 1.2233 }else if(定金类别==美产){ if (this.cc <= 1000) return 0.6404 else if
		 * (this.cc < 1500) return 0.6742 else if (this.cc < 2000) return 0.7095 else if (this.cc <
		 * 2500) return 0.7846 else if (this.cc < 3000) return 0.8455 else if (this.cc < 4000)
		 * return 1.1653 else if (this.cc >= 4000) return 1.7067
		 */
		/*
		 * LIBOR即是London Interbank Offered Rate的缩写。 　　 所谓同业拆放利率，是指银行同业之间的短期资金借贷利率,可以说是银行的成本价,是变动的.
		 * Basis Point（bp）基点。一个基点等于1个百分点的1%，即0.01%，因此，220个基点等于2.2%。 加多少个BP表示银行的利差.相对不变.　
		 * Libor+220bp表示成交价是在某档同业拆放利率的基础上加2.2%.
		 */
		Integer type = c.getType();// 1美产2非美产
		Integer disp = c.getDisplacement();
		if (type != null && disp != null) {
			// int t = type.intValue();
			// int cc = disp.intValue();
			// double tax = getRateByTypeCc(t, cc);
			// c1.setId(c.getId());
			// c1.setTax(new BigDecimal(tax + ""));
			c1.setTax(getRateByTypeCc(type, disp));
			carsourceMapper.updateByPrimaryKeySelective(c1);
		}
		reMap.put("status", true);
		return reMap;
	}

	/**
	 * 
	 * <p>车源编辑保存</p>
	 * @param cmd
	 * @param pics
	 * @param picdeletes
	 * @param picedits
	 * @param config
	 * @param configk
	 * @param configv
	 * @param decorates
	 * @param jzdeletes
	 * @param jzedits
	 * @return
	 * @author wangzh
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public Map<String, Object> carsourceeditsave(CarSourceSaveCmd cmd, String[] pics, String[] picdeletes, String[] picedits, String config, String configk,
			String configv, String decorates, String[] jzdeletes, String jzedits, String colors, String[] colordeletes, String coloredits) {
		Map<String, Object> reMap = new HashMap<String, Object>();
		Integer id = cmd.getId();
		MallOrderDetail order = new MallOrderDetail();
		order.setSourceid(id);
		order.setOrderstatus(3);// 未完成
		order.setIssealapply(2);// 1 未创建合同 2 已创建合同
		int count = orderDetailMapper.countByCriteria(order);
		if (count > 0) {
			throw new PortalBizCheckedException("该车源不可编辑，因存在合同中的订单与该车源相关联的数据");
		}
		// 获取登陆用户
		UserDTO userInfo = SecurityHelper.getAdminUserInfo();// 放置在前面 如果登陆超时 直接报错退出

		Carsource old = carsourceMapper.selectByPrimaryKey(id);
		Carsource c = new Carsource();
		c.setId(id);
		Date now = new Date();
		// 必填项
		c.setUpdator(userInfo.getName());
		c.setUpdatetime(now);
		c.setDisplacement(cmd.getDisplacement());
		c.setCarprice(cmd.getCarprice());
		c.setType(cmd.getType());
		c.setDownpayscale(cmd.getDownpayscale());
		// 非必填项
		c.setDecorateprice(cmd.getDecorateprice());
		c.setOversea4sprice(cmd.getOversea4sprice());
		c.setFavor(cmd.getFavor());
		c.setCmsn(cmd.getCmsn());
		c.setOverseadrayage(cmd.getOverseadrayage());
		c.setOverseashotinsurance(cmd.getOverseashotinsurance());
		c.setSeatransportprice(cmd.getSeatransportprice());
		c.setSeatransportinsurance(cmd.getSeatransportinsurance());
		c.setStoragenum(cmd.getStoragenum());
		c.setIssuingid(cmd.getIssuingid());
		if (StringUtils.isNotBlank(cmd.getIssuingcompany())) {
			c.setIssuingcompany(cmd.getIssuingcompany());
		}
		// c.setOutcolor(cmd.getOutcolor());
		// c.setIncolor(cmd.getIncolor());
		c.setServiceprice(cmd.getServiceprice());
		if (StringUtils.isBlank(old.getCoverpic())) {
			if (null != pics && pics.length > 0) {
				CarsourceFile file = new CarsourceFile();
				file.setSourceid(id);
				file.setUnit(old.getUnit());
				file.setType(1);// 类型1车辆图片2配置图片3加装包
				file.setCreator(userInfo.getName());
				file.setCreatetime(now);
				for (int i = 0; i < pics.length; i++) {
					file.setPicurl(pics[i]);
					sourcefileMapper.insertSelective(file);
				}
				c.setCoverpic(pics[0]);
			}
		}
		// 处理车源图片
		else {
			if (null != pics && pics.length > 0) {// 新增的图片
				CarsourceFile file = new CarsourceFile();
				file.setSourceid(id);
				file.setUnit(old.getUnit());
				file.setType(1);// 类型1车辆图片2配置图片3加装包
				file.setCreator(userInfo.getName());
				file.setCreatetime(now);
				for (int i = 0; i < pics.length; i++) {
					file.setPicurl(pics[i]);
					sourcefileMapper.insertSelective(file);
				}
				// c1.setCoverpic(pics[0]);
			}
			if (null != picdeletes && picdeletes.length > 0) {// 删除的车源图片
				for (int i = 0; i < picdeletes.length; i++) {
					sourcefileMapper.deleteByPrimaryKey(Integer.parseInt(picdeletes[i]));
				}
			}
			if (null != picedits && picedits.length > 0) {// 编辑的车源图片
				for (int i = 0; i < picedits.length; i++) {
					String s = picedits[i];
					String[] sz = s.split(";");
					if (sz.length == 2) {
						CarsourceFile file = new CarsourceFile();
						file.setId(Integer.parseInt(sz[0]));
						file.setPicurl(sz[1]);
						file.setUpdator(userInfo.getName());
						file.setUpdatetime(now);
						sourcefileMapper.updateByPrimaryKeySelective(file);
					} else if (sz.length == 3) {// 封面
						CarsourceFile file = new CarsourceFile();
						file.setId(Integer.parseInt(sz[0]));
						file.setPicurl(sz[2]);
						file.setUpdator(userInfo.getName());
						file.setUpdatetime(now);
						sourcefileMapper.updateByPrimaryKeySelective(file);
						c.setCoverpic(sz[2]);
					}
				}
			}
		}
		// 处理配置
		if (StringUtils.isNotBlank(config)) {
			c.setConfig(config);// 逗号隔开的格式
			List<Map<String, String>> lst = new ArrayList<Map<String, String>>();
			// 组装json字符串
			if (StringUtils.isNotBlank(configk) && StringUtils.isNotBlank(configv)) {
				JSONArray array = JSONArray.fromObject(configk);
				JSONArray array1 = JSONArray.fromObject(configv);
				if (array.size() == array1.size()) {
					for (int i = 0; i < array.size(); i++) {
						String k = array.getString(i);
						Map<String, String> mmp = new HashMap<String, String>();
						mmp.put("k", k);
						mmp.put("v", array1.getString(i));
						lst.add(mmp);
						c.setVersion(k);
					}
					c.setConfigv(com.alibaba.fastjson.JSONObject.toJSONString(lst));
				}
			}
		}
		// 处理加装包
		// BigDecimal total = BigDecimal.ZERO;// 总加装费
		// BigDecimal decorate = BigDecimal.ZERO;// 加装费
		if (decorates != null && decorates.length() > 0) {// 新增加装包

			JSONArray array = JSONArray.fromObject(decorates);
			for (int i = 0; i < array.size(); i++) {

				CarsourceFile file = new CarsourceFile();
				file.setSourceid(id);
				file.setUnit(old.getUnit());
				file.setType(3);// 类型1车辆图片2配置图片3加装包
				file.setCreator(userInfo.getName());
				file.setCreatetime(now);
				JSONObject object = array.getJSONObject(i);
				file.setTitle(object.getString("name"));
				file.setDetail(object.getString("con"));
				String price = object.getString("price");
				if (StringUtils.isNotBlank(price)) {
					file.setPrice(new BigDecimal(price));
				}
				file.setPicurl(object.getString("pic"));
				String deflt = object.getString("ck");
				if (StringUtils.isNotBlank(deflt)) {
					file.setDeflt(Integer.parseInt(deflt));// default是否是默认配置 1是2不是
				}

				sourcefileMapper.insertSelective(file);
			}
		}
		// 删除的加装包
		if (jzdeletes != null && jzdeletes.length > 0) {
			for (int i = 0; i < jzdeletes.length; i++) {
				sourcefileMapper.deleteByPrimaryKey(Integer.parseInt(jzdeletes[i]));
			}
		}
		// 修改的加装包
		if (jzedits != null && jzedits.length() > 0) {
			JSONArray array = JSONArray.fromObject(jzedits);
			for (int i = 0; i < array.size(); i++) {
				CarsourceFile file = new CarsourceFile();

				JSONObject object = JSONObject.fromObject(array.get(i));
				file.setId(object.getInt("id"));
				file.setTitle(object.getString("name"));
				file.setDetail(object.getString("con"));
				String price = object.getString("price");
				if (StringUtils.isNotBlank(price)) {
					file.setPrice(new BigDecimal(price));
				}
				file.setPicurl(object.getString("pic"));
				if (StringUtils.isBlank(file.getPicurl())) {
					file.setPicurl(null);
				}
				String deflt = object.getString("ck");
				if (StringUtils.isNotBlank(deflt)) {
					file.setDeflt(Integer.parseInt(deflt));// default是否是默认配置 1是2不是
				}
				file.setUpdator(userInfo.getName());
				file.setUpdatetime(now);
				sourcefileMapper.updateByPrimaryKeySelective(file);
			}
		}
		// 处理颜色、价格
		// 新增
		if (StringUtils.isNotBlank(colors)) {
			JSONArray array = JSONArray.fromObject(colors);
			for (int i = 0; i < array.size(); i++) {
				CarsourceFile file = new CarsourceFile();
				file.setSourceid(id);
				file.setUnit(old.getUnit());
				file.setType(4);// 类型1车辆图片2配置图片3加装包4颜色价格
				file.setCreator(userInfo.getName());
				file.setCreatetime(now);
				JSONObject object = array.getJSONObject(i);
				file.setTitle(object.getString("outcolor"));
				file.setDetail(object.getString("incolor"));
				String price = object.getString("price");
				if (StringUtils.isNotBlank(price)) {
					file.setPrice(new BigDecimal(price));
				}
				sourcefileMapper.insertSelective(file);
			}
		}
		// 删除
		if (colordeletes != null && colordeletes.length > 0) {
			for (int i = 0; i < colordeletes.length; i++) {
				sourcefileMapper.deleteByPrimaryKey(Integer.parseInt(colordeletes[i]));
			}
		}
		// 修改
		if (coloredits != null && coloredits.length() > 0) {
			JSONArray array = JSONArray.fromObject(coloredits);
			for (int i = 0; i < array.size(); i++) {
				CarsourceFile file = new CarsourceFile();

				JSONObject object = JSONObject.fromObject(array.get(i));
				file.setId(object.getInt("id"));
				file.setTitle(object.getString("outcolor"));
				file.setDetail(object.getString("incolor"));
				String price = object.getString("price");
				if (StringUtils.isNotBlank(price)) {
					file.setPrice(new BigDecimal(price));
				}
				file.setUpdator(userInfo.getName());
				file.setUpdatetime(now);
				sourcefileMapper.updateByPrimaryKeySelective(file);
			}
		}
		// 处理税率（在修改时计算税率）
		Integer type = c.getType();// 1美产2非美产
		Integer disp = c.getDisplacement();
		if (type != null && disp != null) {
			// int t = type.intValue();
			// int cc = disp.intValue();
			// double tax = getRateByTypeCc(t, cc);
			// c.setTax(new BigDecimal(tax + ""));
			c.setTax(getRateByTypeCc(type, disp));
			// 若有开证价 则先把关税算出来
			BigDecimal issuingprice = old.getIssuingprice();
			if (issuingprice != null) {
				BigDecimal duties = issuingprice.multiply(c.getTax()).setScale(2, BigDecimal.ROUND_HALF_UP);
				c.setDuties(duties);
			}
		}
		CarsourceFile record = new CarsourceFile();
		record.setType(3);// 加装包
		record.setSourceid(id);
		List<CarsourceFile> sFiles = sourcefileMapper.selectByCriteria(record);
		if (sFiles.size() > 0) {
			BigDecimal total = BigDecimal.ZERO;// 总加装费
			BigDecimal decorate = BigDecimal.ZERO;// 加装费
			for (int i = 0; i < sFiles.size(); i++) {
				if (sFiles.get(i).getPrice() != null) {
					Integer deflt = sFiles.get(i).getDeflt();
					if (deflt == 1) {
						decorate = decorate.add(sFiles.get(i).getPrice());
					}
					total = total.add(sFiles.get(i).getPrice());
				}
			}
			c.setTotaldecorateprice(total);
			c.setDecorateprice(decorate);
		} else {
			c.setTotaldecorateprice(BigDecimal.ZERO);
			c.setDecorateprice(BigDecimal.ZERO);
		}

		carsourceMapper.updateByPrimaryKeySelectiveForEdit(c);
		reMap.put("status", true);
		return reMap;
	}

	/**
	 * 
	 * <p>根据美产与否、排量获取利率</p>
	 * @param t //1美产2非美产
	 * @param cc 排量
	 * @return
	 * @author wangzh
	 */
	public BigDecimal getRateByTypeCc(Integer t, Integer cc) {
		// if (2 == t) {
		// if (cc < 1000)
		// return 0.3475;
		// else if (cc < 1500)
		// return 0.3753;
		// else if (cc < 2000)
		// return 0.4042;
		// else if (cc < 2500)
		// return 0.4659;
		// else if (cc < 3000)
		// return 0.5159;
		// else if (cc < 4000)
		// return 0.7787;
		// else if (cc >= 4000)
		// return 1.2233;

		// } else if (1 == t) {
		// if (cc < 1000)
		// return 0.6404;
		// else if (cc < 1500)
		// return 0.6742;
		// else if (cc < 2000)
		// return 0.7095;
		// else if (cc < 2500)
		// return 0.7846;
		// else if (cc < 3000)
		// return 0.8455;
		// else if (cc < 4000)
		// return 1.1653;
		// else if (cc >= 4000)
		// return 1.7067;
		// }
		MallDisplacementTax dt = new MallDisplacementTax();
		dt.setType(t);
		dt.setStartdisplacement(cc);
		List<MallDisplacementTax> tList = displacementTaxMapper.selectRangeByCriteria(dt);
		if (tList != null && tList.size() > 0) {
			return tList.get(0).getTax();
		}
		return null;
	}

	/**
	 * 
	 * <p>编辑页面</p>
	 * @param map
	 * @param id
	 * @author wangzh
	 */
	public void mallcarsourceedit(ModelMap map, Integer id) {
		Carsource source = carsourceMapper.selectByPrimaryKey(id);
		if (source == null) {
			throw new PortalBizCheckedException("该车源已不存在，请确认");
		}
		jndSite site = siteMapper.selectByPrimaryKey(source.getAreaid());
		if (site != null) {
			map.put("site", site);
		}
		String model = source.getModel();// 型号
		List<Map<String, Object>> vs = modelMapper.queryVersion(model);
		CarsourceFile f1 = new CarsourceFile();
		f1.setSourceid(id);
		f1.setType(1);// pic
		List<CarsourceFile> pics = sourcefileMapper.selectByCriteria(f1);
		f1.setType(3);// decorate
		List<CarsourceFile> ds = sourcefileMapper.selectByCriteria(f1);
		f1.setType(4);// 颜色、价格
		List<CarsourceFile> colors = sourcefileMapper.selectByCriteria(f1);
		String configv = source.getConfigv();
		List<Map<String, String>> ls = null;
		if (StringUtils.isNotBlank(configv)) {
			JSONArray array = JSONArray.fromObject(configv);
			ls = new ArrayList<Map<String, String>>();
			Map<String, String> map2 = null;
			int siz = array.size();
			for (int i = 0; i < siz; i++) {
				JSONObject object = JSONObject.fromObject(array.get(i));
				map2 = new HashMap<String, String>();
				map2.put("k", object.getString("k"));
				map2.put("v", object.getString("v"));
				ls.add(map2);
			}
		}
		map.addAttribute("cs", source).addAttribute("vs", vs).addAttribute("cps", getAllIssCops(true)).addAttribute("pics", pics).addAttribute("ds", ds)
				.addAttribute("colors", colors);
		if (ls != null) {
			map.addAttribute("cos", ls);
		}
	}

	/**
	 * 
	 * <p>车源审核保存</p>
	 * @param id
	 * @param issuingprice
	 * @author wangzh
	 */
	public void carsourceauditsave(Integer id, BigDecimal issuingprice) {
		// 若有开证价 则先把关税算出来
		if (issuingprice != null) {
			Carsource old = carsourceMapper.selectByPrimaryKey(id);
			BigDecimal duties = issuingprice.multiply(old.getTax());// .setScale(2,
																	// BigDecimal.ROUND_HALF_UP);
			// *汇率
			jndSite site = siteMapper.selectByPrimaryKey(old.getAreaid());
			if (site.getExchangerate() != null) {
				duties = duties.multiply(site.getExchangerate());
			}
			Carsource update = new Carsource();
			update.setId(id);
			update.setIssuingprice(issuingprice);
			update.setDuties(duties.setScale(2, BigDecimal.ROUND_HALF_UP));
			update.setAuditstatus(1);// 已审核
			UserDTO userInfo = SecurityHelper.getAdminUserInfo();
			update.setUpdator1(userInfo.getName());
			update.setUpdatetime1(new Date());
			carsourceMapper.updateByPrimaryKeySelective(update);
		}
	}

	/**
	 * 
	 * <p>返回  对象list </p>
	 * @param Carsource
	 * @author liliang
	 */
	public List<Carsource> getListByParam(Carsource record) {
		List<Carsource> carsourceList = carsourceMapper.selectByCriteria(record);
		return carsourceList;
	}

	/**
	 * 
	 * <p>商城审批流程时获取车辆审核内容</p>
	 * @param map
	 * @param sku
	 * @author wangzh
	 */
	public String contractordercaraudit(ModelMap map, String id) {
		UserDTO userInfo = SecurityHelper.getAdminUserInfo();
		map.put("name", userInfo.getName());// 操作人

		// JndCarorderDetail querycar = new JndCarorderDetail();
		// querycar.setSkucode(skucode);
		// List<JndCarorderDetail> carorderDetails =
		// jndCarorderDetailMapper.selectByCriteria(querycar);
		JndCarorderDetail car = jndCarorderDetailMapper.selectByPrimaryKey(id);
		// Date time = new Date();
		// SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
		// map.put("time", sdf.format(time));// 操作时间
		// if (carorderDetails.size() > 0) {
		if (car != null) {
			// JndCarorderDetail car = carorderDetails.get(0);
			map.addAttribute("car", car);
			Integer sourceid = car.getSourceid();
			Carsource source = carsourceMapper.selectByPrimaryKey(sourceid);
			jndSite site = null;
			if (source != null) {
				map.addAttribute("source", source);
				site = siteMapper.selectByPrimaryKey(source.getAreaid());
				map.put("site", site);// 地区
				CarsourceFile file = new CarsourceFile();
				file.setSourceid(sourceid);
				file.setType(1);// 图片
				List<CarsourceFile> fs = sourcefileMapper.selectByCriteria(file);
				map.addAttribute("pics", fs);
			}
			String code = car.getSubordercode();
			MallOrderDetail mod = new MallOrderDetail();
			mod.setCode(code);
			List<MallOrderDetail> modlst = orderDetailMapper.selectByCriteria(mod);
			if (modlst.size() > 0) {
				MallOrderDetail order = modlst.get(0);
				map.addAttribute("order", order);
				// 获取车辆状态
				Integer status = car.getVerifystatus();
				/**
				 * xhl
				 * 
				 */
				boolean hasflows = true;
				if (status == null) {
					// 定金 车身价+加装）*15%或20%（根据美规非美规）
					BigDecimal downpay = (order.getCarprice().add(order.getDecorateprice()).subtract(order.getFavor())).multiply(source.getDownpayscale())
							.divide(new BigDecimal(100), 2, RoundingMode.HALF_UP);
					map.put("downpay", downpay);// 定金
					hasflows = false;
				} else if (status.intValue() == 1) {
					// 预计支付当地杂费：佣金+杂费+保险+短驳费+服务费
					BigDecimal incidentals = order.getCmsn().add(order.getOversea4sprice()).add(order.getOverseashotinsurance()).add(order.getOverseadrayage())
							.add(order.getServicecharge()).setScale(2, RoundingMode.HALF_UP);
					map.put("incidentals", incidentals);// 杂费
				} else if (status.intValue() == 2) {
					// 海运费：海运费+海运保险
					/*
					 * BigDecimal oceanFreight =
					 * order.getSeatransportprice().add(order.getSeatransportinsurance
					 * ()).setScale(2, RoundingMode.HALF_UP); map.put("oceanFreight", oceanFreight);
					 */// 海运费
				}
				// if (status != null) {
				else if (4 == status.intValue()) {// 到尾款审核
					// 获取预计支付尾款：80%或85%（车身价+加装-优惠）外汇+利息（如果下单客户为采购金融账号，则不计利息）+关税
					// String scale = source.getDownpayscale();
					// if (StringUtils.isNotBlank(scale)) {
					// scale = scale.substring(0, scale.length() - 1);
					BigDecimal downpay = source.getDownpayscale();
					BigDecimal remain = new BigDecimal("100").subtract(downpay).divide(new BigDecimal("100"), 2, RoundingMode.HALF_UP);
					// BigDecimal carprice=source.getCarprice();//车身价
					BigDecimal carprice = order.getCarprice();// 车身价
					BigDecimal decorate = order.getDecorateprice();// 客户实际选择的加装
					BigDecimal favor = order.getFavor();
					BigDecimal total = BigDecimal.ZERO;
					if (carprice != null) {
						total = total.add(carprice);
					}
					if (decorate != null) {
						total = total.add(decorate);
					}
					if (favor != null) {
						total = total.subtract(favor);
					}
					total = total.multiply(remain);
					// 获取外汇
					/*
					 * Integer aid = order.getAreaid(); jndSite site =
					 * siteMapper.selectByPrimaryKey(aid);
					 */
					if (site != null) {
						BigDecimal rate = site.getExchangerate();
						if (rate != null) {
							total = total.multiply(rate);
						}
					}
					if (order.getDuties() != null) {
						total = total.add(order.getDuties());
					}
					map.addAttribute("remainprice", total.setScale(2, BigDecimal.ROUND_HALF_UP));
					String username = order.getUsername();
					mallUser user = new mallUser();
					user.setUsername(username);
					List<mallUser> users = mallUserMapper.selectByCriteria(user);
					if (users.size() > 0) {
						mallUser u = users.get(0);
						Integer ut = u.getUsertype();
						if (ut != null && ut.intValue() == 1) {// 普通用户 算利息
							map.addAttribute("interest", 1);
						}
					}
					// }
				} else if (5 == status.intValue()) {// 全部审核完毕
					// 显示流水步骤
				}
				if (hasflows) {
					MallCarorderDetail flow = new MallCarorderDetail();
					flow.setSkucode(car.getSkucode());
					List<MallCarorderDetail> flows = mallCarorderDetailMapper.selectByCriteria(flow);
					if (flows.size() > 0) {
						Collections.sort(flows);
					}
					map.put("steps", flows);
				}
				// }
			}
		}
		return "mall/stepaudit";
	}

	/**
	 * 
	 * <p>车辆审核步骤</p>
	 * @param id
	 * @param status
	 * @param realmoney
	 * @param currency
	 * @param rate
	 * @author wangzh
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void contractordercarsave(String id, String status, BigDecimal realmoney, String currency, String rate) {
		JndCarorderDetail car = jndCarorderDetailMapper.selectByPrimaryKey(id);
		if (car != null) {
			MallOrderDetail up = new MallOrderDetail();
			JndCarorderDetail temp = new JndCarorderDetail();
			temp.setId(id);
			MallCarorderDetail flow = null;// new MallCarorderDetail();
			MallOrderDetail so = new MallOrderDetail();
			so.setCode(car.getSubordercode());
			List<MallOrderDetail> suborderLst = orderDetailMapper.selectByCriteria(so);
			if (suborderLst.size() > 0) {
				so = suborderLst.get(0);
			} else {
				throw new PortalBizCheckedException("该车辆所属的订单缺失，请联系管理员！");
			}
			up.setId(so.getId());
			Integer cs = so.getCarstatus();

			Integer is = car.getVerifystatus();
			if (StringUtils.isBlank(status) && is == null) {// 定金待支付
				temp.setVerifystatus(1);// 下一步
				flow = getbaseflow(car, 1);// 获取基本流水
				flow.setReceivedmoney(realmoney);
				if (StringUtils.isNotBlank(rate)) {
					flow.setRate(rate);
				}
				flow.setCurrency(Integer.parseInt(currency));
				mallCarorderDetailMapper.insertSelective(flow);
				if (cs == null) {// 若目前订单状态未达到本步骤的值则更新
					up.setCarstatus(1);// 本步骤的值
				}
			} else if (StringUtils.isNotBlank(status) && is != null) {
				if ("1".equals(status) && is.intValue() == 1) {// 杂费待支付
					temp.setVerifystatus(2);// 下一步
					flow = getbaseflow(car, 2);// 获取基本流水
					flow.setReceivedmoney(realmoney);
					if (StringUtils.isNotBlank(rate)) {
						flow.setRate(rate);
					}
					flow.setCurrency(Integer.parseInt(currency));
					mallCarorderDetailMapper.insertSelective(flow);
					if (cs != null && cs.intValue() < 2) {// 若目前订单状态未达到本步骤的值则更新
						up.setCarstatus(2);// 本步骤的值
					}
				} else if ("2".equals(status) && is.intValue() == 2) {// 海运费待支付
					temp.setVerifystatus(3);// 下一步
					flow = getbaseflow(car, 3);// 获取基本流水
					flow.setReceivedmoney(realmoney);
					if (StringUtils.isNotBlank(rate)) {
						flow.setRate(rate);
					}
					flow.setCurrency(Integer.parseInt(currency));
					mallCarorderDetailMapper.insertSelective(flow);
					if (cs != null && cs.intValue() < 3) {// 若目前订单状态未达到本步骤的值则更新
						up.setCarstatus(3);// 本步骤的值
					}
				} else if ("3".equals(status) && is.intValue() == 3) {// 报关费待支付
					/*
					 * JndCarorderDetail temp = new JndCarorderDetail(); temp.setId(id);
					 */
					temp.setVerifystatus(4);// 下一步
					/* jndCarorderDetailMapper.updateByPrimaryKeySelective(temp); */// 更新支付状态
					/* MallCarorderDetail */flow = getbaseflow(car, 4);// 获取基本流水
					flow.setReceivedmoney(realmoney);// 每一步骤设置相关特点值
					mallCarorderDetailMapper.insertSelective(flow); // / 插入流水
					// 查询子订单
					/*
					 * MallOrderDetail suborder = new MallOrderDetail();
					 * suborder.setCode(car.getSubordercode()); List<MallOrderDetail> suborderLst =
					 * orderDetailMapper.selectByCriteria(suborder);
					 */
					/* MallOrderDetail so = suborderLst.get(0); */
					// 车辆状态
					/* Integer cs = so.getCarstatus(); */
					if (cs != null && cs.intValue() < 4) {// 若目前订单状态未达到本步骤的值则更新
						/*
						 * MallOrderDetail up = new MallOrderDetail(); up.setId(so.getId());
						 */
						up.setCarstatus(4);// 本步骤的值
						/* orderDetailMapper.updateByPrimaryKeySelective(up); */
					}
					// 订单状态 这里不更新该状态 因为现在这辆车还未走完 全部走完才更新为5
					// Integer orderstatus=so.getOrderstatus();
				} else if ("4".equals(status) && is.intValue() == 4) {// 尾款待支付
					/*
					 * JndCarorderDetail temp = new JndCarorderDetail(); temp.setId(id);
					 */
					temp.setVerifystatus(5);// 下一步
					// 商城第5步审核查看pro_car中是否有对应sku的车辆，若有则将其状态改为2商城已售
					String sss = car.getSkucode();
					Car procar = new Car();
					procar.setMallCarSkuCode(sss);
					List<Car> lstquerycar = carMapper.selectByCriteria(procar);
					if (lstquerycar.size() > 0) {
						procar.setMallCarSkuCode(null);
						procar.setId(lstquerycar.get(0).getId());
						procar.setMallCarStatus(2);// 商城已售
						carMapper.updateByPrimaryKeySelective(procar);
					}
					/* jndCarorderDetailMapper.updateByPrimaryKeySelective(temp); */// 更新支付状态
					/* MallCarorderDetail */flow = getbaseflow(car, 5);
					flow.setReceivedmoney(realmoney);// 每一步骤设置相关特点值
					mallCarorderDetailMapper.insertSelective(flow); // / 插入流水
					/*
					 * // 查询子订单 MallOrderDetail suborder = new MallOrderDetail();
					 * suborder.setCode(car.getSubordercode()); List<MallOrderDetail> suborderLst =
					 * orderDetailMapper.selectByCriteria(suborder);
					 */
					/* MallOrderDetail so = suborderLst.get(0); */
					// 车辆状态
					/* Integer cs = so.getCarstatus(); */
					if (cs != null && cs.intValue() < 5) {// 若目前订单状态未达到本步骤的值则更新
						/*
						 * MallOrderDetail up = new MallOrderDetail(); up.setId(so.getId());
						 */
						up.setCarstatus(5);// 本步骤的值
						/* orderDetailMapper.updateByPrimaryKeySelective(up); */
					}
					// 订单状态 这里根据是否全部车辆都走完5个步骤来更新订单状态
					Integer orderstatus = so.getOrderstatus();
					if (orderstatus != null) {
						if (orderstatus.intValue() == 5) {// 若已完成 则不必更新
							// do nothing
						} else if (orderstatus.intValue() == 3) {// 未完成
							// 判断是否所有的车都已走完
							List<Map<String, Object>> subordercarsmap = mallCarorderDetailMapper.selectForOrderstatus(car.getSubordercode());
							Integer num = so.getNum();// 子订单车辆数量
							if (null != num) {
								if (num.intValue() > subordercarsmap.size()) {// 走过流水的车小于子订单数
									// do nothing
								} else if (num.intValue() == subordercarsmap.size()) {// 相等时
									// 前面刚插入一条5的 现在刚好查出来
									boolean all = true;
									for (int i = 0, siz = subordercarsmap.size(); i < siz; i++) {
										Map<String, Object> item = subordercarsmap.get(i);
										Object oj = item.get("step");
										if (!"5".equals(oj.toString())) {
											all = false;
											break;
										}
									}
									if (all) {// 全部走完
										/*
										 * MallOrderDetail up = new MallOrderDetail();
										 * up.setId(so.getId());
										 */
										up.setOrderstatus(5);// 全完成
										/* orderDetailMapper.updateByPrimaryKeySelective(up); */
									}
								}
							}
						}
					}
				} else {
					throw new PortalBizCheckedException("车辆支付状态已改变，请返回列表查看");
				}
			} else {
				throw new PortalBizCheckedException("参数异常，请返回列表重新尝试");
			}
			// mallCarorderDetailMapper.insertSelective(flow);
			jndCarorderDetailMapper.updateByPrimaryKeySelective(temp);
			if (up.getCarstatus() != null || up.getOrderstatus() != null) {
				orderDetailMapper.updateByPrimaryKeySelective(up);
			}
		} else {
			throw new PortalBizCheckedException("车辆不存在，请联系管理员");
		}
	}

	/**
	 * 
	 * <p>获取基本流水</p>
	 * @param c
	 * @param status
	 * @return
	 * @author wangzh
	 */
	public MallCarorderDetail getbaseflow(JndCarorderDetail c, Integer status) {
		// 插入流水
		// 获取登陆用户
		UserDTO userInfo = SecurityHelper.getAdminUserInfo();
		if (userInfo == null) {
			throw new PortalBizCheckedException("未登录或登录超时！");
		}
		MallCarorderDetail flow = new MallCarorderDetail();
		flow.setId(UUIDTool.getUUID());
		flow.setSourceid(c.getSourceid());
		flow.setSkucode(c.getSkucode());
		flow.setOrdercode(c.getOrdercode());
		flow.setSubordercode(c.getSubordercode());
		flow.setContractcode(c.getContractcode());
		flow.setCreatetime(new Date());
		flow.setVerifier(userInfo.getName());
		flow.setVerifystatus(status);
		flow.setUnit(c.getUnit());
		return flow;
	}
}
