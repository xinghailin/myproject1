package com.yyq.car.portal.ms.app.service;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.ParseException;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.yyq.car.portal.common.dto.KrcarDTO;
import com.yyq.car.portal.common.dto.UserDTO;
import com.yyq.car.portal.common.exception.PortalBizCheckedException;
import com.yyq.car.portal.common.mapper.kr.KrcarMapper;
import com.yyq.car.portal.common.mapper.kr.KrpoolMapper;
import com.yyq.car.portal.common.mapper.product.flowschemeMapper;
import com.yyq.car.portal.common.model.kr.Krcar;
import com.yyq.car.portal.common.model.kr.Krpool;
import com.yyq.car.portal.common.service.security.SecurityHelper;
import com.yyq.car.portal.common.util.DateUtils;
import com.yyq.car.portal.ms.web.util.UUIDTool;


/**
 * <P>北汽金融Service</P>
 * @author liang
 */
@Service
public class KrCarService {

	@Autowired
	private KrcarMapper krcarMapper;

	@Autowired
	private KrpoolMapper krpoolMapper;
	@Autowired
	private flowschemeMapper flowschemeMapper;

	private Logger log = LoggerFactory.getLogger(KrCarService.class);

	/**
	 * 保存录入的车辆
	 * <p>TODO</p>
	 * @author liliang
	 */
	// @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED,
	// rollbackFor = Exception.class)
	public Map<String, Object> saveCar(Krcar car) throws IOException {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", "保存失败了。。");
		returnMap.put("rescode", "0");
		// Krcar record = new Krcar();
		// record.setVin(car.getVin());
		// List<Krcar> carlist= krcarMapper.selectByCriteria(record);
		int count = krcarMapper.countinpool(car.getVin());// 不为3（审核不通过）的车辆
		if (count > 0) {
			returnMap.put("result", "保存失败了。VIN有重复");
			returnMap.put("rescode", "0");
		} else {
			car.setId(UUIDTool.getUUID());
			UserDTO userDTO = SecurityHelper.getAdminUserInfo();
			if (userDTO == null) {
				throw new PortalBizCheckedException("SecurityContextHolder.getContext().getAuthentication()为空");
			}
			car.setCreator(userDTO.getId().toString());
			car.setCreatetime(new Date());// 记录创建时间
			car.setBatnum(1);// 北汽的 批次
			krcarMapper.insertSelective(car);
			returnMap.put("result", "保存成功！");
			returnMap.put("rescode", "1");
		}
		return returnMap;
	}

	/**
	* 库容车 查看list
	* <p>TODO</p>
	* @param KrcarDTO
	* @param start
	* @param pageSize
	* @return
	* @author liliang
	 * @throws Exception 
	*/
	public Map<String, Object> lookByParameter(KrcarDTO dto, String start, String pageSize, int batnum) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		int ps = Integer.parseInt(pageSize);
		Krcar entity = new Krcar();
		if (StringUtils.isNotBlank(dto.getIntime())) {
			entity.setIntime(DateUtils.parse(dto.getIntime(), DateUtils.DEFAULT_DATE_FORMAT_DEFAULT));
		}
		entity.setBatnum(batnum);
		if (StringUtils.isNotBlank(dto.getStatus())) {
			entity.setStatus(Integer.valueOf(dto.getStatus()));
		}
		entity.setBrand(dto.getBrand());
		entity.setModel(dto.getModel());
		entity.setVersion(dto.getVersion());
		entity.setVin(dto.getVin());
		if (StringUtils.isNotBlank(dto.getPoolid())) {
			entity.setPoolid(dto.getPoolid());
		}
		entity.setStart((Integer.parseInt(start) - 1) * ps);
		entity.setPageSize(ps);
		if (StringUtils.isNotBlank(dto.getOuttimestatus())) {
			if (StringUtils.isNotBlank(dto.getPoolid())) {
				Krpool pool = krpoolMapper.selectByPrimaryKey(dto.getPoolid());
				if (null == pool.getLoantime()) {
					throw new Exception("所选库融池的放款时间为空 ,请先填写放款时间.");
				}
			}
			entity.setOuttimestatus(Integer.valueOf(dto.getOuttimestatus()));
		}

		List<Krcar> lst = krcarMapper.lookAllByCriteria(entity);
		int cmeet = krcarMapper.countlookAllByCriteria(entity);

