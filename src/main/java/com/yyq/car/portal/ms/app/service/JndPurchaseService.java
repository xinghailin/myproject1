/*******************************************************************************
 * Project   : car-ms
 * Class Name: com.yyq.car.portal.ms.app.service.JndPurchaseService
 * Created By: wangzh 
 * Created on: 2017年11月28日 下午2:42:49
 * Copyright © 2013-2014 YYQ All rights reserved.
 ******************************************************************************/
package com.yyq.car.portal.ms.app.service;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.apache.commons.lang.StringUtils;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;

import com.yyq.car.portal.common.constant.Constants;
import com.yyq.car.portal.common.constant.FileTypeEnum;
import com.yyq.car.portal.common.dto.UserDTO;
import com.yyq.car.portal.common.exception.PortalAppUnCheckedException;
import com.yyq.car.portal.common.exception.PortalBizCheckedException;
import com.yyq.car.portal.common.mapper.comm.SequenceMapper;
import com.yyq.car.portal.common.mapper.jnd.JndapplypayMapper;
import com.yyq.car.portal.common.mapper.jnd.JndblacksupplierMapper;
import com.yyq.car.portal.common.mapper.jnd.JndbuyMapper;
import com.yyq.car.portal.common.mapper.jnd.JndcarMapper;
import com.yyq.car.portal.common.mapper.jnd.JndcontractMapper;
import com.yyq.car.portal.common.mapper.jnd.JndneedMapper;
import com.yyq.car.portal.common.mapper.jnd.JndsubbuyMapper;
import com.yyq.car.portal.common.mapper.jnd.JndsubneedMapper;
import com.yyq.car.portal.common.mapper.jnd.jndSupplierMapper;
import com.yyq.car.portal.common.mapper.product.StoreMapper;
import com.yyq.car.portal.common.model.jnd.Jndapplypay;
import com.yyq.car.portal.common.model.jnd.Jndblacksupplier;
import com.yyq.car.portal.common.model.jnd.Jndbuy;
import com.yyq.car.portal.common.model.jnd.Jndcar;
import com.yyq.car.portal.common.model.jnd.Jndcontract;
import com.yyq.car.portal.common.model.jnd.Jndneed;
import com.yyq.car.portal.common.model.jnd.Jndsubbuy;
import com.yyq.car.portal.common.model.jnd.Jndsubneed;
import com.yyq.car.portal.common.model.jnd.jndSupplier;
import com.yyq.car.portal.common.model.product.Store;
import com.yyq.car.portal.common.service.ResourcePersistenceService;
import com.yyq.car.portal.common.service.security.SecurityHelper;
import com.yyq.car.portal.common.util.DateUtils;
import com.yyq.car.portal.common.util.StringUtil;
import com.yyq.car.portal.ms.web.command.ApplypaySaveCmd;
import com.yyq.car.portal.ms.web.command.ContractSaveCmd;
import com.yyq.car.portal.ms.web.command.PurchaseCmd;
import com.yyq.car.portal.ms.web.constant.WebConstants;


/**
 * <P>加拿大采购Service</P>
 * @author wangzh
 */
@Service
public class JndPurchaseService {

	@Autowired
	JndneedMapper needMapper;
	@Autowired
	JndsubneedMapper subneedMapper;
	@Autowired
	JndbuyMapper buyMapper;
	@Autowired
	JndsubbuyMapper subbuyMapper;
	@Autowired
	JndapplypayMapper applypayMapper;
	@Autowired
	JndcarMapper carMapper;
	// @Autowired
	// JndcarcheckMapper checkMapper;
	@Autowired
	StoreMapper storeMapper;
	@Autowired
	JndblacksupplierMapper blacksupplierMapper;
	@Autowired
	private SequenceMapper sequenceMapper;

	@Autowired
	private JndcontractMapper contractMapper;

	@Autowired
	private ResourcePersistenceService resourceService;

	@Autowired
	private jndSupplierMapper supplierMapper;

