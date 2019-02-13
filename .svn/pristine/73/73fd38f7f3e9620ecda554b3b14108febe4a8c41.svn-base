/*******************************************************************************
 * Project   : car-ms
 * Class Name: com.yyq.car.portal.ms.app.service.Kroutservice
 * Created By: wangzh 
 * Created on: 2018年6月6日 下午6:28:36
 * Copyright © 2013-2014 YYQ All rights reserved.
 ******************************************************************************/
package com.yyq.car.portal.ms.app.service;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;

import com.yyq.car.portal.common.constant.Constants;
import com.yyq.car.portal.common.constant.FileTypeEnum;
import com.yyq.car.portal.common.dto.KrcarDTO;
import com.yyq.car.portal.common.dto.UserDTO;
import com.yyq.car.portal.common.exception.PortalBizCheckedException;
import com.yyq.car.portal.common.mapper.kr.KrcarMapper;
import com.yyq.car.portal.common.mapper.kr.KrpoolMapper;
import com.yyq.car.portal.common.model.kr.Krcar;
import com.yyq.car.portal.common.model.kr.Krpool;
import com.yyq.car.portal.common.service.ResourcePersistenceService;
import com.yyq.car.portal.common.service.security.SecurityHelper;
import com.yyq.car.portal.common.util.DateUtils;
import com.yyq.car.portal.common.util.StringUtil;
import com.yyq.car.portal.ms.common.bqcarimportDTO;
import com.yyq.car.portal.ms.web.util.UUIDTool;


/**
 * <P>库融出库service</P>
 * @author wangzh
 */
@Service
public class Kroutservice {

	private Logger log = LoggerFactory.getLogger(Kroutservice.class);

	@Autowired
	private KrcarMapper krcarMapper;

	@Autowired
	private KrpoolMapper krpoolMapper;

	@Autowired
	ResourcePersistenceService resourceService;

	/**
	 * 
	 * <p>查询所有库融池</p>
	 * @return
	 * @author wangzh
	 */
	public List<Krpool> findAllPoolList() {
		List<Krpool> list = krpoolMapper.findAllPoolList();
		return list;
	}

	/**
	* <p>库容车 待出库 审核 list</p>
	* @param KrcarDTO
	* @param start
	* @param pageSize
	* @return
	* @author liliang
	 * @throws ParseException 
	*/
	public Map<String, Object> outByParameter(KrcarDTO dto, Integer start, Integer ps, Integer batnum) throws ParseException {
		Map<String, Object> map = new HashMap<String, Object>();
		Krcar entity = new Krcar();
		if (StringUtils.isNotBlank(dto.getIntime())) {
			entity.setIntime(DateUtils.parse(dto.getIntime(), DateUtils.DEFAULT_DATE_FORMAT_DEFAULT));
		}
		// entity.setBatnum(batnum);
		entity.setStatus(2); // 状态只能为2的才能出库
		entity.setBrand(dto.getBrand());
		entity.setModel(dto.getModel());
		entity.setVersion(dto.getVersion());
		entity.setVin(dto.getVin());
		if (StringUtils.isNotBlank(dto.getPoolid())) {
			entity.setPoolid(dto.getPoolid());
		}
		entity.setStart((start - 1) * ps);
		entity.setPageSize(ps);
		List<Krcar> lst = krcarMapper.outByParameter(entity);
		int c = krcarMapper.countoutByParameter(entity);
		map.put("result", lst);
		map.put("total", c);
		return map;
	}