		/*
		 * if (StringUtils.isNotBlank(dto.getPoolid())) { Krpool pool =
		 * krpoolMapper.selectByPrimaryKey(dto.getPoolid()); for (Krcar car : lst) { if (2 ==
		 * car.getStatus()) { if (null == pool) { car.setRemainstatus(7);// 标记为为 没有对应的库融池 break; }
		 * Date loantime = pool.getLoantime(); if (null == loantime) { car.setRemainstatus(5);//
		 * 标记为为未放款 continue; } else { car.setRemainstatus(6);// 标记为为已放款 car.setLoantime(loantime);
		 * try { int days = KrcardaysUtil.diffdays(car); car.setRemaindays(days); } catch (Exception
		 * e) { log.error("..计算超时时间出错 出错的car vin为.." + car.getVin()); e.printStackTrace(); } } } } }
		 * else { for (Krcar car : lst) { if (2 == car.getStatus()) { Krpool pool =
		 * krpoolMapper.selectByPrimaryKey(car.getPoolid()); if (null == pool) {
		 * car.setRemainstatus(7);// 标记为为 没有对应的库融池 continue; } Date loantime = pool.getLoantime();
		 * if (null == loantime) { car.setRemainstatus(5);// 标记为为未放款 break; } else {
		 * car.setRemainstatus(6);// 标记为为已放款 car.setLoantime(loantime); try { int days =
		 * KrcardaysUtil.diffdays(car); car.setRemaindays(days); } catch (Exception e) {
		 * log.error("..计算超时时间出错 出错的car vin为.." + car.getVin()); e.printStackTrace(); } } } } }
		 */