	/**
	 * <p>获取加拿大采购计划列表及记录总数</p>
	 * @param modelMap
	 * @param code
	 * @param time
	 * @param name
	 * @author wangzh
	 */
	public Map<String, Object> getPurchaseLstAndCount(Map<String, Object> paramMap) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<Map<String, Object>> lstMap = buyMapper.selectPurchaseLst(paramMap);
		int c = buyMapper.countPurchase(paramMap);
		resultMap.put("result", lstMap);
		resultMap.put("total", c);
		return resultMap;
	}

	/**
	 * <p>根据需求id查询是否有对应采购</p>
	 * @param id
	 * @return
	 * @author wangzh
	 */
	public int countBuyByNeedId(Integer id) {
		Jndbuy buy = new Jndbuy();
		buy.setNeedid(id);
		return buyMapper.countByCriteria(buy);
	}

	/**
	 * 
	 * <p>获取采购计划编辑或新增页面内容</p>
	 * @param map
	 * @param id
	 * @return
	 * @author wangzh
	 */
	public String queryNeedBuyDetailsByNeedId(ModelMap map, Integer id) {

		Jndneed need = needMapper.selectByPrimaryKey(id);
		map.put("need", need);
		// Integer cur = need.getCurrency();

		Store store = new Store();
		store.setType(need.getCurrency().toString());// 仓库类型 1加拿大 2中东
		List<Store> stores = storeMapper.selectByCriteria(store);
		map.put("stores", stores);

		Jndsubneed sn = new Jndsubneed();
		sn.setNeedid(id);
		List<Jndsubneed> subneed = subneedMapper.selectByCriteria(sn);
		map.put("subneed", subneed);
		Jndbuy buy = new Jndbuy();
		buy.setNeedid(id);
		List<Jndbuy> buyLst = buyMapper.selectByCriteria(buy);

		int c = buyLst.size();

		if (c > 0) {// 有对应采购则编辑
			map.put("buy", buyLst.get(0));
			// Jndsubbuy subbuy = new Jndsubbuy();
			// subbuy.setBuyid(buyLst.get(0).getId());
			Map<String, Object> paMap = new HashMap<String, Object>();
			paMap.put("buyid", buyLst.get(0).getId());
			List<Map<String, Object>> subbuyLst = subbuyMapper.selectJoinApplyPay(paMap);
			map.put("subbuy", subbuyLst);
			return "jndPurchaseEdit";
		} else {// 没有则添加
			// 生成采购计划编号canadacgd+2017年12月8日16:00:10+id
			Integer key = sequenceMapper.selectSequeceValueByCode(702);
			map.put("idkey", key);
			String now = DateUtils.formate(DateUtils.getCurrentTime(), DateUtils.COMPACT_DATETIME_FORMAT);
			Integer curr = need.getCurrency();
			String fc = "";// 编号前缀 1加拿大业务 or 2中东业务
			if (curr != null) {
				fc = curr.intValue() == 1 ? WebConstants.CANADACGD_PREFIX : curr.intValue() == 2 ? WebConstants.MIDDLEEASTCGD_PREFIX : "";
			}
			map.put("filecode", fc + now.substring(2) + key);
			return "jndPurchaseAdd";
		}
	}

	/**
	 * 
	 * <p>获取采购计划编辑或新增页面内容--------新</p>
	 * @param map
	 * @param id
	 * @return
	 * @author wangzh
	 */
	public String nqueryNeedBuyDetailsByNeedId(ModelMap map, Integer id) {

		Jndneed need = needMapper.selectByPrimaryKey(id);
		map.put("need", need);
		String _coun = need.getCountry().toString();

		Store store = new Store();
		store.setType(_coun);// 仓库类型 1加拿大 2中东
		List<Store> stores = storeMapper.selectByCriteria(store);
		map.put("stores", stores);

		Jndsubneed sn = new Jndsubneed();
		sn.setNeedid(id);
		List<Jndsubneed> subneed = subneedMapper.selectByCriteria(sn);
		map.put("subneed", subneed);

		// 获取供应方列表
		jndSupplier sp = new jndSupplier();
		sp.setType(_coun);
		List<jndSupplier> splst = supplierMapper.selectByCriteria(sp);
		map.put("splst", splst);

		Jndbuy buy = new Jndbuy();
		buy.setNeedid(id);
		List<Jndbuy> buyLst = buyMapper.selectByCriteria(buy);

		int c = buyLst.size();

		if (c > 0) {// 有对应采购则编辑
			map.put("buy", buyLst.get(0));
			// Jndsubbuy subbuy = new Jndsubbuy();
			// subbuy.setBuyid(buyLst.get(0).getId());
			Map<String, Object> paMap = new HashMap<String, Object>();
			paMap.put("buyid", buyLst.get(0).getId());
			List<Map<String, Object>> subbuyLst = subbuyMapper.selectJoinContract(paMap);// 新需求
			map.put("subbuy", subbuyLst);
			return "njndPurchaseEdit";
		} else {// 没有则添加
			// 生成采购计划编号Canadacgd+2017年12月8日16:00:10+id
			Integer key = sequenceMapper.selectSequeceValueByCode(702);
			map.put("idkey", key);
			String now = DateUtils.formate(DateUtils.getCurrentTime(), DateUtils.COMPACT_DATETIME_FORMAT);
			Integer curr = need.getCurrency();
			String fc = "";// 编号前缀 1加拿大业务 or 2中东业务
			if (curr != null) {
				fc = curr.intValue() == 1 ? WebConstants.CANADACGD_PREFIXn : curr.intValue() == 2 ? WebConstants.MIDDLEEASTCGD_PREFIXn : "";
			}
			map.put("filecode", fc + now.substring(2) + key);
			return "njndPurchaseAdd";
		}
	}

	/**
	 * 
	 * <p>当一条子采购时转换以避免维度问题</p>
	 * @param cmd
	 * @author wangzh
	 */
	public void transformPurchaseCmdWhenOne(PurchaseCmd cmd) {
		String[] empty = new String[] { "" };
		if (cmd.getSid().length == 0) {
			cmd.setSid(empty);
		}
		if (cmd.getBidc().length == 0) {
			cmd.setBidc(empty);
		}
		if (cmd.getAdjust().length == 0) {
			cmd.setAdjust(empty);
		}
		if (cmd.getConfig().length == 0) {
			cmd.setConfig(empty);
		}
		if (cmd.getOutcolor().length == 0) {
			cmd.setOutcolor(empty);
		}
		if (cmd.getIncolor().length == 0) {
			cmd.setIncolor(empty);
		}
		if (cmd.getNum().length == 0) {
			cmd.setNum(empty);
		}
		if (cmd.getSupplyname().length == 0) {
			cmd.setSupplyname(empty);
		}
		if (cmd.getTostoreid().length == 0) {
			cmd.setTostoreid(empty);
		}
		if (cmd.getAppointtime().length == 0) {
			cmd.setAppointtime(empty);
		}
		if (cmd.getPaytime().length == 0) {
			cmd.setPaytime(empty);
		}
		if (cmd.getTotalprice().length == 0) {
			cmd.setTotalprice(empty);
		}
		// if (cmd.getRebate().length == 0) {
		// cmd.setRebate(empty);
		// }
		if (cmd.getOthercost().length == 0) {
			cmd.setOthercost(empty);
		}
		// if (cmd.getLatecost().length == 0) {
		// cmd.setLatecost(empty);
		// }
		if (cmd.getInsurance().length == 0) {
			cmd.setInsurance(empty);
		}
		if (cmd.getExpensetax().length == 0) {
			cmd.setExpensetax(empty);
		}
		// if (cmd.getSalecost().length == 0) {
		// cmd.setSalecost(empty);
		// }

		if (cmd.getCmsn1().length == 0) {
			cmd.setCmsn1(empty);
		}
		if (cmd.getCmsn2().length == 0) {
			cmd.setCmsn2(empty);
		}
		if (cmd.getCmsn3().length == 0) {
			cmd.setCmsn3(empty);
		}
		if (cmd.getCmsn4().length == 0) {
			cmd.setCmsn4(empty);
		}
		if (cmd.getCmsn5().length == 0) {
			cmd.setCmsn5(empty);
		}
		if (cmd.getOther1().length == 0) {
			cmd.setOther1(empty);
		}
		if (cmd.getOther2().length == 0) {
			cmd.setOther2(empty);
		}
		if (cmd.getOther3().length == 0) {
			cmd.setOther3(empty);
		}
		if (cmd.getOther4().length == 0) {
			cmd.setOther4(empty);
		}
		if (cmd.getOther5().length == 0) {
			cmd.setOther5(empty);
		}

		if (cmd.getTranscost().length == 0) {
			cmd.setTranscost(empty);
		}
		if (cmd.getTransname().length == 0) {
			cmd.setTransname(empty);
		}
	}

	/**
	 * <p>。。。采购计划编辑保存</p>
	 * @param modelMap
	 * @param cmd
	 * @throws PortalAppUnCheckedException
	 * @author wangzh
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void editSave(ModelMap modelMap, PurchaseCmd cmd) throws PortalAppUnCheckedException {
		// 开整 头疼
		// 先校验一把 不行的话直接驳回给客户让他瞅瞅啥情况
		Integer id = cmd.getId();// 采购id
		if (id != null) {
			if (cmd.getBmv().length < 2) {// 就一条时
				transformPurchaseCmdWhenOne(cmd);
			}
			Jndbuy buy = buyMapper.selectByPrimaryKey(id);
			int totalNum = 0;// 采购计划总车辆数目
			if (buy != null && StringUtils.isBlank(cmd.getPuradd())) {// 编辑采购计划 有对应采购计划并且不是添加

				Integer needid = buy.getNeedid();

				Jndsubneed subneed = new Jndsubneed();
				subneed.setNeedid(needid);

				List<Jndsubneed> subneedLst = subneedMapper.selectByCriteria(subneed);
				Map<String, Integer> map = new HashMap<String, Integer>();
				if (subneedLst.size() > 0) {
					String[] bmvs = cmd.getBmv();// 品牌型号版别 子需求id

					String[] nums = cmd.getNum();

					for (int i = 0; i < bmvs.length; i++) {
						if (map.containsKey(bmvs[i])) {
							Integer count = map.get(bmvs[i]);
							map.put(bmvs[i], Integer.parseInt(nums[i]) + count.intValue());
						} else {
							map.put(bmvs[i], Integer.valueOf(nums[i]));
						}
					}
					// 先校验所有条目的数量是否合适
					for (Iterator<Entry<String, Integer>> iterator = map.entrySet().iterator(); iterator.hasNext();) {
						Entry<String, Integer> entry = iterator.next();
						String key = entry.getKey();
						Integer val = entry.getValue();
						for (Iterator<Jndsubneed> iterator2 = subneedLst.iterator(); iterator2.hasNext();) {
							Jndsubneed jndsubneed = (Jndsubneed) iterator2.next();
							if (jndsubneed.getId().toString().equals(key)) {
								Integer num = jndsubneed.getNum();
								if (val.intValue() > num.intValue()) {
									throw new PortalAppUnCheckedException("[" + jndsubneed.getBrand() + " " + jndsubneed.getModel() + " "
											+ jndsubneed.getVersion() + "]对应的采购计划车辆数量超出范围！out of range！");
								} else {
									break;
								}
							}
						}
					}

					// 对单个有对应报价单的采购条目的数量进行校验
					String[] bidcs = cmd.getBidc();
					String[] sids = cmd.getSid();
					for (int i = 0; i < bidcs.length; i++) {
						if (StringUtils.isNotBlank(bidcs[i]) && !"0".equals(bidcs[i])) {
							Map<String, Object> mmMap = new HashMap<String, Object>();
							mmMap.put("subbuyid", Integer.parseInt(sids[i]));
							int sum = applypayMapper.selectSumBySubbuyId(mmMap);
							if (Integer.parseInt(nums[i]) < sum) {
								for (Iterator<Jndsubneed> iterator2 = subneedLst.iterator(); iterator2.hasNext();) {
									Jndsubneed jndsubneed = (Jndsubneed) iterator2.next();
									if (jndsubneed.getId().toString().equals(bmvs[i])) {
										throw new PortalAppUnCheckedException("[" + jndsubneed.getBrand() + " " + jndsubneed.getModel() + " "
												+ jndsubneed.getVersion() + "]对应的采购计划车辆数量不得小于该采购计划所关联的所有付款申请单的车辆数量之和！out of range！");
									}
								}
							}
						}
					}

					// 查询之前的子采购id集合
					Set<Integer> oldids = new HashSet<Integer>();
					Jndsubbuy tempJndsubbuy = new Jndsubbuy();
					tempJndsubbuy.setBuyid(id);
					List<Jndsubbuy> oldsbs = subbuyMapper.selectByCriteria(tempJndsubbuy);
					for (Jndsubbuy jndsubbuy : oldsbs) {
						oldids.add(jndsubbuy.getId());
					}

					// 获取父需求
					Jndneed need = needMapper.selectByPrimaryKey(needid);

					// 新增、更新、删除
					Date now = new Date();
					Set<Integer> newsbids = new HashSet<Integer>();// 最新的id集合

					for (int i = 0; i < sids.length; i++) {
						if (StringUtils.isBlank(sids[i])) {// 没子采购id则新增
							Jndsubbuy sb = new Jndsubbuy();
							sb.setAdjust(cmd.getAdjust()[i]);
							sb.setConfig(cmd.getConfig()[i]);
							sb.setOutcolor(cmd.getOutcolor()[i]);
							sb.setIncolor(cmd.getIncolor()[i]);
							sb.setNum(Integer.parseInt(cmd.getNum()[i]));
							totalNum = totalNum + sb.getNum();
							if (StringUtils.isNotBlank(cmd.getSupplyname()[i])) {
								sb.setSupplyname(cmd.getSupplyname()[i]);
							}

							// 检查黑名单
							blackCheck(cmd.getSupplyname()[i]);

							sb.setTostoreid(Integer.parseInt(cmd.getTostoreid()[i]));
							if (StringUtils.isNotBlank(cmd.getAppointtime()[i])) {
								sb.setAppointtime(DateUtils.parse(cmd.getAppointtime()[i], DateUtils.DEFAULT_DATE_FORMAT_DEFAULT));
							}
							if (StringUtils.isNotBlank(cmd.getPaytime()[i])) {
								sb.setPaytime(DateUtils.parse(cmd.getPaytime()[i], DateUtils.DEFAULT_DATE_FORMAT_DEFAULT));
							}
							if (StringUtils.isNotBlank(cmd.getTotalprice()[i])) {
								sb.setTotalprice(new BigDecimal(cmd.getTotalprice()[i]));
							}
							// if (StringUtils.isNotBlank(cmd.getRebate()[i]))
							// sb.setRebate(new BigDecimal(cmd.getRebate()[i]));
							if (StringUtils.isNotBlank(cmd.getInsurance()[i]))
								sb.setInsurance(new BigDecimal(cmd.getInsurance()[i]));
							if (StringUtils.isNotBlank(cmd.getExpensetax()[i]))
								sb.setExpensetax(new BigDecimal(cmd.getExpensetax()[i]));
							if (StringUtils.isNotBlank(cmd.getOthercost()[i]))
								sb.setOthercost(new BigDecimal(cmd.getOthercost()[i]));
							// if (StringUtils.isNotBlank(cmd.getLatecost()[i]))
							// sb.setLatecost(new BigDecimal(cmd.getLatecost()[i]));
							// if (StringUtils.isNotBlank(cmd.getSalecost()[i]))
							// sb.setSalecost(new BigDecimal(cmd.getSalecost()[i]));

							if (StringUtils.isNotBlank(cmd.getCmsn1()[i])) {
								sb.setCmsn1(new BigDecimal(cmd.getCmsn1()[i]));
							}
							if (StringUtils.isNotBlank(cmd.getCmsn2()[i])) {
								sb.setCmsn2(new BigDecimal(cmd.getCmsn2()[i]));
							}
							if (StringUtils.isNotBlank(cmd.getCmsn3()[i])) {
								sb.setCmsn3(new BigDecimal(cmd.getCmsn3()[i]));
							}
							if (StringUtils.isNotBlank(cmd.getCmsn4()[i])) {
								sb.setCmsn4(new BigDecimal(cmd.getCmsn4()[i]));
							}
							if (StringUtils.isNotBlank(cmd.getCmsn5()[i])) {
								sb.setCmsn5(new BigDecimal(cmd.getCmsn5()[i]));
							}

							if (StringUtils.isNotBlank(cmd.getOther1()[i])) {
								sb.setOther1(new BigDecimal(cmd.getOther1()[i]));
							}
							if (StringUtils.isNotBlank(cmd.getOther2()[i])) {
								sb.setOther2(new BigDecimal(cmd.getOther2()[i]));
							}
							if (StringUtils.isNotBlank(cmd.getOther3()[i])) {
								sb.setOther3(new BigDecimal(cmd.getOther3()[i]));
							}
							if (StringUtils.isNotBlank(cmd.getOther4()[i])) {
								sb.setOther4(new BigDecimal(cmd.getOther4()[i]));
							}
							if (StringUtils.isNotBlank(cmd.getOther5()[i])) {
								sb.setOther5(new BigDecimal(cmd.getOther5()[i]));
							}
							if (StringUtils.isNotBlank(cmd.getTranscost()[i])) {
								sb.setTranscost(new BigDecimal(cmd.getTranscost()[i]));
							}
							if (StringUtils.isNotBlank(cmd.getTransname()[i])) {
								sb.setTransname(cmd.getTransname()[i]);
							}
							sb.setCreatetime(now);
							sb.setBuyid(id);
							sb.setSubneedid(Integer.parseInt(bmvs[i]));

							// 赋值国家、货币
							sb.setCountry(need.getCountry());
							sb.setCurrency(need.getCurrency());

							subbuyMapper.insertSelective(sb);
						} else {// 有采购id则更新
							newsbids.add(Integer.parseInt(sids[i]));
							Jndsubbuy sb = new Jndsubbuy();
							sb.setAdjust(cmd.getAdjust()[i]);
							sb.setConfig(cmd.getConfig()[i]);
							sb.setOutcolor(cmd.getOutcolor()[i]);
							sb.setIncolor(cmd.getIncolor()[i]);
							sb.setNum(Integer.parseInt(cmd.getNum()[i]));
							totalNum = totalNum + sb.getNum();
							sb.setSupplyname(cmd.getSupplyname()[i]);
							// blackCheck(cmd.getSupplyname()[i]);
							sb.setTostoreid(Integer.parseInt(cmd.getTostoreid()[i]));
							if (StringUtils.isNotBlank(cmd.getAppointtime()[i])) {
								sb.setAppointtime(DateUtils.parse(cmd.getAppointtime()[i], DateUtils.DEFAULT_DATE_FORMAT_DEFAULT));
							}
							if (StringUtils.isNotBlank(cmd.getPaytime()[i])) {
								sb.setPaytime(DateUtils.parse(cmd.getPaytime()[i], DateUtils.DEFAULT_DATE_FORMAT_DEFAULT));
							}
							if (StringUtils.isNotBlank(cmd.getTotalprice()[i])) {
								sb.setTotalprice(new BigDecimal(cmd.getTotalprice()[i]));
							}
							// if (StringUtils.isNotBlank(cmd.getRebate()[i]))
							// sb.setRebate(new BigDecimal(cmd.getRebate()[i]));
							// else {
							// sb.setRebate(null);
							// }
							if (StringUtils.isNotBlank(cmd.getInsurance()[i]))
								sb.setInsurance(new BigDecimal(cmd.getInsurance()[i]));

							if (StringUtils.isNotBlank(cmd.getExpensetax()[i]))
								sb.setExpensetax(new BigDecimal(cmd.getExpensetax()[i]));

							if (StringUtils.isNotBlank(cmd.getOthercost()[i]))
								sb.setOthercost(new BigDecimal(cmd.getOthercost()[i]));

							// if (StringUtils.isNotBlank(cmd.getLatecost()[i]))
							// sb.setLatecost(new BigDecimal(cmd.getLatecost()[i]));
							// else {
							// sb.setLatecost(null);
							// }
							// if (StringUtils.isNotBlank(cmd.getSalecost()[i]))
							// sb.setSalecost(new BigDecimal(cmd.getSalecost()[i]));
							// else {
							// sb.setSalecost(null);
							// }

							if (StringUtils.isNotBlank(cmd.getCmsn1()[i])) {
								sb.setCmsn1(new BigDecimal(cmd.getCmsn1()[i]));
							}
							if (StringUtils.isNotBlank(cmd.getCmsn2()[i])) {
								sb.setCmsn2(new BigDecimal(cmd.getCmsn2()[i]));
							}
							if (StringUtils.isNotBlank(cmd.getCmsn3()[i])) {
								sb.setCmsn3(new BigDecimal(cmd.getCmsn3()[i]));
							}
							if (StringUtils.isNotBlank(cmd.getCmsn4()[i])) {
								sb.setCmsn4(new BigDecimal(cmd.getCmsn4()[i]));
							}
							if (StringUtils.isNotBlank(cmd.getCmsn5()[i])) {
								sb.setCmsn5(new BigDecimal(cmd.getCmsn5()[i]));
							}

							if (StringUtils.isNotBlank(cmd.getOther1()[i])) {
								sb.setOther1(new BigDecimal(cmd.getOther1()[i]));
							}
							if (StringUtils.isNotBlank(cmd.getOther2()[i])) {
								sb.setOther2(new BigDecimal(cmd.getOther2()[i]));
							}
							if (StringUtils.isNotBlank(cmd.getOther3()[i])) {
								sb.setOther3(new BigDecimal(cmd.getOther3()[i]));
							}
							if (StringUtils.isNotBlank(cmd.getOther4()[i])) {
								sb.setOther4(new BigDecimal(cmd.getOther4()[i]));
							}
							if (StringUtils.isNotBlank(cmd.getOther5()[i])) {
								sb.setOther5(new BigDecimal(cmd.getOther5()[i]));
							}
							if (StringUtils.isNotBlank(cmd.getTranscost()[i])) {
								sb.setTranscost(new BigDecimal(cmd.getTranscost()[i]));
							}
							sb.setTransname(cmd.getTransname()[i]);
							sb.setSubneedid(Integer.parseInt(bmvs[i]));
							sb.setId(Integer.parseInt((sids[i])));
							subbuyMapper.updateByPrimaryKeySelectiveSpecial(sb);
						}
					}
					// 删除
					for (Iterator<Integer> iterator = oldids.iterator(); iterator.hasNext();) {
						Integer theid = iterator.next();
						if (!newsbids.contains(theid)) {// 删除
							subbuyMapper.deleteByPrimaryKey(theid);
						}
					}
					// 保存
					Jndbuy tempJndbuy = new Jndbuy();
					tempJndbuy.setId(id);
					if (!buy.getName().equals(cmd.getBuyname())) {// 若采购计划名称有变则保存
						tempJndbuy.setName(cmd.getBuyname());
					}
					tempJndbuy.setNum(totalNum);
					buyMapper.updateByPrimaryKeySelective(tempJndbuy);
				} else {
					throw new PortalAppUnCheckedException("没有具体需求 no requirement content");
				}
			} else if (buy == null && StringUtils.isNotBlank(cmd.getPuradd())) {// 新增采购计划
																				// 没有对应计划并且是添加
				Integer needid = cmd.getNeedid();
				Jndsubneed subneed = new Jndsubneed();
				subneed.setNeedid(needid);

				List<Jndsubneed> subneedLst = subneedMapper.selectByCriteria(subneed);
				Map<String, Integer> map = new HashMap<String, Integer>();
				if (subneedLst.size() > 0) {
					String[] bmvs = cmd.getBmv();// 品牌型号版别 子需求id

					String[] nums = cmd.getNum();

					for (int i = 0; i < bmvs.length; i++) {
						if (map.containsKey(bmvs[i])) {
							Integer count = map.get(bmvs[i]);
							map.put(bmvs[i], Integer.parseInt(nums[i]) + count.intValue());
						} else {
							map.put(bmvs[i], Integer.valueOf(nums[i]));
						}
					}
					// 先校验所有条目的数量是否合适
					for (Iterator<Entry<String, Integer>> iterator = map.entrySet().iterator(); iterator.hasNext();) {
						Entry<String, Integer> entry = iterator.next();
						String key = entry.getKey();
						Integer val = entry.getValue();
						for (Iterator<Jndsubneed> iterator2 = subneedLst.iterator(); iterator2.hasNext();) {
							Jndsubneed jndsubneed = (Jndsubneed) iterator2.next();
							if (jndsubneed.getId().toString().equals(key)) {
								Integer num = jndsubneed.getNum();
								if (val.intValue() > num.intValue()) {
									throw new PortalAppUnCheckedException("[" + jndsubneed.getBrand() + " " + jndsubneed.getModel() + " "
											+ jndsubneed.getVersion() + "]对应的采购计划车辆数量超出范围！out of range！");
								} else {
									break;
								}
							}
						}
					}

					// 获取父需求
					Jndneed need = needMapper.selectByPrimaryKey(needid);

					Date nowDate = new Date();
					// 插入数据
					Jndbuy tempJndbuy = new Jndbuy();
					tempJndbuy.setId(id);
					tempJndbuy.setNeedid(needid);
					tempJndbuy.setName(cmd.getBuyname());
					tempJndbuy.setCode(cmd.getBuycode());
					tempJndbuy.setCreatetime(nowDate);

					// 赋值国家、货币
					tempJndbuy.setCountry(need.getCountry());
					tempJndbuy.setCurrency(need.getCurrency());

					buyMapper.insertSelectiveWithKey(tempJndbuy);
					for (int i = 0; i < nums.length; i++) {
						Jndsubbuy sb = new Jndsubbuy();
						sb.setAdjust(cmd.getAdjust()[i]);
						sb.setConfig(cmd.getConfig()[i]);
						sb.setOutcolor(cmd.getOutcolor()[i]);
						sb.setIncolor(cmd.getIncolor()[i]);
						sb.setNum(Integer.parseInt(cmd.getNum()[i]));
						totalNum = totalNum + sb.getNum();
						if (StringUtils.isNotBlank(cmd.getSupplyname()[i])) {
							sb.setSupplyname(cmd.getSupplyname()[i]);
						}

						// 检查黑名单
						blackCheck(cmd.getSupplyname()[i]);

						sb.setTostoreid(Integer.parseInt(cmd.getTostoreid()[i]));
						if (StringUtils.isNotBlank(cmd.getAppointtime()[i])) {
							sb.setAppointtime(DateUtils.parse(cmd.getAppointtime()[i], DateUtils.DEFAULT_DATE_FORMAT_DEFAULT));
						}
						if (StringUtils.isNotBlank(cmd.getPaytime()[i])) {
							sb.setPaytime(DateUtils.parse(cmd.getPaytime()[i], DateUtils.DEFAULT_DATE_FORMAT_DEFAULT));
						}
						if (StringUtils.isNotBlank(cmd.getTotalprice()[i])) {
							sb.setTotalprice(new BigDecimal(cmd.getTotalprice()[i]));
						}
						// if (StringUtils.isNotBlank(cmd.getRebate()[i]))
						// sb.setRebate(new BigDecimal(cmd.getRebate()[i]));
						if (StringUtils.isNotBlank(cmd.getInsurance()[i]))
							sb.setInsurance(new BigDecimal(cmd.getInsurance()[i]));
						if (StringUtils.isNotBlank(cmd.getExpensetax()[i]))
							sb.setExpensetax(new BigDecimal(cmd.getExpensetax()[i]));
						if (StringUtils.isNotBlank(cmd.getOthercost()[i]))
							sb.setOthercost(new BigDecimal(cmd.getOthercost()[i]));
						// if (StringUtils.isNotBlank(cmd.getLatecost()[i]))
						// sb.setLatecost(new BigDecimal(cmd.getLatecost()[i]));
						// if (StringUtils.isNotBlank(cmd.getSalecost()[i]))
						// sb.setSalecost(new BigDecimal(cmd.getSalecost()[i]));

						if (StringUtils.isNotBlank(cmd.getCmsn1()[i])) {
							sb.setCmsn1(new BigDecimal(cmd.getCmsn1()[i]));
						}
						if (StringUtils.isNotBlank(cmd.getCmsn2()[i])) {
							sb.setCmsn2(new BigDecimal(cmd.getCmsn2()[i]));
						}
						if (StringUtils.isNotBlank(cmd.getCmsn3()[i])) {
							sb.setCmsn3(new BigDecimal(cmd.getCmsn3()[i]));
						}
						if (StringUtils.isNotBlank(cmd.getCmsn4()[i])) {
							sb.setCmsn4(new BigDecimal(cmd.getCmsn4()[i]));
						}
						if (StringUtils.isNotBlank(cmd.getCmsn5()[i])) {
							sb.setCmsn5(new BigDecimal(cmd.getCmsn5()[i]));
						}

						if (StringUtils.isNotBlank(cmd.getOther1()[i])) {
							sb.setOther1(new BigDecimal(cmd.getOther1()[i]));
						}
						if (StringUtils.isNotBlank(cmd.getOther2()[i])) {
							sb.setOther2(new BigDecimal(cmd.getOther2()[i]));
						}
						if (StringUtils.isNotBlank(cmd.getOther3()[i])) {
							sb.setOther3(new BigDecimal(cmd.getOther3()[i]));
						}
						if (StringUtils.isNotBlank(cmd.getOther4()[i])) {
							sb.setOther4(new BigDecimal(cmd.getOther4()[i]));
						}
						if (StringUtils.isNotBlank(cmd.getOther5()[i])) {
							sb.setOther5(new BigDecimal(cmd.getOther5()[i]));
						}
						if (StringUtils.isNotBlank(cmd.getTranscost()[i])) {
							sb.setTranscost(new BigDecimal(cmd.getTranscost()[i]));
						}
						if (StringUtils.isNotBlank(cmd.getTransname()[i])) {
							sb.setTransname(cmd.getTransname()[i]);
						}
						sb.setCreatetime(nowDate);
						sb.setBuyid(id);
						sb.setSubneedid(Integer.parseInt(bmvs[i]));

						// 赋值国家、货币
						sb.setCountry(need.getCountry());
						sb.setCurrency(need.getCurrency());
						subbuyMapper.insertSelective(sb);
					}
					tempJndbuy = new Jndbuy();
					tempJndbuy.setId(id);
					tempJndbuy.setNum(totalNum);
					buyMapper.updateByPrimaryKeySelective(tempJndbuy);
				} else {
					throw new PortalAppUnCheckedException("没有具体需求 no requirement content");
				}
			} else {
				throw new PortalAppUnCheckedException("稍后再试，如有疑问请联系管理员！wait for a moment,if any questions contact administrator！");
			}
		}
	}

	/**
	 * <p>。。。采购计划编辑保存--------新</p>
	 * @param modelMap
	 * @param cmd
	 * @throws PortalAppUnCheckedException
	 * @author wangzh
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void neditSave(ModelMap modelMap, PurchaseCmd cmd) throws PortalAppUnCheckedException {
		// 开整 头疼
		// 先校验一把 不行的话直接驳回给客户让他瞅瞅啥情况
		Integer id = cmd.getId();// 采购id
		if (id != null) {
			if (cmd.getBmv().length < 2) {// 就一条时
				transformPurchaseCmdWhenOne(cmd);
			}
			Jndbuy buy = buyMapper.selectByPrimaryKey(id);
			int totalNum = 0;// 采购计划总车辆数目
			if (buy != null && StringUtils.isBlank(cmd.getPuradd())) {// 编辑采购计划 有对应采购计划并且不是添加

				Integer needid = buy.getNeedid();

				Jndsubneed subneed = new Jndsubneed();
				subneed.setNeedid(needid);

				List<Jndsubneed> subneedLst = subneedMapper.selectByCriteria(subneed);
				Map<String, Integer> map = new HashMap<String, Integer>();
				if (subneedLst.size() > 0) {
					String[] bmvs = cmd.getBmv();// 品牌型号版别 子需求id

					String[] nums = cmd.getNum();

					for (int i = 0; i < bmvs.length; i++) {
						if (map.containsKey(bmvs[i])) {
							Integer count = map.get(bmvs[i]);
							map.put(bmvs[i], Integer.parseInt(nums[i]) + count.intValue());
						} else {
							map.put(bmvs[i], Integer.valueOf(nums[i]));
						}
					}
					// 先校验所有条目的数量是否合适
					for (Iterator<Entry<String, Integer>> iterator = map.entrySet().iterator(); iterator.hasNext();) {
						Entry<String, Integer> entry = iterator.next();
						String key = entry.getKey();
						Integer val = entry.getValue();
						for (Iterator<Jndsubneed> iterator2 = subneedLst.iterator(); iterator2.hasNext();) {
							Jndsubneed jndsubneed = (Jndsubneed) iterator2.next();
							if (jndsubneed.getId().toString().equals(key)) {
								Integer num = jndsubneed.getNum();
								if (val.intValue() > num.intValue()) {
									throw new PortalAppUnCheckedException("[" + jndsubneed.getBrand() + " " + jndsubneed.getModel() + " "
											+ jndsubneed.getVersion() + "]对应的采购计划车辆数量超出范围！out of range！");
								} else {
									break;
								}
							}
						}
					}

					// 对单个有对应报价单的采购条目的数量进行校验
					String[] bidcs = cmd.getBidc();
					String[] sids = cmd.getSid();
					for (int i = 0; i < bidcs.length; i++) {
						if (StringUtils.isNotBlank(bidcs[i]) && !"0".equals(bidcs[i])) {
							Map<String, Object> mmMap = new HashMap<String, Object>();
							mmMap.put("subbuyid", Integer.parseInt(sids[i]));
							int sum = contractMapper.selectSumBySubbuyId(mmMap);
							if (Integer.parseInt(nums[i]) < sum) {
								for (Iterator<Jndsubneed> iterator2 = subneedLst.iterator(); iterator2.hasNext();) {
									Jndsubneed jndsubneed = (Jndsubneed) iterator2.next();
									if (jndsubneed.getId().toString().equals(bmvs[i])) {
										throw new PortalAppUnCheckedException("[" + jndsubneed.getBrand() + " " + jndsubneed.getModel() + " "
												+ jndsubneed.getVersion() + "]对应的采购计划车辆数量不得小于该采购计划所关联的所有有效合同(非审核不通过的)的车辆数量之和！out of range！");
									}
								}
							}
						}
					}

					// 查询之前的子采购id集合
					Set<Integer> oldids = new HashSet<Integer>();
					Jndsubbuy tempJndsubbuy = new Jndsubbuy();
					tempJndsubbuy.setBuyid(id);
					List<Jndsubbuy> oldsbs = subbuyMapper.selectByCriteria(tempJndsubbuy);
					for (Jndsubbuy jndsubbuy : oldsbs) {
						oldids.add(jndsubbuy.getId());
					}

					// 获取父需求
					Jndneed need = needMapper.selectByPrimaryKey(needid);

					// 新增、更新、删除
					Date now = new Date();
					Set<Integer> newsbids = new HashSet<Integer>();// 最新的id集合

					for (int i = 0; i < sids.length; i++) {
						if (StringUtils.isBlank(sids[i])) {// 没子采购id则新增
							Jndsubbuy sb = new Jndsubbuy();
							sb.setAdjust(cmd.getAdjust()[i]);
							sb.setConfig(cmd.getConfig()[i]);
							sb.setOutcolor(cmd.getOutcolor()[i]);
							sb.setIncolor(cmd.getIncolor()[i]);
							sb.setNum(Integer.parseInt(cmd.getNum()[i]));
							totalNum = totalNum + sb.getNum();
							if (StringUtils.isNotBlank(cmd.getSupplyname()[i])) {
								sb.setSupplyname(cmd.getSupplyname()[i]);
							}

							// 检查黑名单
							blackCheck(cmd.getSupplyname()[i]);

							sb.setTostoreid(Integer.parseInt(cmd.getTostoreid()[i]));
							if (StringUtils.isNotBlank(cmd.getAppointtime()[i])) {
								sb.setAppointtime(DateUtils.parse(cmd.getAppointtime()[i], DateUtils.DEFAULT_DATE_FORMAT_DEFAULT));
							}
							if (StringUtils.isNotBlank(cmd.getPaytime()[i])) {
								sb.setPaytime(DateUtils.parse(cmd.getPaytime()[i], DateUtils.DEFAULT_DATE_FORMAT_DEFAULT));
							}
							if (StringUtils.isNotBlank(cmd.getTotalprice()[i])) {
								sb.setTotalprice(new BigDecimal(cmd.getTotalprice()[i]));
							}
							// if (StringUtils.isNotBlank(cmd.getRebate()[i]))
							// sb.setRebate(new BigDecimal(cmd.getRebate()[i]));
							if (StringUtils.isNotBlank(cmd.getInsurance()[i]))
								sb.setInsurance(new BigDecimal(cmd.getInsurance()[i]));
							if (StringUtils.isNotBlank(cmd.getExpensetax()[i]))
								sb.setExpensetax(new BigDecimal(cmd.getExpensetax()[i]));
							if (StringUtils.isNotBlank(cmd.getOthercost()[i]))
								sb.setOthercost(new BigDecimal(cmd.getOthercost()[i]));
							// if (StringUtils.isNotBlank(cmd.getLatecost()[i]))
							// sb.setLatecost(new BigDecimal(cmd.getLatecost()[i]));
							// if (StringUtils.isNotBlank(cmd.getSalecost()[i]))
							// sb.setSalecost(new BigDecimal(cmd.getSalecost()[i]));

							if (StringUtils.isNotBlank(cmd.getCmsn1()[i])) {
								sb.setCmsn1(new BigDecimal(cmd.getCmsn1()[i]));
							}
							if (StringUtils.isNotBlank(cmd.getCmsn2()[i])) {
								sb.setCmsn2(new BigDecimal(cmd.getCmsn2()[i]));
							}
							if (StringUtils.isNotBlank(cmd.getCmsn3()[i])) {
								sb.setCmsn3(new BigDecimal(cmd.getCmsn3()[i]));
							}
							if (StringUtils.isNotBlank(cmd.getCmsn4()[i])) {
								sb.setCmsn4(new BigDecimal(cmd.getCmsn4()[i]));
							}
							if (StringUtils.isNotBlank(cmd.getCmsn5()[i])) {
								sb.setCmsn5(new BigDecimal(cmd.getCmsn5()[i]));
							}

							if (StringUtils.isNotBlank(cmd.getOther1()[i])) {
								sb.setOther1(new BigDecimal(cmd.getOther1()[i]));
							}
							if (StringUtils.isNotBlank(cmd.getOther2()[i])) {
								sb.setOther2(new BigDecimal(cmd.getOther2()[i]));
							}
							if (StringUtils.isNotBlank(cmd.getOther3()[i])) {
								sb.setOther3(new BigDecimal(cmd.getOther3()[i]));
							}
							if (StringUtils.isNotBlank(cmd.getOther4()[i])) {
								sb.setOther4(new BigDecimal(cmd.getOther4()[i]));
							}
							if (StringUtils.isNotBlank(cmd.getOther5()[i])) {
								sb.setOther5(new BigDecimal(cmd.getOther5()[i]));
							}
							if (StringUtils.isNotBlank(cmd.getTranscost()[i])) {
								sb.setTranscost(new BigDecimal(cmd.getTranscost()[i]));
							}
							if (StringUtils.isNotBlank(cmd.getTransname()[i])) {
								sb.setTransname(cmd.getTransname()[i]);
							}
							sb.setCreatetime(now);
							sb.setBuyid(id);
							sb.setSubneedid(Integer.parseInt(bmvs[i]));

							// 赋值国家、货币
							sb.setCountry(need.getCountry());
							sb.setCurrency(need.getCurrency());

							subbuyMapper.insertSelective(sb);
						} else {// 有采购id则更新
							newsbids.add(Integer.parseInt(sids[i]));
							Jndsubbuy sb = new Jndsubbuy();
							sb.setAdjust(cmd.getAdjust()[i]);
							sb.setConfig(cmd.getConfig()[i]);
							sb.setOutcolor(cmd.getOutcolor()[i]);
							sb.setIncolor(cmd.getIncolor()[i]);
							sb.setNum(Integer.parseInt(cmd.getNum()[i]));
							totalNum = totalNum + sb.getNum();
							sb.setSupplyname(cmd.getSupplyname()[i]);
							// blackCheck(cmd.getSupplyname()[i]);
							sb.setTostoreid(Integer.parseInt(cmd.getTostoreid()[i]));
							if (StringUtils.isNotBlank(cmd.getAppointtime()[i])) {
								sb.setAppointtime(DateUtils.parse(cmd.getAppointtime()[i], DateUtils.DEFAULT_DATE_FORMAT_DEFAULT));
							}
							if (StringUtils.isNotBlank(cmd.getPaytime()[i])) {
								sb.setPaytime(DateUtils.parse(cmd.getPaytime()[i], DateUtils.DEFAULT_DATE_FORMAT_DEFAULT));
							}
							if (StringUtils.isNotBlank(cmd.getTotalprice()[i])) {
								sb.setTotalprice(new BigDecimal(cmd.getTotalprice()[i]));
							}
							// if (StringUtils.isNotBlank(cmd.getRebate()[i]))
							// sb.setRebate(new BigDecimal(cmd.getRebate()[i]));
							// else {
							// sb.setRebate(null);
							// }
							if (StringUtils.isNotBlank(cmd.getInsurance()[i]))
								sb.setInsurance(new BigDecimal(cmd.getInsurance()[i]));

							if (StringUtils.isNotBlank(cmd.getExpensetax()[i]))
								sb.setExpensetax(new BigDecimal(cmd.getExpensetax()[i]));

							if (StringUtils.isNotBlank(cmd.getOthercost()[i]))
								sb.setOthercost(new BigDecimal(cmd.getOthercost()[i]));

							// if (StringUtils.isNotBlank(cmd.getLatecost()[i]))
							// sb.setLatecost(new BigDecimal(cmd.getLatecost()[i]));
							// else {
							// sb.setLatecost(null);
							// }
							// if (StringUtils.isNotBlank(cmd.getSalecost()[i]))
							// sb.setSalecost(new BigDecimal(cmd.getSalecost()[i]));
							// else {
							// sb.setSalecost(null);
							// }

							if (StringUtils.isNotBlank(cmd.getCmsn1()[i])) {
								sb.setCmsn1(new BigDecimal(cmd.getCmsn1()[i]));
							}
							if (StringUtils.isNotBlank(cmd.getCmsn2()[i])) {
								sb.setCmsn2(new BigDecimal(cmd.getCmsn2()[i]));
							}
							if (StringUtils.isNotBlank(cmd.getCmsn3()[i])) {
								sb.setCmsn3(new BigDecimal(cmd.getCmsn3()[i]));
							}
							if (StringUtils.isNotBlank(cmd.getCmsn4()[i])) {
								sb.setCmsn4(new BigDecimal(cmd.getCmsn4()[i]));
							}
							if (StringUtils.isNotBlank(cmd.getCmsn5()[i])) {
								sb.setCmsn5(new BigDecimal(cmd.getCmsn5()[i]));
							}

							if (StringUtils.isNotBlank(cmd.getOther1()[i])) {
								sb.setOther1(new BigDecimal(cmd.getOther1()[i]));
							}
							if (StringUtils.isNotBlank(cmd.getOther2()[i])) {
								sb.setOther2(new BigDecimal(cmd.getOther2()[i]));
							}
							if (StringUtils.isNotBlank(cmd.getOther3()[i])) {
								sb.setOther3(new BigDecimal(cmd.getOther3()[i]));
							}
							if (StringUtils.isNotBlank(cmd.getOther4()[i])) {
								sb.setOther4(new BigDecimal(cmd.getOther4()[i]));
							}
							if (StringUtils.isNotBlank(cmd.getOther5()[i])) {
								sb.setOther5(new BigDecimal(cmd.getOther5()[i]));
							}
							if (StringUtils.isNotBlank(cmd.getTranscost()[i])) {
								sb.setTranscost(new BigDecimal(cmd.getTranscost()[i]));
							}
							sb.setTransname(cmd.getTransname()[i]);
							sb.setSubneedid(Integer.parseInt(bmvs[i]));
							sb.setId(Integer.parseInt((sids[i])));
							subbuyMapper.updateByPrimaryKeySelectiveSpecial(sb);
						}
					}
					// 删除
					for (Iterator<Integer> iterator = oldids.iterator(); iterator.hasNext();) {
						Integer theid = iterator.next();
						if (!newsbids.contains(theid)) {// 删除
							subbuyMapper.deleteByPrimaryKey(theid);
						}
					}
					// 保存
					Jndbuy tempJndbuy = new Jndbuy();
					tempJndbuy.setId(id);
					if (!buy.getName().equals(cmd.getBuyname())) {// 若采购计划名称有变则保存
						tempJndbuy.setName(cmd.getBuyname());
					}
					tempJndbuy.setNum(totalNum);
					buyMapper.updateByPrimaryKeySelective(tempJndbuy);
				} else {
					throw new PortalAppUnCheckedException("没有具体需求 no requirement content");
				}
			} else if (buy == null && StringUtils.isNotBlank(cmd.getPuradd())) {// 新增采购计划
																				// 没有对应计划并且是添加
				Integer needid = cmd.getNeedid();
				Jndsubneed subneed = new Jndsubneed();
				subneed.setNeedid(needid);

				List<Jndsubneed> subneedLst = subneedMapper.selectByCriteria(subneed);
				Map<String, Integer> map = new HashMap<String, Integer>();
				if (subneedLst.size() > 0) {
					String[] bmvs = cmd.getBmv();// 品牌型号版别 子需求id

					String[] nums = cmd.getNum();

					for (int i = 0; i < bmvs.length; i++) {
						if (map.containsKey(bmvs[i])) {
							Integer count = map.get(bmvs[i]);
							map.put(bmvs[i], Integer.parseInt(nums[i]) + count.intValue());
						} else {
							map.put(bmvs[i], Integer.valueOf(nums[i]));
						}
					}
					// 先校验所有条目的数量是否合适
					for (Iterator<Entry<String, Integer>> iterator = map.entrySet().iterator(); iterator.hasNext();) {
						Entry<String, Integer> entry = iterator.next();
						String key = entry.getKey();
						Integer val = entry.getValue();
						for (Iterator<Jndsubneed> iterator2 = subneedLst.iterator(); iterator2.hasNext();) {
							Jndsubneed jndsubneed = (Jndsubneed) iterator2.next();
							if (jndsubneed.getId().toString().equals(key)) {
								Integer num = jndsubneed.getNum();
								if (val.intValue() > num.intValue()) {
									throw new PortalAppUnCheckedException("[" + jndsubneed.getBrand() + " " + jndsubneed.getModel() + " "
											+ jndsubneed.getVersion() + "]对应的采购计划车辆数量超出范围！out of range！");
								} else {
									break;
								}
							}
						}
					}

					// 获取父需求
					Jndneed need = needMapper.selectByPrimaryKey(needid);

					Date nowDate = new Date();
					// 插入数据
					Jndbuy tempJndbuy = new Jndbuy();
					tempJndbuy.setId(id);
					tempJndbuy.setNeedid(needid);
					tempJndbuy.setName(cmd.getBuyname());
					tempJndbuy.setCode(cmd.getBuycode());
					tempJndbuy.setCreatetime(nowDate);

					// 赋值国家、货币
					tempJndbuy.setCountry(need.getCountry());
					tempJndbuy.setCurrency(need.getCurrency());

					// 赋值需求方 商城合同编号
					// tempJndbuy.setNeeder(need.getNeeder());
					// tempJndbuy.setMallcontractcode(need.getMallcontractcode());
					buyMapper.insertSelectiveWithKey(tempJndbuy);
					for (int i = 0; i < nums.length; i++) {
						Jndsubbuy sb = new Jndsubbuy();
						sb.setAdjust(cmd.getAdjust()[i]);
						sb.setConfig(cmd.getConfig()[i]);
						sb.setOutcolor(cmd.getOutcolor()[i]);
						sb.setIncolor(cmd.getIncolor()[i]);
						sb.setNum(Integer.parseInt(cmd.getNum()[i]));
						totalNum = totalNum + sb.getNum();
						if (StringUtils.isNotBlank(cmd.getSupplyname()[i])) {
							sb.setSupplyname(cmd.getSupplyname()[i]);
						}

						// 检查黑名单
						blackCheck(cmd.getSupplyname()[i]);

						sb.setTostoreid(Integer.parseInt(cmd.getTostoreid()[i]));
						if (StringUtils.isNotBlank(cmd.getAppointtime()[i])) {
							sb.setAppointtime(DateUtils.parse(cmd.getAppointtime()[i], DateUtils.DEFAULT_DATE_FORMAT_DEFAULT));
						}
						if (StringUtils.isNotBlank(cmd.getPaytime()[i])) {
							sb.setPaytime(DateUtils.parse(cmd.getPaytime()[i], DateUtils.DEFAULT_DATE_FORMAT_DEFAULT));
						}
						if (StringUtils.isNotBlank(cmd.getTotalprice()[i])) {
							sb.setTotalprice(new BigDecimal(cmd.getTotalprice()[i]));
						}
						// if (StringUtils.isNotBlank(cmd.getRebate()[i]))
						// sb.setRebate(new BigDecimal(cmd.getRebate()[i]));
						if (StringUtils.isNotBlank(cmd.getInsurance()[i]))
							sb.setInsurance(new BigDecimal(cmd.getInsurance()[i]));
						if (StringUtils.isNotBlank(cmd.getExpensetax()[i]))
							sb.setExpensetax(new BigDecimal(cmd.getExpensetax()[i]));
						if (StringUtils.isNotBlank(cmd.getOthercost()[i]))
							sb.setOthercost(new BigDecimal(cmd.getOthercost()[i]));
						// if (StringUtils.isNotBlank(cmd.getLatecost()[i]))
						// sb.setLatecost(new BigDecimal(cmd.getLatecost()[i]));
						// if (StringUtils.isNotBlank(cmd.getSalecost()[i]))
						// sb.setSalecost(new BigDecimal(cmd.getSalecost()[i]));

						if (StringUtils.isNotBlank(cmd.getCmsn1()[i])) {
							sb.setCmsn1(new BigDecimal(cmd.getCmsn1()[i]));
						}
						if (StringUtils.isNotBlank(cmd.getCmsn2()[i])) {
							sb.setCmsn2(new BigDecimal(cmd.getCmsn2()[i]));
						}
						if (StringUtils.isNotBlank(cmd.getCmsn3()[i])) {
							sb.setCmsn3(new BigDecimal(cmd.getCmsn3()[i]));
						}
						if (StringUtils.isNotBlank(cmd.getCmsn4()[i])) {
							sb.setCmsn4(new BigDecimal(cmd.getCmsn4()[i]));
						}
						if (StringUtils.isNotBlank(cmd.getCmsn5()[i])) {
							sb.setCmsn5(new BigDecimal(cmd.getCmsn5()[i]));
						}

						if (StringUtils.isNotBlank(cmd.getOther1()[i])) {
							sb.setOther1(new BigDecimal(cmd.getOther1()[i]));
						}
						if (StringUtils.isNotBlank(cmd.getOther2()[i])) {
							sb.setOther2(new BigDecimal(cmd.getOther2()[i]));
						}
						if (StringUtils.isNotBlank(cmd.getOther3()[i])) {
							sb.setOther3(new BigDecimal(cmd.getOther3()[i]));
						}
						if (StringUtils.isNotBlank(cmd.getOther4()[i])) {
							sb.setOther4(new BigDecimal(cmd.getOther4()[i]));
						}
						if (StringUtils.isNotBlank(cmd.getOther5()[i])) {
							sb.setOther5(new BigDecimal(cmd.getOther5()[i]));
						}
						if (StringUtils.isNotBlank(cmd.getTranscost()[i])) {
							sb.setTranscost(new BigDecimal(cmd.getTranscost()[i]));
						}
						if (StringUtils.isNotBlank(cmd.getTransname()[i])) {
							sb.setTransname(cmd.getTransname()[i]);
						}
						sb.setCreatetime(nowDate);
						sb.setBuyid(id);
						sb.setSubneedid(Integer.parseInt(bmvs[i]));

						// 赋值国家、货币
						sb.setCountry(need.getCountry());
						sb.setCurrency(need.getCurrency());

						// 赋值需求方 商城合同编号
						// sb.setNeeder(need.getNeeder());
						// sb.setMallcontractcode(need.getMallcontractcode());
						subbuyMapper.insertSelective(sb);
					}
					tempJndbuy = new Jndbuy();
					tempJndbuy.setId(id);
					tempJndbuy.setNum(totalNum);
					buyMapper.updateByPrimaryKeySelective(tempJndbuy);
				} else {
					throw new PortalAppUnCheckedException("没有具体需求 no requirement content");
				}
			} else {
				throw new PortalAppUnCheckedException("稍后再试，如有疑问请联系管理员！wait for a moment,if any questions contact administrator！");
			}
		}
	}

	/**
	 * <p>获取付款申请列表和总数</p>
	 * @param paramMap
	 * @return
	 * @author wangzh
	 */
	public Map<String, Object> getApplypayLstAndCount(Map<String, Object> paramMap) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<Map<String, Object>> lstMap = applypayMapper.selectApayLst(paramMap);
		int c = applypayMapper.countApay(paramMap);
		resultMap.put("result", lstMap);
		resultMap.put("total", c);
		return resultMap;
	}

	/**
	 * 
	 * <p>获取付款申请单编辑查看页</p>
	 * @param modelMap
	 * @param id 付款申请id
	 * @return
	 * @author wangzh
	 */
	public String getApplypayEdit(ModelMap modelMap, Integer id) {
		// 获取采购计划编号 名称
		// Map<String, Object> resultMap = new HashMap<String, Object>();
		String reString = null;
		Map<String, Object> multiMap = applypayMapper.getApplypayMultiById(id);
		modelMap.put("ap", multiMap);
		Object status = multiMap.get("status");
		char s = status.toString().charAt(0);// 1审核通过2不通过3申请中4已撤销
		/**新：1定金审核通过2定金审核不通过3定金申请中
		4定金已撤销
		5尾款审核通过6尾款审核不通过7尾款申请中8尾款申请已撤销*/
		// 查看：所有情况都可以查看
		// 编辑：2/4/6/8
		if (s < '5') {// 关于定金
			// 通过、申请中查看页面
			reString = "1";
			if (s == '1') {// 定金审核通过
				modelMap.put("next", true);
			}
		} else {// 关于尾款
			// 不通过、已撤销可继续编辑提交
			reString = "2";
		}
		Store store = new Store();
		store.setType(multiMap.get("currency").toString());
		List<Store> stores = storeMapper.selectByCriteria(store);
		modelMap.put("stores", stores);
		return reString;
		// return null;
	}

	/**
	 * 
	 * <p>准备付款申请添加</p>
	 * @param modelMap
	 * @author wangzh
	 */
	public void readyapayadd(ModelMap modelMap) {
		Store store = new Store();
		store.setType("1");
		List<Store> stores = storeMapper.selectByCriteria(store);
		modelMap.put("stores", stores);
	}

	/**
	 * <p>查询子计划for付款申请</p>
	 * @param paramMap
	 * @return
	 * @author wangzh
	 */
	public Map<String, Object> getSubPurchaseLstAndCountForApay(Map<String, Object> paramMap) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<Map<String, Object>> lstMap = subbuyMapper.selectLstForApay(paramMap);
		int c = subbuyMapper.countForApay(paramMap);
		resultMap.put("result", lstMap);
		resultMap.put("total", c);
		return resultMap;
	}

	/**
	 * 
	 * <p>通过子计划id获取内容</p>
	 * @param id
	 * @return
	 * @author wangzh
	 */
	public Map<String, Object> getSubPurchaseById(Map<String, Object> pamap) {
		Map<String, Object> sb = subbuyMapper.selectForApayById(pamap);
		Object remainnumob = sb.get("remainnum");
		Object numob = sb.get("num");
		Object currency = sb.get("currency");
		Store store = new Store();
		store.setType(currency.toString());
		List<Store> stores = storeMapper.selectByCriteria(store);
		try {
			int num = Integer.parseInt(numob.toString());
			int remainnum = Integer.parseInt(remainnumob.toString());
			if (remainnum > 0 && num > remainnum) {
				// 将所有的价格按比例拆分
				double divd = (double) remainnum / num;
				BigDecimal multi = new BigDecimal(divd);
				BigDecimal totalprice = (BigDecimal) sb.get("totalprice");
				BigDecimal othercost = (BigDecimal) sb.get("othercost");
				BigDecimal insurance = (BigDecimal) sb.get("insurance");
				BigDecimal expensetax = (BigDecimal) sb.get("expensetax");
				BigDecimal cmsn1 = (BigDecimal) sb.get("cmsn1");
				BigDecimal cmsn2 = (BigDecimal) sb.get("cmsn2");
				BigDecimal cmsn3 = (BigDecimal) sb.get("cmsn3");
				BigDecimal cmsn4 = (BigDecimal) sb.get("cmsn4");
				BigDecimal cmsn5 = (BigDecimal) sb.get("cmsn5");
				BigDecimal other1 = (BigDecimal) sb.get("other1");
				BigDecimal other2 = (BigDecimal) sb.get("other2");
				BigDecimal other3 = (BigDecimal) sb.get("other3");
				BigDecimal other4 = (BigDecimal) sb.get("other4");
				BigDecimal other5 = (BigDecimal) sb.get("other5");
				BigDecimal transcost = (BigDecimal) sb.get("transcost");
				if (totalprice != null) {
					totalprice = totalprice.multiply(multi).setScale(2, BigDecimal.ROUND_HALF_DOWN);
					sb.put("totalprice", totalprice);
				}
				if (othercost != null) {
					othercost = othercost.multiply(multi).setScale(2, BigDecimal.ROUND_HALF_DOWN);
					sb.put("othercost", othercost);
				}
				if (insurance != null) {
					insurance = insurance.multiply(multi).setScale(2, BigDecimal.ROUND_HALF_DOWN);
					sb.put("insurance", insurance);
				}
				if (expensetax != null) {
					expensetax = expensetax.multiply(multi).setScale(2, BigDecimal.ROUND_HALF_DOWN);
					sb.put("expensetax", expensetax);
				}
				if (cmsn1 != null) {
					cmsn1 = cmsn1.multiply(multi).setScale(2, BigDecimal.ROUND_HALF_DOWN);
					sb.put("cmsn1", cmsn1);
				}
				if (cmsn2 != null) {
					cmsn2 = cmsn2.multiply(multi).setScale(2, BigDecimal.ROUND_HALF_DOWN);
					sb.put("cmsn2", cmsn2);
				}
				if (cmsn3 != null) {
					cmsn3 = cmsn3.multiply(multi).setScale(2, BigDecimal.ROUND_HALF_DOWN);
					sb.put("cmsn3", cmsn3);
				}
				if (cmsn4 != null) {
					cmsn4 = cmsn4.multiply(multi).setScale(2, BigDecimal.ROUND_HALF_DOWN);
					sb.put("cmsn4", cmsn4);
				}
				if (cmsn5 != null) {
					cmsn5 = cmsn5.multiply(multi).setScale(2, BigDecimal.ROUND_HALF_DOWN);
					sb.put("cmsn5", cmsn5);
				}
				if (other1 != null) {
					other1 = other1.multiply(multi).setScale(2, BigDecimal.ROUND_HALF_DOWN);
					sb.put("other1", other1);
				}
				if (other2 != null) {
					other2 = other2.multiply(multi).setScale(2, BigDecimal.ROUND_HALF_DOWN);
					sb.put("other2", other2);
				}
				if (other3 != null) {
					other3 = other3.multiply(multi).setScale(2, BigDecimal.ROUND_HALF_DOWN);
					sb.put("other3", other3);
				}
				if (other4 != null) {
					other4 = other4.multiply(multi).setScale(2, BigDecimal.ROUND_HALF_DOWN);
					sb.put("other4", other4);
				}
				if (other5 != null) {
					other5 = other5.multiply(multi).setScale(2, BigDecimal.ROUND_HALF_DOWN);
					sb.put("other5", other5);
				}
				if (transcost != null) {
					transcost = transcost.multiply(multi).setScale(2, BigDecimal.ROUND_HALF_DOWN);
					sb.put("transcost", transcost);
				}
			}
		} catch (Exception e) {
		}
		sb.put("stores", stores);
		return sb;
	}

	/**
	 * 
	 * <p>付款申请编辑保存</p>
	 * @throws PortalAppUnCheckedException
	 * @author wangzh
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void applypaySave(ModelMap modelMap, ApplypaySaveCmd cmd) throws PortalAppUnCheckedException {

		// 该方法适用于 新增保存、1定金审核通过编辑保存（编辑尾款）、2定金审核不通过编辑保存、4定金撤销编辑保存、6尾款审核不通过编辑保存、8尾款撤销编辑保存

		// 根据有无主键区分新增还是其他
		Integer id = cmd.getId();

		if (id == null) {// 新增
			// 常规检测
			if (cmd.getSubbuyid() == null) {
				throw new PortalAppUnCheckedException("您还未选择采购子计划！");
			}
			Jndsubbuy sb = subbuyMapper.selectByPrimaryKey(cmd.getSubbuyid());
			if (sb != null) {
				Integer sbnum = sb.getNum();
				if (sbnum == null) {
					throw new PortalAppUnCheckedException("该采购子计划采购数量不存在");
				}
			} else {
				throw new PortalAppUnCheckedException("该采购子计划已不存在");
			}

			// 检查供应方是否在黑名单中
			blackCheck(cmd.getSupplyname());
			// 检查数量是否合适
			Integer num = cmd.getNum();
			// 查询该采购子计划所对应的付款申请已经占有了多少数量
			Map<String, Object> mmMap = new HashMap<String, Object>();
			mmMap.put("subbuyid", cmd.getSubbuyid());
			int sum = applypayMapper.selectSumBySubbuyId(mmMap);

			Integer sbnum = sb.getNum();
			if ((num.intValue() + sum) > sbnum.intValue()) {
				throw new PortalAppUnCheckedException("数量超出范围，根据计算目前最多可填入：" + (sbnum.intValue() - sum));
			}
			// 继续
			Jndapplypay ap = new Jndapplypay();
			ap.setSubbuyid(cmd.getSubbuyid());
			ap.setNum(num);
			ap.setSupplyname(cmd.getSupplyname());
			ap.setTostoreid(cmd.getTostoreid());
			if (StringUtils.isNotBlank(cmd.getAppointtime())) {
				ap.setAppointtime(DateUtils.parse(cmd.getAppointtime(), DateUtils.DEFAULT_DATE_FORMAT_DEFAULT));
			}
			// if (StringUtils.isNotBlank(cmd.getPaytime())) {
			// ap.setPaytime(DateUtils.parse(cmd.getPaytime(),
			// DateUtils.DEFAULT_DATE_FORMAT_DEFAULT));
			// }
			if (StringUtils.isNotBlank(cmd.getTotalprice())) {
				ap.setTotalprice(new BigDecimal(cmd.getTotalprice()));
			}
			if (StringUtils.isNotBlank(cmd.getOthercost())) {
				ap.setOthercost(new BigDecimal(cmd.getOthercost()));
			}
			if (StringUtils.isNotBlank(cmd.getInsurance())) {
				ap.setInsurance(new BigDecimal(cmd.getInsurance()));
			}
			if (StringUtils.isNotBlank(cmd.getExpensetax())) {
				ap.setExpensetax(new BigDecimal(cmd.getExpensetax()));
			}
			// 新增字段
			if (StringUtils.isNotBlank(cmd.getCmsn1())) {
				ap.setCmsn1(new BigDecimal(cmd.getCmsn1()));
			}
			if (StringUtils.isNotBlank(cmd.getCmsn2())) {
				ap.setCmsn2(new BigDecimal(cmd.getCmsn2()));
			}
			if (StringUtils.isNotBlank(cmd.getCmsn3())) {
				ap.setCmsn3(new BigDecimal(cmd.getCmsn3()));
			}
			if (StringUtils.isNotBlank(cmd.getCmsn4())) {
				ap.setCmsn4(new BigDecimal(cmd.getCmsn4()));
			}
			if (StringUtils.isNotBlank(cmd.getCmsn5())) {
				ap.setCmsn5(new BigDecimal(cmd.getCmsn5()));
			}
			if (StringUtils.isNotBlank(cmd.getOther1())) {
				ap.setOther1(new BigDecimal(cmd.getOther1()));
			}
			if (StringUtils.isNotBlank(cmd.getOther2())) {
				ap.setOther2(new BigDecimal(cmd.getOther2()));
			}
			if (StringUtils.isNotBlank(cmd.getOther3())) {
				ap.setOther3(new BigDecimal(cmd.getOther3()));
			}
			if (StringUtils.isNotBlank(cmd.getOther4())) {
				ap.setOther4(new BigDecimal(cmd.getOther4()));
			}
			if (StringUtils.isNotBlank(cmd.getOther5())) {
				ap.setOther5(new BigDecimal(cmd.getOther5()));
			}
			if (StringUtils.isNotBlank(cmd.getTranscost())) {
				ap.setTranscost(new BigDecimal(cmd.getTranscost()));
			}
			ap.setTransname(cmd.getTransname());
			ap.setCreatetime(new Date());
			ap.setStatus("3");// 申请中
			ap.setConfig(cmd.getConfig());
			ap.setOutcolor(cmd.getOutcolor());
			ap.setIncolor(cmd.getIncolor());
			ap.setAdjust(cmd.getAdjust());// 此处保存子计划的调剂字段值
			ap.setPaytype(cmd.getPaytype());// 购车方式1全款2预定
			ap.setContract(cmd.getContract());// 合同
			if (StringUtils.isNotBlank(cmd.getDownpay())) {
				ap.setDownpay(new BigDecimal(cmd.getDownpay()));// 定金
			} else {
				throw new PortalAppUnCheckedException("定金必填！");
			}
			if ("1".equals(cmd.getPaytype())) {// 全款
				// 全款时 如果定金为0 提交后直接变为定金审核通过(省了财务审核步骤)
				if (ap.getDownpay().compareTo(BigDecimal.ZERO) == 0) {
					ap.setStatus("1");
				}
			} else if ("2".equals(cmd.getPaytype())) {// 预定
				// 不管是不是0都要走两步流程
			}
			if (StringUtils.isNotBlank(cmd.getShouldfp())) {
				ap.setShouldfp(new BigDecimal(cmd.getShouldfp()));// 自动计算出的应付尾款
			}

			// 赋值国家、货币
			ap.setCountry(sb.getCountry());
			ap.setCurrency(sb.getCurrency());
			applypayMapper.insertSelective(ap);
		} else {// 编辑
				// 查看前端传过来的status
			String status = cmd.getStatus();
			if (StringUtils.isBlank(status)) {
				throw new PortalAppUnCheckedException("该付款申请状态缺失！");
			}

			// 保存之前获取当前此付款记录
			Jndapplypay theap = applypayMapper.selectByPrimaryKey(id);
			if (theap == null) {
				throw new PortalAppUnCheckedException("该付款申请已不存在，请联系管理员！");
			}
			String thestatus = theap.getStatus();
			if (status.equals(thestatus)) {// 先保证状态一致
				// 定金还是尾款判断
				if ("2".equals(status) || "4".equals(status)) {// 定金审核不通过、定金撤销
					// 常规检测
					if (cmd.getSubbuyid() == null) {
						throw new PortalAppUnCheckedException("您未成功选择采购子计划，请重新选择！");
					}
					Jndsubbuy sb = subbuyMapper.selectByPrimaryKey(cmd.getSubbuyid());
					if (sb != null) {
						if (sb.getNum() == null) {
							throw new PortalAppUnCheckedException("该采购子计划采购数量不存在");
						}
					} else {
						throw new PortalAppUnCheckedException("该采购子计划已不存在");
					}
					// 检查供应方是否在黑名单中
					blackCheck(cmd.getSupplyname());
					// 检查数量是否合适
					Integer num = cmd.getNum();// 2 ，比如总共10，这里推荐最多是2
					// 查询该采购子计划所对应的付款申请已经占有了多少数量
					Map<String, Object> mmMap = new HashMap<String, Object>();
					mmMap.put("subbuyid", cmd.getSubbuyid());
					mmMap.put("id", id);
					int sum = applypayMapper.selectSumBySubbuyId(mmMap);// 8 占了8个了

					Integer sbnum = sb.getNum();// 10
					if ((num.intValue() + sum) > sbnum.intValue()) {
						throw new PortalAppUnCheckedException("数量超出范围，根据计算目前最多可填入：" + (sbnum.intValue() - sum));
					}
					// 继续
					Jndapplypay ap = new Jndapplypay();
					ap.setId(id);
					ap.setSubbuyid(cmd.getSubbuyid());
					ap.setNum(num);
					ap.setSupplyname(cmd.getSupplyname());
					ap.setTostoreid(cmd.getTostoreid());
					if (StringUtils.isNotBlank(cmd.getAppointtime())) {
						ap.setAppointtime(DateUtils.parse(cmd.getAppointtime(), DateUtils.DEFAULT_DATE_FORMAT_DEFAULT));
					}
					if (StringUtils.isNotBlank(cmd.getTotalprice())) {
						ap.setTotalprice(new BigDecimal(cmd.getTotalprice()));
					}
					if (StringUtils.isNotBlank(cmd.getOthercost())) {
						ap.setOthercost(new BigDecimal(cmd.getOthercost()));
					}
					if (StringUtils.isNotBlank(cmd.getInsurance())) {
						ap.setInsurance(new BigDecimal(cmd.getInsurance()));
					}
					if (StringUtils.isNotBlank(cmd.getExpensetax())) {
						ap.setExpensetax(new BigDecimal(cmd.getExpensetax()));
					}
					// 新增字段
					if (StringUtils.isNotBlank(cmd.getCmsn1())) {
						ap.setCmsn1(new BigDecimal(cmd.getCmsn1()));
					}
					if (StringUtils.isNotBlank(cmd.getCmsn2())) {
						ap.setCmsn2(new BigDecimal(cmd.getCmsn2()));
					}
					if (StringUtils.isNotBlank(cmd.getCmsn3())) {
						ap.setCmsn3(new BigDecimal(cmd.getCmsn3()));
					}
					if (StringUtils.isNotBlank(cmd.getCmsn4())) {
						ap.setCmsn4(new BigDecimal(cmd.getCmsn4()));
					}
					if (StringUtils.isNotBlank(cmd.getCmsn5())) {
						ap.setCmsn5(new BigDecimal(cmd.getCmsn5()));
					}
					if (StringUtils.isNotBlank(cmd.getOther1())) {
						ap.setOther1(new BigDecimal(cmd.getOther1()));
					}
					if (StringUtils.isNotBlank(cmd.getOther2())) {
						ap.setOther2(new BigDecimal(cmd.getOther2()));
					}
					if (StringUtils.isNotBlank(cmd.getOther3())) {
						ap.setOther3(new BigDecimal(cmd.getOther3()));
					}
					if (StringUtils.isNotBlank(cmd.getOther4())) {
						ap.setOther4(new BigDecimal(cmd.getOther4()));
					}
					if (StringUtils.isNotBlank(cmd.getOther5())) {
						ap.setOther5(new BigDecimal(cmd.getOther5()));
					}
					if (StringUtils.isNotBlank(cmd.getTranscost())) {
						ap.setTranscost(new BigDecimal(cmd.getTranscost()));
					}
					ap.setTransname(cmd.getTransname());
					ap.setStatus("3");// 申请中
					ap.setConfig(cmd.getConfig());
					ap.setOutcolor(cmd.getOutcolor());
					ap.setIncolor(cmd.getIncolor());
					ap.setAdjust(cmd.getAdjust());// 此处保存子计划的调剂字段值
					ap.setPaytype(cmd.getPaytype());// 购车方式1全款2预定
					ap.setContract(cmd.getContract());// 合同
					if (StringUtils.isNotBlank(cmd.getDownpay())) {
						ap.setDownpay(new BigDecimal(cmd.getDownpay()));// 定金
					} else {
						throw new PortalAppUnCheckedException("定金必填！");
					}
					if ("1".equals(cmd.getPaytype())) {// 全款
						// 全款时 如果定金为0 提交后直接变为定金审核通过(省了财务审核步骤)
						if (BigDecimal.ZERO.compareTo(ap.getDownpay()) == 0) {
							ap.setStatus("1");
						}
					} else if ("2".equals(cmd.getPaytype())) {// 预定
						// 不管是不是0都要走两步流程
					}
					if (StringUtils.isNotBlank(cmd.getShouldfp())) {
						ap.setShouldfp(new BigDecimal(cmd.getShouldfp()));// 自动计算出的应付尾款
					}

					// 赋值国家、货币
					ap.setCountry(sb.getCountry());
					ap.setCurrency(sb.getCurrency());
					applypayMapper.updateByPrimaryKeySelectiveSpecial(ap);
				} else if ("1".equals(status) || "6".equals(status) || "8".equals(status)) {// 定金通过页面是尾款、尾款不通过、尾款撤销
					// 只走尾款审核就行 没有相关修改 所以常规检测就不必了
					// 继续
					Jndapplypay ap = new Jndapplypay();
					ap.setId(id);
					if (StringUtils.isNotBlank(cmd.getFinalpay())) {
						ap.setFinalpay(new BigDecimal(cmd.getFinalpay()));// 尾款
						ap.setStatus("7");// 尾款审核中

						// 处理运费字段
						if (StringUtils.isNotBlank(cmd.getTranscost())) {
							ap.setTranscost(new BigDecimal(cmd.getTranscost()));
							applypayMapper.updateByPrimaryKeySelective(ap);
						} else {// 用户清空该字段了
							applypayMapper.updateByPrimaryKeySelective(ap);
							// 单独清空该字段
							applypayMapper.updateTranscostNullByPrimaryKey(id);
						}
					} else {
						throw new PortalAppUnCheckedException("尾款必填！");
					}
				}
			} else {
				throw new PortalAppUnCheckedException("该付款申请状态已改变，请点击返回按钮，查看列表！");
			}
		}
	}

	/**
	 * 
	 * <p>黑名单检查</p>
	 * @param supplier
	 * @author wangzh
	 */
	public void blackCheck(String supplier) {
		Jndblacksupplier jbs = new Jndblacksupplier();
		jbs.setName(supplier);
		int bc = blacksupplierMapper.countByCriteria(jbs);
		if (bc > 0) {
			throw new PortalAppUnCheckedException("[" + supplier + "]在黑名单中，禁止使用！");
		}
	}

	/**
	 * 
	 * <p>删除付款申请单</p>
	 * @param id
	 * @author wangzh
	 */
	public void applypayDelete(Integer id) {
		// 删除之前先查看一下现在这条记录的状态
		Jndapplypay ap = applypayMapper.selectByPrimaryKey(id);
		String sta = ap.getStatus();
		if (StringUtils.isNotBlank(sta) && !"1".equals(sta) && sta.charAt(0) < '5') {// 1代表审核通过
			applypayMapper.deleteByPrimaryKey(id);
		}
	}

	/**
	 * 
	 * <p>撤销</p>
	 * @param id
	 * @author wangzh
	 */
	public void applypayrevocation(Integer id) {
		// 删除之前先查看一下现在这条记录的状态
		Jndapplypay ap = applypayMapper.selectByPrimaryKey(id);
		String sta = ap.getStatus();
		if (StringUtils.isNotBlank(sta) && ("3".equals(sta) || "7".equals(sta))) {// 1代表审核通过
																					// 3审核中7尾款审核中
			Jndapplypay temp = new Jndapplypay();
			temp.setId(id);
			temp.setStatus("4");// 定金撤销
			if ("7".equals(sta)) {
				temp.setStatus("8");// 尾款撤销
			}
			applypayMapper.updateByPrimaryKeySelective(temp);
		}
	}

	/**
	 * 
	 * <p>获取付款申请内容for财务审核</p>
	 * @param modelMap
	 * @param id
	 * @author wangzh
	 */
	public String getpayapplyforaudit(ModelMap modelMap, Integer id) {
		// 获取采购计划编号 名称
		Map<String, Object> multiMap = applypayMapper.getApplypayMultiById(id);
		modelMap.put("ap", multiMap);

		String reString = null;
		Object status = multiMap.get("status");
		char s = status.toString().charAt(0);// 1审核通过2不通过3申请中4已撤销
		/**新：1定金审核通过2定金审核不通过3定金申请中
		4定金已撤销
		5尾款审核通过6尾款审核不通过7尾款申请中8尾款申请已撤销*/
		// 查看：所有情况都可以查看
		// 审核：2/4/6/8
		if (s < '5') {// 关于定金
			reString = "1";
		} else {// 关于尾款
			reString = "2";
		}

		Store store = new Store();
		store.setType("1");
		List<Store> stores = storeMapper.selectByCriteria(store);
		modelMap.put("stores", stores);

		return reString;
	}

	/**
	 * 
	 * <p>付款申请审核do</p>
	 * @param id
	 * @param pass
	 * @param reason 不通过原因
	 * @author wangzh
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void applypayAuditDo(Integer id, String pass, String reason, String status) {
		// 审核之前先查看一下现在这条记录的状态
		Jndapplypay ap = applypayMapper.selectByPrimaryKey(id);
		if (ap == null) {
			throw new PortalAppUnCheckedException("付款申请单缺失，请联系管理员！");
		}
		if (!("3".equals(status) || "7".equals(status))) {// 3、7待审核状态
			throw new PortalAppUnCheckedException("该付款申请单已经不是待审核状态，请联系返回列表查看！");
		}
		String sta = ap.getStatus();// 此时状态
		if (!sta.equals(status)) {
			throw new PortalAppUnCheckedException("该付款申请单状态已改变，请联系返回列表查看！");
		}

		UserDTO userdto = SecurityHelper.getAdminUserInfo();
		if (userdto == null) {
			throw new PortalAppUnCheckedException("由于长时间未操作会话已过期，请重新登录！");
		}
		String paytype = ap.getPaytype();// 付款类型 1全款2预定
		if ("3".equals(sta)) {// 定金待审核时
			if ("1".equals(pass)) {// 通过
				// 插入加拿大资产库相应数量的车辆
				// 检查供应方是否在黑名单中
				// try {
				// blackCheck(ap.getSupplyname());
				// } catch (PortalAppUnCheckedException e) {
				//
				// }

				// 获取采购计划编号 名称
				Jndapplypay temp = new Jndapplypay();
				temp.setId(id);
				temp.setStatus("1");// 定金通过
				temp.setReason("");// 不通过理由清空
				temp.setDownpaytime(new Date());
				temp.setDownpayoperater(userdto.getName());
				applypayMapper.updateByPrimaryKeySelective(temp);
				if ("1".equals(paytype)) {// 全款
					// 不做什么
				} else if ("2".equals(paytype)) {// 预定
					// 审核通过就插入车辆
					Integer num = ap.getNum();
					if (num.intValue() > 0) {
						// 获取子采购
						Integer sbid = ap.getSubbuyid();
						Jndsubbuy subbuy = subbuyMapper.selectByPrimaryKey(sbid);
						if (subbuy != null) {
							Integer buyid = subbuy.getBuyid();
							Integer subneedid = subbuy.getSubneedid();
							Jndbuy buy = buyMapper.selectByPrimaryKey(buyid);
							if (buy == null) {
								throw new PortalAppUnCheckedException("采购单缺失，请联系管理员！");
							}
							Jndsubneed subneed = subneedMapper.selectByPrimaryKey(subneedid);
							if (subneed != null) {
								Integer needid = subneed.getNeedid();
								Jndneed need = needMapper.selectByPrimaryKey(needid);
								if (need != null) {
									Date nowDate = new Date();// 创建时间
									// 计算单辆车各种价格
									// BigDecimal divisor = new BigDecimal(num.intValue());// 车辆数目
									// BigDecimal totalprice = ap.getTotalprice();
									// BigDecimal rebate = ap.getRebate();
									// BigDecimal othercost = ap.getOthercost();
									// BigDecimal latecost = ap.getLatecost();
									// BigDecimal salecost = ap.getSalecost();
									// BigDecimal insurance = ap.getInsurance();
									// BigDecimal expensetax = ap.getExpensetax();
									// BigDecimal costprice = null;//BigDecimal.ZERO;// 成本价
									// if (totalprice != null) {
									// totalprice = totalprice.divide(divisor, 2,
									// BigDecimal.ROUND_HALF_DOWN);
									// costprice = costprice.add(totalprice);
									// }
									// if (rebate != null) {
									// rebate = rebate.divide(divisor, 2,
									// BigDecimal.ROUND_HALF_DOWN);
									// costprice = costprice.add(rebate);
									// }
									// if (othercost != null) {
									// othercost = othercost.divide(divisor, 2,
									// BigDecimal.ROUND_HALF_DOWN);
									// costprice = costprice.add(othercost);
									// }
									// if (latecost != null) {
									// latecost = latecost.divide(divisor, 2,
									// BigDecimal.ROUND_HALF_DOWN);
									// costprice = costprice.add(latecost);
									// }
									// if (salecost != null) {
									// salecost = salecost.divide(divisor, 2,
									// BigDecimal.ROUND_HALF_DOWN);
									// costprice = costprice.add(salecost);
									// }
									// if (insurance != null) {
									// insurance = insurance.divide(divisor, 2,
									// BigDecimal.ROUND_HALF_DOWN);
									// costprice = costprice.add(insurance);
									// }
									// if (expensetax != null) {
									// expensetax = expensetax.divide(divisor, 2,
									// BigDecimal.ROUND_HALF_DOWN);
									// costprice = costprice.add(expensetax);
									// }
									for (int i = 0; i < num.intValue(); i++) {// 循环插入车辆
										Jndcar jc = new Jndcar();
										// 赋值国家、货币
										jc.setCountry(ap.getCountry());
										jc.setCurrency(ap.getCurrency());

										jc.setApplypayid(id);
										jc.setNeedcode(need.getCode());
										jc.setNeedname(need.getName());
										jc.setBuycode(buy.getCode());
										jc.setBuyname(buy.getName());
										jc.setInitials(subneed.getInitials());
										jc.setBrand(subneed.getBrand());
										jc.setModel(subneed.getModel());
										jc.setVersion(subneed.getVersion());
										jc.setConfig(ap.getConfig());
										jc.setOutcolor(ap.getOutcolor());
										jc.setIncolor(ap.getIncolor());
										if (ap.getAppointtime() != null) {
											jc.setAppointtime(ap.getAppointtime());
										}
										jc.setStatus("0");// 0初始化状态
										jc.setCreatetime(nowDate);
										if (ap.getTostoreid() != null) {
											jc.setInstoreid(ap.getTostoreid());
										}
										jc.setBuyername(ap.getSupplyname());
										// 设置价格
										// if (totalprice != null) {// 总价
										// jc.setPrice(totalprice);
										// }
										// if (costprice != null) {// 成本价
										// jc.setCostprice(costprice);
										// }
										// if (rebate != null) {// 买手返佣
										// jc.setRebate(rebate);
										// }
										// if (othercost != null) {// 4s店杂费
										// jc.setOthercost(othercost);
										// }
										// if (latecost != null) {// 退保违约金
										// jc.setLatecost(latecost);
										// }
										// if (salecost != null) {// 4s销售佣金
										// jc.setSalecost(salecost);
										// }
										// if (insurance != null) {// 保险费
										// jc.setInsurance(insurance);
										// }
										// if (expensetax != null) {// 消费税
										// jc.setExpensetax(expensetax);
										// }
										carMapper.insertSelective(jc);
									}
								} else {
									throw new PortalAppUnCheckedException("需求单缺失，请联系管理员！");
								}
							} else {
								throw new PortalAppUnCheckedException("子需求单缺失，请联系管理员！");
							}
						} else {
							throw new PortalAppUnCheckedException("子采购单缺失，请联系管理员！");
						}
					} else {
						throw new PortalAppUnCheckedException("付款申请单数量必须大于0，请核对！");
					}
				}
			} else if ("2".equals(pass)) {// 不通过
				Jndapplypay temp = new Jndapplypay();
				temp.setId(id);// 不通过
				temp.setStatus("2");
				temp.setReason(reason);// 不通过理由
				// temp.setDownpaytime(new Date());
				temp.setDownpayoperater(userdto.getName());
				applypayMapper.updateByPrimaryKeySelective(temp);
			}
		} else if ("7".equals(sta)) {// 尾款审核
			if ("1".equals(pass)) {// 通过
				Jndapplypay temp = new Jndapplypay();
				temp.setId(id);
				temp.setStatus("5");// 全款通过
				temp.setReason("");// 不通过理由清空
				temp.setFinalpaytime(new Date());
				temp.setFinalpayoperater(userdto.getName());
				applypayMapper.updateByPrimaryKeySelective(temp);
				if ("1".equals(paytype)) {// 全款
					// 插入车辆
					Integer num = ap.getNum();
					if (num.intValue() > 0) {
						// 获取子采购
						Integer sbid = ap.getSubbuyid();
						Jndsubbuy subbuy = subbuyMapper.selectByPrimaryKey(sbid);
						if (subbuy != null) {
							Integer buyid = subbuy.getBuyid();
							Integer subneedid = subbuy.getSubneedid();
							Jndbuy buy = buyMapper.selectByPrimaryKey(buyid);
							if (buy == null) {
								throw new PortalAppUnCheckedException("采购单缺失，请联系管理员！");
							}
							Jndsubneed subneed = subneedMapper.selectByPrimaryKey(subneedid);
							if (subneed != null) {
								Integer needid = subneed.getNeedid();
								Jndneed need = needMapper.selectByPrimaryKey(needid);
								if (need != null) {
									Date nowDate = new Date();// 创建时间
									// 计算单辆车各种价格
									BigDecimal divisor = new BigDecimal(num.intValue());// 车辆数目
									BigDecimal totalprice = ap.getTotalprice();// 总车价

									BigDecimal downpay = ap.getDownpay();// 定金
									if (downpay == null) {
										throw new PortalAppUnCheckedException("定金缺失，请联系管理员！");
									}
									BigDecimal finalpay = ap.getFinalpay();// 尾款
									if (finalpay == null) {
										throw new PortalAppUnCheckedException("尾款缺失，请联系管理员！");
									}
									BigDecimal totalcostprice = downpay.add(finalpay);// 总成本价 定金+尾款

									if (totalprice != null) {
										totalprice = totalprice.divide(divisor, 2, BigDecimal.ROUND_HALF_DOWN);// 单个车价
									}
									if (totalcostprice != null) {
										totalcostprice = totalcostprice.divide(divisor, 2, BigDecimal.ROUND_HALF_DOWN);// 单个车成本价
									}
									for (int i = 0; i < num.intValue(); i++) {// 循环插入车辆
										Jndcar jc = new Jndcar();
										// 赋值国家、货币
										jc.setCountry(ap.getCountry());
										jc.setCurrency(ap.getCurrency());

										jc.setApplypayid(id);
										jc.setNeedcode(need.getCode());
										jc.setNeedname(need.getName());
										jc.setBuycode(buy.getCode());
										jc.setBuyname(buy.getName());
										jc.setInitials(subneed.getInitials());
										jc.setBrand(subneed.getBrand());
										jc.setModel(subneed.getModel());
										jc.setVersion(subneed.getVersion());
										jc.setConfig(ap.getConfig());
										jc.setOutcolor(ap.getOutcolor());
										jc.setIncolor(ap.getIncolor());
										if (ap.getAppointtime() != null) {
											jc.setAppointtime(ap.getAppointtime());
										}
										jc.setStatus("0");// 0初始化状态
										jc.setCreatetime(nowDate);
										if (ap.getTostoreid() != null) {
											jc.setInstoreid(ap.getTostoreid());
										}
										jc.setBuyername(ap.getSupplyname());
										// 设置价格
										if (totalprice != null) {
											jc.setPrice(totalprice);// 车价
										}
										if (totalcostprice != null) {
											jc.setCostprice(totalcostprice);// 成本价
										}
										carMapper.insertSelective(jc);
									}
								} else {
									throw new PortalAppUnCheckedException("需求单缺失，请联系管理员！");
								}
							} else {
								throw new PortalAppUnCheckedException("子需求单缺失，请联系管理员！");
							}
						} else {
							throw new PortalAppUnCheckedException("子采购单缺失，请联系管理员！");
						}
					} else {
						throw new PortalAppUnCheckedException("付款申请单数量必须大于0，请核对！");
					}
				} else if ("2".equals(paytype)) {// 预定
					// 之前插入车辆了 这里做车辆的更新操作
					// 计算单辆车各种价格
					Integer num = ap.getNum();
					BigDecimal divisor = new BigDecimal(num.intValue());// 车辆数目
					BigDecimal totalprice = ap.getTotalprice();// 总车价

					BigDecimal downpay = ap.getDownpay();// 定金
					if (downpay == null) {
						throw new PortalAppUnCheckedException("定金缺失，请联系管理员！");
					}
					BigDecimal finalpay = ap.getFinalpay();// 尾款
					if (finalpay == null) {
						throw new PortalAppUnCheckedException("尾款缺失，请联系管理员！");
					}
					BigDecimal totalcostprice = downpay.add(finalpay);// 总成本价 定金+尾款

					if (totalprice != null) {
						totalprice = totalprice.divide(divisor, 2, BigDecimal.ROUND_HALF_DOWN);// 单个车价
					}
					if (totalcostprice != null) {
						totalcostprice = totalcostprice.divide(divisor, 2, BigDecimal.ROUND_HALF_DOWN);// 单个车成本价
					}
					// 查询之前插入的所有车辆
					Jndcar jndcar = new Jndcar();
					jndcar.setApplypayid(id);
					List<Jndcar> lst = carMapper.selectByCriteria(jndcar);

					jndcar.setApplypayid(null);
					jndcar.setPrice(totalprice);
					jndcar.setCostprice(totalcostprice);
					for (int i = 0; i < lst.size(); i++) {
						jndcar.setId(lst.get(i).getId());
						carMapper.updateByPrimaryKeySelective(jndcar);// 依次更新车价、成本价
					}
				}
			} else if ("2".equals(pass)) {// 不通过
				Jndapplypay temp = new Jndapplypay();
				temp.setId(id);
				temp.setStatus("6");// 全款不通过
				temp.setReason(reason);// 不通过理由
				temp.setFinalpayoperater(userdto.getName());
				applypayMapper.updateByPrimaryKeySelective(temp);
			}
		}
	}

	/**
	 * 
	 * <p>预入库列表查询</p>
	 * @param paramMap
	 * @param reMap
	 * @author wangzh
	 */
	public void precarlstquery(Map<String, Object> paramMap, Map<String, Object> reMap) {
		List<Jndcar> lst = carMapper.selectByCriteriaParamMap(paramMap);
		int c = carMapper.countByCriteriaParamMap(paramMap);
		reMap.put("result", lst);
		reMap.put("total", c);
	}

	/**
	 * 
	 * <p>黑名单查询</p>
	 * @param start
	 * @param pageSize
	 * @param name
	 * @return
	 * @author wangzh
	 */
	public Map<String, Object> getblacksupplierLstAndCount(Integer start, Integer pageSize, String name) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Jndblacksupplier black = new Jndblacksupplier();
		if (StringUtils.isNotBlank(name)) {
			black.setName(name);
			resultMap.put("name",name);
		}
		UserDTO userDto = SecurityHelper.getAdminUserInfo();
		if (userDto.getCountry()!=null) {
			black.setType(userDto.getCountry());
			resultMap.put("type",userDto.getCountry());
		}
		resultMap.put("start", (start - 1) * pageSize);
		resultMap.put("pageSize", pageSize);
		List<Map<String, Object>> lstMap = blacksupplierMapper.selectblacksupplierlist(resultMap);
		int c = blacksupplierMapper.countByCriteria(black);
		resultMap.put("result", lstMap);
		resultMap.put("total", c);
		return resultMap;
	}

	/**
	 * 
	 * <p>从黑名单中删除供应方</p>
	 * @param id
	 * @author wangzh
	 */
	public void blacksupplierDel(Integer id) {
		// 判断是否可以删除
		Jndblacksupplier the = blacksupplierMapper.selectByPrimaryKey(id);
		if (the == null) {
			throw new PortalAppUnCheckedException("该供应方已从黑名单中移除！");
		}
		String now = null;
		Calendar calendar = Calendar.getInstance(// Locale.CANADA获取加拿大时间
				);
		Date cDate = calendar.getTime();
		now = DateUtils.formate(cDate, DateUtils.DEFAULT_DATE_FORMAT_DEFAULT);
		int c = blacksupplierMapper.countInLstByName(now, the.getName());
		if (c > 0) {// 此供应方存在在当前所查出的所有供应方列表中
			throw new PortalAppUnCheckedException("该供应方还有未入库的车辆，不可从黑名单中删除！This supplier can not be deleted from the Blacklist because there are vehicles provided by the supplier that are not in the warehouse yet!");
		}
		blacksupplierMapper.deleteByPrimaryKey(id);
	}

	// 合同相关内容
	/**
	 * 
	 * <p>查询合同列表和数量</p>
	 * @param start
	 * @param pageSize
	 * @param code
	 * @param time
	 * @param brand
	 * @return
	 * @author wangzh
	 */
	public Map<String, Object> getcontractLstAndCount(String node, String userCountry, Integer start, Integer pageSize, String pcode, String name, String code,
			String brand, String createtime, Integer status) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> paraMap = new HashMap<String, Object>();
		paraMap.put("node", node);
		paraMap.put("start", (start - 1) * pageSize);
		paraMap.put("size", pageSize);
		if (StringUtils.isNotBlank(pcode)) {
			paraMap.put("pcode", pcode);
		}
		if (StringUtils.isNotBlank(name)) {
			paraMap.put("name", name);
		}
		if (StringUtils.isNotBlank(code)) {
			paraMap.put("code", code);
		}
		if (StringUtils.isNotBlank(brand)) {
			paraMap.put("brand", brand);
		}
		if (StringUtils.isNotBlank(createtime)) {
			paraMap.put("createtime", createtime);
		}
		if (status != null) {
			paraMap.put("status", status);
		}
		if (StringUtils.isNotBlank(userCountry)) {
			paraMap.put("country", userCountry);
		}
		List<Map<String, Object>> lstMap = contractMapper.selectByPara(paraMap);
		int c = contractMapper.countByPara(paraMap);
		resultMap.put("result", lstMap);
		resultMap.put("total", c);
		return resultMap;
	}

	/**
	 * 
	 * <p>为合同选择子采购</p>
	 * @param paramMap
	 * @return
	 * @author wangzh
	 */
	public Map<String, Object> getSubPurchaseLstAndCountForContract(Map<String, Object> paramMap) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<Map<String, Object>> lstMap = subbuyMapper.selectLstForContract(paramMap);
		int c = subbuyMapper.countForContract(paramMap);
		resultMap.put("result", lstMap);
		resultMap.put("total", c);
		return resultMap;
	}

	/**
	 * 
	 * <p>通过子采购id获取合同相关内容来填充合同</p>
	 * @param pamap
	 * @return
	 * @author wangzh
	 */
	public Map<String, Object> getSubPurchaseForContractById(Map<String, Object> pamap) {
		Map<String, Object> sb = subbuyMapper.selectForContractById(pamap);
		Object remainnumob = sb.get("remainnum");
		Object numob = sb.get("num");
		Object currency = sb.get("currency");
		Store store = new Store();
		store.setType(currency.toString());
		List<Store> stores = storeMapper.selectByCriteria(store);

		// 查询供应方
		jndSupplier supplier = new jndSupplier();
		supplier.setType(store.getType());
		List<jndSupplier> splst = supplierMapper.selectByCriteria(supplier);
		sb.put("splst", splst);

		try {
			int num = Integer.parseInt(numob.toString());
			int remainnum = Integer.parseInt(remainnumob.toString());
			if (remainnum > 0 && num > remainnum) {
				// 将所有的价格按比例拆分
				double divd = (double) remainnum / num;
				BigDecimal multi = new BigDecimal(divd);
				BigDecimal totalprice = (BigDecimal) sb.get("totalprice");// 车辆价格
				BigDecimal othercost = (BigDecimal) sb.get("othercost");// 4s店杂费
				BigDecimal insurance = (BigDecimal) sb.get("insurance");// 保险
				BigDecimal expensetax = (BigDecimal) sb.get("expensetax");// 消费税去掉不用了
				BigDecimal cmsn1 = (BigDecimal) sb.get("cmsn1");// 佣金1
				BigDecimal cmsn2 = (BigDecimal) sb.get("cmsn2");
				BigDecimal cmsn3 = (BigDecimal) sb.get("cmsn3");
				BigDecimal cmsn4 = (BigDecimal) sb.get("cmsn4");
				BigDecimal cmsn5 = (BigDecimal) sb.get("cmsn5");
				BigDecimal other1 = (BigDecimal) sb.get("other1");// 其他费用1
				BigDecimal other2 = (BigDecimal) sb.get("other2");
				BigDecimal other3 = (BigDecimal) sb.get("other3");
				BigDecimal other4 = (BigDecimal) sb.get("other4");
				BigDecimal other5 = (BigDecimal) sb.get("other5");
				BigDecimal transcost = (BigDecimal) sb.get("transcost");// 运输费用
				if (totalprice != null) {
					totalprice = totalprice.multiply(multi).setScale(2, BigDecimal.ROUND_HALF_DOWN);
					sb.put("totalprice", totalprice);
				}
				if (othercost != null) {
					othercost = othercost.multiply(multi).setScale(2, BigDecimal.ROUND_HALF_DOWN);
					sb.put("othercost", othercost);
				}
				if (insurance != null) {
					insurance = insurance.multiply(multi).setScale(2, BigDecimal.ROUND_HALF_DOWN);
					sb.put("insurance", insurance);
				}
				if (expensetax != null) {
					expensetax = expensetax.multiply(multi).setScale(2, BigDecimal.ROUND_HALF_DOWN);
					sb.put("expensetax", expensetax);
				}
				if (cmsn1 != null) {
					cmsn1 = cmsn1.multiply(multi).setScale(2, BigDecimal.ROUND_HALF_DOWN);
					sb.put("cmsn1", cmsn1);
				}
				if (cmsn2 != null) {
					cmsn2 = cmsn2.multiply(multi).setScale(2, BigDecimal.ROUND_HALF_DOWN);
					sb.put("cmsn2", cmsn2);
				}
				if (cmsn3 != null) {
					cmsn3 = cmsn3.multiply(multi).setScale(2, BigDecimal.ROUND_HALF_DOWN);
					sb.put("cmsn3", cmsn3);
				}
				if (cmsn4 != null) {
					cmsn4 = cmsn4.multiply(multi).setScale(2, BigDecimal.ROUND_HALF_DOWN);
					sb.put("cmsn4", cmsn4);
				}
				if (cmsn5 != null) {
					cmsn5 = cmsn5.multiply(multi).setScale(2, BigDecimal.ROUND_HALF_DOWN);
					sb.put("cmsn5", cmsn5);
				}
				if (other1 != null) {
					other1 = other1.multiply(multi).setScale(2, BigDecimal.ROUND_HALF_DOWN);
					sb.put("other1", other1);
				}
				if (other2 != null) {
					other2 = other2.multiply(multi).setScale(2, BigDecimal.ROUND_HALF_DOWN);
					sb.put("other2", other2);
				}
				if (other3 != null) {
					other3 = other3.multiply(multi).setScale(2, BigDecimal.ROUND_HALF_DOWN);
					sb.put("other3", other3);
				}
				if (other4 != null) {
					other4 = other4.multiply(multi).setScale(2, BigDecimal.ROUND_HALF_DOWN);
					sb.put("other4", other4);
				}
				if (other5 != null) {
					other5 = other5.multiply(multi).setScale(2, BigDecimal.ROUND_HALF_DOWN);
					sb.put("other5", other5);
				}
				if (transcost != null) {
					transcost = transcost.multiply(multi).setScale(2, BigDecimal.ROUND_HALF_DOWN);
					sb.put("transcost", transcost);
				}
			}
		} catch (Exception e) {
		}
		sb.put("stores", stores);
		if (pamap.get("contractid") == null) // 新增合同时
		// 生成合同编号
		// 编号：地区+Contract+2017年12月8日16:00:10+id
		{
			Integer key = sequenceMapper.selectSequeceValueByCode(710);// 710为合同序列表
			sb.put("idkey", key);
			String now = DateUtils.formate(DateUtils.getCurrentTime(), DateUtils.COMPACT_DATETIME_FORMAT);
			Integer country = Integer.parseInt(sb.get("country").toString());
			String fc = "";// 编号前缀 1加拿大业务 or 2中东业务
			if (country != null) {
				fc = country.intValue() == 1 ? WebConstants.CANADA_contract_PREFIX : country.intValue() == 2 ? WebConstants.MIDDLEEAST_contract_PREFIX : "";
			}
			if (country.intValue() == 1) {// 加拿大
				Map<String, String> purMap = new HashMap<String, String>();
				purMap.put("name", "Super Auto Trade Services of Canada Inc");
				purMap.put("add", "1074 Westport Cres");
				purMap.put("type", "Business Number");
				purMap.put("no", "1047868-7");
				purMap.put("phone", "647-835-8139");
				sb.put("purinfo", purMap);
			}
			sb.put("contractcode", fc + now.substring(2) + key);
		}
		return sb;
	}

	/**
	 * 
	 * <p>合同新增、编辑保存</p>
	 * @param modelMap
	 * @param cmd
	 * @throws PortalAppUnCheckedException
	 * @author wangzh
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void contractSave(ModelMap modelMap, ContractSaveCmd cmd) throws PortalAppUnCheckedException {

		// 根据是否新增标示区分新增还是其他
		String newadd = cmd.getNewadd();

		if (StringUtils.isNotBlank(newadd)) {// 新增
			// 常规检测
			if (cmd.getSubbuyid() == null) {
				throw new PortalAppUnCheckedException("您还未选择采购子计划！");
			}
			if (cmd.getBuyid() == null) {
				throw new PortalAppUnCheckedException("缺少采购计划主键！");
			}
			Jndsubbuy sb = subbuyMapper.selectByPrimaryKey(cmd.getSubbuyid());
			if (sb != null) {
				Integer sbnum = sb.getNum();
				if (sbnum == null) {
					throw new PortalAppUnCheckedException("该采购子计划采购数量不存在");
				}
			} else {
				throw new PortalAppUnCheckedException("该采购子计划已不存在");
			}

			// 检查供应方是否在黑名单中
			blackCheck(cmd.getSname());
			// 检查数量是否合适
			Integer num = cmd.getNum();
			// 查询该采购子计划所对应的合同已经占有了多少数量
			Map<String, Object> mmMap = new HashMap<String, Object>();
			mmMap.put("subbuyid", cmd.getSubbuyid());
			int sum = contractMapper.selectSumBySubbuyId(mmMap);

			Integer sbnum = sb.getNum();
			if ((num.intValue() + sum) > sbnum.intValue()) {
				throw new PortalAppUnCheckedException("合同所填写的车的*数量（amount）超出范围，根据计算目前最多可填入：" + (sbnum.intValue() - sum));
			}
			// 继续
			Jndcontract ap = new Jndcontract();// 新增的合同

			ap.setId(cmd.getId());// 主键
			ap.setSubbuyid(cmd.getSubbuyid());// 子计划id
			ap.setBuyid(cmd.getBuyid());// 父计划id
			ap.setCode(cmd.getCode());// 合同编号

			ap.setNeeder(cmd.getActivepurchaser());// 主动采购方
			if ("商城采购".equals(ap.getNeeder())) {// 商城采购时加入商城合同编号
				ap.setMallcontractcode(cmd.getMallcode());
			}

			ap.setSname(cmd.getSname());// 供应方
			ap.setSadd(cmd.getSadd());
			ap.setSidtype(cmd.getSidtype());
			ap.setSno(cmd.getSno());
			ap.setSphone(cmd.getSphone());

			ap.setPname(cmd.getPname());// 采购方
			ap.setPadd(cmd.getPadd());
			ap.setPidtype(cmd.getPidtype());
			ap.setPno(cmd.getPno());
			ap.setPphone(cmd.getPphone());

			ap.setBrand(cmd.getBrand());
			ap.setModel(cmd.getModel());
			ap.setVersion(cmd.getVersion());
			ap.setDisplacement(cmd.getDisplacement());
			ap.setConfig(cmd.getConfig());
			ap.setOutcolor(cmd.getOutcolor());
			ap.setIncolor(cmd.getIncolor());
			ap.setTrim(cmd.getTrim());
			ap.setNum(num);
			ap.setPrice(new BigDecimal(cmd.getPrice()));// 车价
			ap.setRemark(cmd.getRemark());
			ap.setApponitadd(cmd.getApponitadd());
			if (StringUtils.isNotBlank(cmd.getAppointtime())) {
				ap.setAppointtime(DateUtils.parse(cmd.getAppointtime(), DateUtils.DEFAULT_DATE_FORMAT_DEFAULT));
			}
			ap.setTransname(cmd.getTransname());
			if (StringUtils.isNotBlank(cmd.getTransprice())) {
				ap.setTransprice(new BigDecimal(cmd.getTransprice()));
			}
			if (StringUtils.isNotBlank(cmd.getInsurance())) {
				ap.setInsurance(new BigDecimal(cmd.getInsurance()));
			}
			if (StringUtils.isNotBlank(cmd.getTrimprice())) {
				ap.setTrimprice(new BigDecimal(cmd.getTrimprice()));
			}

			ap.setTrim1(cmd.getTrim1());
			ap.setTrim2(cmd.getTrim2());
			ap.setTrim3(cmd.getTrim3());
			ap.setTrim4(cmd.getTrim4());
			ap.setTrim5(cmd.getTrim5());
			ap.setTrim6(cmd.getTrim6());
			ap.setTrim7(cmd.getTrim7());
			ap.setTrim8(cmd.getTrim8());
			ap.setTrim9(cmd.getTrim9());
			ap.setTrim10(cmd.getTrim10());
			ap.setTrim11(cmd.getTrim11());
			ap.setTrim12(cmd.getTrim12());
			// 加装费4个
			ap.setT1price(cmd.getT1price());
			ap.setT2price(cmd.getT2price());
			ap.setT3price(cmd.getT3price());
			ap.setT4price(cmd.getT4price());
			// 加装费新增4个 at 2018年9月5日12:38:57
			ap.setT5price(cmd.getT5price());
			ap.setT6price(cmd.getT6price());
			ap.setT7price(cmd.getT7price());
			ap.setT8price(cmd.getT8price());
			// 加装费再次新增4个 at 2018年9月17日19:05:36
			ap.setT9price(cmd.getT9price());
			ap.setT10price(cmd.getT10price());
			ap.setT11price(cmd.getT11price());
			ap.setT12price(cmd.getT12price());
			if (StringUtils.isNotBlank(cmd.getCmsn1())) {
				ap.setCmsn1(new BigDecimal(cmd.getCmsn1()));
			}
			if (StringUtils.isNotBlank(cmd.getCmsn2())) {
				ap.setCmsn2(new BigDecimal(cmd.getCmsn2()));
			}
			if (StringUtils.isNotBlank(cmd.getCmsn3())) {
				ap.setCmsn3(new BigDecimal(cmd.getCmsn3()));
			}
			if (StringUtils.isNotBlank(cmd.getCmsn4())) {
				ap.setCmsn4(new BigDecimal(cmd.getCmsn4()));
			}
			// if (StringUtils.isNotBlank(cmd.getCmsn5())) {
			// ap.setCmsn5(new BigDecimal(cmd.getCmsn5()));
			// }
			if (StringUtils.isNotBlank(cmd.getOther1())) {
				ap.setOther1(new BigDecimal(cmd.getOther1()));
			}
			if (StringUtils.isNotBlank(cmd.getOther2())) {
				ap.setOther2(new BigDecimal(cmd.getOther2()));
			}
			if (StringUtils.isNotBlank(cmd.getOther3())) {
				ap.setOther3(new BigDecimal(cmd.getOther3()));
			}
			if (StringUtils.isNotBlank(cmd.getOther4())) {
				ap.setOther4(new BigDecimal(cmd.getOther4()));
			}
			// if (StringUtils.isNotBlank(cmd.getOther5())) {
			// ap.setOther5(new BigDecimal(cmd.getOther5()));
			// }

			ap.setCreatetime(new Date());
			// ap.setStatus("3");// 申请中

			if (StringUtils.isNotBlank(cmd.getTotalprice())) {// 合同总价
				ap.setTotalprice(new BigDecimal(cmd.getTotalprice()));
			}
			if (StringUtils.isNotBlank(cmd.getAutotprice())) {// 自动计算的合同总价
				ap.setAutotprice(new BigDecimal(cmd.getAutotprice()));
			}

			if (StringUtils.isNotBlank(cmd.getOthercost())) {// 4s杂费
				ap.setOthercost(new BigDecimal(cmd.getOthercost()));
			}
			if (StringUtils.isNotBlank(cmd.getExpensetax())) {
				ap.setExpensetax(new BigDecimal(cmd.getExpensetax()));
			}

			ap.setPaytype(cmd.getPaytype());// 购车方式1全款2定金
			if ("2".equals(cmd.getPaytype())) {// 是定金
				// 定金时保存定金、尾款
				if (StringUtils.isNotBlank(cmd.getDownpay())) {
					ap.setDownpay(new BigDecimal(cmd.getDownpay()));// 定金
				}
				if (StringUtils.isNotBlank(cmd.getFinalpay())) {
					ap.setFinalpay(new BigDecimal(cmd.getFinalpay()));// 尾款
				}
				// 保存1自采2代采
				ap.setSelfbuy(cmd.getSelfbuy());
				if ("1".equals(cmd.getSelfbuy())) {// 自采

					ap.setInsurance(null);
					ap.setTrimprice(null);
					ap.setOthercost(null);
					// 加装费4个
					ap.setT1price(null);
					ap.setT2price(null);
					ap.setT3price(null);
					ap.setT4price(null);
					ap.setT5price(null);
					ap.setT6price(null);
					ap.setT7price(null);
					ap.setT8price(null);
					ap.setT9price(null);
					ap.setT10price(null);
					ap.setT11price(null);
					ap.setT12price(null);
					ap.setTrim1("");
					ap.setTrim2("");
					ap.setTrim3("");
					ap.setTrim4("");
					ap.setTrim5("");
					ap.setTrim6("");
					ap.setTrim7("");
					ap.setTrim8("");
					ap.setTrim9("");
					ap.setTrim10("");
					ap.setTrim11("");
					ap.setTrim12("");
					// 预估费用
					ap.setPreinsuranceprice(cmd.getPreinsuranceprice());
					ap.setPredrayageprice(cmd.getPredrayageprice());
					ap.setPrelicenseprice(cmd.getPrelicenseprice());
					ap.setPreoilprice(cmd.getPreoilprice());
				}
			}

			// 赋值国家、货币
			ap.setCountry(sb.getCountry());
			ap.setCurrency(sb.getCurrency());

			ap.setIssuingprice(cmd.getIssuingprice());// 开证价
			try {
				String name = cmd.getTexturl().getOriginalFilename();
				boolean hasdot = false;
				if (StringUtils.isNotBlank(name)) {
					int dot = name.lastIndexOf(".");
					if (dot > 0) {
						hasdot = true;
						name = name.substring(dot);
					}
				}
				String path = uploadFileProcess(cmd.getTexturl(), FileTypeEnum.jndcontract, hasdot, name);
				// 获取文件后缀

				ap.setTexturl(path);
			} catch (Exception e) {
				throw new PortalAppUnCheckedException("file upload failed");
			}

			try {
				String name = cmd.getPurfile().getOriginalFilename();
				boolean hasdot = false;
				if (StringUtils.isNotBlank(name)) {
					int dot = name.lastIndexOf(".");
					if (dot > 0) {
						hasdot = true;
						name = name.substring(dot);
					}
				}
				String path = uploadFileProcess(cmd.getPurfile(), FileTypeEnum.jndcontract, hasdot, name);
				// 获取文件后缀

				ap.setPurfile(path);
			} catch (Exception e) {
				throw new PortalAppUnCheckedException("file upload failed");
			}
			contractMapper.insertSelectiveWithKey(ap);
		} else {// 编辑
				// 常规检测
			Jndcontract con = contractMapper.selectByPrimaryKey(cmd.getId());
			if (con == null) {
				throw new PortalAppUnCheckedException("该合同已不存在！");
			}
			String statu = con.getStatus();
			// 可编辑时状态为：2、5、8、10
			if (!("2".equals(statu) || "5".equals(statu) || "8".equals(statu) || "10".equals(statu))) {
				throw new PortalAppUnCheckedException("该合同状态已改变，不可编辑，请返回列表查看！");
			}
			if (cmd.getSubbuyid() == null) {
				throw new PortalAppUnCheckedException("您还未选择采购子计划！");
			}
			if (cmd.getBuyid() == null) {
				throw new PortalAppUnCheckedException("缺少采购计划主键！");
			}
			Jndsubbuy sb = subbuyMapper.selectByPrimaryKey(cmd.getSubbuyid());
			if (sb != null) {
				Integer sbnum = sb.getNum();
				if (sbnum == null) {
					throw new PortalAppUnCheckedException("该采购子计划采购数量不存在");
				}
			} else {
				throw new PortalAppUnCheckedException("该采购子计划已不存在");
			}

			// 检查供应方是否在黑名单中
			String oldsupp = con.getSname();
			if (StringUtils.isNotBlank(oldsupp) && StringUtils.isNotBlank(cmd.getSname()) && !oldsupp.equals(cmd.getSname())) {
				blackCheck(cmd.getSname());// 如果编辑时换供应商了则去检测
			}

			// 检查数量是否合适
			Integer num = cmd.getNum();
			// 查询该采购子计划所对应的合同已经占有了多少数量
			Map<String, Object> mmMap = new HashMap<String, Object>();
			mmMap.put("subbuyid", cmd.getSubbuyid());
			mmMap.put("id", cmd.getId());
			int sum = contractMapper.selectSumBySubbuyId(mmMap);

			Integer sbnum = sb.getNum();
			if ((num.intValue() + sum) > sbnum.intValue()) {
				throw new PortalAppUnCheckedException("合同所填写的车的*数量（amount）超出范围，根据计算目前最多可填入：" + (sbnum.intValue() - sum));
			}
			// 继续
			Jndcontract ap = new Jndcontract();// 新增的合同

			ap.setId(cmd.getId());// 主键
			ap.setSubbuyid(cmd.getSubbuyid());// 子计划id
			ap.setBuyid(cmd.getBuyid());// 父计划id
			// ap.setCode(cmd.getCode());// 合同编号

			ap.setNeeder(cmd.getActivepurchaser());// 主动采购方
			if ("商城采购".equals(ap.getNeeder())) {
				ap.setMallcontractcode(cmd.getMallcode());
			} else {
				ap.setMallcontractcode("");
			}

			ap.setSname(cmd.getSname());// 供应方
			ap.setSadd(cmd.getSadd());
			ap.setSidtype(cmd.getSidtype());
			ap.setSno(cmd.getSno());
			ap.setSphone(cmd.getSphone());

			ap.setPname(cmd.getPname());// 采购方
			ap.setPadd(cmd.getPadd());
			ap.setPidtype(cmd.getPidtype());
			ap.setPno(cmd.getPno());
			ap.setPphone(cmd.getPphone());

			ap.setBrand(cmd.getBrand());
			ap.setModel(cmd.getModel());
			ap.setVersion(cmd.getVersion());
			ap.setDisplacement(cmd.getDisplacement());
			ap.setConfig(cmd.getConfig());
			ap.setOutcolor(cmd.getOutcolor());
			ap.setIncolor(cmd.getIncolor());
			ap.setTrim(cmd.getTrim());
			ap.setNum(num);
			ap.setPrice(new BigDecimal(cmd.getPrice()));// 车价
			ap.setRemark(cmd.getRemark());
			ap.setApponitadd(cmd.getApponitadd());
			if (StringUtils.isNotBlank(cmd.getAppointtime())) {
				ap.setAppointtime(DateUtils.parse(cmd.getAppointtime(), DateUtils.DEFAULT_DATE_FORMAT_DEFAULT));
			}
			ap.setTransname(cmd.getTransname());
			if (StringUtils.isNotBlank(cmd.getTransprice())) {
				ap.setTransprice(new BigDecimal(cmd.getTransprice()));
			}
			if (StringUtils.isNotBlank(cmd.getInsurance())) {
				ap.setInsurance(new BigDecimal(cmd.getInsurance()));
			}
			if (StringUtils.isNotBlank(cmd.getTrimprice())) {
				ap.setTrimprice(new BigDecimal(cmd.getTrimprice()));
			}

			ap.setTrim1(cmd.getTrim1());
			ap.setTrim2(cmd.getTrim2());
			ap.setTrim3(cmd.getTrim3());
			ap.setTrim4(cmd.getTrim4());
			// 加装费4个
			ap.setT1price(cmd.getT1price());
			ap.setT2price(cmd.getT2price());
			ap.setT3price(cmd.getT3price());
			ap.setT4price(cmd.getT4price());
			ap.setTrim5(cmd.getTrim5());
			ap.setTrim6(cmd.getTrim6());
			ap.setTrim7(cmd.getTrim7());
			ap.setTrim8(cmd.getTrim8());
			ap.setTrim9(cmd.getTrim9());
			ap.setTrim10(cmd.getTrim10());
			ap.setTrim11(cmd.getTrim11());
			ap.setTrim12(cmd.getTrim12());
			// 加装费新增4个 at 2018年9月5日12:38:57
			ap.setT5price(cmd.getT5price());
			ap.setT6price(cmd.getT6price());
			ap.setT7price(cmd.getT7price());
			ap.setT8price(cmd.getT8price());
			ap.setT9price(cmd.getT9price());
			ap.setT10price(cmd.getT10price());
			ap.setT11price(cmd.getT11price());
			ap.setT12price(cmd.getT12price());
			if (StringUtils.isNotBlank(cmd.getCmsn1())) {
				ap.setCmsn1(new BigDecimal(cmd.getCmsn1()));
			}
			if (StringUtils.isNotBlank(cmd.getCmsn2())) {
				ap.setCmsn2(new BigDecimal(cmd.getCmsn2()));
			}
			if (StringUtils.isNotBlank(cmd.getCmsn3())) {
				ap.setCmsn3(new BigDecimal(cmd.getCmsn3()));
			}
			if (StringUtils.isNotBlank(cmd.getCmsn4())) {
				ap.setCmsn4(new BigDecimal(cmd.getCmsn4()));
			}
			// if (StringUtils.isNotBlank(cmd.getCmsn5())) {
			// ap.setCmsn5(new BigDecimal(cmd.getCmsn5()));
			// }
			if (StringUtils.isNotBlank(cmd.getOther1())) {
				ap.setOther1(new BigDecimal(cmd.getOther1()));
			}
			if (StringUtils.isNotBlank(cmd.getOther2())) {
				ap.setOther2(new BigDecimal(cmd.getOther2()));
			}
			if (StringUtils.isNotBlank(cmd.getOther3())) {
				ap.setOther3(new BigDecimal(cmd.getOther3()));
			}
			if (StringUtils.isNotBlank(cmd.getOther4())) {
				ap.setOther4(new BigDecimal(cmd.getOther4()));
			}
			// if (StringUtils.isNotBlank(cmd.getOther5())) {
			// ap.setOther5(new BigDecimal(cmd.getOther5()));
			// }

			ap.setCreatetime(new Date());
			// ap.setStatus("3");// 申请中

			if (StringUtils.isNotBlank(cmd.getTotalprice())) {// 合同总价
				ap.setTotalprice(new BigDecimal(cmd.getTotalprice()));
			}
			if (StringUtils.isNotBlank(cmd.getAutotprice())) {// 自动计算的合同总价
				ap.setAutotprice(new BigDecimal(cmd.getAutotprice()));
			}

			if (StringUtils.isNotBlank(cmd.getOthercost())) {// 4s杂费
				ap.setOthercost(new BigDecimal(cmd.getOthercost()));
			}
			if (StringUtils.isNotBlank(cmd.getExpensetax())) {
				ap.setExpensetax(new BigDecimal(cmd.getExpensetax()));
			}
			ap.setPaytype(cmd.getPaytype());// 购车方式1全款2定金
			if ("2".equals(cmd.getPaytype())) {// 是定金
				// 定金时保存定金、尾款
				if (StringUtils.isNotBlank(cmd.getDownpay())) {
					ap.setDownpay(new BigDecimal(cmd.getDownpay()));// 定金
				}
				if (StringUtils.isNotBlank(cmd.getFinalpay())) {
					ap.setFinalpay(new BigDecimal(cmd.getFinalpay()));// 尾款
				}
				// 保存1自采2代采
				ap.setSelfbuy(cmd.getSelfbuy());

				if ("1".equals(cmd.getSelfbuy())) {// 自采

					ap.setInsurance(null);
					ap.setTrimprice(null);
					ap.setOthercost(null);
					// 加装费4个
					ap.setT1price(null);
					ap.setT2price(null);
					ap.setT3price(null);
					ap.setT4price(null);
					ap.setT5price(null);
					ap.setT6price(null);
					ap.setT7price(null);
					ap.setT8price(null);
					ap.setT9price(null);
					ap.setT10price(null);
					ap.setT11price(null);
					ap.setT12price(null);
					ap.setTrim1("");
					ap.setTrim2("");
					ap.setTrim3("");
					ap.setTrim4("");
					ap.setTrim5("");
					ap.setTrim6("");
					ap.setTrim7("");
					ap.setTrim8("");
					ap.setTrim9("");
					ap.setTrim10("");
					ap.setTrim11("");
					ap.setTrim12("");
					// 预估费用
					ap.setPreinsuranceprice(cmd.getPreinsuranceprice());
					ap.setPredrayageprice(cmd.getPredrayageprice());
					ap.setPrelicenseprice(cmd.getPrelicenseprice());
					ap.setPreoilprice(cmd.getPreoilprice());
				}
			}

			// 赋值国家、货币
			ap.setCountry(sb.getCountry());
			ap.setCurrency(sb.getCurrency());

			ap.setIssuingprice(cmd.getIssuingprice());// 开证价
			if (cmd.getTexturl() != null && cmd.getTexturl().getSize() > 0) {
				try {
					String name = cmd.getTexturl().getOriginalFilename();
					boolean hasdot = false;
					if (StringUtils.isNotBlank(name)) {
						int dot = name.lastIndexOf(".");
						if (dot > 0) {
							hasdot = true;
							name = name.substring(dot);
						}
					}
					String path = uploadFileProcess(cmd.getTexturl(), FileTypeEnum.jndcontract, hasdot, name);
					// 获取文件后缀

					ap.setTexturl(path);
				} catch (Exception e) {
					throw new PortalAppUnCheckedException("file upload failed");
				}
			}

			if (cmd.getPurfile() != null && cmd.getPurfile().getSize() > 0) {
				try {
					String name = cmd.getPurfile().getOriginalFilename();
					boolean hasdot = false;
					if (StringUtils.isNotBlank(name)) {
						int dot = name.lastIndexOf(".");
						if (dot > 0) {
							hasdot = true;
							name = name.substring(dot);
						}
					}
					String path = uploadFileProcess(cmd.getPurfile(), FileTypeEnum.jndcontract, hasdot, name);
					// 获取文件后缀

					ap.setPurfile(path);
				} catch (Exception e) {
					throw new PortalAppUnCheckedException("file upload failed");
				}
			}
			// 流程相关
			if ("2".equals(statu)) {
				ap.setStatus(null);
			} else if ("5".equals(statu)) {
				ap.setStatus("1");
			} else if ("8".equals(statu)) {
				ap.setStatus("4");
			} else if ("10".equals(statu)) {
				ap.setStatus(null);
			}
			contractMapper.updateContract(ap);
		}
	}

	/**
	 * <p>同步保存文件</p>
	 * @param file
	 * @return
	 * @throws IOException
	 * @author wangzh
	 */
	private String uploadFileProcess(MultipartFile file, FileTypeEnum fte, boolean hasdot, String suffix) throws Exception {
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
	 * <p>查看合同内容</p>
	 * @param modelMap
	 * @param currpage
	 * @param id
	 * @author wangzh
	 */
	public void jndContractview(ModelMap modelMap, Integer id, String node) {
		// 查询合同根据id
		Jndcontract contract = contractMapper.selectByPrimaryKey(id);
		if (contract == null) {
			throw new PortalBizCheckedException("该合同已经被删除");
		}
		// modelMap.put("con", contract);
		getContractById(modelMap, id);
		// String status = contract.getStatus();// 合同状态
		/*
		 * 合同审核进度：null初始状态 待审核 1采购审核通过2采购要求修改3采购不通过 4法务审核通过5法务要求修改6法务不通过 7财务审核通过（最终通过）8财务要求修改9财务不通过
		 * 撤销10（仅当为null时可以撤销）
		 */
		// String nopass = contract.getNopass();// 值为1，审核不通过，解锁子计划车辆;否则为null

		// 开始分析各种状态
		// 所有的编辑都以查看页面提交的方式存在、（查看、撤销、删除）显示在列表中供操作

		// 为null时，可以进行编辑、查看、撤销、删除
		// 1：查看
		// 2：查看、编辑、删除
		// 3：查看、删除
		// 4：查看
		// 5：查看、编辑、删除
		// 6：查看、删除
		// 7：查看
		// 8：查看、编辑、删除
		// 9：查看、删除
		// 10:查看、编辑、删除
	}

	/**
	 * 
	 * <p>到合同审核页</p>
	 * @param modelMap
	 * @param id
	 * @param node
	 * @author wangzh
	 */
	public void jndContractaudit(ModelMap modelMap, Integer id, String node) {
		modelMap.put("node", node);
		if (StringUtils.isBlank(node)) {
			throw new PortalBizCheckedException("缺少node节点");
		}
		// 查询合同根据id
		Jndcontract contract = contractMapper.selectByPrimaryKey(id);
		if (contract == null) {
			throw new PortalBizCheckedException("该合同已经被删除");
		}
		String status = contract.getStatus();// 合同状态
		/*
		 * 合同审核进度：null初始状态 待审核 1采购审核通过2采购要求修改3采购不通过 4法务审核通过5法务要求修改6法务不通过 7财务审核通过（最终通过）8财务要求修改9财务不通过
		 * 撤销10（仅当为null时可以撤销）
		 */
		// String nopass = contract.getNopass();// 值为1，审核不通过，解锁子计划车辆;否则为null

		// 开始分析各种状态
		// 所有的编辑都以查看页面提交的方式存在、（查看、撤销、删除）显示在列表中供操作

		// 为null时，可以进行编辑、查看、撤销、删除
		// 1：查看
		// 2：查看、编辑、删除
		// 3：查看、删除
		// 4：查看
		// 5：查看、编辑、删除
		// 6：查看、删除
		// 7：查看
		// 8：查看、编辑、删除
		// 9：查看、删除
		// 10:查看、编辑、删除

		if (StringUtils.isBlank(status) || "1".equals(status) || "4".equals(status)) {
			if ("1".equals(node) && StringUtils.isBlank(status)) {// 采购审核、初始提交时
				getContractById(modelMap, id);
			} else if ("2".equals(node) && "1".equals(status)) {// 法务审核、采购通过
				getContractById(modelMap, id);
			} else if ("3".equals(node) && "4".equals(status)) {// 财务审核、法务通过
				getContractById(modelMap, id);
			} else {
				throw new PortalBizCheckedException("审核节点和合同状态不匹配");
			}
		} else {
			throw new PortalBizCheckedException("该合同状态已经改变，不可审核，请返回列表查看");
		}
	}

	/**
	 * 
	 * <p>合同删除、撤销</p>
	 * @param id
	 * @param reb 撤销标识
	 * @author wangzh
	 */
	public void contractDelete(Integer id, String reb) {
		// 删除、撤销之前先查看一下现在这条记录的状态
		Jndcontract con = contractMapper.selectByPrimaryKey(id);
		if (con == null) {
			throw new PortalAppUnCheckedException("该记录已不存在!");
		}
		String sta = con.getStatus();
		if (StringUtils.isNotBlank(reb)) {// 标识撤销
			// 只有状态为null时可以撤销
			if (StringUtils.isBlank(sta)) {
				Jndcontract tempcon = new Jndcontract();
				tempcon.setId(id);
				tempcon.setStatus("10");// 10是撤销
				contractMapper.updateByPrimaryKeySelective(tempcon);
			} else {
				throw new PortalAppUnCheckedException("该记录状态已改变，请刷新列表查看!");
			}
		} else {
			// 删除 null提交审核待审核、10撤销后、不通过（3,6,9）、要求修改（2,5,8）
			// 只有通过的不可以删（1,4,7）
			if (sta == null || "10".equals(sta) || "3".equals(sta) || "6".equals(sta) || "9".equals(sta) || "2".equals(sta) || "5".equals(sta)
					|| "8".equals(sta)) {
				contractMapper.deleteByPrimaryKey(id);
			} else {
				throw new PortalAppUnCheckedException("该记录状态已改变，请刷新列表查看!");
			}
		}
	}

	/**
	 * 
	 * <p>通过合同id获取合同相关内容</p>
	 * @param modelMap
	 * @param id
	 * @author wangzh
	 */
	public void getContractById(ModelMap modelMap, Integer id) {
		Map<String, Object> conMap = contractMapper.selectMultiContractById(id);
		Object object = conMap.get("texturl");// 合同文件
		if (object != null) {
			String url = object.toString();
			url = url.substring(url.lastIndexOf("/") + 1);
			conMap.put("texturlname", url);
		}

		Object object2 = conMap.get("purfile");// 采购文件
		if (object2 != null) {
			String url = object2.toString();
			url = url.substring(url.lastIndexOf("/") + 1);
			conMap.put("purfilename", url);
		}

		Object object1 = conMap.get("text1url");// 合同签字文件
		Object stamp = conMap.get("stamp");// 是否签字标示

		if (object1 != null && stamp != null && ((Integer) stamp).intValue() == 1) {
			String url = object1.toString();
			url = url.substring(url.lastIndexOf("/") + 1);
			conMap.put("texturl1name", url);
		}
		modelMap.put("con", conMap);
		Store store = new Store();
		store.setType(conMap.get("currency").toString());
		List<Store> stores = storeMapper.selectByCriteria(store);
		modelMap.put("stores", stores);
		// 查询供应方
		// jndSupplier supplier = new jndSupplier();
		// supplier.setType(store.getType());
		// List<jndSupplier> splst = supplierMapper.selectByCriteria(supplier);
		// modelMap.put("splst", splst);
	}

	/**
	 * 
	 * <p>根据区域类型查询供应方列表</p>
	 * @param type
	 * @return
	 * @author wangzh
	 */
	public List<jndSupplier> querySpLst(String type) {
		jndSupplier supplier = new jndSupplier();
		supplier.setType(type);
		List<jndSupplier> splst = supplierMapper.selectByCriteria(supplier);
		return splst;
	}

	/**
	 * 
	 * <p>审核do</p>
	 * @param modelMap
	 * @param id
	 * @param node
	 * @param type 1通过2修改3不通过
	 * @param reason
	 * @throws PortalAppUnCheckedException
	 * @author wangzh
	 */
	public void contractauditdo(ModelMap modelMap, Integer id, String node, String type, String reason) throws PortalAppUnCheckedException {
		Jndcontract con = contractMapper.selectByPrimaryKey(id);
		if (con == null) {
			throw new PortalAppUnCheckedException("该记录已不存在!");
		}
		UserDTO userDto = SecurityHelper.getAdminUserInfo();
		if (userDto == null) {
			throw new PortalAppUnCheckedException("会话过期，请重新登录!");
		}
		String sta = con.getStatus();
		// node只能为 1,2,3
		Jndcontract upcon = new Jndcontract();
		upcon.setId(id);
		if ("1".equals(node)) {// 采购审核
			if (sta == null) {
				upcon.setAuditer1(userDto.getName());
				upcon.setAuditime1(new Date());
				if ("1".equals(type)) {// 通过
					upcon.setStatus("1");
					upcon.setRejectreason1("");// 清空
				} else if ("2".equals(type)) {// 修改
					upcon.setStatus("2");
					upcon.setRejectreason1(reason);
				} else if ("3".equals(type)) {// 不通过
					upcon.setStatus("3");
					upcon.setNopass("1");// 不通过标示
					upcon.setRejectreason1(reason);
				}
			} else {
				throw new PortalAppUnCheckedException("该合同状态已改变，不可审核!");
			}
		} else if ("2".equals(node)) {// 法务审核
			if ("1".equals(sta)) {
				upcon.setAuditer2(userDto.getName());
				upcon.setAuditime2(new Date());
				if ("1".equals(type)) {// 通过
					upcon.setStatus("4");
					upcon.setRejectreason2("");// 清空
				} else if ("2".equals(type)) {// 修改
					upcon.setStatus("5");
					upcon.setRejectreason2(reason);
				} else if ("3".equals(type)) {// 不通过
					upcon.setStatus("6");
					upcon.setNopass("1");// 不通过标示
					upcon.setRejectreason2(reason);
				}
			} else {
				throw new PortalAppUnCheckedException("该合同状态已改变，不可审核!");
			}
		} else if ("3".equals(node)) {// 财务审核
			if ("4".equals(sta)) {
				upcon.setAuditer3(userDto.getName());
				upcon.setAuditime3(new Date());
				if ("1".equals(type)) {// 通过
					upcon.setStatus("7");
					upcon.setRejectreason3("");// 清空
				} else if ("2".equals(type)) {// 修改
					upcon.setStatus("8");
					upcon.setRejectreason3(reason);
				} else if ("3".equals(type)) {// 不通过
					upcon.setStatus("9");
					upcon.setNopass("1");// 不通过标示
					upcon.setRejectreason3(reason);
				}
			} else {
				throw new PortalAppUnCheckedException("该合同状态已改变，不可审核!");
			}
		} else {
			throw new PortalAppUnCheckedException("审核节点错误!");
		}
		contractMapper.updateByPrimaryKeySelective(upcon);
	}

	/**
	 * 
	 * <p>上传正式签字文件</p>
	 * @param text1url
	 * @param id
	 * @author wangzh
	 */
	public void contractsign(MultipartFile text1url, Integer id) {
		// Jndcontract con=contractMapper.selectByPrimaryKey(id);
		// String sta=con.getStatus();
		Jndcontract con = new Jndcontract();
		con.setId(id);
		if (text1url != null && text1url.getSize() > 0) {
			try {
				String name = text1url.getOriginalFilename();
				boolean hasdot = false;
				if (StringUtils.isNotBlank(name)) {
					int dot = name.lastIndexOf(".");
					if (dot > 0) {
						hasdot = true;
						name = name.substring(dot);
					}
				}
				String path = uploadFileProcess(text1url, FileTypeEnum.jndcontract, hasdot, name);
				// 获取文件后缀
 
				con.setText1url(path);
				con.setStamp(1);// 已上传正式签字文件
			} catch (Exception e) {
				throw new PortalAppUnCheckedException("file upload failed");
			}
		}
		contractMapper.updateByPrimaryKeySelective(con);
	}
}
