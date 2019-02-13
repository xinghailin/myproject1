/*******************************************************************************
 * Project   : car-ms
 * Class Name: com.yyq.car.portal.ms.app.service.AssetRepositoryService
 * Created By: wangzh 
 * Created on: 2017年5月16日 下午12:54:06
 * Copyright © 2013-2014 YYQ All rights reserved.
 ******************************************************************************/
package com.yyq.car.portal.ms.app.service;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.regex.Pattern;

import org.apache.commons.lang.StringUtils;
import org.apache.ibatis.session.RowBounds;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.snaker.engine.IOrderService;
import org.snaker.engine.ITaskService;
import org.snaker.engine.entity.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

import com.yyq.car.portal.common.constant.Constants;
import com.yyq.car.portal.common.constant.FileTypeEnum;
import com.yyq.car.portal.common.constant.MasterDataType;
import com.yyq.car.portal.common.dto.CarTypeinDto;
import com.yyq.car.portal.common.dto.ClientInfoDto;
import com.yyq.car.portal.common.dto.ContractDto;
import com.yyq.car.portal.common.dto.UserDTO;
import com.yyq.car.portal.common.dto.carProfitDto;
import com.yyq.car.portal.common.mapper.auth.RoleMapper;
import com.yyq.car.portal.common.mapper.auth.UserMapper;
import com.yyq.car.portal.common.mapper.biz.BizcontractMapper;
import com.yyq.car.portal.common.mapper.biz.BizzeropurchaseMapper;
import com.yyq.car.portal.common.mapper.cif.BuyerMapper;
import com.yyq.car.portal.common.mapper.cif.CommunicateMapper;
import com.yyq.car.portal.common.mapper.cif.contractMapper;
import com.yyq.car.portal.common.mapper.comm.AreapriceMapper;
import com.yyq.car.portal.common.mapper.comm.BrandMapper;
import com.yyq.car.portal.common.mapper.comm.PriceCityMapper;
import com.yyq.car.portal.common.mapper.comm.SequenceMapper;
import com.yyq.car.portal.common.mapper.jnd.JndcarMapper;
import com.yyq.car.portal.common.mapper.product.CarMapper;
import com.yyq.car.portal.common.mapper.product.OutRepositoryMapper;
import com.yyq.car.portal.common.mapper.product.ShopMapper;
import com.yyq.car.portal.common.mapper.product.StoreMapper;
import com.yyq.car.portal.common.model.auth.Role;
import com.yyq.car.portal.common.model.auth.User;
import com.yyq.car.portal.common.model.biz.Bizcontract;
import com.yyq.car.portal.common.model.biz.Bizzeropurchase;
import com.yyq.car.portal.common.model.cif.Buyer;
import com.yyq.car.portal.common.model.cif.Communicate;
import com.yyq.car.portal.common.model.cif.contract;
import com.yyq.car.portal.common.model.comm.Abrand;
import com.yyq.car.portal.common.model.comm.Areaprice;
import com.yyq.car.portal.common.model.comm.Brand;
import com.yyq.car.portal.common.model.comm.PriceCity;
import com.yyq.car.portal.common.model.jnd.Jndcar;
import com.yyq.car.portal.common.model.product.Car;
import com.yyq.car.portal.common.model.product.OutRepository;
import com.yyq.car.portal.common.model.product.Shop;
import com.yyq.car.portal.common.model.product.Store;
import com.yyq.car.portal.common.model.product.flowscheme;
import com.yyq.car.portal.common.service.ResourcePersistenceService;
import com.yyq.car.portal.common.service.security.SecurityHelper;
import com.yyq.car.portal.common.util.BeanCopierUtils;
import com.yyq.car.portal.common.util.CachFactory;
import com.yyq.car.portal.common.util.DateUtils;
import com.yyq.car.portal.ms.common.exception.PortalMsBizCheckedException;
import com.yyq.car.portal.ms.web.constant.CarOutStatusEnum;
import com.yyq.car.portal.ms.web.constant.CarSaleStatusEnum;
import com.yyq.car.portal.ms.web.constant.CarStatusEnum;
import com.yyq.car.portal.ms.web.constant.RoleEnum;
import com.yyq.car.portal.ms.web.constant.StoreStatusEnum;
import com.yyq.car.portal.ms.web.constant.WebConstants;
import com.yyq.snakerflow.portal.ms.web.controller.SnakerController;


/**
 * <P>资产库service</P>
 * @author wangzh 
 */
@Service
public class AssetRepositoryService extends SnakerController {

	// static {
	// ServiceContext.put(TaskAccessStrategy.class.getName(), GeneralAccessStrategy.class);
	// }
	// private final String FILE_PREFIX = "03102610";// cjzj字母表顺序
	@Autowired
	private CarMapper carMapper;

	@Autowired
	private StoreMapper storeMapper;

	@Autowired
	private ShopMapper shopMapper;

	@Autowired
	private BuyerMapper buyMapper;

	@Autowired
	private contractMapper contractMapper;

	@Autowired
	private ResourcePersistenceService resourceService;

	@Autowired
	private ITaskService taskService;

	@Autowired
	private RoleMapper roleMapper;

	@Autowired
	private IOrderService orderService;

	@Autowired
	private SequenceMapper sequenceMapper;

	@Autowired
	private OutRepositoryMapper outRepositoryMapper;

	@Autowired
	private CommunicateMapper communicateMapper;

	@Autowired
	private BrandAndModelService brandAndModelService;
	@Autowired
	private BrandMapper brandMapper;

	@Autowired
	private UserMapper userMapper;
	@Autowired
	private PriceCityMapper priceCityMapper;
	@Autowired
	private AreapriceMapper areapriceMapper;

	@Autowired
	private JndcarMapper jndcarMapper;

	@Autowired
	BizzeropurchaseMapper zeropurchaseMapper;

	@Autowired
	BizcontractMapper bizcontractMapper;
	@Autowired
	SellContractService sellContractService;

	// private byte[] outRepLock = new byte[0];// 购车出库锁

	public void addAreaPrices(Areaprice areaprice) {
		areapriceMapper.insertSelective(areaprice);
	}

	/**
	 * 计算利润
	 * <p>TODO</p>
	 * @param profit
	 * @param pageStart
	 * @param pageSize
	 * @return
	 * @author mjy
	 */
 
	public List<carProfitDto> countProfit(carProfitDto profit) {

		return carMapper.statisProfit(profit);
	}

	/**
	 * 根据sequence表中的id选择下一个主键
	 * <p>TODO</p>
	 * @param code
	 * @return
	 * @author wangzh
	 */
	public Integer querySequenceValue(Integer code) {
		return sequenceMapper.selectSequeceValueByCode(code);
	}

	/**
	 * 校验车辆参数唯一性
	 * <p>TODO</p>
	 * @param param
	 * @param type
	 * @return
	 * @author wangzh
	 */
	public boolean carParamCheck(String param, String type, String id) {
		Car car = new Car();
		boolean flag = true;
		if ("1".equals(type)) {// 发动机号
			if (StringUtils.isNotBlank(param)) {
				car.setEngineNum(param);
				if (StringUtils.isNotBlank(id))
					car.setId(Integer.parseInt(id));
				int count = carMapper.countByParam(car);
				if (count > 0)
					flag = false;
			}
		} else if ("2".equals(type)) {// 车架号
			if (StringUtils.isNotBlank(param)) {
				car.setVin(param);
				if (StringUtils.isNotBlank(id))
					car.setId(Integer.parseInt(id));
				int count = carMapper.countByParam(car);
				if (count > 0)
					flag = false;
			}
		}
		return flag;
	}