		map.put("result", lst);
		map.put("total", cmeet);
		map.put("status", true);
		return map;
	}

	/**
	* 库容车 待入库 审核 list
	* <p>TODO</p>
	* @param KrcarDTO
	* @param start
	* @param pageSize
	* @return
	* @author liliang
	 * @throws ParseException 
	*/
	public Map<String, Object> checkIntoListByParameter(KrcarDTO dto, String start, String pageSize, int batnum) throws ParseException {
		Map<String, Object> map = new HashMap<String, Object>();
		int ps = Integer.parseInt(pageSize);
		Krcar entity = new Krcar();
		if (StringUtils.isNotBlank(dto.getIntime())) {
			entity.setIntime(DateUtils.parse(dto.getIntime(), DateUtils.DEFAULT_DATE_FORMAT_DEFAULT));
		}
		entity.setBatnum(batnum);// 批次号 默认1
		entity.setBrand(dto.getBrand());
		entity.setModel(dto.getModel());
		entity.setVersion(dto.getVersion());
		entity.setVin(dto.getVin());
		entity.setStatus(1);	// 待审核1
		if (StringUtils.isNotBlank(dto.getPoolid())) {
			entity.setPoolid(dto.getPoolid());
		}
		entity.setStart((Integer.parseInt(start) - 1) * ps);
		entity.setPageSize(ps);
		List<Krcar> lst = krcarMapper.checkByParameter(entity);
		int cmeet = krcarMapper.countcheckByParameter(entity);
		map.put("result", lst);
		map.put("total", cmeet);
		return map;
	}

	/**
	* 库容车 待出库 审核 list
	* <p>TODO</p>
	* @param KrcarDTO
	* @param start
	* @param pageSize
	* @return
	* @author liliang
	 * @throws ParseException 
	*/
	public Map<String, Object> outByParameter(KrcarDTO dto, String start, String pageSize, int batnum) throws ParseException {
		Map<String, Object> map = new HashMap<String, Object>();
		int ps = Integer.parseInt(pageSize);
		Krcar entity = new Krcar();
		if (StringUtils.isNotBlank(dto.getIntime())) {
			entity.setIntime(DateUtils.parse(dto.getIntime(), DateUtils.DEFAULT_DATE_FORMAT_DEFAULT));
		}
		entity.setBatnum(batnum);
		entity.setStatus(2); // 状态只能为2 的 才能出库
		entity.setBrand(dto.getBrand());
		entity.setModel(dto.getModel());
		entity.setVersion(dto.getVersion());
		entity.setVin(dto.getVin());
		if (StringUtils.isNotBlank(dto.getPoolid())) {
			entity.setPoolid(dto.getPoolid());
		}
		entity.setStart((Integer.parseInt(start) - 1) * ps);
		entity.setPageSize(ps);
		List<Krcar> lst = krcarMapper.outByParameter(entity);
		int cmeet = krcarMapper.countoutByParameter(entity);
		map.put("result", lst);
		map.put("total", cmeet);
		return map;
	}

	/**
	* 库容车 批量 出库 方法
	* <p>TODO</p>
	* @param KrcarDTO
	* @param start
	* @param pageSize
	* @return
	* @author liliang
	 * @throws ParseException 
	*/
	@SuppressWarnings("null")
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, rollbackFor = Exception.class)
	public Map<String, Object> outCar(KrcarDTO dto) {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", "出库失败了。。");
		returnMap.put("rescode", "0");
		String carids = dto.getCarids();
		String[] caridsz = carids.split(",");
		List<String> caridList = Arrays.asList(caridsz);
		if (null == caridList && caridList.size() == 0) {
			returnMap.put("result", "出库失败了。。。没有勾选出库的记录.");
			returnMap.put("rescode", "0");
			return returnMap;
		}
		if (StringUtils.isBlank(dto.getAuditor())) {
			returnMap.put("result", "出库失败了。。。登录用户信息失效了.");
			returnMap.put("rescode", "0");
			return returnMap;
		}
		dto.setCaridList(caridList);
		// 勾选车的总金额
		String moneys = krcarMapper.findSummoneyByIds(dto.getCaridList());
		BigDecimal bigmoneys = new BigDecimal(moneys);
		// 库融池所有车的总金额 根据库融池id 和 batnum =1 的
		Krcar entity = new Krcar();
		entity.setPoolid(dto.getPoolid());
		entity.setBatnum(1);
		entity.setStatus(2);
		String allmoneys = krcarMapper.findSummoneyByPoolid(entity);
		BigDecimal bigallmoneys = new BigDecimal(allmoneys);

		Krpool pool = krpoolMapper.selectByPrimaryKey(dto.getPoolid());
		BigDecimal poolmoney = new BigDecimal("10000").multiply(pool.getTotalmoney());
		BigDecimal remainmoney = bigallmoneys.subtract(bigmoneys);
		log.info("...勾选车的总金额..." + bigmoneys + "...库融池所有车的总金额......" + bigallmoneys + "...库融池额度.." + poolmoney + ".." + remainmoney);
		if (remainmoney.compareTo(poolmoney) > 0) {// 说明可以出库
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("list", dto.getCaridList());
			map.put("auditor", dto.getAuditor());
			map.put("outtime", new Date());
			krcarMapper.updateOurCarByids(map);
		} else {
			returnMap.put("result", "出库失败了。。。超额" + remainmoney.subtract(poolmoney));
			returnMap.put("rescode", "0");
			return returnMap;
		}

		returnMap.put("result", "出库成功了。。");
		returnMap.put("rescode", "1");
		return returnMap;
	}

	/**
	* 审核入库方法
	* <p>TODO</p>
	* @param KrcarDTO
	* @return
	* @author liliang
	*/
	public Map<String, Object> checkcarinto(KrcarDTO dto) {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", "保存失败了。。");
		returnMap.put("rescode", "0");
		Krcar krcar = new Krcar();

		int status = Integer.valueOf(dto.getStatus());
		if (2 == status || 3 == status) {
			krcar.setId(dto.getId());
			krcar.setStatus(Integer.valueOf(dto.getStatus()));
			krcar.setAuditor(dto.getAuditor());
			if (2 == status) {
				krcar.setIntime(new Date());
			} else {
				krcar.setNopassreason(dto.getNopassreason());
			}
			krcarMapper.updateByPrimaryKeySelective(krcar);
			returnMap.put("result", "保存成功了。");
			returnMap.put("rescode", "1");
		}

		return returnMap;
	}

	/**
	* 通过id 查询  对象
	* <p>TODO</p>
	* @param KrcarDTO
	* @param start
	* @param pageSize
	* @return
	* @author liliang
	 * @throws ParseException 
	*/
	public Krcar findById(String id) {
		Krcar krcar = krcarMapper.selectByPrimaryKey(id);
		return krcar;
	}

	/**
	* 查询所有库融池信息
	* @author liliang
	 * @throws ParseException 
	*/
	public List<Krpool> findAllPoolList() {
		List<Krpool> list = krpoolMapper.findAllPoolList();
		return list;
	}

	/**
	* 库容车 审核list
	* <p>TODO</p>
	* @param KrcarDTO
	* @param start
	* @param pageSize
	* @return
	* @author liliang
	 * @throws ParseException 
	*/
	public Map<String, Object> lookcheckByParameter(KrcarDTO dto, String start, String pageSize, int batnum) {
		Map<String, Object> map = new HashMap<String, Object>();
		int ps = Integer.parseInt(pageSize);
		Krcar entity = new Krcar();
		if (StringUtils.isNotBlank(dto.getIntime())) {
			entity.setIntime(DateUtils.parse(dto.getIntime(), DateUtils.DEFAULT_DATE_FORMAT_DEFAULT));
		}
		entity.setBatnum(batnum);
		entity.setBrand(dto.getBrand());
		entity.setModel(dto.getModel());
		entity.setVersion(dto.getVersion());
		entity.setVin(dto.getVin());
		if (StringUtils.isNotBlank(dto.getPoolid())) {
			entity.setPoolid(dto.getPoolid());
		}
		entity.setStart((Integer.parseInt(start) - 1) * ps);
		entity.setPageSize(ps);
		List<Krcar> lst = krcarMapper.lookcheckByParameter(entity);
		int cmeet = krcarMapper.countlookcheckByParameter(entity);
		map.put("result", lst);
		map.put("total", cmeet);
		return map;
	}

}