	/**
	* <p>库容车 批量 出库 方法</p>
	* @param KrcarDTO
	* @param start
	* @param pageSize
	* @return
	* @author liliang
	 * @throws ParseException 
	*/
	@SuppressWarnings("null")
	// @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED,
	// rollbackFor = Exception.class)
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
	 * 
	 * <p>选择完车辆后校验</p>
	 * @param ids
	 * @param poolid
	 * @param map
	 * @return
	 * @author wangzh
	 */
	@SuppressWarnings("all")
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, rollbackFor = Exception.class)
	public void gatheroutlst(String ids, String poolid, ModelMap map) {
		if (StringUtils.isNotBlank(ids)) {
			JSONObject json = JSONObject.fromObject(ids);
			// for(Object k:json.keySet()){
			//
			// }
			List outlst = new ArrayList(json.keySet());
			String outmoneys = krcarMapper.findSummoneyByIds(outlst);
			BigDecimal bigoutmoneys = (new BigDecimal(outmoneys)).setScale(2, BigDecimal.ROUND_HALF_UP);// 出库车的总额度

			// 库融池所有车的总金额 根据库融池id 和 batnum =1 的
			Krcar entity = new Krcar();
			entity.setPoolid(poolid);
			// entity.setBatnum(1);
			entity.setStatus(2);// 已入库的车
			String inmoneys = krcarMapper.findSummoneyByPoolid(entity);
			BigDecimal biginmoneys = (new BigDecimal(inmoneys)).setScale(2, BigDecimal.ROUND_HALF_UP);// 库存车的总额度

			Krpool pool = krpoolMapper.selectByPrimaryKey(poolid);
			BigDecimal poolmoney = (new BigDecimal("10000").multiply(pool.getTotalmoney())).setScale(2, BigDecimal.ROUND_HALF_UP);// 单位万

			if (biginmoneys.compareTo(poolmoney) <= 0) {// 池中所有的车不大于池金额时 一个都不能出
				// map.put("message",
				// "出库总金额："+bigoutmoneys+";库存总金额："+biginmoneys+";池中额度："+poolmoney);
				throw new PortalBizCheckedException("出库额度：" + bigoutmoneys + "；库存额度：" + biginmoneys + "；池额度：" + poolmoney + "；库存额度不大于池额度，不可出库！");
			} else {
				if (biginmoneys.subtract(bigoutmoneys).compareTo(poolmoney) < 0) {
					// map.put("message",
					// "出库总金额："+bigoutmoneys+";库存总金额："+biginmoneys+";池中额度："+poolmoney+";因出库之后剩余额度小于池额度");
					throw new PortalBizCheckedException("出库额度：" + bigoutmoneys + "；库存额度：" + biginmoneys + "；池额度：" + poolmoney + "；若出库之后剩余库存额度会小于池额度，故不可出库");
				}
			}
			// List<Krcar> outList=krcarMapper.findLstByIds(outlst);
			// map.put("outlst", outList);
			Date now = new Date();
			UserDTO user = SecurityHelper.getAdminUserInfo();
			Map<String, Object> pmap = new HashMap<String, Object>();
			pmap.put("list", outlst);
			pmap.put("outor", user.getId().toString());
			pmap.put("outtime", now);
			krcarMapper.updateOurCarByids(pmap);
		}
	}

	/**
	 * 
	 * <p>在（默认1、已入库2、已出库4）范围内的vin重复性校验</p>
	 * @param vin
	 * @return
	 * @author wangzh
	 */
	public boolean carVinCheck(String vin) {
		return krcarMapper.countinpool(vin) > 0;
	}

	/**
	 * 
	 * <p>基本信息校验过后批量入库</p>
	 * @param lst
	 * @author wangzh
	 * @throws IOException 
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, rollbackFor = Exception.class)
	public void batchin(List<bqcarimportDTO> lst, Map<String, String> poolNameMap, MultipartFile file) throws IOException {

		int size = lst.size();
		for (int i = 0; i < size; i++) {
			// 检查vin唯一性
			boolean vbl = carVinCheck(lst.get(i).getVin());
			if (vbl) {
				throw new PortalBizCheckedException("第" + (i + 5) + "行，车架号[" + lst.get(i).getVin() + "]已存在");
			}
		}
		Date now = new Date();
		UserDTO user = SecurityHelper.getAdminUserInfo();
		if (user == null) {
			throw new PortalBizCheckedException("会话超时，请重新登录");
		}
		for (int i = 0; i < size; i++) {
			Krcar car = new Krcar();
			bqcarimportDTO dto = lst.get(i);
			car.setId(UUIDTool.getUUID());
			car.setBrand(dto.getBrand());
			car.setModel(dto.getModel());
			car.setVersion(dto.getVersion());
			car.setVin(dto.getVin());
			car.setPrice(new BigDecimal(dto.getPrice()));
			car.setDisprice(new BigDecimal(dto.getDisprice()));
			car.setPoolid(poolNameMap.get(dto.getPoolid()));
			car.setOutcolor(dto.getOutcolor());
			car.setIncolor(dto.getIncolor());
			car.setCert1("1");
			car.setCert2("1");
			car.setCert3("1");
			car.setBatnum(1);// 批次号 暂定为1
			car.setStatus(2);// 已入库
			car.setCreator(user.getId().toString());
			car.setCreatetime(now);
			// car.setAuditor(car.getCreator());
			car.setIntime(car.getCreatetime());
			krcarMapper.insertSelective(car);
		}
		uploadFileTogether(file, FileTypeEnum.krcarbatchexcel, user.getId());
	}

	/**
	 * <p>同步保存文件</p>
	 * @param file
	 * @return
	 * @throws IOException
	 * @author wangzh
	 */
	public String uploadFileTogether(MultipartFile file, FileTypeEnum fte, Integer loginid) throws IOException {
		String picPath = null;
		if (file != null && file.getSize() > 0) {
			if (file.getSize() > Constants.PROFILE_PHOTO_MAX_SIZE) {
				throw new PortalBizCheckedException("文件不能超过10M");
			}
			String targetFileName = StringUtil.createFileName();
			// if (hasdot) {
			// targetFileName = targetFileName + suffix;
			// }
			String path = resourceService.getFilePath(fte);

			String name = file.getOriginalFilename(), hz = null;
			int dotpos = 0;
			boolean hasdot = false;
			if (StringUtils.isNotBlank(name)) {
				dotpos = name.lastIndexOf(".");
				if (dotpos > 0) {
					hasdot = true;
					hz = name.substring(dotpos);
				}
			}
			String endname = null;

			if (hasdot) {
				endname = name.substring(0, dotpos) + "_" + loginid + "_" + targetFileName + hz;
			} else {
				endname = name + "_" + loginid + "_" + targetFileName;
			}
			picPath = path + "/" + DateUtils.formateCurrent(DateUtils.COMPACT_DATE_FORMAT) + "/" + endname;
			resourceService.syncSaveFile(picPath, file.getInputStream(), true);
		}
		return picPath;
	}
}