	/**
	 * <p>realsale修改检查发动机号</p>
	 * @param engineNum 发动机号
	 * @param vin 车架号
	 * @return
	 * @author wangzh
	 */
	public boolean carEngineNumCheck(String engineNum, String vin) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("engineNum", engineNum);
		map.put("vin", vin);
		boolean flag = true;
		int count = carMapper.countEngineByVin(map);
		if (count > 0)
			flag = false;
		return flag;
	}

	/**
	 * 通过主键获取car
	 * <p>TODO</p>
	 * @param id
	 * @return
	 * @author wangzh
	 */
	public Car getCarById(Integer id) {
		return carMapper.selectByPrimaryKey(id);
	}

	/**
	 * 根据用户ID查询其拥有的角色
	 * @param userId
	 * @return
	 */
	public List<Role> getRolesByUserId(Integer userId) {
		return roleMapper.selectByUserId(userId);
	}

	/**
	 * 查询所有仓库
	 * <p>TODO</p>
	 * @return
	 * @author wangzh
	 */
	public List<Store> queryAllStore() {
		return storeMapper.cStoreid();
	}

	/**
	 * 查询所有车辆所在地
	 * @return
	 */
	public List<Car> queryCarAddress() {
		return carMapper.queryCarAddress();

	}

	/**
	 * 查询单个仓库
	 * @param id
	 * @return
	 */
	public Store queryStore(int id) {
		return storeMapper.selectByPrimaryKey(id);

	}

	/**
	 * 查询拥有门店管理权限的账户
	 * @return
	 */
	public List<User> queryName() {
		return userMapper.queryName();

	}

	/**
	 * 根据主键查询仓库
	 * <p>TODO</p>
	 * @return
	 * @author wangzh
	 */
	public Store queryStoreById(Integer id) {
		return storeMapper.selectByPrimaryKey(id);
	}

	/**
	 * 根据主键查询门店
	 * <p>TODO</p>
	 * @param id
	 * @return
	 * @author wangzh
	 */
	public Shop queryShopById(Integer id) {
		return shopMapper.selectByPrimaryKey(id);
	}

	/**
	 * <p>查询所有门店</p>
	 * @return
	 * @author wangzh
	 */
	public List<Shop> queryAllShop() {
		return shopMapper.selectByCriteriaExceptMc();
	}

	/**
	 * 保存录入的车辆
	 * <p>TODO</p>
	 * @author wangzh
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void saveCarTypein(CarTypeinDto dto) throws IOException {
		Car car = new Car();
		// BeanCopierUtils.copyProperties(dto, car);
		car.setCreateTime(new Date());// 记录创建时间
		car.setIden1(resourceService.uploadFileProcessStr(dto.getIden1(), FileTypeEnum.CARIDENTIFY));
		car.setIden2(resourceService.uploadFileProcessStr(dto.getIden2(), FileTypeEnum.CARIDENTIFY));
		car.setIden3(resourceService.uploadFileProcessStr(dto.getIden3(), FileTypeEnum.CARIDENTIFY));
		car.setIden5(resourceService.uploadFileProcessStr(dto.getIden5(), FileTypeEnum.CARIDENTIFY));
		car.setIden4(resourceService.uploadFileProcessStr(dto.getIden4(), FileTypeEnum.CARIDENTIFY));
		Map<String, Map<String, Object>> map = new HashMap<String, Map<String, Object>>();
		if (StringUtils.isNotBlank(car.getIden1())) {
			Map<String, Object> tMap = new HashMap<String, Object>();
			tMap.put("is", dto.getIden1().getInputStream());
			tMap.put("size", dto.getIden1().getSize());
			map.put(car.getIden1(), tMap);
		}
		if (StringUtils.isNotBlank(car.getIden2())) {
			Map<String, Object> tMap = new HashMap<String, Object>();
			tMap.put("is", dto.getIden2().getInputStream());
			tMap.put("size", dto.getIden2().getSize());
			map.put(car.getIden2(), tMap);
		}
		if (StringUtils.isNotBlank(car.getIden3())) {
			Map<String, Object> tMap = new HashMap<String, Object>();
			tMap.put("is", dto.getIden3().getInputStream());
			tMap.put("size", dto.getIden3().getSize());
			map.put(car.getIden3(), tMap);
		}
		if (StringUtils.isNotBlank(car.getIden5())) {
			Map<String, Object> tMap = new HashMap<String, Object>();
			tMap.put("is", dto.getIden5().getInputStream());
			tMap.put("size", dto.getIden5().getSize());
			map.put(car.getIden5(), tMap);
		}
		if (StringUtils.isNotBlank(car.getIden4())) {
			Map<String, Object> tMap = new HashMap<String, Object>();
			tMap.put("is", dto.getIden4().getInputStream());
			tMap.put("size", dto.getIden4().getSize());
			map.put(car.getIden4(), tMap);
		}
		if (map.entrySet().size() > 0) {
			resourceService.asyncSaveFiles(map, true);
		}
		car.setEngineNum(dto.getEngineNum());
		car.setVin(dto.getVin());
		car.setBrand(dto.getBrand());
		car.setModel(dto.getModel());
		car.setVersion(dto.getVersion());
		car.setLenWidHei(dto.getLenWidHei());
		car.setRealSale(dto.getRealSale());
		car.setBuyerName(dto.getBuyerName());
		if (StringUtils.isNotBlank(dto.getLeaveFactoryTime())) {
			car.setLeaveFactoryTime(DateUtils.parse(dto.getLeaveFactoryTime(), DateUtils.DEFAULT_DATE_FORMAT_DEFAULT));
		}
		if (StringUtils.isNotBlank(dto.getPurchaseTime())) {
			car.setPurchaseTime(DateUtils.parse(dto.getPurchaseTime(), DateUtils.DEFAULT_DATE_FORMAT_DEFAULT));
		}
		car.setDisplacement(dto.getDisplacement());
		car.setOilWear(dto.getOilWear());
		car.setDischarge(dto.getDischarge());
		car.setWeight(dto.getWeight());
		car.setLevel(dto.getLevel());
		car.setGearbox(dto.getGearbox());
		// car.setEnergyType(dto.getEnergyType());
		car.setOutlookColor(dto.getOutlookColor());
		car.setInnerColor(dto.getInnerColor());
		car.setConfig(dto.getConfig());// 配置
		car.setBuyName(dto.getBuyName());
		car.setDecorate(dto.getDecorate());
		car.setPurchasesettlementprice(dto.getPurchasesettlementprice());// 采购结算价
		if (StringUtils.isNotBlank(dto.getBuyPrice()))// 采购价
			car.setBuyPrice(new BigDecimal(dto.getBuyPrice()));
		if (StringUtils.isNotBlank(dto.getSellerprice()))// 销售价
			car.setSellerprice(new BigDecimal(dto.getSellerprice()));
		if (StringUtils.isNotBlank(dto.getLowPrice()))
			car.setLowPrice(new BigDecimal(dto.getLowPrice()));// 最低销售价
		if (StringUtils.isNotBlank(dto.getTypeinsettleprice()))
			car.setTypeinsettleprice(new BigDecimal(dto.getTypeinsettleprice()));// 车辆录入结算价
		// if (dto.getEnergyType().substring(0, 1).equals("s")) {// 现在地址是仓库
		// Store store =
		// storeMapper.selectByPrimaryKey(Integer.parseInt(dto.getEnergyType().substring(1)));
		// car.setStoreId(Integer.parseInt(dto.getEnergyType().substring(1)));
		// car.setCarAddress(store.getAddress());
		// car.setStoreType(2);// 仓库存储
		// }
		// if (dto.getEnergyType().startsWith("h")) {// 现在门店所在地
		// Shop shop =
		// shopMapper.selectByPrimaryKey(Integer.parseInt(dto.getEnergyType().substring(1)));
		// car.setShopId(Integer.parseInt(dto.getEnergyType().substring(1)));
		// car.setCarAddress(shop.getAddress());
		// car.setStoreType(1);// 门店存储
		// }

		Store store = storeMapper.selectByPrimaryKey(Integer.parseInt(dto.getAddress()));
		car.setStoreId(Integer.parseInt(dto.getAddress()));
		car.setCarAddress(store.getAddress());
		car.setStoreType(2);// 仓库存储

		car.setAddress(dto.getAddress());// 原始仓库地址
		car.setIsStored(StoreStatusEnum.AUDIT.getValue());
		// 加入创建者
		UserDTO userInfo = SecurityHelper.getAdminUserInfo();
		// if (userInfo != null)
		car.setCreatorid(userInfo.getId());

		// 加入更新零采状态 edit at 2018年5月23日15:22:12 by wangzh
		if (dto.getZeroid() != null) {
			Bizzeropurchase bizzeropurchase = new Bizzeropurchase();
			bizzeropurchase.setId(dto.getZeroid());
			bizzeropurchase.setStatus("2");// 2车辆部门已将零采车辆插入pro_car表
			zeropurchaseMapper.updateByPrimaryKeySelective(bizzeropurchase);
			car.setZeropurid(dto.getZeroid());
		}

		carMapper.insertSelective(car);
		flowscheme flow = new flowscheme();
		flow.setTaskid(car.getId());
		flow.setTaskname("录入的车辆保存");
		flow.setTasktype1(1);
		sellContractService.insertSelective(flow);
	}

	/**
	 * 修改保存
	 * <p>TODO</p>
	 * @param dto
	 * @throws IOException
	 * @author wangzh
	 */
	public void saveCarEdit(CarTypeinDto dto) throws IOException {
		Car car = new Car();
		// BeanCopierUtils.copyProperties(dto, car);
		car.setId(dto.getId());
		car.setIden1(resourceService.uploadFileProcessStr(dto.getIden1(), FileTypeEnum.CARIDENTIFY));
		car.setIden2(resourceService.uploadFileProcessStr(dto.getIden2(), FileTypeEnum.CARIDENTIFY));
		car.setIden3(resourceService.uploadFileProcessStr(dto.getIden3(), FileTypeEnum.CARIDENTIFY));
		car.setIden4(resourceService.uploadFileProcessStr(dto.getIden4(), FileTypeEnum.CARIDENTIFY));
		car.setIden5(resourceService.uploadFileProcessStr(dto.getIden5(), FileTypeEnum.CARIDENTIFY));
		// Map<String, MultipartFile> map = new HashMap<String, MultipartFile>();
		// if (StringUtils.isNotBlank(car.getIden1())) {
		// map.put(car.getIden1(), dto.getIden1());
		// }
		// if (StringUtils.isNotBlank(car.getIden2())) {
		// map.put(car.getIden2(), dto.getIden2());
		// }
		// if (StringUtils.isNotBlank(car.getIden3())) {
		// map.put(car.getIden3(), dto.getIden3());
		// }
		// if (StringUtils.isNotBlank(car.getIden4())) {
		// map.put(car.getIden4(), dto.getIden4());
		// }
		Map<String, Map<String, Object>> map = new HashMap<String, Map<String, Object>>();
		if (StringUtils.isNotBlank(car.getIden1())) {
			Map<String, Object> tMap = new HashMap<String, Object>();
			tMap.put("is", dto.getIden1().getInputStream());
			tMap.put("size", dto.getIden1().getSize());
			map.put(car.getIden1(), tMap);
		}
		if (StringUtils.isNotBlank(car.getIden2())) {
			Map<String, Object> tMap = new HashMap<String, Object>();
			tMap.put("is", dto.getIden2().getInputStream());
			tMap.put("size", dto.getIden2().getSize());
			map.put(car.getIden2(), tMap);
		}
		if (StringUtils.isNotBlank(car.getIden3())) {
			Map<String, Object> tMap = new HashMap<String, Object>();
			tMap.put("is", dto.getIden3().getInputStream());
			tMap.put("size", dto.getIden3().getSize());
			map.put(car.getIden3(), tMap);
		}
		if (StringUtils.isNotBlank(car.getIden4())) {
			Map<String, Object> tMap = new HashMap<String, Object>();
			tMap.put("is", dto.getIden4().getInputStream());
			tMap.put("size", dto.getIden4().getSize());
			map.put(car.getIden4(), tMap);
		}
		if (StringUtils.isNotBlank(car.getIden5())) {
			Map<String, Object> tMap = new HashMap<String, Object>();
			tMap.put("is", dto.getIden5().getInputStream());
			tMap.put("size", dto.getIden5().getSize());
			map.put(car.getIden5(), tMap);
		}
		if (map.entrySet().size() > 0) {
			resourceService.asyncSaveFiles(map, true);
		}
		car.setEngineNum(dto.getEngineNum());
		car.setVin(dto.getVin());
		car.setBrand(dto.getBrand());
		car.setModel(dto.getModel());
		car.setVersion(dto.getVersion());
		car.setBuyerName(dto.getBuyerName());
		if (StringUtils.isNotBlank(dto.getLeaveFactoryTime()))
			car.setLeaveFactoryTime(DateUtils.parse(dto.getLeaveFactoryTime(), DateUtils.DEFAULT_DATE_FORMAT_DEFAULT));
		else {
			car.setLeaveFactoryTime(null);
		}
		if (StringUtils.isNotBlank(dto.getPurchaseTime()))
			car.setPurchaseTime(DateUtils.parse(dto.getPurchaseTime(), DateUtils.DEFAULT_DATE_FORMAT_DEFAULT));
		else {
			car.setPurchaseTime(null);
		}
		car.setOutlookColor(dto.getOutlookColor());
		car.setInnerColor(dto.getInnerColor());
		car.setConfig(dto.getConfig());// 配置
		car.setBuyName(dto.getBuyName());
		car.setDecorate(dto.getDecorate());
		car.setRealSale(dto.getRealSale());
		car.setPurchasesettlementprice(dto.getPurchasesettlementprice());
		if (StringUtils.isNotBlank(dto.getBuyPrice()))// 采购价
			car.setBuyPrice(new BigDecimal(dto.getBuyPrice()));
		else
			car.setBuyPrice(null);
		if (StringUtils.isNotBlank(dto.getLowPrice()))
			car.setLowPrice(new BigDecimal(dto.getLowPrice()));// 成本价
		else
			car.setLowPrice(null);
		if (StringUtils.isNotBlank(dto.getSellerprice()))
			car.setSellerprice(new BigDecimal(dto.getSellerprice()));// 销售价
		else
			car.setSellerprice(null);
		if (StringUtils.isNotBlank(dto.getTypeinsettleprice()))
			car.setTypeinsettleprice(new BigDecimal(dto.getTypeinsettleprice()));// 车辆录入结算价
		else
			car.setTypeinsettleprice(null);
		if (StringUtils.isNotBlank(dto.getAddress())) {
			Car tempcar = carMapper.selectByPrimaryKey(dto.getId());
			if (tempcar != null && CarStatusEnum.INSTORE.getValue().equals(tempcar.getStatus())) {// 如果还在仓库中
																									// 则可以修改仓库地址
																									// if
																									// (tempcar.getStoreId()
																									// !=
																									// null)
																									// {
				/*
				 * if (tempcar.getStoreId().toString().equals(dto.getAddress())) {// 仓库地址未变动 } else
				 * {// 变动了
				 */// / car.setStoreId(Integer.parseInt(dto.getAddress()));// 仓库id
				Store store = storeMapper.selectByPrimaryKey(Integer.parseInt(dto.getAddress()));
				if (store != null && StringUtils.isNotBlank(store.getAddress())) {
					car.setCarAddress(store.getAddress());
					//
					car.setStoreId(Integer.parseInt(dto.getAddress()));

				}
			}
		}
		carMapper.updateByPrimaryKeySelectiveForEdit(car);
	}

	/**
	 * 分页查询录入车辆列表和总数
	 * <p>TODO</p>
	 * @param dto
	 * @param start
	 * @param pageSize
	 * @return
	 * @author wangzh
	 */
	public Map<String, Object> carTypeinLstDo(CarTypeinDto dto, String start, String pageSize) {
		Car car = new Car();
		Map<String, Object> map = new HashMap<String, Object>();
		// car.setIsStored(StoreStatusEnum.SPECIAL.getValue());// 查询状态为2,3的记录 不通过,审核中
		if (StringUtils.isNotBlank(dto.getIsStored()))
			car.setIsStored(Integer.parseInt(dto.getIsStored()));// 如果有值
		car.setVin(dto.getVin());
		car.setBrand(dto.getBrand());
		car.setModel(dto.getModel());
		car.setCarAddress(dto.getCarAddress());
		// car.setEnergyType(dto.getEnergyType());
		car.setAddress(dto.getAddress());
		if (StringUtils.isNotBlank(dto.getLeaveFactoryTime()))
			car.setLeaveFactoryTime(DateUtils.parse(dto.getLeaveFactoryTime(), DateUtils.DEFAULT_DATE_FORMAT_DEFAULT));
		int ps = Integer.parseInt(pageSize);
		List<Car> lst = carMapper.selectByCriteria(car, new RowBounds((Integer.parseInt(start) - 1) * ps, ps));
		map.put("result", lst);
		int size = carMapper.countByCriteria(car);
		map.put("total", size);
		return map;
	}

	/**
	 * 分页查询待审核车辆列表和总数
	 * <p>TODO</p>
	 * @param dto
	 * @param start
	 * @param pageSize
	 * @return
	 * @author wangzh
	 */
	public Map<String, Object> carAuditLstDo(CarTypeinDto dto, String start, String pageSize) {
		Car car = new Car();
		Map<String, Object> map = new HashMap<String, Object>();
		car.setIsStored(StoreStatusEnum.AUDIT.getValue());// 查询状态为3的记录 审核中 未入库
		car.setVin(dto.getVin());
		car.setBrand(dto.getBrand());
		car.setModel(dto.getModel());
		// car.setEnergyType(dto.getEnergyType());
		car.setAddress(dto.getAddress());
		car.setCarAddress(dto.getCarAddress());
		if (StringUtils.isNotBlank(dto.getLeaveFactoryTime()))
			car.setLeaveFactoryTime(DateUtils.parse(dto.getLeaveFactoryTime(), DateUtils.DEFAULT_DATE_FORMAT_DEFAULT));
		int ps = Integer.parseInt(pageSize);
		List<Car> lst = carMapper.selectByCriteria(car, new RowBounds((Integer.parseInt(start) - 1) * ps, ps));
		map.put("result", lst);
		int size = carMapper.countByCriteria(car);
		map.put("total", size);
		return map;
	}

	/**
	 * 获取待审核的车
	 * <p>TODO</p>
	 * @param id
	 * @return
	 * @author wangzh
	 */
	public Car getAuditCar(String id) {
		if (StringUtils.isNotBlank(id)) {
			Car car = carMapper.selectByPrimaryKey(Integer.parseInt(id));
			if (car != null) {
				String add = car.getAddress();
				if (StringUtils.isNotBlank(add)) {
					Store store = storeMapper.selectByPrimaryKey(Integer.parseInt(add));
					if (store != null) {
						car.setAddress(store.getAddress());
					}
				}
			}
			return car;
		}
		return null;
	}

	/**
	 * 获取要修改的车
	 * <p>TODO</p>
	 * @param id
	 * @return
	 * @author wangzh
	 */
	public Car getEditCar(String id) {
		if (StringUtils.isNotBlank(id)) {
			Car car = carMapper.selectByPrimaryKey(Integer.parseInt(id));
			return car;
		}
		return null;
	}

	/**
	 * 入库审核
	 * <p>TODO</p>
	 * @param id
	 * @param pass
	 * @param reason
	 * @author wangzh
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	synchronized public void carAuditDo(String id, String pass, String reason, String jndcar) {
		if (StringUtils.isNotBlank(id) && StringUtils.isNotBlank(pass)) {
			int passInt = Integer.parseInt(pass);
			Car car = null;
			int idInt = Integer.parseInt(id);
			car = carMapper.selectByPrimaryKey(idInt);
			if (car != null) {
				Integer stored = car.getIsStored();
				if (StoreStatusEnum.HAVESTORE.getValue().intValue() == stored.intValue()) {
					throw new PortalMsBizCheckedException("该车辆已被审核通过了");
				}
				if (StoreStatusEnum.NOSTORE.getValue().intValue() == stored.intValue()) {
					throw new PortalMsBizCheckedException("该车辆已被审核为不通过");
				}
				if (passInt == StoreStatusEnum.HAVESTORE.getValue().intValue() && StoreStatusEnum.AUDIT.getValue().intValue() == stored.intValue()) {// 如果点通过进行重复验证
					// 查询入库车中有无重复车架号 发动机号
					String vins = car.getVin();
					String eng = car.getEngineNum();
					Car car2 = new Car();
					if (StringUtils.isNotBlank(vins)) {
						car2.setVin(vins);
						int siz2 = carMapper.countByParam(car2);
						if (siz2 > 0) {
							throw new PortalMsBizCheckedException("车架号已存在");
						}
					}
					car2 = new Car();
					if (StringUtils.isNotBlank(eng))// 如果页面填写值了
					{
						car2.setEngineNum(eng);

						int siz = carMapper.countByParam(car2);
						if (siz > 0) {
							// car2 = new Car();
							// if (StringUtils.isNotBlank(vin)) {
							// car2.setVin(vin);
							// int siz1 = carMapper.countByParam(car2);
							// if (siz1 > 0) {
							// throw new PortalMsBizCheckedException("发动机号已存在并且车架号已存在");
							// }
							// }
							throw new PortalMsBizCheckedException("发动机号已存在");
						}
					}

					if (StringUtils.isNotBlank(jndcar)) {
						Jndcar jnd = new Jndcar();
						jnd.setId(Integer.parseInt(jndcar));
						jnd.setStatus("6");
						jndcarMapper.updateByPrimaryKeySelective(jnd);
					}

				}
			} else {
				throw new PortalMsBizCheckedException("查无此车");
			}
			Integer zeroid = car.getZeropurid();
			Car car1 = new Car();
			car1.setId(idInt);
			car1.setIsStored(passInt);
			if (StringUtils.isNotBlank(reason) && StoreStatusEnum.NOSTORE.getValue().intValue() == passInt) {
				car1.setReason(reason);
				// 新加逻辑 如果审核不通过 并且是从待入中国库 进来的审核。 审核不通过后 进入待入中国库
				Integer jndid = car.getJndcar();
				if (null != jndid) { // 说明时从jnd_car 表中过来的数据。
					Jndcar jnd_car = jndcarMapper.selectByPrimaryKey(jndid);
					if (null != jnd_car) {
						Jndcar jnd_car_pojo = new Jndcar();
						jnd_car_pojo.setId(jnd_car.getId());
						jnd_car_pojo.setStatus("8"); // 进入待入库状态
						jndcarMapper.updateByPrimaryKeySelective(jnd_car_pojo);
					} else {
						throw new PortalMsBizCheckedException("jnd_car表中查无此车");
					}
				}
				if (zeroid != null) {
					Bizzeropurchase zero = new Bizzeropurchase();
					zero.setId(zeroid);
					zero.setStatus("4");// 不通过
					zeropurchaseMapper.updateByPrimaryKeySelective(zero);
				}
			}
			if (StoreStatusEnum.HAVESTORE.getValue().intValue() == passInt) {
				car1.setStatus(CarStatusEnum.INSTORE.getValue());
				if (zeroid != null) {
					Bizzeropurchase zero1 = zeropurchaseMapper.selectByPrimaryKey(zeroid);
					Integer conid = zero1.getContractid();
					if (conid != null) {// 将该零采车辆放入合同中
						Bizcontract contr = new Bizcontract();
						contr.setId(conid);
						contr.setCarid(idInt);
						contr.setVin(car.getVin());
						bizcontractMapper.updateByPrimaryKeySelective(contr);
					}
					Bizzeropurchase zero = new Bizzeropurchase();
					zero.setId(zeroid);
					zero.setStatus("3");// 通过
					zeropurchaseMapper.updateByPrimaryKeySelective(zero);
				}
			}

			carMapper.updateByPrimaryKeySelective(car1);
		}
	}

	/**
	 * 分页查询总资产库车辆列表和总数
	 * <p>TODO</p>
	 * @param dto
	 * @param start
	 * @param pageSize
	 * @return
	 * @author wangzh
	 */
	public Map<String, Object> carAssetLstDo(CarTypeinDto dto, String start, String pageSize) {
		Car car = new Car();
		Map<String, Object> map = new HashMap<String, Object>();
		car.setIsStored(StoreStatusEnum.HAVESTORE.getValue());// 查询状态为1的记录 审核通过已入库
		car.setVin(dto.getVin());
		car.setBrand(dto.getBrand());
		car.setModel(dto.getModel());
		car.setAddress(dto.getAddress());
		car.setRealSale(dto.getRealSale());
		car.setBuyerName(dto.getBuyerName());
		car.setCarAddress(dto.getCarAddress());
		// if (StringUtils.isNotBlank(dto.getStatus()))
		// car.setStatus(Integer.parseInt(dto.getStatus()));
		if (StringUtils.isNotBlank(dto.getStatus())) {
			int st = Integer.parseInt(dto.getStatus());
			// <option value="1">库存车辆</option><option value="2">移库中</option><option
			// value="3">已移库门店</option>
			// <option value="4">购车锁定</option><option value="5">购车物流中</option><option
			// value="6">已销未提</option>
			// <option value="7">已销已提</option>
			if (st > 3 && st < 9) {
				car.setSaleStatus(st - 3);
			} else {
				car.setStatus(st);
				car.setSaleStatus(66);
			}
		}
		if (StringUtils.isNotBlank(dto.getLeaveFactoryTime()))
			car.setLeaveFactoryTime(DateUtils.parse(dto.getLeaveFactoryTime(), DateUtils.DEFAULT_DATE_FORMAT_DEFAULT));
		int ps = Integer.parseInt(pageSize);
		List<Car> lst = carMapper.selectByCriteria(car, new RowBounds((Integer.parseInt(start) - 1) * ps, ps));
		map.put("result", lst);
		int size = carMapper.countByCriteria(car);
		map.put("total", size);
		return map;
	}

	/**
	 * 分页查询总资产库可售车辆列表和总数
	 * <p>TODO</p>
	 * @param dto
	 * @param start
	 * @param pageSize
	 * @return
	 * @author tupeng
	 */
	public Map<String, Object> carAssetListRealSale(CarTypeinDto dto, String start, String pageSize) {
		Car car = new Car();
		Map<String, Object> map = new HashMap<String, Object>();

		Integer a = dto.getId();
		car.setId(a);
		car.setMallCarStatus(8);// 特殊值用于排除商城的车
		car.setIsStored(StoreStatusEnum.HAVESTORE.getValue());// 查询状态为1的记录 审核通过已入库
		car.setId(dto.getId());// add at 2018年5月30日20:49:02 by wangzh
		car.setVin(dto.getVin());
		car.setBrand(dto.getBrand());
		car.setModel(dto.getModel());
		car.setAddress(dto.getAddress());
		car.setRealSale(1);// 1表示可销售车辆信息
		// car.setStatus(6);// 6表示1,3两种状态下的可售车辆
		car.setOutStatus(66);// outStatus为null值
		car.setSaleStatus(66);// saleStatus为null
		car.setCarAddress(dto.getCarAddress());
		if (StringUtils.isNotBlank(dto.getStatus())) {
			int st = Integer.parseInt(dto.getStatus());
			// <option value="1">库存车辆</option><option value="2">移库中</option><option
			// value="3">已移库门店</option>
			// <option value="4">购车锁定</option><option value="5">购车物流中</option><option
			// value="6">已销未提</option>
			// <option value="7">已销已提</option>
			car.setStatus(st);
		}
		if (StringUtils.isNotBlank(dto.getLeaveFactoryTime()))
			car.setLeaveFactoryTime(DateUtils.parse(dto.getLeaveFactoryTime(), DateUtils.DEFAULT_DATE_FORMAT_DEFAULT));
		int ps = Integer.parseInt(pageSize);

		List<Car> lst = carMapper.selectByCriteria(car, new RowBounds((Integer.parseInt(start) - 1) * ps, ps));
		if (null != lst && lst.size() > 0) {
			for (Car entity : lst) {
				// 如果settlementprice 有值 则 用settlementprice 否则用typeinsettleprice by liliang 2018-5-28
				BigDecimal settlementprice = entity.getSettlementprice();
				BigDecimal typeinsettleprice = entity.getTypeinsettleprice();
				if (null == settlementprice) {
					entity.setSettlementprice(typeinsettleprice);
				}
			}
		}
		map.put("result", lst);
		int size = carMapper.countByCriteria(car);
		map.put("total", size);
		return map;
	}

	/**
	 * 分页查询仓库车辆列表和总数
	 * <p>TODO</p>
	 * @param dto
	 * @param storeId 仓库id
	 * @param start
	 * @param pageSize
	 * @return
	 * @author wangzh
	 */
	public Map<String, Object> storecarsLstDo(CarTypeinDto dto, String storeId, String start, String pageSize) {
		Car car = new Car();
		Map<String, Object> map = new HashMap<String, Object>();
		car.setIsStored(StoreStatusEnum.HAVESTORE.getValue());// 查询状态为1的记录 审核通过已入库
		car.setVin(dto.getVin());
		car.setBrand(dto.getBrand());
		car.setModel(dto.getModel());
		car.setAddress(storeId);// 本仓库
		car.setRealSale(dto.getRealSale());
		if (StringUtils.isNotBlank(dto.getStatus()))
			car.setStatus(Integer.parseInt(dto.getStatus()));
		if (StringUtils.isNotBlank(dto.getLeaveFactoryTime()))
			car.setLeaveFactoryTime(DateUtils.parse(dto.getLeaveFactoryTime(), DateUtils.DEFAULT_DATE_FORMAT_DEFAULT));
		int ps = Integer.parseInt(pageSize);
		List<Car> lst = carMapper.selectByCriteria(car, new RowBounds((Integer.parseInt(start) - 1) * ps, ps));
		map.put("result", lst);
		int size = carMapper.countByCriteria(car);
		map.put("total", size);
		return map;
	}

	/**
	 * 分页查询门店车辆列表和总数
	 * <p>TODO</p>
	 * @param dto
	 * @param storeId 仓库id
	 * @param start
	 * @param pageSize
	 * @return
	 * @author wangzh
	 */
	public Map<String, Object> shopcarsLstDo(CarTypeinDto dto, String shopId, String start, String pageSize) {
		Car car = new Car();
		Map<String, Object> map = new HashMap<String, Object>();
		car.setIsStored(StoreStatusEnum.HAVESTORE.getValue());// 查询状态为1的记录 审核通过已入库
		car.setVin(dto.getVin());
		car.setBrand(dto.getBrand());
		car.setModel(dto.getModel());
		car.setStoreType(1);// 1门店2仓库

		/*
		 * car.setOutStatus(99);// 99代表outstatus不为7（已售已提）的列表
		 */
		if (dto.getSaleStatus() == null) {
			car.setSaleStatus(100);// 查询 4、已销已提（出库材料备好） 之前的车
		} else {
			car.setSaleStatus(dto.getSaleStatus());// 条件查询用
		}

		if (StringUtils.isNotBlank(shopId))
			car.setShopId(Integer.parseInt(shopId));// 本门店
		if (StringUtils.isNotBlank(dto.getStatus()))
			car.setStatus(Integer.parseInt(dto.getStatus()));
		if (StringUtils.isNotBlank(dto.getLeaveFactoryTime()))
			car.setLeaveFactoryTime(DateUtils.parse(dto.getLeaveFactoryTime(), DateUtils.DEFAULT_DATE_FORMAT_DEFAULT));
		int ps = Integer.parseInt(pageSize);
		List<Car> lst = carMapper.selectByCriteria(car, new RowBounds((Integer.parseInt(start) - 1) * ps, ps));
		// List<Car> car1=new ArrayList<Car>();
		// for (Car car2 : lst) {
		// if (car2.getOutStatus()!=null) {
		// if(7==car2.getOutStatus().intValue()){
		// }
		// else{
		// car1.add(car2);
		// }
		// }
		// else{
		// car1.add(car2);
		// }
		// }
		// for (int i = 0; i < lst.size(); i++) {
		// if (lst.get(i).getOutStatus() != null && 7 == lst.get(i).getOutStatus().intValue()) {
		// lst.remove(i);
		// }
		// }
		map.put("result", lst);
		int size = carMapper.countByCriteria(car);
		map.put("total", size);
		return map;
	}

	/**
	 * 导出excel
	 * <p>TODO</p>
	 * @param dto
	 * @return
	 * @author wangzh
	 */
	public Workbook exportExcel(CarTypeinDto dto) {
		Car car = new Car();
		// Map<String, Object> map = new HashMap<String, Object>();
		car.setIsStored(StoreStatusEnum.HAVESTORE.getValue());// 查询状态为1的记录 审核通过已入库
		car.setVin(dto.getVin());
		car.setBrand(dto.getBrand());
		car.setModel(dto.getModel());
		car.setAddress(dto.getAddress());
		if (StringUtils.isNotBlank(dto.getStatus()))
			car.setStatus(Integer.parseInt(dto.getStatus()));
		if (StringUtils.isNotBlank(dto.getLeaveFactoryTime()))
			car.setLeaveFactoryTime(DateUtils.parse(dto.getLeaveFactoryTime(), DateUtils.DEFAULT_DATE_FORMAT_DEFAULT));
		List<Car> lst = carMapper.selectByCriteriaExport(car);
		// map.put("result", lst);

		// public static Workbook createWorkBook(List<Map<String, Object>> list, String[] keys,
		// String columnNames[]) {
		// 创建excel工作簿
		Workbook wb = new HSSFWorkbook();
		// 创建第一个sheet（页），并命名
		Sheet sheet = wb.createSheet("资产库车辆导出");
		// 设置列名
		String[] columnNames = { "品牌", "型号", "车架号", "采购商名称", "仓库", "采购价" };
		// 手动设置列宽。第一个参数表示要为第几列设；，第二个参数表示列的宽度，n为列高的像素数。
		for (int i = 0; i < columnNames.length; i++) {
			sheet.setColumnWidth((short) i, (short) (256 * 28));
		}

		// 创建第一行
		Row row0 = sheet.createRow((short) 0);

		// 创建两种单元格格式
		CellStyle cs = wb.createCellStyle();
		CellStyle cs2 = wb.createCellStyle();

		// 创建两种字体
		Font f = wb.createFont();
		Font f2 = wb.createFont();

		// 创建第一种字体样式（用于列名）
		f.setFontHeightInPoints((short) 10);
		f.setColor(IndexedColors.BLACK.getIndex());
		f.setBoldweight(Font.BOLDWEIGHT_BOLD);

		// 创建第二种字体样式（用于值）
		f2.setFontHeightInPoints((short) 10);
		f2.setColor(IndexedColors.BLACK.getIndex());

		// Font f3=wb.createFont();
		// f3.setFontHeightInPoints((short) 10);
		// f3.setColor(IndexedColors.RED.getIndex());

		// 设置第一种单元格的样式（用于列名）
		cs.setFont(f);
		cs.setBorderLeft(CellStyle.BORDER_THIN);
		cs.setBorderRight(CellStyle.BORDER_THIN);
		cs.setBorderTop(CellStyle.BORDER_THIN);
		cs.setBorderBottom(CellStyle.BORDER_THIN);
		cs.setAlignment(CellStyle.ALIGN_CENTER);

		// 设置第二种单元格的样式（用于值）
		cs2.setFont(f2);
		cs2.setBorderLeft(CellStyle.BORDER_THIN);
		cs2.setBorderRight(CellStyle.BORDER_THIN);
		cs2.setBorderTop(CellStyle.BORDER_THIN);
		cs2.setBorderBottom(CellStyle.BORDER_THIN);
		cs2.setAlignment(CellStyle.ALIGN_CENTER);

		for (int i = 0; i < columnNames.length; i++) {
			Cell cell = row0.createCell(i);
			cell.setCellValue(columnNames[i]);
			cell.setCellStyle(cs);
		}
		// 设置每行每列的值
		for (short i = 0; i < lst.size(); i++) {
			// Row 行,Cell 方格 , Row 和 Cell 都是从0开始计数的
			// 创建一行，在页sheet上
			Row row = sheet.createRow(i + 1);
			// 在row行上创建一个方格
			// for (short j = 0; j < keys.length; j++) {
			// Cell cell = row1.createCell(j);
			// cell.setCellValue(list.get(i).get(keys[j]) == null ? " " :
			// list.get(i).get(keys[j]).toString());
			// cell.setCellStyle(cs2);
			// }
			Car tempCar = lst.get(i);
			Cell cell0 = row.createCell(0);
			cell0.setCellStyle(cs2);
			cell0.setCellValue(tempCar.getBrand());

			Cell cell1 = row.createCell(1);
			cell1.setCellStyle(cs2);
			cell1.setCellValue(tempCar.getModel());

			Cell cell2 = row.createCell(2);
			cell2.setCellStyle(cs2);
			cell2.setCellValue(tempCar.getVin());

			Cell cell3 = row.createCell(3);
			cell3.setCellStyle(cs2);
			cell3.setCellValue(tempCar.getBuyName());

			Cell cell4 = row.createCell(4);
			cell4.setCellStyle(cs2);
			cell4.setCellValue(tempCar.getAddress());

			Cell cell5 = row.createCell(5);
			cell5.setCellStyle(cs2);
			cell5.setCellValue(tempCar.getBuyPrice() == null ? " " : tempCar.getBuyPrice().toString());
		}
		// 自动设置列宽。第一个参数表示要为第几列设；第二个参数表示列的宽度，n为列高的像素数。
		// for (int i = 0; i < columnNames.length; i++) {
		// sheet.autoSizeColumn(i);
		// }
		// for (int i = 0; i < columnNames.length; i++) {
		// sheet.setColumnWidth(i, sheet.getColumnWidth(i) + 256 * 10);
		// }
		return wb;
		// }

	}

	/**
	 * 保存客户信息表
	 * <p>TODO</p>
	 * @param dto
	 * @return
	 * @author wangzh
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public Map<String, Object> saveClientInfo(ClientInfoDto dto) {
		Buyer buyer = new Buyer();
		BeanCopierUtils.copyProperties(dto, buyer);
		buyer.setCreateTime(new Date());
		if (StringUtils.isNotBlank(dto.getId()))
			buyer.setId(Integer.parseInt(dto.getId()));
		if (StringUtils.isNotBlank(dto.getComeshopTime()))
			buyer.setComeshopTime(DateUtils.parse(dto.getComeshopTime(), DateUtils.DEFAULT_DATE_FORMAT_DEFAULT));
		if (StringUtils.isNotBlank(dto.getCarId()))
			buyer.setCarId(Integer.parseInt(dto.getCarId()));
		if (StringUtils.isNotBlank(dto.getCarPrice()))
			buyer.setCarPrice(new BigDecimal(dto.getCarPrice()));
		if (StringUtils.isNotBlank(dto.getShopId()))
			buyer.setShopId(Integer.parseInt(dto.getShopId()));
		// if(StringUtils.isNotBlank(dto.getFilenum())){
		// //手动填写时
		// Buyer b1=new Buyer();b1.setFilenum(dto.getFilenum());
		// int size=buyMapper.countByCriteria(b1);
		// }
		buyMapper.insertSelectiveWithKey(buyer);
		// Integer id = buyer.getId();
		// String now = DateUtils.formate(buyer.getCreateTime(), DateUtils.COMPACT_DATE_FORMAT);
		// now = now.substring(2);
		// Buyer buyer1 = new Buyer();
		// buyer1.setId(id);
		// buyer1.setFilenum(WebConstants.FILE_PREFIX + now + id);
		// buyMapper.updateByPrimaryKeySelective(buyer1);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("infoId", dto.getId());
		map.put("infoNum", dto.getFilenum());
		Car car = carMapper.selectByPrimaryKey(buyer.getCarId());
		if (StringUtils.isNotBlank(car.getAddress())) {// 保存的是仓库的主键
			Store store = storeMapper.selectByPrimaryKey(Integer.parseInt(car.getAddress()));
			if (store != null)
				car.setAddress(store.getAddress());
		}
		map.put("car", car);
		return map;
	}

	/**
	 * 新需求 保存客户信息表 方法作废
	 * <p>TODO</p>
	 * @param ci 信息表id
	 * @param carId
	 * @author wangzh
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public Map<String, Object> saveClientInfoNew(Integer ci, Integer carId) {
		if (ci != null && carId != null) {
			Buyer buyer = new Buyer();
			buyer.setId(ci);
			buyer.setCarId(carId);
			buyMapper.updateByPrimaryKeySelective(buyer);
			Buyer buyer2 = buyMapper.selectByPrimaryKey(ci);

			Map<String, Object> map = new HashMap<String, Object>();

			map.put("carId", buyer2.getCarId());
			Car car = carMapper.selectByPrimaryKey(ci);
			if (StringUtils.isNotBlank(car.getAddress())) {// 保存的是仓库的主键
				Store store = storeMapper.selectByPrimaryKey(Integer.parseInt(car.getAddress()));
				if (store != null)
					car.setAddress(store.getAddress());
			}
			map.put("car", car);
			Integer shopId = buyer2.getShopId();
			map.put("infoId", buyer2.getId());
			map.put("infoNum", buyer2.getFilenum());
			if (shopId != null) {
				Shop shop = queryShopById(shopId);
				map.put("shopId", shop.getId());
				map.put("shopName", shop.getName());
			}

			map.put("phone", buyer2.getPhone());
			map.put("buyerName", buyer2.getName());
			map.put("identify", buyer2.getIdentify());
			return map;
		}
		return null;
	}

	/**
	 * 保存合同并发起流程
	 * <p>TODO</p>
	 * @param dto
	 * @author wangzh
	 * @throws Exception 
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void saveContract(ContractDto dto) throws Exception {
		contract contract = new contract();
		BeanCopierUtils.copyProperties(dto, contract);
		contract.setCreateTime(new Date());
		//
		// Car car = new Car();
		// // BeanCopierUtils.copyProperties(dto, car);
		//
		// car.setCreateTime(new Date());// 记录创建时间
		// car.setIden1(resourceService.uploadFileProcessStr(dto.getIden1(),
		// FileTypeEnum.CARIDENTIFY));
		// car.setIden2(resourceService.uploadFileProcessStr(dto.getIden2(),
		// FileTypeEnum.CARIDENTIFY));
		// car.setIden3(resourceService.uploadFileProcessStr(dto.getIden3(),
		// FileTypeEnum.CARIDENTIFY));
		// car.setIden4(resourceService.uploadFileProcessStr(dto.getIden4(),
		// FileTypeEnum.CARIDENTIFY));
		// Map<String, Map<String, Object>> map = new HashMap<String, Map<String, Object>>();
		// if (StringUtils.isNotBlank(car.getIden1())) {
		// Map<String, Object> tMap = new HashMap<String, Object>();
		// tMap.put("is", dto.getIden1().getInputStream());
		// tMap.put("size", dto.getIden1().getSize());
		// map.put(car.getIden1(), tMap);
		// }

		contract.setVideos(resourceService.uploadFileProcessStrVideo(dto.getIden5(), dto.getInfoNum(), FileTypeEnum.VIDEO));
		Map<String, Object> map = new HashMap<String, Object>();
		if (StringUtils.isNotBlank(contract.getVideos())) {
			Map<String, Object> tMap = new HashMap<String, Object>();
			tMap.put("is", dto.getIden5().getInputStream());
			tMap.put("size", dto.getIden5().getSize());
			map.put(contract.getVideos(), tMap);
		}
		if (map.entrySet().size() > 0) {
			resourceService.asyncSaveVideoss(map, true);
		}

		Map<String, Object> params = new HashMap<String, Object>();
		if (StringUtils.isNotBlank(dto.getInfoId())) {
			contract.setInfoId(Integer.parseInt(dto.getInfoId()));
			// params.put("infoId", dto.getInfoId());
		}
		if (StringUtils.isNotBlank(dto.getShopId()))
			contract.setShopId(Integer.parseInt(dto.getShopId()));
		if (StringUtils.isNotBlank(dto.getSellerId()))
			contract.setSellerId(Integer.parseInt(dto.getSellerId()));
		if (StringUtils.isNotBlank(dto.getSalePrice()))
			contract.setSalePrice(new BigDecimal(dto.getSalePrice()));
		if (StringUtils.isNotBlank(dto.getContPrice()))
			contract.setContPrice(new BigDecimal(dto.getContPrice()));
		if (StringUtils.isNotBlank(dto.getCarId()))
			contract.setCarId(Integer.parseInt(dto.getCarId()));

		if (StringUtils.isNotBlank(dto.getDownpay()))
			contract.setDownpay(new BigDecimal(dto.getDownpay()));

		// 新增字段
		if (StringUtils.isNotBlank(dto.getInsurePrice()))// 保险费
			contract.setInsurePrice(new BigDecimal(dto.getInsurePrice()));
		if (StringUtils.isNotBlank(dto.getBuyTax()))// 购置税
			contract.setBuyTax(new BigDecimal(dto.getBuyTax()));
		if (StringUtils.isNotBlank(dto.getCardPrice()))// 上牌费
			contract.setCardPrice(new BigDecimal(dto.getCardPrice()));

		if (StringUtils.isNotBlank(dto.getQualityguarPrice()))// 质保费
			contract.setQualityguarPrice(new BigDecimal(dto.getQualityguarPrice()));
		if (StringUtils.isNotBlank(dto.getDelayguarPrice()))// 延保费
			contract.setDelayguarPrice(new BigDecimal(dto.getDelayguarPrice()));
		if (StringUtils.isNotBlank(dto.getDecoratePrice()))// 装潢费
			contract.setDecoratePrice(new BigDecimal(dto.getDecoratePrice()));

		// contract.setVideos(dto.getVideos());
		// if (contract.getSalePrice() != null && contract.getDownpay() != null) {// 销售价、定金必填
		// // 计算出应付尾款
		// contract.setFinalpay(contract.getSalePrice().subtract(contract.getDownpay()));
		// }
		// 向销售表中插一条数据
		OutRepository out = new OutRepository();
		out.setCarId(contract.getCarId());
		// out.setConid(contract.getId());
		out.setCreateTime(new Date());
		outRepositoryMapper.insertSelective(out);
		contract.setOutid(out.getId());
		/*
		 * if (contract.getVideos() != null) { resourceService.asyncSaveVideo(dto.getIden5(),
		 * contract.getVideos()); }
		 */
		contractMapper.insertSelective(contract);

		//
		UserDTO userInfo = SecurityHelper.getAdminUserInfo();
		// String name = userInfo.getName();
		// String logname = userInfo.getLoginName();
		String roleName = getOneRole(userInfo.getId());
		if (StringUtils.isBlank(roleName)) {
			throw new Exception("您还未有该门店销售车辆的角色，请联系管理员"); // return;Unreachable code
		}
		params.put("submitContractAssignee", roleName);// 发起者指定为role名
		params.put(WebConstants.startUserId, // 还是存放角色名吧
				// userInfo.getId()
				roleName);// 用于财务审批通过后返回给哪个门店
		// 指定总部车辆角色审核节点的参与者 指定为角色
		params.put("hqContractAssignee", RoleEnum.ROLE_HQ_CAR.getName());
		params.put("infoId", contract.getInfoId());
		params.put("contractId", contract.getId());
		params.put("carId", contract.getCarId());
		// if (contract.getCarId() != null) {
		// Car car = carMapper.selectByPrimaryKey(contract.getCarId());
		// if (car != null)
		// params.put("carOldStatus", car.getStatus());
		// }
		// 锁定车辆
		Car car = new Car();
		car.setId(contract.getCarId());
		car.setSaleStatus(CarSaleStatusEnum.BUY_LOCK.getValue());
		car.setOutStatus(CarOutStatusEnum.APPLY.getValue());
		if (car.getId() != null)
			carMapper.updateByPrimaryKeySelective(car);

		params.put("outRepId", out.getId());

		// 开启流程执行 执行第一步 车辆部门角色从待办任务中查看任务
		startAndExecute("outRepository", 0, roleName, params);
		// 设置car的status为4销售锁定
		// Car car1 = new Car();
		// car1.setId(contract.getCarId());
		// car1.setStatus(CarStatusEnum.SELLLOCK.getValue());
		// car1.setOutStatus(CarOutStatusEnum.APPLY.getValue());
		// carMapper.updateByPrimaryKeySelective(car1);
	}

	/**
	 * 获取唯一个审批流程的role
	 * <p>TODO</p>
	 * @param userId
	 * @return
	 * @author wangzh
	 */
	public String getOneRole(Integer userId) {
		List<Role> roles = getRolesByUserId(userId);
		String roleName = "";
		for (Role role : roles) {
			if (null != role.getAppId() && role.getAppId().intValue() == 0) {
				roleName = role.getName();
				break;
			}
		}
		return roleName;
	}

	/**
	 * 获取车辆、信息表、合同
	 * <p>TODO</p>
	 * @param modelMap
	 * @param taskId
	 * @author wangzh
	 */
	// @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED,
	// timeout = 3)
	public void getInfoContract(ModelMap modelMap, String taskId) {
		// 获取提交的客户消息表、合同、车辆信息
		// UserDTO userInfo = SecurityHelper.getAdminUserInfo();
		// String name = userInfo.getLoginName();
		// Integer logId = userInfo.getId();
		// 提取任务
		// String roleName = getOneRole(logId);
		// Task task = taskService.take(taskId, roleName);
		Task task = facets.getEngine().query().getTask(taskId);
		// Task task=taskService.
		String initVariable = task.getVariable().replace("\"", "");
		initVariable = initVariable.replace("{", "");
		initVariable = initVariable.replace("}", "");
		String[] args = initVariable.split(",");
		Integer carId = null;// 车辆id
		Car car = null;
		Integer contractId = null;// 合同id
		contract contract = null;
		Integer infoId = null;// 客户信息表id

		Buyer buyer = null;
		for (int i = 0; i < args.length; i++) {
			String[] temp = args[i].split(":");
			if (temp.length == 2) {
				if (temp[0].equals("carId")) {
					carId = Integer.parseInt(temp[1]);
					// car=carMapper.selectByPrimaryKey(carId);
				}
				if (temp[0].equals("contractId")) {
					contractId = Integer.parseInt(temp[1]);
					// contract=contractMapper.selectByPrimaryKey(contractId);
				}
				if (temp[0].equals("infoId")) {
					infoId = Integer.parseInt(temp[1]);
				}
				if (temp[0].equals(WebConstants.startUserId)) {
					modelMap.put(WebConstants.startUserId, temp[1]);
				}
				// if (temp[0].equals("carOldStatus")) {
				// modelMap.put("carOldStatus", temp[1]);
				// }
			}
		}
		if (carId != null) {
			car = carMapper.selectByPrimaryKey(carId);

			if (StringUtils.isNotBlank(car.getAddress())) {// 保存的是仓库的主键
				Store store = storeMapper.selectByPrimaryKey(Integer.parseInt(car.getAddress()));
				if (store != null)
					// car.setAddress(store.getAddress());// 临时转换为地址供查看用
					car.setAddress(store.getName());// 临时转换为地址供查看用 存的是仓库名称
			}

			modelMap.put("car", car);
		}
		if (infoId != null) {
			buyer = buyMapper.selectByPrimaryKey(infoId);
			modelMap.put("buyer", buyer);
			// buyer.setWorkType("1".equals(buyer.getWorkType()) ? "个人" : "单位");
			// modelMap.put("clientType", "个人".equals(buyer.getWorkType()) ? 1 : 2);
			// Communicate record = new Communicate();
			// record.setClientId(infoId);
			// List<Communicate> lst = communicateMapper.selectByCriteria(record);
			// modelMap.put("lst", lst);
		}
		if (contractId != null) {
			contract = contractMapper.selectByPrimaryKey(contractId);
			modelMap.put("contract", contract);
		}
	}

	/**
	 * 总部审核
	 * <p>TODO</p>
	 * @param modelMap
	 * @param carId 车辆id
	 * @param infoId 信息表id
	 * @param contractId 合同id
	 * @param taskId 任务id
	 * @param pass 1通过 0驳回（或者是不通过）
	 * @author wangzh
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void hqAudit(ModelMap modelMap, String orderId, String carId, String carOldStatus, String infoId, String contractId, String taskId,
			String startUserId, String pass) {
		String roleName = getOneRole(SecurityHelper.getAdminUserInfo().getId());
		if ("1".equals(pass)) {// 通过审核
			// hqaudit.operator
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("carId", carId);
			map.put("infoId", infoId);
			map.put("contractId", contractId);
			map.put("orderId", orderId);
			// map.put("contractId", contractId);
			// Integer logId=userInfo.getId();
			// 提取任务
			// roleName = getOneRole(SecurityHelper.getAdminUserInfo().getId());
			// Task task = taskService.take(taskId, roleName);
			// taskService.take(taskId, operator);
			map.put("hqContractAssignee", roleName);// 此节点操作者
			map.put("hqFinFirstpayAssignee", RoleEnum.ROLE_HQ_FINANCE.getName());// 下一步操作者为总部财务
			map.put(WebConstants.startUserId, startUserId);// 门店用户id

			// map.put("carOldStatus", carOldStatus);

			facets.execute(taskId, roleName, map);// 任务执行
			// 车辆出库状态变为
			Car car = new Car();
			if (StringUtils.isNotBlank(carId)) {
				car.setId(Integer.parseInt(carId));
				car.setOutStatus(CarOutStatusEnum.CONTRACT_PASS.getValue());
				// car.setSaleStatus(CarSaleStatusEnum.);
				carMapper.updateByPrimaryKeySelective(car);
			}
		} else if ("0".equals(pass)) {
			// 驳回 现在先临时终止流程
			// 直接终止流程
			// orderService.terminate(orderId, SnakerEngine.ADMIN);
			orderService.terminate(orderId, roleName);
			// 修改车辆状态为 新：车辆解锁
			// Car car = new Car();
			if (StringUtils.isNotBlank(carId)) {
				// car.setId(Integer.parseInt(carId));
				// car.setOutStatus(CarOutStatusEnum.CONTRACT_PASS.getValue());
				// if (StringUtils.isNotBlank(carOldStatus))
				// car.setStatus(Integer.parseInt(carOldStatus));
				// if (car.getId() != null && car.getStatus() != null)
				// carMapper.updateByPrimaryKeySelective(car);
				carMapper.unlockCarSaleStatus(Integer.parseInt(carId));
			}
		}
	}

	/**
	 * 总部财务查看首付情况
	 * <p>TODO</p>
	 * @param modelMap
	 * @param taskId
	 * @author wangzh
	 */
	public void getFirstPay(ModelMap modelMap, String taskId) {
		//
		// UserDTO userInfo = SecurityHelper.getAdminUserInfo();
		// String name = userInfo.getLoginName();
		// Integer logId = userInfo.getId();
		// 提取任务
		// String roleName = getOneRole(logId);
		// Task task = taskService.take(taskId, roleName);
		// Task task=taskService.
		Task task = facets.getEngine().query().getTask(taskId);// 查询任务
		String initVariable = task.getVariable().replace("\"", "");
		initVariable = initVariable.replace("{", "");
		initVariable = initVariable.replace("}", "");
		String[] args = initVariable.split(",");
		// Integer carId = null;// 车辆id
		// Car car = null;
		Integer contractId = null;// 合同id
		contract contract = null;
		Integer infoId = null;// 客户信息表id

		Buyer buyer = null;
		for (int i = 0; i < args.length; i++) {
			String[] temp = args[i].split(":");
			if (temp.length == 2) {
				if (temp[0].equals("carId")) {
					// carId = Integer.parseInt(temp[1]);
					// car=carMapper.selectByPrimaryKey(carId);
					modelMap.put("carId", temp[1]);
				}
				if (temp[0].equals("contractId")) {
					contractId = Integer.parseInt(temp[1]);
					// contract=contractMapper.selectByPrimaryKey(contractId);
				}
				if (temp[0].equals("infoId")) {
					infoId = Integer.parseInt(temp[1]);
					modelMap.put("infoId", infoId);
				}
				if (temp[0].equals(WebConstants.startUserId)) {
					modelMap.put(WebConstants.startUserId, temp[1]);
				}
				// if (temp[0].equals("carOldStatus")) {
				// modelMap.put("carOldStatus", temp[1]);
				// }
			}
		}
		// if (carId != null) {
		// car = carMapper.selectByPrimaryKey(carId);
		// modelMap.put("car", car);
		// }
		if (infoId != null) {
			buyer = buyMapper.selectByPrimaryKey(infoId);
			modelMap.put("buyer", buyer);
			// buyer.setWorkType("1".equals(buyer.getWorkType()) ? "个人" : "单位");
		}
		if (contractId != null) {
			contract = contractMapper.selectByPrimaryKey(contractId);
			modelMap.put("contract", contract);
			Car car = carMapper.selectByPrimaryKey(contract.getCarId());
			modelMap.put("car", car);
		}
	}

	/**
	 * 总部财务审核首付
	 * <p>TODO</p>
	 * @param modelMap
	 * @param orderId
	 * @param carId
	 * @param carOldStatus
	 * @param infoId
	 * @param contractId
	 * @param taskId
	 * @param startUserId
	 * @param pass
	 * @author wangzh
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void hqFinanceAudit(ModelMap modelMap, String orderId, String carId, String carOldStatus, String infoId, String contractId, String taskId,
			String startUserId, String realdownpay, String pass) {
		String roleName = getOneRole(SecurityHelper.getAdminUserInfo().getId());
		if ("1".equals(pass)) {// 通过审核
			// hqaudit.operator
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("carId", carId);
			map.put("infoId", infoId);
			map.put("contractId", contractId);
			map.put("orderId", orderId);
			// map.put("contractId", contractId);
			// Integer logId=userInfo.getId();
			// 提取任务
			// roleName = getOneRole(SecurityHelper.getAdminUserInfo().getId());
			// Task task = taskService.take(taskId, roleName);
			// taskService.take(taskId, operator);
			map.put("hqFinFirstpayAssignee", roleName);// 此节点操作者
			// String startRole = "";
			// if (StringUtils.isNotBlank(startUserId)) {
			// startRole = getOneRole(Integer.parseInt(startUserId));
			// }
			map.put("clientCheckCarAssignee", startUserId);// 下一步操作者为发起流程请求的那个门店角色
			map.put(WebConstants.startUserId, startUserId);// 门店用户id

			// map.put("carOldStatus", carOldStatus);

			facets.execute(taskId, roleName, map);// 任务执行
			// 车辆出库状态变为
			Car car = new Car();
			if (StringUtils.isNotBlank(carId)) {
				car.setId(Integer.parseInt(carId));
				car.setOutStatus(CarOutStatusEnum.FIRSTPAY_PASS.getValue());// 出库状态首付核实通过
				car.setSaleStatus(CarSaleStatusEnum.BUY_LOGIS.getValue());// 销售状态物流中
				carMapper.updateByPrimaryKeySelective(car);
			}
			// 更新合同实到定金
			contract ct = new contract();
			contract ct1 = null;
			if (StringUtils.isNotBlank(contractId)) {
				ct.setId(Integer.parseInt(contractId));
				ct1 = contractMapper.selectByPrimaryKey(ct.getId());
				// }
				// if(ct1!=null)
				if (ct1 != null && StringUtils.isNotBlank(realdownpay)) {// 实到定金
					ct.setRealdownpay(new BigDecimal(realdownpay));
					// 计算出应付尾款
					// if (ct1 != null) {
					BigDecimal saleprice = ct1.getSalePrice();
					if (saleprice != null) {
						BigDecimal realpay = ct.getRealdownpay();
						// if (realpay != null) {
						BigDecimal shouldfinal = saleprice.subtract(realpay).multiply(new BigDecimal(1));// 乘以1万
						// 涉及到车的费用单位是万
						// 再加上六种费用
						BigDecimal ip = ct1.getInsurePrice();// 保险费
						BigDecimal bt = ct1.getBuyTax();// 购置税
						BigDecimal cp = ct1.getCardPrice();// 上牌费
						BigDecimal qp = ct1.getQualityguarPrice();// 质保费
						BigDecimal dp = ct1.getDelayguarPrice();// 延保费
						BigDecimal dep = ct1.getDecoratePrice();// 装潢费
						shouldfinal = shouldfinal.add(ip == null ? BigDecimal.ZERO : ip).add(bt == null ? BigDecimal.ZERO : bt)
								.add(cp == null ? BigDecimal.ZERO : cp).add(qp == null ? BigDecimal.ZERO : qp).add(dp == null ? BigDecimal.ZERO : dp)
								.add(dep == null ? BigDecimal.ZERO : dep);
						ct.setFinalpay(shouldfinal);
						// }
					}
					// }
					contractMapper.updateByPrimaryKeySelective(ct);
				}
			}

			// if (ct.getId() != null && ct.getRealdownpay() != null) {
			// contractMapper.updateByPrimaryKeySelective(ct);
			// }
		} else if ("0".equals(pass)) {
			// 驳回 现在先临时终止流程
			// 直接终止流程
			// orderService.terminate(orderId, SnakerEngine.ADMIN);
			orderService.terminate(orderId, roleName);
			// 修改车辆状态为
			// Car car = new Car();
			if (StringUtils.isNotBlank(carId))
				// car.setId(Integer.parseInt(carId));
				// car.setOutStatus(CarOutStatusEnum.CONTRACT_PASS.getValue());
				// if (StringUtils.isNotBlank(carOldStatus))
				// car.setStatus(Integer.parseInt(carOldStatus));
				// if (car.getId() != null && car.getStatus() != null)
				carMapper.unlockCarSaleStatus(Integer.parseInt(carId));
		}
	}

	/**
	 * 门店销售指引客户验车
	 * <p>TODO</p>
	 * @param modelMap
	 * @param taskId
	 * @author wangzh
	 */
	public void getCheckCar(ModelMap modelMap, String taskId) {
		//
		// UserDTO userInfo = SecurityHelper.getAdminUserInfo();
		// String name = userInfo.getLoginName();
		// Integer logId = userInfo.getId();
		// 提取任务
		// String roleName = getOneRole(logId);
		// Task task = taskService.take(taskId, roleName);
		Task task = facets.getEngine().query().getTask(taskId);
		String initVariable = task.getVariable().replace("\"", "");
		initVariable = initVariable.replace("{", "");
		initVariable = initVariable.replace("}", "");
		String[] args = initVariable.split(",");
		Integer carId = null;// 车辆id
		Car car = null;
		Integer contractId = null;// 合同id
		contract contract = null;
		Integer infoId = null;// 客户信息表id

		Buyer buyer = null;
		for (int i = 0; i < args.length; i++) {
			String[] temp = args[i].split(":");
			if (temp.length == 2) {
				if (temp[0].equals("carId")) {
					carId = Integer.parseInt(temp[1]);
					// car=carMapper.selectByPrimaryKey(carId);
					modelMap.put("carId", temp[1]);
				}
				if (temp[0].equals("contractId")) {
					contractId = Integer.parseInt(temp[1]);
					// contract=contractMapper.selectByPrimaryKey(contractId);
				}
				if (temp[0].equals("infoId")) {
					infoId = Integer.parseInt(temp[1]);
				}
				if (temp[0].equals(WebConstants.startUserId)) {
					modelMap.put(WebConstants.startUserId, temp[1]);
				}
				// if (temp[0].equals("carOldStatus")) {
				// modelMap.put("carOldStatus", temp[1]);
				// }
			}
		}
		if (carId != null) {
			car = carMapper.selectByPrimaryKey(carId);
			modelMap.put("car", car);
			if (StringUtils.isNotBlank(car.getAddress())) {// 保存的是仓库的主键
				Store store = storeMapper.selectByPrimaryKey(Integer.parseInt(car.getAddress()));
				if (store != null)
					// car.setAddress(store.getAddress());// 临时转换为地址供查看用
					car.setAddress(store.getName());// 临时转换为地址供查看用 存的是仓库名称
			}
		}
		if (infoId != null) {
			buyer = buyMapper.selectByPrimaryKey(infoId);
			modelMap.put("buyer", buyer);
			// buyer.setWorkType("1".equals(buyer.getWorkType()) ? "个人" : "单位");
		}
		if (contractId != null) {
			contract = contractMapper.selectByPrimaryKey(contractId);
			// BigDecimal saleprice = contract.getSalePrice();
			// BigDecimal downpayString = contract.getDownpay();
			// if (saleprice != null && downpayString != null) {
			// BigDecimal shouldfinalpay = saleprice.subtract(downpayString);
			// contract.setFinalpay(shouldfinalpay);
			// }
			modelMap.put("contract", contract);
		}
	}

	/**
	 * 门店销售指引客户验车do
	 * <p>TODO</p>
	 * @param modelMap
	 * @param orderId
	 * @param carId
	 * @param carOldStatus
	 * @param infoId
	 * @param contractId
	 * @param taskId
	 * @param startUserId
	 * @param pass
	 * @author wangzh
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void checkCarDo(ModelMap modelMap, String orderId, String carId, String infoId, String contractId, String taskId, String startUserId, String pass,
			String nopasstype, String changeCarId, String changeCarVin, String refundReason) {
		String roleName = getOneRole(SecurityHelper.getAdminUserInfo().getId());
		if ("1".equals(pass)) {// 通过审核
			// hqaudit.operator
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("carId", carId);
			map.put("infoId", infoId);
			map.put("contractId", contractId);
			map.put("orderId", orderId);
			// map.put("contractId", contractId);
			// Integer logId=userInfo.getId();
			// 提取任务
			// roleName = getOneRole(SecurityHelper.getAdminUserInfo().getId());
			// Task task = taskService.take(taskId, roleName);
			// taskService.take(taskId, operator);
			map.put("clientCheckCarAssignee", roleName);// 此节点操作者
			// String startRole = "";
			// if (StringUtils.isNotBlank(startUserId)) {
			// startRole = getOneRole(Integer.parseInt(startUserId));
			// }
			map.put("notifyFinalpayAssignee", roleName);// 下一步操作者
			map.put(WebConstants.startUserId, startUserId);// 门店用户id
			facets.execute(taskId, roleName, map);// 任务执行
			// 车辆出库状态变为
			Car car = new Car();
			if (StringUtils.isNotBlank(carId)) {
				car.setId(Integer.parseInt(carId));
				car.setOutStatus(CarOutStatusEnum.CLIENT_CHECKCAR_PASS.getValue());
				// car.setSaleStatus(CarSaleStatusEnum.BUY_LOGIS.getValue());
				carMapper.updateByPrimaryKeySelective(car);
			}
			if (StringUtils.isNotBlank(contractId)) {
				contract contract = contractMapper.selectByPrimaryKey(Integer.parseInt(contractId));
				Integer outId = contract.getOutid();
				if (outId != null) {
					OutRepository out = new OutRepository();
					out.setId(outId);
					out.setCarId(contract.getCarId());
					if (out.getCarId() != null) {
						outRepositoryMapper.updateByPrimaryKeySelective(out);
					}
				}
			}
		} else if ("2".equals(pass)) {// 不通过
			// 判断是换车还是退定金
			if ("1".equals(nopasstype)) {// 换车
				if (StringUtils.isNotBlank(changeCarId) // && StringUtils.isNotBlank(changeCarVin)
				) {
					// 可以手动填vin
					// Car car = carMapper.selectByCriteriaByVin(changeCarVin);
					// if (car != null) {
					// if (changeCarId.equals(car.getId().toString())) {
					// 更新客户表绑定的车辆id
					if (StringUtils.isNotBlank(infoId) && StringUtils.isNotBlank(contractId)) {
						Integer ID = Integer.parseInt(infoId);
						Integer newCarId = Integer.parseInt(changeCarId);
						Buyer buyer = buyMapper.selectByPrimaryKey(ID);
						if (buyer != null) {
							// 解绑原先车辆
							Integer oldCarId = buyer.getCarId();
							if (oldCarId != null) {
								carMapper.unlockCarSaleStatus(oldCarId);
							}
							// 锁定新车
							Car car2 = new Car();
							car2.setId(newCarId);
							car2.setOutStatus(CarOutStatusEnum.FIRSTPAY_PASS.getValue());
							car2.setSaleStatus(CarSaleStatusEnum.BUY_LOGIS.getValue());
							carMapper.updateByPrimaryKeySelective(car2);
							Buyer buyer2 = new Buyer();
							buyer2.setId(ID);
							buyer2.setCarId(newCarId);
							buyMapper.updateByPrimaryKeySelective(buyer2);
						}
						// 更新合同
						contract con = new contract();
						con.setId(Integer.parseInt(contractId));
						con.setCarId(newCarId);
						con.setVin(changeCarVin);
						contractMapper.updateByPrimaryKeySelective(con);
						contract con1 = contractMapper.selectByPrimaryKey(con.getId());
						Integer outId = con1.getOutid();
						if (outId != null) {
							OutRepository out = new OutRepository();
							out.setId(outId);
							out.setChanged(1);
							outRepositoryMapper.updateByPrimaryKeySelective(out);
						}
						// 跳转到本环节
						Map<String, Object> map = new HashMap<String, Object>();
						map.put("carId", newCarId);
						map.put("infoId", infoId);
						map.put("contractId", contractId);
						map.put("orderId", orderId);
						map.put("oldCarId", carId);// 之前那辆车id
						map.put("clientCheckCarAssignee", roleName);// 此节点操作者也是下一步操作者
						// map.put("notifyFinalpayAssignee", roleName);//
						map.put(WebConstants.startUserId, startUserId);// 门店用户id
						executeAndJump(taskId, roleName, map, "clientCheckCar");
					} else {
						throw new PortalMsBizCheckedException("客户信息表或合同表参数有误，请返回任务列表重新处理该任务！");
					}
					// } else {
					// throw new
					// PortalMsBizCheckedException("车架号不存在；选择车辆后不要手动修改车架号，请返回任务列表重新处理该任务！");
					// }
					// } else {
					// throw new PortalMsBizCheckedException("车架号不存在，选择车辆后不要手动修改车架号！");
					// }
				}
			}
			if ("2".equals(nopasstype)) {// 退定金
				// 解绑原先车
				Buyer buyer = buyMapper.selectByPrimaryKey(Integer.parseInt(infoId));
				if (buyer != null) {
					// 解绑原先车辆
					Integer oldCarId = buyer.getCarId();
					if (oldCarId != null) {
						carMapper.unlockCarSaleStatus(oldCarId);
					}
					// 更新合同
					if (StringUtils.isNotBlank(contractId)) {
						contract con1 = contractMapper.selectByPrimaryKey(Integer.parseInt(contractId));
						Integer outId = con1.getOutid();
						if (outId != null) {
							OutRepository out = new OutRepository();
							out.setId(outId);
							out.setStatus(2);
							out.setRefundReason(refundReason);
							outRepositoryMapper.updateByPrimaryKeySelective(out);
						}
					}
				}
				// 直接终止流程
				// orderService.terminate(orderId, SnakerEngine.ADMIN);
				orderService.terminate(orderId, roleName);
			}
		}
	}

	/**
	 * 门店通知客户支付尾款--查看
	 * <p>TODO</p>
	 * @param modelMap
	 * @param taskId
	 * @author wangzh
	 */
	public void getNotify(ModelMap modelMap, String taskId) {
		//
		// UserDTO userInfo = SecurityHelper.getAdminUserInfo();
		// String name = userInfo.getLoginName();
		// Integer logId = userInfo.getId();
		// 提取任务
		// String roleName = getOneRole(logId);
		// Task task = taskService.take(taskId, roleName);
		Task task = facets.getEngine().query().getTask(taskId);
		String initVariable = task.getVariable().replace("\"", "");
		initVariable = initVariable.replace("{", "");
		initVariable = initVariable.replace("}", "");
		String[] args = initVariable.split(",");
		// Integer carId = null;// 车辆id
		// Car car = null;
		Integer contractId = null;// 合同id
		contract contract = null;
		Integer infoId = null;// 客户信息表id

		Buyer buyer = null;
		for (int i = 0; i < args.length; i++) {
			String[] temp = args[i].split(":");
			if (temp.length == 2) {
				if (temp[0].equals("carId")) {
					// carId = Integer.parseInt(temp[1]);
					// car=carMapper.selectByPrimaryKey(carId);
					modelMap.put("carId", temp[1]);
				}
				if (temp[0].equals("contractId")) {
					contractId = Integer.parseInt(temp[1]);
					// contract=contractMapper.selectByPrimaryKey(contractId);
				}
				if (temp[0].equals("infoId")) {
					infoId = Integer.parseInt(temp[1]);
				}
				if (temp[0].equals(WebConstants.startUserId)) {
					modelMap.put(WebConstants.startUserId, temp[1]);
				}
				// if (temp[0].equals("carOldStatus")) {
				// modelMap.put("carOldStatus", temp[1]);
				// }
			}
		}
		// if (carId != null) {
		// car = carMapper.selectByPrimaryKey(carId);
		// modelMap.put("car", car);
		// }
		if (infoId != null) {
			buyer = buyMapper.selectByPrimaryKey(infoId);
			modelMap.put("buyer", buyer);
		}
		if (contractId != null) {
			contract = contractMapper.selectByPrimaryKey(contractId);
			// BigDecimal saleprice = contract.getSalePrice();
			// BigDecimal downpayString = contract.getDownpay();
			// if (saleprice != null && downpayString != null) {
			// BigDecimal shouldfinalpay = saleprice.subtract(downpayString);
			// contract.setFinalpay(shouldfinalpay);
			// }
			modelMap.put("contract", contract);
			Car car = carMapper.selectByPrimaryKey(contract.getCarId());
			modelMap.put("car", car);
		}
	}

	/**
	 * 门店通知客户支付尾款
	 * <p>TODO</p>
	 * @param modelMap
	 * @param orderId
	 * @param carId
	 * @param carOldStatus
	 * @param infoId
	 * @param contractId
	 * @param taskId
	 * @param startUserId
	 * @param pass
	 * @author wangzh
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void notifyDo(ModelMap modelMap, String orderId, String carId, String carOldStatus, String infoId, String contractId, String taskId,
			String startUserId, String pass) {
		String roleName = getOneRole(SecurityHelper.getAdminUserInfo().getId());
		// if ("1".equals(pass)) {// 通过审核
		// hqaudit.operator
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("carId", carId);
		map.put("infoId", infoId);
		map.put("contractId", contractId);
		map.put("orderId", orderId);
		// map.put("contractId", contractId);
		// Integer logId=userInfo.getId();
		// 提取任务
		// roleName = getOneRole(SecurityHelper.getAdminUserInfo().getId());
		// Task task = taskService.take(taskId, roleName);
		// taskService.take(taskId, operator);
		map.put("notifyFinalpayAssignee", roleName);// 此节点操作者
		// String startRole = "";
		// if (StringUtils.isNotBlank(startUserId)) {
		// startRole = getOneRole(Integer.parseInt(startUserId));
		// }
		map.put("hqFinFinalpayAssignee", RoleEnum.ROLE_HQ_FINANCE.getName());// 下一步操作者
		map.put(WebConstants.startUserId, startUserId);// 门店用户id
		// map.put("carOldStatus", carOldStatus);
		facets.execute(taskId, roleName, map);// 任务执行
		// 车辆出库状态变为
		Car car = new Car();
		if (StringUtils.isNotBlank(carId)) {
			car.setId(Integer.parseInt(carId));
			car.setOutStatus(CarOutStatusEnum.HAVE_NOTICE_FINALPAY.getValue());
			carMapper.updateByPrimaryKeySelective(car);
		}
	}

	/**
	 * 总部财务审核尾款
	 * <p>TODO</p>
	 * @param modelMap
	 * @param orderId
	 * @param carId
	 * @param carOldStatus
	 * @param infoId
	 * @param contractId
	 * @param taskId
	 * @param startUserId
	 * @param pass
	 * @author wangzh
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void hqFinanceFinalpayDo(ModelMap modelMap, String orderId, String carId, String carOldStatus, String infoId, String contractId, String taskId,
			String startUserId, String finalpay, String realfinalpay, String pass) {
		String roleName = getOneRole(SecurityHelper.getAdminUserInfo().getId());
		// if ("1".equals(pass)) {// 通过审核
		// hqaudit.operator
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("carId", carId);
		map.put("infoId", infoId);
		map.put("contractId", contractId);
		map.put("orderId", orderId);
		// map.put("contractId", contractId);
		// Integer logId=userInfo.getId();
		// 提取任务
		// roleName = getOneRole(SecurityHelper.getAdminUserInfo().getId());
		// Task task = taskService.take(taskId, roleName);
		// taskService.take(taskId, operator);
		map.put("hqFinFinalpayAssignee", roleName);// 此节点操作者
		// String startRole = "";
		// if (StringUtils.isNotBlank(startUserId)) {
		// startRole = getOneRole(Integer.parseInt(startUserId));
		// }
		map.put("readyOutMaterialAssignee", startUserId);// 下一步操作者
		map.put(WebConstants.startUserId, startUserId);// 门店用户id

		// map.put("carOldStatus", carOldStatus);
		// map.put("OK", "车已售");
		facets.execute(taskId, roleName, map);// 任务执行
		// 车辆出库状态变为
		Car car = new Car();
		if (StringUtils.isNotBlank(carId)) {
			car.setId(Integer.parseInt(carId));
			// car.setStatus(CarStatusEnum.SELLED.getValue());
			car.setOutStatus(CarOutStatusEnum.FINALPAY_PASS.getValue());
			car.setSaleStatus(CarSaleStatusEnum.SALE_NO_OUT.getValue());// 已购未提
			car.setSaletime(new Date());
			if (StringUtils.isNotBlank(contractId)) {
				contract contract = contractMapper.selectByPrimaryKey(Integer.parseInt(contractId));
				if (contract != null) {
					if (StringUtils.isBlank(infoId)) {
						infoId = contract.getInfoId() == null ? "" : contract.getInfoId().toString();
					}
					car.setSalePrice(contract.getSalePrice());
					contract contract1 = new contract();
					contract1.setId(contract.getId());
					// if (StringUtils.isNotBlank(finalpay))
					// contract1.setFinalpay(new BigDecimal(finalpay));
					if (StringUtils.isNotBlank(realfinalpay)) {
						contract1.setRealfinalpay(new BigDecimal(realfinalpay));
						contractMapper.updateByPrimaryKeySelective(contract1);
					}
				}
			}
			carMapper.updateByPrimaryKeySelective(car);
		}
		// 更新cif_buy购买时间
		if (StringUtils.isNotBlank(infoId)) {
			Buyer buyer = new Buyer();
			buyer.setId(Integer.parseInt(infoId));
			buyer.setBuyTime(car.getSaletime());
			buyMapper.updateByPrimaryKeySelective(buyer);
		}
	}

	/**
	 * 门店销售审核出库材料
	 * <p>TODO</p>
	 * @param modelMap
	 * @param orderId
	 * @param carId
	 * @param carOldStatus
	 * @param infoId
	 * @param contractId
	 * @param taskId
	 * @param startUserId
	 * @param pass
	 * @author wangzh
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void matieralDo(ModelMap modelMap, String orderId, String carId, String carOldStatus, String infoId, String contractId, String taskId,
			String startUserId, String pass) {
		String roleName = getOneRole(SecurityHelper.getAdminUserInfo().getId());
		// if ("1".equals(pass)) {// 通过审核
		// hqaudit.operator
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("carId", carId);
		map.put("infoId", infoId);
		map.put("contractId", contractId);
		map.put("orderId", orderId);
		// map.put("contractId", contractId);
		// Integer logId=userInfo.getId();
		// 提取任务
		// roleName = getOneRole(SecurityHelper.getAdminUserInfo().getId());
		// Task task = taskService.take(taskId, roleName);
		// taskService.take(taskId, operator);
		map.put("readyOutMaterialAssignee", roleName);// 此节点操作者
		// String startRole = "";
		// if (StringUtils.isNotBlank(startUserId)) {
		// startRole = getOneRole(Integer.parseInt(startUserId));
		// }
		map.put("settlementAssignee", RoleEnum.ROLE_HQ_FINANCE.getName());// 下一步操作者
		map.put(WebConstants.startUserId, startUserId);// 门店用户id

		// map.put("carOldStatus", carOldStatus);
		// map.put("OK", "车已售");
		facets.execute(taskId, roleName, map);// 任务执行
		// 合同内容更新
		if (StringUtils.isNotBlank(contractId)) {
			contract contract = new contract();
			contract.setId(Integer.parseInt(contractId));
			contract contract2 = contractMapper.selectByPrimaryKey(contract.getId());
			if (contract2 != null) {
				contract.setManual("1");
				contract.setCarKey("1");
				contract.setThreeBill("1");
				contract.setThreeIden("1");
				if (contract2.getInsurePrice() != null) {
					contract.setCarGuar("1");
				}
				if (contract2.getBuyTax() != null) {
					contract.setBuytaxBill("1");
				}
				if (contract2.getCardPrice() != null) {
					contract.setProductLicense("1");
					contract.setBill("1");
					contract.setCard("1");
				}
				if (contract2.getQualityguarPrice() != null) {
					contract.setQualityGuar("1");
				}
				if (contract2.getDecoratePrice() != null) {
					contract.setDelayGuar("1");
				}
				if (contract2.getDecoratePrice() != null) {
					contract.setDelayGuar("1");
				}
				contract.setOutcartime(new Date());
				contractMapper.updateByPrimaryKeySelective(contract);
			}
		}
		// 车辆出库状态变为
		Car car = new Car();
		if (StringUtils.isNotBlank(carId)) {
			car.setId(Integer.parseInt(carId));
			// car.setStatus(CarStatusEnum.SELLED.getValue());
			car.setOutStatus(CarOutStatusEnum.CLIENT_BUYCAR_HAVEGET.getValue());
			car.setSaleStatus(CarSaleStatusEnum.SELL_YES_OUT.getValue());// 已购已提
			carMapper.updateByPrimaryKeySelective(car);
		}
	}

	/**
	 * 结算do
	 * <p>TODO</p>
	 * @param modelMap
	 * @param orderId
	 * @param carId
	 * @param carOldStatus
	 * @param infoId
	 * @param contractId
	 * @param taskId
	 * @param startUserId
	 * @param pass
	 * @author wangzh
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void settlelDo(ModelMap modelMap, String orderId, String carId, String settlement, String infoId, String contractId, String taskId,
			String startUserId, String insurePricer, String buyTaxr, String cardPricer, String qualityguarPricer, String delayguarPricer, String decoratePricer) {
		String roleName = getOneRole(SecurityHelper.getAdminUserInfo().getId());
		// if ("1".equals(pass)) {// 通过审核
		// hqaudit.operator
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("carId", carId);
		map.put("infoId", infoId);
		map.put("contractId", contractId);
		map.put("orderId", orderId);
		// map.put("contractId", contractId);
		// Integer logId=userInfo.getId();
		// 提取任务
		// roleName = getOneRole(SecurityHelper.getAdminUserInfo().getId());
		// Task task = taskService.take(taskId, roleName);
		// taskService.take(taskId, operator);
		map.put("settlementAssignee", roleName);// 此节点操作者
		// String startRole = "";
		// if (StringUtils.isNotBlank(startUserId)) {
		// startRole = getOneRole(Integer.parseInt(startUserId));
		// }
		// map.put("settlementAssignee", RoleEnum.ROLE_HQ_FINANCE);// 下一步操作者
		map.put(WebConstants.startUserId, startUserId);// 门店用户id

		// map.put("carOldStatus", carOldStatus);
		// map.put("OK", "车已售");

		// 合同内容更新
		if (StringUtils.isNotBlank(contractId)) {
			contract contract = contractMapper.selectByPrimaryKey(Integer.parseInt(contractId));
			BigDecimal sp = contract.getSalePrice();
			if (sp == null) {
				throw new PortalMsBizCheckedException("车辆售价异常！");
			}
			sp = sp.multiply(new BigDecimal(1));
			contract contract2 = new contract();
			contract2.setId(Integer.parseInt(contractId));

			if (StringUtils.isNotBlank(settlement)) {
				// contract2.setSettlement(new BigDecimal(settlement));
				if (contract.getInsurePrice() != null && StringUtils.isNotBlank(insurePricer)) {
					contract2.setInsurePricer(new BigDecimal(insurePricer));
					sp = sp.add(contract2.getInsurePricer());
				}
				if (contract.getBuyTax() != null && StringUtils.isNotBlank(buyTaxr)) {
					contract2.setBuyTaxr(new BigDecimal(buyTaxr));
					sp = sp.add(contract2.getBuyTaxr());
				}
				if (contract.getCardPrice() != null && StringUtils.isNotBlank(cardPricer)) {
					contract2.setCardPricer(new BigDecimal(cardPricer));
					sp = sp.add(contract2.getCardPricer());
				}
				if (contract.getQualityguarPrice() != null && StringUtils.isNotBlank(qualityguarPricer)) {
					contract2.setQualityguarPricer(new BigDecimal(qualityguarPricer));
					sp = sp.add(contract2.getQualityguarPricer());
				}
				if (contract.getDelayguarPrice() != null && StringUtils.isNotBlank(delayguarPricer)) {
					contract2.setDelayguarPricer(new BigDecimal(delayguarPricer));
					sp = sp.add(contract2.getDelayguarPricer());
				}
				if (contract.getDecoratePrice() != null && StringUtils.isNotBlank(decoratePricer)) {
					contract2.setDecoratePricer(new BigDecimal(decoratePricer));
					sp = sp.add(contract2.getDecoratePricer());
				}
				// 结算 =（车价+以上实际费用（contract2的各种收费））-（实际定金+实际尾款）
				if (contract.getRealdownpay() != null && contract.getRealfinalpay() != null) {
					BigDecimal settle = ((contract.getRealdownpay().multiply(new BigDecimal(1))).add(contract.getRealfinalpay())).subtract(sp);// 实际收的钱-实际用的钱
					map.put("calc", settle);
					contract2.setSettlement(settle);
				}
				contractMapper.updateByPrimaryKeySelective(contract2);

				Integer outid = contract.getOutid();
				if (outid != null) {
					OutRepository out = new OutRepository();
					out.setId(outid);
					out.setStatus(1);
					outRepositoryMapper.updateByPrimaryKeySelective(out);
				}
			}
		}
		facets.execute(taskId, roleName, map);// 任务执行
	}

	/**
	 * 结算计算
	 * <p>TODO</p>
	 * @param modelMap
	 * @param infoId
	 * @param contractId
	 * @param insurePricer
	 * @param buyTaxr
	 * @param cardPricer
	 * @param qualityguarPricer
	 * @param delayguarPricer
	 * @param decoratePricer
	 * @author wangzh
	 */
	public void calcDo(ModelMap modelMap, String infoId, String contractId, String insurePricer, String buyTaxr, String cardPricer, String qualityguarPricer,
			String delayguarPricer, String decoratePricer) {
		// 合同内容更新
		if (StringUtils.isNotBlank(contractId)) {

			contract contract = contractMapper.selectByPrimaryKey(Integer.parseInt(contractId));
			contract contract2 = new contract();
			contract2.setId(contract.getId());
			BigDecimal sp = contract.getSalePrice();
			if (sp == null) {
				throw new PortalMsBizCheckedException("车辆售价异常！");
			}
			sp = sp.multiply(new BigDecimal(1));
			if (contract.getInsurePrice() != null && StringUtils.isNotBlank(insurePricer)) {
				contract2.setInsurePricer(new BigDecimal(insurePricer));
				sp = sp.add(contract2.getInsurePricer());
			}
			if (contract.getBuyTax() != null && StringUtils.isNotBlank(buyTaxr)) {
				contract2.setBuyTaxr(new BigDecimal(buyTaxr));
				sp = sp.add(contract2.getBuyTaxr());
			}
			if (contract.getCardPrice() != null && StringUtils.isNotBlank(cardPricer)) {
				contract2.setCardPricer(new BigDecimal(cardPricer));
				sp = sp.add(contract2.getCardPricer());
			}
			if (contract.getQualityguarPrice() != null && StringUtils.isNotBlank(qualityguarPricer)) {
				contract2.setQualityguarPricer(new BigDecimal(qualityguarPricer));
				sp = sp.add(contract2.getQualityguarPricer());
			}
			if (contract.getDelayguarPrice() != null && StringUtils.isNotBlank(delayguarPricer)) {
				contract2.setDelayguarPricer(new BigDecimal(delayguarPricer));
				sp = sp.add(contract2.getDelayguarPricer());
			}
			if (contract.getDecoratePrice() != null && StringUtils.isNotBlank(decoratePricer)) {
				contract2.setDecoratePricer(new BigDecimal(decoratePricer));
				sp = sp.add(contract2.getDecoratePricer());
			}
			// 结算 =（实际定金+实际尾款）-（车价+以上实际费用（contract2的各种收费））
			if (contract.getRealdownpay() != null && contract.getRealfinalpay() != null) {
				// BigDecimal settle =
				// sp.subtract(contract.getRealdownpay()).subtract(contract.getRealfinalpay());
				BigDecimal settle = ((contract.getRealdownpay().multiply(new BigDecimal(1))).add(contract.getRealfinalpay())).subtract(sp);// 实际收的钱-实际用的钱;实际支付定金单位万
				modelMap.put("calc", settle);
			}
		}
	}

	/**
	 * 查询沟通列表和总数目
	 * <p>TODO</p>
	 * @param infoId
	 * @param start
	 * @param pageSize
	 * @return
	 * @author wangzh
	 */
	public Map<String, Object> CommuLstDo(String infoId, String start, String pageSize) {
		// Integer loginId = SecurityHelper.getAdminUserInfo().getId();
		Communicate record = new Communicate();
		// record.setSellerId(loginId);
		if (StringUtils.isNotBlank(infoId))
			record.setClientId(Integer.parseInt(infoId));
		else {
			return null;
		}
		Map<String, Object> map = new HashMap<String, Object>();
		int ps = Integer.parseInt(pageSize);
		List<Communicate> lst = communicateMapper.selectByCriteria(record, new RowBounds((Integer.parseInt(start) - 1) * ps, ps));
		map.put("result", lst);
		int size = communicateMapper.countByCriteria(record);
		map.put("total", size);
		return map;
	}

	/**
	 * 获取所有品牌
	 * <p>TODO</p>
	 * @return
	 * @author wangzh
	 */
	public List<Brand> getAllBrandLst() {
		Brand brand = new Brand();
		return brandMapper.selectByCriteria(brand);
	}

	/**
	 * 插入一条沟通信息
	 * <p>TODO</p>
	 * @param sellerId
	 * @param clientId
	 * @param content
	 * @author wangzh
	 */
	public void addCommu(String sellerId, String clientId, String content) {
		Communicate c = new Communicate();
		if (StringUtils.isNotBlank(clientId))
			c.setClientId(Integer.parseInt(clientId));
		if (StringUtils.isNotBlank(sellerId))
			c.setSellerId(Integer.parseInt(sellerId));
		c.setContent(content);
		c.setCreateTime(new Date());
		communicateMapper.insert(c);
	}

	/**
	 * 插入一条沟通信息和查询列表
	 * <p>TODO</p>
	 * @param sellerId
	 * @param clientId
	 * @param content
	 * @author wangzh
	 */
	public void addCommuAndQuery(String sellerId, String clientId, String content, Map<String, Object> map) {
		Communicate c = new Communicate();
		if (StringUtils.isNotBlank(clientId))
			c.setClientId(Integer.parseInt(clientId));
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
		Communicate c1 = new Communicate();
		c1.setClientId(c.getClientId());
		// c1.setSellerId(c.getSellerId());
		List<Communicate> lst = communicateMapper.selectByCriteria(c1, new RowBounds(0, 10));
		int total = communicateMapper.countByCriteria(c1);
		map.put("result", lst);
		map.put("total", total);
	}

	/**
	 * 根据主键获取要修改的客户
	 * <p>TODO</p>
	 * @param id
	 * @return
	 * @author wangzh
	 */
	@SuppressWarnings("unchecked")
	public void getEditClient(String id, ModelMap map) {
		if (StringUtils.isNotBlank(id)) {
			Buyer buyer = buyMapper.selectByPrimaryKey(Integer.parseInt(id));
			/**查询是否走到了合同，若是则表明已经进入审批流程，根据本人对业务的目前理解，思路为：客户信息档案编号和合同的档案编号是一一对应的
			走到了合同，合同中对应的车辆状态可能会解锁（换车的情况下）、若不换车则会是在流程中等待下一步的审批，无论是2种中的哪一种，都不能偷偷在流程外
			（就是这里的修改，这里换车的情况是本来客户表中就是G，然后操作员又切换radio又变成了G，这样就会跳出选车界面就可以换车了）进行
			额外的换车！
			并且若换车的话，不止在信息表中修改carId，还要到合同中去修改carId和车架号；前面部分说的是不合理后面部分说的是又麻烦，于情于理；
			并且一般情况是填完信息表就到合同的新增页面，若编辑信息表并且它又有对应合同，那么这一步就是编辑合同还是新增合同？编辑合同不合理，因为不知道流程下面流程已经审批
			到哪一步了，随便编辑不规范；新增合同？也不合理：这样就不是一一对应的关系了，多个合同对应同一个信息表的档案编号和id，到底取哪一个合同？取最新的合同？
			最后得出结论：只要是信息表已经走到了合同保存了这一步，就不能改动客户级别！
			*/
			List<Abrand> brand = brandAndModelService.queryBrandinitial();// 查询所有品牌首字母
			map.put("brand", brand);
			Abrand lst = brandAndModelService.queryId(buyer.getWantBrand());// 根据品牌查询品牌id
			if (lst != null) {
				List<Map<String, Object>> model = brandAndModelService.queryByBrandidModel(lst.getBrandid());// 根据品牌id查询所有型号
				map.put("model", model);
				/*
				 * if (model.size()>0) { for (Map<String, Object> map1 : model) { for (String map2 :
				 * map1.keySet()) { String model1=null; model1= map1.get(map2).toString();
				 * List<Map<String, Object>>
				 * version=brandAndModelService.queryVersion(model1);//根据型号查询版别 map.put("version",
				 * version); } } }else{ map.put("version", null); }
				 */
			} else {
				map.put("model", null);
			}
			List<Map<String, Object>> version = brandAndModelService.queryVersion(buyer.getWantcar());
			if (version.size() > 0) {
				map.put("version", version);
			} else {
				map.put("version", null);
			}

			map.put("buyer", buyer);
			Map<String, Object> pMap = (Map<String, Object>) CachFactory.getInstance().get(Constants.MASTER_DATA_LIST);
			Map<String, Object> priceLst = (Map<String, Object>) pMap.get(MasterDataType.PRICE.getValue());// 价格
			map.put("priceLst", priceLst);
			// 获取品牌
			List<Brand> brandLst = getAllBrandLst();
			map.put("brandLst", brandLst);
			if (buyer.getShopId() != null) {
				Shop shop = shopMapper.selectByPrimaryKey(buyer.getShopId());
				map.put("shop", shop);
			}
			if (StringUtils.isNotBlank(buyer.getClientLevel()) && "G".equals(buyer.getClientLevel())) {// 本来就是G级别了
				Integer clientId = buyer.getId();
				contract contract = new contract();
				contract.setInfoId(clientId);
				int size = contractMapper.countByCriteria(contract);
				if (size > 0) {// 然后又有合同
					map.put("editstatus", "0");
				}
			}
		}
	}

	@SuppressWarnings("unchecked")
	public void getViewAllClient(String id, ModelMap map) {
		if (StringUtils.isNotBlank(id)) {
			Buyer buyer = buyMapper.selectByPrimaryKey(Integer.parseInt(id));
			map.put("buyer", buyer);
			Map<String, Object> pMap = (Map<String, Object>) CachFactory.getInstance().get(Constants.MASTER_DATA_LIST);
			Map<String, Object> priceLst = (Map<String, Object>) pMap.get(MasterDataType.PRICE.getValue());// 价格
			map.put("priceLst", priceLst);
			// 获取品牌
			List<Brand> brandLst = getAllBrandLst();
			map.put("brandLst", brandLst);
			if (buyer.getShopId() != null) {
				Shop shop = shopMapper.selectByPrimaryKey(buyer.getShopId());
				map.put("shop", shop);
			}
			// if (StringUtils.isNotBlank(buyer.getClientLevel()) &&
			// "G".equals(buyer.getClientLevel())) {// 本来就是G级别了
			// Integer clientId = buyer.getId();
			// contract contract = new contract();
			// contract.setInfoId(clientId);
			// int size = contractMapper.countByCriteria(contract);
			// if (size > 0) {// 然后又有合同
			// map.put("editstatus", "0");
			// }
			// }
		}
	}

	/**
	 * <p>分页查询录入客户信息的列表和总数</p>
	 * @param dto
	 * @param start
	 * @param pageSize
	 * @return
	 * @author wangzh
	 */
	public Map<String, Object> clientFindListDo(ClientInfoDto dto, String start, String pageSize) {
		Buyer buyer = new Buyer();
		Map<String, Object> map = new HashMap<String, Object>();
		buyer.setName(dto.getName());
		buyer.setClientLevel(dto.getClientLevel());
		buyer.setPhone(dto.getPhone());
		UserDTO userInfo = SecurityHelper.getAdminUserInfo();

		Collection<GrantedAuthority> as = userInfo.getAuthorities();
		boolean ismanager = false;

		for (Iterator<GrantedAuthority> iterator = as.iterator(); iterator.hasNext();) {
			GrantedAuthority grantedAuthority = (GrantedAuthority) iterator.next();
			if ("ROLE_SHOP_MANAGER".equals(grantedAuthority.toString())) {// ROLE_SHOP_MANAGER：店长角色
				ismanager = true;
				break;
			}
		}
		if (ismanager) {
			if (StringUtils.isNotBlank(userInfo.getShop()))
				buyer.setShopId(Integer.parseInt(userInfo.getShop()));
		} else {
			buyer.setSellerId(userInfo.getId());
		}
		buyer.setWorkType(dto.getWorkType());
		if (StringUtils.isNotBlank(dto.getComeshopTime()))
			buyer.setComeshopTime(DateUtils.parse(dto.getComeshopTime(), DateUtils.DEFAULT_DATE_FORMAT_DEFAULT));
		int ps = Integer.parseInt(pageSize);
		List<Buyer> lst = buyMapper.selectByCriterialike(buyer, new RowBounds((Integer.parseInt(start) - 1) * ps, ps));
		if (lst != null && lst.size() > 0) {
			Shop sp = null;

			if (StringUtils.isNotBlank(userInfo.getShop())) {
				sp = queryShopById(Integer.parseInt(userInfo.getShop()));
			}
			if (sp != null) {
				HashMap<Integer, String> map2 = new HashMap<Integer, String>();
				if (ismanager)

				{
					Set<Integer> set = new HashSet<Integer>();

					for (int i = 0; i < lst.size(); i++) {
						Integer temp = lst.get(i).getSellerId();
						set.add(temp);
					}

					List<Integer> users = new ArrayList<Integer>(set);
					List<User> lstUsers = userMapper.selectByIds(users);
					for (Iterator<User> iterator = lstUsers.iterator(); iterator.hasNext();) {
						User user = (User) iterator.next();
						map2.put(user.getId(), user.getName());
					}

				}
				for (int i = 0; i < lst.size(); i++) {
					lst.get(i).setShopName(sp.getName());
					if (ismanager) {
						lst.get(i).setSellerName(map2.get(lst.get(i).getSellerId()));
					} else {
						lst.get(i).setSellerName(userInfo.getName());
					}
				}
			}
		}

		map.put("result", lst);
		int size = buyMapper.countByCriterialike(buyer);
		map.put("total", size);
		return map;
	}

	/**
	 * <p>分页查询录入客户信息的列表和总数--总览</p>
	 * @param dto
	 * @param start
	 * @param pageSize
	 * @return
	 * @author wangzh
	 */
	public Map<String, Object> clientFindListAllDo(ClientInfoDto dto, String start, String pageSize) {
		Map<String, Object> map = new HashMap<String, Object>();
		int ps = Integer.parseInt(pageSize);
		Map<String, Object> paramMap = new HashMap<String, Object>();
		if (StringUtils.isNotBlank(dto.getName())) {
			paramMap.put("name", dto.getName());
		}
		if (StringUtils.isNotBlank(dto.getClientLevel())) {
			paramMap.put("clientLevel", dto.getClientLevel());
		}
		if (StringUtils.isNotBlank(dto.getPhone())) {
			paramMap.put("phone", dto.getPhone());
		}
		if (StringUtils.isNotBlank(dto.getWorkType())) {
			paramMap.put("workType", dto.getWorkType());
		}
		if (StringUtils.isNotBlank(dto.getShopId())) {
			paramMap.put("shopId", dto.getShopId());
		}
		if (StringUtils.isNotBlank(dto.getComeshopTime())) {
			paramMap.put("comeshopTime", dto.getComeshopTime());
		}
		paramMap.put("pageStart", (Integer.parseInt(start) - 1) * ps);
		paramMap.put("pageSize", Integer.parseInt(pageSize));
		List<Buyer> lst = buyMapper.selectByCriterialikeForShop(paramMap);
		map.put("result", lst);
		int size = buyMapper.countByCriterialikeForShop(paramMap);
		map.put("total", size);
		return map;
	}

	/**
	 * 保存录入的客户信息
	 * <p>TODO</p>
	 * @author tup
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void saveClients(ClientInfoDto dto) throws IOException {
		Buyer buyer = new Buyer();
		// Communicate com = new Communicate();
		buyer.setFilenum(dto.getFilenum());
		// buyer.setShopId(etShopId());
		buyer.setName(dto.getName());
		buyer.setIdentify(dto.getIdentify());
		buyer.setPhone(dto.getPhone());
		buyer.setWorkType(dto.getWorkType());
		buyer.setCompanyName(dto.getCompanyName());
		buyer.setCompanyAddress(dto.getCompanyAddress());
		buyer.setHomeAddress(dto.getHomeAddress());
		buyer.setPostcode(dto.getPostcode());
		buyer.setCreateTime(new Date());
		if (StringUtils.isNotBlank(dto.getComeshopTime()))
			buyer.setComeshopTime(DateUtils.parse(dto.getComeshopTime(), DateUtils.DEFAULT_DATE_FORMAT_DEFAULT));
		else {
			buyer.setComeshopTime(null);
		}
		buyer.setWantcar(dto.getWantcar());
		buyer.setNowCar(dto.getNowCar());
		buyer.setColor(dto.getColor());
		buyer.setWantBrand(dto.getWantBrand());
		buyer.setHeartPrice(dto.getHeartPrice());
		buyer.setOldIntroduce(dto.getOldIntroduce());
		buyer.setHaveCard(dto.getHaveCard());
		buyer.setBizLicense(buyer.getBizLicense());
		if (StringUtils.isNotBlank(dto.getClientLevel())) {
			buyer.setClientLevel(dto.getClientLevel());
		}
		buyMapper.insertSelective(buyer);
	}

	/**
	 * 新增以及修改客户信息表
	 * <p>TODO</p>
	 * @param dto
	 * @param type 1新增2修改
	 * @author wangzh
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public String UpdateSaveClients(ClientInfoDto dto, String type, String shopName, ModelMap map) {
		String flag = "";
		if (StringUtils.isNotBlank(type)) {
			Integer loginId = SecurityHelper.getAdminUserInfo().getId();
			// 保存信息表2017款 Sportback 35TFSI 进取型220
			Buyer buyer = new Buyer();
			if (StringUtils.isNotBlank(dto.getId()))
				buyer.setId(Integer.parseInt(dto.getId()));
			if (StringUtils.isNotBlank(dto.getShopId()))
				buyer.setShopId(Integer.parseInt(dto.getShopId()));
			buyer.setName(dto.getName());
			buyer.setIdentify(dto.getIdentify());
			buyer.setPhone(dto.getPhone());
			buyer.setCompanyName(dto.getCompanyName());
			buyer.setBizLicense(dto.getBizLicense());
			buyer.setWantcar(dto.getWantcar());
			buyer.setNowCar(dto.getNowCar());
			buyer.setColor(dto.getColor());
			buyer.setVersion(dto.getVersion());
			buyer.setWantBrand(dto.getWantBrand());
			buyer.setHeartPrice(dto.getHeartPrice());
			buyer.setOldIntroduce(dto.getOldIntroduce());
			buyer.setHaveCard(dto.getHaveCard());
			buyer.setClientLevel(dto.getClientLevel());
			buyer.setPrincipal(dto.getPrincipal());
			if ("1".equals(type)) {// 新增
				if ("G".equals(dto.getClientLevel())) {// 立即购买
					if (StringUtils.isBlank(dto.getCarId())) {
						throw new PortalMsBizCheckedException("未成功选择车辆，请重新进行选择！");
					} else {
						flag = "1";// 新增直接选G客户级别
						buyer.setCarId(Integer.parseInt(dto.getCarId()));
						map.put("shopId", dto.getShopId());
						map.put("carId", dto.getCarId());
						map.put("shopName", shopName);
						map.put("infoId", dto.getId());
						map.put("infoNum", dto.getFilenum());
						Car car = carMapper.selectByPrimaryKey(buyer.getCarId());
						if (StringUtils.isNotBlank(car.getAddress())) {// 保存的是仓库的主键
							Store store = storeMapper.selectByPrimaryKey(Integer.parseInt(car.getAddress()));
							if (store != null)
								// car.setAddress(store.getAddress());// 临时转换为地址供查看用
								car.setAddress(store.getName());// 临时转换为地址供查看用 存的是仓库名称
						}
						// 根据调价表查询价格，若无调价则取车辆表最低价
						// getAdjustPriceByCar(car);////////////////////888888888888888888888888888888888
						map.put("car", car);
					}
				} else {// 不是立即购买
					flag = "2";// 新增没选或选了其他的客户级别
				}
				buyer.setFilenum(dto.getFilenum());
				buyer.setWorkType(dto.getWorkType());
				if (StringUtils.isNotBlank(dto.getComeshopTime()))
					buyer.setComeshopTime(DateUtils.parse(dto.getComeshopTime(), DateUtils.DEFAULT_DATE_FORMAT_DEFAULT));
				buyer.setSellerId(loginId);
				buyMapper.insertSelectiveWithKey(buyer);
			} else {// 修改
				if ("G".equals(dto.getClientLevel())) {// 立即购买
					if (StringUtils.isBlank(dto.getCarId())) {
						throw new PortalMsBizCheckedException("未成功选择车辆，请重新进行选择！");
					} else {
						flag = "1";// 新增直接选G客户级别
						buyer.setCarId(Integer.parseInt(dto.getCarId()));
						map.put("shopId", dto.getShopId());
						map.put("carId", dto.getCarId());
						map.put("shopName", shopName);
						map.put("infoId", dto.getId());
						map.put("infoNum", dto.getFilenum());
						Car car = carMapper.selectByPrimaryKey(buyer.getCarId());
						if (StringUtils.isNotBlank(car.getAddress())) {// 保存的是仓库的主键
							Store store = storeMapper.selectByPrimaryKey(Integer.parseInt(car.getAddress()));
							if (store != null)
								// car.setAddress(store.getAddress());// 临时转换为地址供查看用
								car.setAddress(store.getName());// 临时转换为地址供查看用 存的是仓库名称
						}
						getAdjustPriceByCar(car);
						map.put("car", car);
					}
				} else {// 不是立即购买
					flag = "2";// 新增没选或选了其他的客户级别
					// 查看这个信息表之前若是G的情况下有没有保存关联车，若有则去掉关联
					Buyer buyer2 = buyMapper.selectByPrimaryKey(buyer.getId());
					if ("G".equals(buyer2.getClientLevel()) && buyer2.getCarId() != null) {
						buyMapper.unlockCarId(buyer.getId());
					}
				}
				// buyer.setFilenum(dto.getFilenum());
				// buyer.setWorkType(dto.getWorkType());
				buyer.setShopId(null);
				buyer.setFilenum(null);
				if (StringUtils.isNotBlank(dto.getComeshopTime()))
					buyer.setComeshopTime(DateUtils.parse(dto.getComeshopTime(), DateUtils.DEFAULT_DATE_FORMAT_DEFAULT));
				// buyer.setSellerId(loginId);
				buyMapper.updateByPrimaryKeySelective(buyer);
			}
		} else {
			throw new PortalMsBizCheckedException("缺少新增或者修改标示！");
		}
		return flag;
	}

	// 根据调价表查询价格，若无调价则默认取车辆表最低价
	public void getAdjustPriceByCar(Car car) {
		String _shop = SecurityHelper.getAdminUserInfo().getShop();
		if (StringUtils.isNotBlank(_shop) && car != null) {
			Shop sp = queryShopById(Integer.parseInt(_shop));
			String brand = car.getBrand();
			String model = car.getModel();
			String vin = car.getVin();
			String cityName = sp.getCity();
			PriceCity pc = new PriceCity();
			pc.setVin(vin);
			pc.setType("2");
			pc.setCityName(cityName);
			List<PriceCity> pcLst = priceCityMapper.selectByCriteria(pc);
			if (pcLst != null && pcLst.size() > 0) {
				PriceCity pc2 = pcLst.get(0);
				BigDecimal pri = pc2.getPrice();
				if (pri != null) {
					car.setLowPrice(pri);
				}
			} else {
				pc.setVin(null);
				pc.setBrand(brand);
				pc.setModel(model);
				pc.setType("1");
				List<PriceCity> pcLst1 = priceCityMapper.selectByCriteria(pc);
				if (pcLst1 != null && pcLst1.size() > 0) {
					PriceCity pc2 = pcLst1.get(0);
					BigDecimal pri = pc2.getPrice();
					if (pri != null) {
						car.setLowPrice(pri);
					}
				}
			}
		}
	}

	/**
	 * 批量导入车辆
	 * <p>TODO</p>
	 * @param lst
	 * @author wangzh
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void batchCarTypein(List<Car> lst) {
		for (int i = 0; i < lst.size(); i++) {
			carMapper.insertSelective(lst.get(i));
		}
	}

	/**
	 * 调价之前检查excel有效性
	 * @param datas
	 * @param headers
	 * @param type 1车型 2车架号
	 * @return
	 * @author wangzh
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> checkAdjustPrice(String[][] datas, String[] headers, int type) {
		// 处理表头、第二行车型或车架号
		String[] data2 = datas[0];// 获取第二行
		Map<String, Object> returnMap = new HashMap<String, Object>();
		Map<Integer, String> coMap = new HashMap<Integer, String>();
		int co = 0;
		for (int i = 6; i < headers.length; i++) {// 从G列第6列开始
			String h = headers[i];
			String d = data2[i];
			if (StringUtils.isNotBlank(h) && StringUtils.isNotBlank(d)) {// 头必须有值，列也有值的情况下
				if (1 == type) {// 按车型
					if (h.contains("车型")) {
						if (d.contains("*")) {
							String[] bm = d.split("\\*");
							if (bm.length == 2) {
								String br = bm[0];
								String mo = bm[1];
								Car car = new Car();
								car.setBrand(br);
								car.setModel(mo);
								int size = carMapper.countByParam(car);
								if (size < 1) {
									throw new PortalMsBizCheckedException("第二行，第" + (i + 1) + "列，不存在品牌[" + br + "]、型号[" + mo + "]的车型");
								}
								co++;
								returnMap.put(d, new HashMap<PriceCity, String>());
								if (co != returnMap.size()) {
									throw new PortalMsBizCheckedException("第二行，第" + (i + 1) + "列[" + d + "]重复");
								}
								coMap.put(i, d);
							} else {
								throw new PortalMsBizCheckedException("第二行，第" + (i + 1) + "列，车型格式错误，正确格式为：品牌*型号");
							}
						} else {
							throw new PortalMsBizCheckedException("第二行，第" + (i + 1) + "列，车型格式错误，正确格式为：品牌*型号");
						}
					} else {
						throw new PortalMsBizCheckedException("第一行，第" + (i + 1) + "列，必须包含\"车型\"字符串");
					}
				} else if (2 == type) {// 按车架号
					if (h.contains("车架号")) {
						if (!d.contains("*")) {
							Car car = new Car();
							car.setVin(d);
							int size = carMapper.countByParam(car);
							if (size < 1) {
								throw new PortalMsBizCheckedException("第二行，第" + (i + 1) + "列，不存在车架号[" + d + "]的车");
							}
							co++;
							returnMap.put(d, new HashMap<PriceCity, String>());
							if (co != returnMap.size()) {
								throw new PortalMsBizCheckedException("第二行，第" + (i + 1) + "列[" + d + "]重复");
							}
							coMap.put(i, d);
						} else {
							throw new PortalMsBizCheckedException("第二行，第" + (i + 1) + "列，车架号不能有*");
						}
					} else {
						throw new PortalMsBizCheckedException("第一行，第" + (i + 1) + "列，必须包含\"车架号\"字符串");
					}
				}
			}
		}
		// 检查从第三行开始的datas
		Pattern pattern = Pattern.compile("^(([1-9]{1}\\d*)|([0]{1}))((\\.(\\d){1,2}))?$");// 检查保留最多2位小数
		Pattern pattern1 = Pattern.compile("^[01]{1}$");// 检查保留最多2位小数
		for (int i = 1, len = datas.length; i < len; i++) {// 从datas第2条开始
			String[] row = datas[i];
			if (StringUtils.isNotBlank(row[0]) && StringUtils.isNotBlank(row[1]) && StringUtils.isNotBlank(row[2])) {// 有序号、省ID、市ID就认为是一行
				if (StringUtils.isNotBlank(row[5]) && pattern1.matcher(row[5]).matches()) {
					if ("1".equals(row[5])) {
						for (int j = 6; j < row.length; j++) {
							String pri = row[j];
							String d = coMap.get(j);
							Map<PriceCity, String> mm = (Map<PriceCity, String>) returnMap.get(d);
							if (StringUtils.isNotBlank(pri)) {
								if (pattern.matcher(pri).matches()) {
									PriceCity pc = new PriceCity();
									pc.setPro(row[1]);
									pc.setCity(row[2]);
									pc.setProName(row[3]);
									pc.setCityName(row[4]);
									mm.put(pc, pri);
								} else {
									throw new PortalMsBizCheckedException("第" + (i + 2) + "行，第" + (j + 1) + "列，格式错误（要求整数或小数并且最多2位小数）");
								}
							}
						}
					}
				} else {
					throw new PortalMsBizCheckedException("excel列[启动（1:是 0:否）]必填且只能填0或1");
				}
			} else {
				break;// 不满足就终止循环
			}
		}
		return returnMap;
	}

	/**
	 * 开始调价 
	 * @param map
	 * @param type
	 * @return
	 * @author wangzh
	 */
	@SuppressWarnings("unchecked")
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void AdjustPriceDo(Map<String, Object> map, int type) {
		Date now = new Date();
		if (1 == type) {// 型号
			for (Iterator<String> iterator = map.keySet().iterator(); iterator.hasNext();) {
				String k = (String) iterator.next();
				if (StringUtils.isNotBlank(k) && k.contains("*")) {
					String[] k2 = k.split("\\*");
					Map<String, String> params = new HashMap<String, String>();
					params.put("brand", k2[0]);
					params.put("model", k2[1]);
					params.put("type", "1");
					priceCityMapper.deleteByParams(params);
					Map<PriceCity, String> mm = (Map<PriceCity, String>) map.get(k);
					for (Iterator<Entry<PriceCity, String>> iterator2 = mm.entrySet().iterator(); iterator2.hasNext();) {
						Entry<PriceCity, String> entry = iterator2.next();
						PriceCity pc = entry.getKey();
						pc.setType("1");
						pc.setBrand(k2[0]);
						pc.setModel(k2[1]);
						pc.setCreateTime(now);
						if (StringUtils.isNotBlank(entry.getValue())) {
							pc.setPrice(new BigDecimal(entry.getValue()));
							priceCityMapper.insertSelective(pc);
						}
					}
				}
			}
		} else if (2 == type) {
			for (Iterator<String> iterator = map.keySet().iterator(); iterator.hasNext();) {
				String k = (String) iterator.next();
				if (StringUtils.isNotBlank(k) && !k.contains("*")) {
					Map<String, String> params = new HashMap<String, String>();
					params.put("vin", k);
					params.put("type", "2");
					priceCityMapper.deleteByParams(params);
					Map<PriceCity, String> mm = (Map<PriceCity, String>) map.get(k);
					for (Iterator<Entry<PriceCity, String>> iterator2 = mm.entrySet().iterator(); iterator2.hasNext();) {
						Entry<PriceCity, String> entry = iterator2.next();
						PriceCity pc = entry.getKey();
						pc.setType("2");
						pc.setVin(k);
						pc.setCreateTime(now);
						if (StringUtils.isNotBlank(entry.getValue())) {
							pc.setPrice(new BigDecimal(entry.getValue()));
							priceCityMapper.insertSelective(pc);
						}
					}
				}
			}
		}
	}

	/**
	 * <p>导出excel真实可售修改</p>
	 * @param dto
	 * @return
	 * @author wangzh
	 */
	public Workbook exportExcelForRealsaleEdit(CarTypeinDto dto) {
		Car car = new Car();
		List<Store> storeLst = queryAllStore();
		car.setIsStored(StoreStatusEnum.HAVESTORE.getValue());// 查询状态为1的记录 审核通过已入库
		car.setVin(dto.getVin());
		car.setBrand(dto.getBrand());
		car.setModel(dto.getModel());
		car.setAddress(dto.getAddress());
		car.setRealSale(1);// 1表示可销售车辆信息
		car.setOutStatus(66);// outStatus为null值
		car.setSaleStatus(66);// saleStatus为null
		if (StringUtils.isNotBlank(dto.getStatus())) {
			int st = Integer.parseInt(dto.getStatus());
			car.setStatus(st);
		}
		if (StringUtils.isNotBlank(dto.getLeaveFactoryTime())) {
			car.setLeaveFactoryTime(DateUtils.parse(dto.getLeaveFactoryTime(), DateUtils.DEFAULT_DATE_FORMAT_DEFAULT));
		}

		List<Car> lst = carMapper.selectByCriteria(car);
		// map.put("result", lst);

		// public static Workbook createWorkBook(List<Map<String, Object>> list, String[] keys,
		// String columnNames[]) {
		// 创建excel工作簿
		Workbook wb = new HSSFWorkbook();
		// 创建第一个sheet（页），并命名
		Sheet sheet = wb.createSheet("真实可售车辆");
		// 设置列名
		String[] columnNames = { "品牌", "型号", "车架号", "发动机号", "长宽高", "排量", "综合油耗", "排放", "整体质量", "外观颜色", "内饰颜色", "车身级别", "变速箱", "能源类型", "出厂日期", "采购价", "最低销售价",
				"经销商名称", "仓库", "加装", "真实可售" };
		// 手动设置列宽。第一个参数表示要为第几列设；，第二个参数表示列的宽度，n为列高的像素数。
		for (int i = 0; i < columnNames.length; i++) {
			sheet.setColumnWidth((short) i, (short) (256 * 28));
		}

		// 创建第一行
		Row row0 = sheet.createRow((short) 0);

		// 创建两种单元格格式
		CellStyle cs = wb.createCellStyle();
		CellStyle cs2 = wb.createCellStyle();

		// 创建两种字体
		Font f = wb.createFont();
		Font f2 = wb.createFont();

		// 创建第一种字体样式（用于列名）
		f.setFontHeightInPoints((short) 10);
		f.setColor(IndexedColors.BLACK.getIndex());
		f.setBoldweight(Font.BOLDWEIGHT_BOLD);

		// 创建第二种字体样式（用于值）
		f2.setFontHeightInPoints((short) 10);
		f2.setColor(IndexedColors.BLACK.getIndex());

		// Font f3=wb.createFont();
		// f3.setFontHeightInPoints((short) 10);
		// f3.setColor(IndexedColors.RED.getIndex());

		// 设置第一种单元格的样式（用于列名）
		cs.setFont(f);
		cs.setBorderLeft(CellStyle.BORDER_THIN);
		cs.setBorderRight(CellStyle.BORDER_THIN);
		cs.setBorderTop(CellStyle.BORDER_THIN);
		cs.setBorderBottom(CellStyle.BORDER_THIN);
		cs.setAlignment(CellStyle.ALIGN_CENTER);

		// 设置第二种单元格的样式（用于值）
		cs2.setFont(f2);
		cs2.setBorderLeft(CellStyle.BORDER_THIN);
		cs2.setBorderRight(CellStyle.BORDER_THIN);
		cs2.setBorderTop(CellStyle.BORDER_THIN);
		cs2.setBorderBottom(CellStyle.BORDER_THIN);
		cs2.setAlignment(CellStyle.ALIGN_CENTER);

		for (int i = 0; i < columnNames.length; i++) {
			Cell cell = row0.createCell(i);
			if (i == 14) {
				cell.setCellType(Cell.CELL_TYPE_STRING);
			}
			cell.setCellValue(columnNames[i]);
			cell.setCellStyle(cs);
		}
		// 设置每行每列的值
		for (short i = 0; i < lst.size(); i++) {
			// Row 行,Cell 方格 , Row 和 Cell 都是从0开始计数的
			// 创建一行，在页sheet上
			Row row = sheet.createRow(i + 1);
			// 在row行上创建一个方格
			// for (short j = 0; j < keys.length; j++) {
			// Cell cell = row1.createCell(j);
			// cell.setCellValue(list.get(i).get(keys[j]) == null ? " " :
			// list.get(i).get(keys[j]).toString());
			// cell.setCellStyle(cs2);
			// }
			Car tempCar = lst.get(i);
			Cell cell0 = row.createCell(0);
			cell0.setCellStyle(cs2);
			cell0.setCellValue(tempCar.getBrand());

			Cell cell1 = row.createCell(1);
			cell1.setCellStyle(cs2);
			cell1.setCellValue(tempCar.getModel());

			Cell cell2 = row.createCell(2);
			cell2.setCellStyle(cs2);
			cell2.setCellValue(tempCar.getVin());

			Cell cell3 = row.createCell(3);
			cell3.setCellStyle(cs2);
			cell3.setCellValue(tempCar.getEngineNum());

			Cell cell4 = row.createCell(4);
			cell4.setCellStyle(cs2);
			cell4.setCellValue(tempCar.getLenWidHei());

			Cell cell5 = row.createCell(5);
			cell5.setCellStyle(cs2);
			cell5.setCellValue(tempCar.getDisplacement());

			Cell cell6 = row.createCell(6);
			cell6.setCellStyle(cs2);
			cell6.setCellValue(tempCar.getOilWear());

			Cell cell7 = row.createCell(7);
			cell7.setCellStyle(cs2);
			cell7.setCellValue(tempCar.getDischarge());

			Cell cell8 = row.createCell(8);
			cell8.setCellStyle(cs2);
			cell8.setCellValue(tempCar.getWeight());

			Cell cell9 = row.createCell(9);
			cell9.setCellStyle(cs2);
			cell9.setCellValue(tempCar.getOutlookColor());

			Cell cell10 = row.createCell(10);
			cell10.setCellStyle(cs2);
			cell10.setCellValue(tempCar.getInnerColor());

			Cell cell11 = row.createCell(11);
			cell11.setCellStyle(cs2);
			cell11.setCellValue(tempCar.getLevel());

			Cell cell12 = row.createCell(12);
			cell12.setCellStyle(cs2);
			cell12.setCellValue(tempCar.getGearbox());

			Cell cell13 = row.createCell(13);
			cell13.setCellStyle(cs2);
			String str = tempCar.getEnergyType();
			if ("汽油".equals(str)) {
				cell13.setCellValue("1");
			} else if ("纯电动".equals(str)) {
				cell13.setCellValue("2");
			} else if ("油电混合".equals(str)) {
				cell13.setCellValue("3");
			}

			Cell cell14 = row.createCell(14);
			cell14.setCellStyle(cs2);
			cell14.setCellType(Cell.CELL_TYPE_STRING);
			cell14.setCellValue(tempCar.getLeaveFactoryTime() == null ? null : DateUtils.formate(tempCar.getLeaveFactoryTime(),
					DateUtils.DEFAULT_DATE_FORMAT_DEFAULT));

			Cell cell15 = row.createCell(15);
			cell15.setCellStyle(cs2);
			cell15.setCellValue(tempCar.getBuyPrice() == null ? null : tempCar.getBuyPrice().toString());

			Cell cell16 = row.createCell(16);
			cell16.setCellStyle(cs2);
			cell16.setCellValue(tempCar.getLowPrice() == null ? null : tempCar.getLowPrice().toString());

			Cell cell17 = row.createCell(17);
			cell17.setCellStyle(cs2);
			cell17.setCellValue(tempCar.getBuyName());

			Cell cell18 = row.createCell(18);
			cell18.setCellStyle(cs2);
			if (StringUtils.isNotBlank(tempCar.getAddress())) {
				for (int j = 0; j < storeLst.size(); j++) {
					if (tempCar.getAddress().equals(storeLst.get(j).getId().toString())) {
						cell18.setCellValue(storeLst.get(j).getName());
						break;
					}
				}
			}

			Cell cell19 = row.createCell(19);
			cell19.setCellStyle(cs2);
			cell19.setCellValue(tempCar.getDecorate());

			Cell cell20 = row.createCell(20);
			cell20.setCellStyle(cs2);
			cell20.setCellValue(tempCar.getRealSale());
		}
		return wb;

	}

	/**
	 * <p>根据车架号修改realsale为1的车辆</p>
	 * @param lst
	 * @author wangzh
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void batchRealsaleEdit(List<Car> lst) {
		for (int i = 0; i < lst.size(); i++) {
			if (StringUtils.isNotBlank(lst.get(i).getVin())) {
				carMapper.updateByVinForRealsale(lst.get(i));
			}
		}
	}
}
