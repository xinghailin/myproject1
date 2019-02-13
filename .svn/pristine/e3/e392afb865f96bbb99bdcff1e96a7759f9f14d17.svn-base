/*******************************************************************************
 * Project   : car-ms
 * Class Name: com.yyq.car.portal.ms.app.service.ClientService
 * Created By: wangzh 
 * Created on: 2018年4月2日 下午7:27:36
 * Copyright © 2013-2014 YYQ All rights reserved.
 ******************************************************************************/
package com.yyq.car.portal.ms.app.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.commons.lang.StringUtils;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import com.yyq.car.portal.common.mapper.biz.BizShopGroupClassifyMapper;
import com.yyq.car.portal.common.mapper.biz.BizShopGroupIntermeMapper;
import com.yyq.car.portal.common.mapper.biz.BizShopGroupMapper;
import com.yyq.car.portal.common.mapper.product.ShopMapper;
import com.yyq.car.portal.common.model.biz.BizShopGroup;
import com.yyq.car.portal.common.model.biz.BizShopGroupClassify;
import com.yyq.car.portal.common.model.biz.BizShopGroupInterme;
import com.yyq.car.portal.common.model.product.Shop;
import com.yyq.car.portal.ms.web.util.UUIDTool;


/**
 * <P>门店 分组  - 组管理</P>
 * @author liliang
 */
@Service
public class BizShopGroupService {

	@Autowired
	BizShopGroupMapper bizShopGroupMapper;
	@Autowired
	ShopMapper shopMapper;
	@Autowired
	BizShopGroupClassifyMapper shopGroupClassifyMapper;
	@Autowired
	BizShopGroupIntermeMapper shopGroupIntermeMapper;

	/**
	 * 
	 * <p>组查询</p>
	 * @param name
	 * @param start
	 * @param pageSize
	 * @return
	 * @author liliang
	 */
	public Map<String, Object> shopquery(String name, String start, String pageSize) {
		Map<String, Object> map = new HashMap<String, Object>();
		int ps = Integer.parseInt(pageSize);
		BizShopGroup record = new BizShopGroup();
		if (StringUtils.isNotBlank(name)) {
			record.setName(name);
		}
		List<BizShopGroup> lst = bizShopGroupMapper.selectByCriteria(record, new RowBounds(
				(Integer.parseInt(start) - 1) * ps, ps));
		int size = bizShopGroupMapper.countByCriteria(record);
		map.put("result", lst);
		map.put("total", size);
		return map;
	}

	/**
	 * 
	 * <p>获取门店列表</p>
	 * @param 
	 * @param 
	 * @return
	 * @author liliang
	 */
	public List<Shop> queryshoplst(ModelMap map) {
		Map<String, Object> param = new HashMap<String, Object>();
		List<Shop> lst = shopMapper.selectShopsByParameter(param);
		return lst;
	}

	/**
	 * 
	 * <p>获取 门店列表  并且标记出属于当前组的门店</p>
	 * @param 
	 * @param 
	 * @return
	 * @author liliang
	 */
	public List<Shop> querysignshoplst(Integer id) {
		Map<String, Object> param = new HashMap<String, Object>();
		List<Shop> lst = shopMapper.selectShopsByParameter(param);

		BizShopGroupInterme shopGroupInterme = new BizShopGroupInterme();
		shopGroupInterme.setGroupid(id);
		List<BizShopGroupInterme> groupInterme = shopGroupIntermeMapper.selectByCriteria(shopGroupInterme);

		for (Shop shop : lst) {
			for (BizShopGroupInterme interme : groupInterme) {
				if (shop.getId().equals(interme.getShopid())) {
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
	 * @param host
	 * @param assistant1
	 * @param assistant2
	 * @param shopId
	 * @author liliang
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, rollbackFor = Exception.class)
	public Map<String, Object> groupaddsave(ModelMap map, BizShopGroup bizshopGroup) {
		Map<String, Object> reMap = new HashMap<String, Object>();
		reMap.put("status", true);
		reMap.put("message", "");
		// 先校验名字是否存在
		BizShopGroup bsg = new  BizShopGroup();
		bsg.setName(bizshopGroup.getName());
	    List<BizShopGroup> lst = bizShopGroupMapper.selectByFullName(bsg);
		if(lst.size() > 0){
			reMap.put("status", false);
			reMap.put("message", "用户名已存在");
			return reMap;
		}
		BizShopGroup shopGroup = new BizShopGroup();
		shopGroup.setName(bizshopGroup.getName());
		shopGroup.setHostname(bizshopGroup.getHostname());
		shopGroup.setHostid(bizshopGroup.getHostid());
		shopGroup.setAssistant1id(bizshopGroup.getAssistant1id());
		shopGroup.setAssistant1name(bizshopGroup.getAssistant1name());
		shopGroup.setAssistant2id(bizshopGroup.getAssistant2id());
		shopGroup.setAssistant2name(bizshopGroup.getAssistant2name());
		shopGroup.setCreatetime(new Date());
		shopGroup.setCreateuser(bizshopGroup.getCreateuser());
		bizShopGroupMapper.insertSelective(shopGroup);

		int shopGroupid = shopGroup.getId();// 组id
		// 同一组门店的
		for (int i = 0; i < bizshopGroup.getShopids().size(); i++) {
			BizShopGroupInterme shopGroupInterme = new BizShopGroupInterme();
			shopGroupInterme.setId(UUIDTool.getUUID());
			shopGroupInterme.setGroupid(shopGroupid);
			shopGroupInterme.setShopid(bizshopGroup.getShopids().get(i));
			shopGroupIntermeMapper.insertSelective(shopGroupInterme);
		}
		// 主1 副1 副2 和组 报存

		if (null != bizshopGroup.getHostid()) {
			BizShopGroupClassify shopGroupClassify = new BizShopGroupClassify();
			shopGroupClassify.setId(UUIDTool.getUUID());
			shopGroupClassify.setUserid(bizshopGroup.getHostid());
			shopGroupClassify.setGroupid(shopGroupid);
			shopGroupClassifyMapper.insertSelective(shopGroupClassify);
		}
		if (null != bizshopGroup.getAssistant1id()) {
			BizShopGroupClassify shopGroupClassify = new BizShopGroupClassify();
			shopGroupClassify.setId(UUIDTool.getUUID());
			shopGroupClassify.setUserid(bizshopGroup.getAssistant1id());
			shopGroupClassify.setGroupid(shopGroupid);
			shopGroupClassifyMapper.insertSelective(shopGroupClassify);
		}
		if (null != bizshopGroup.getAssistant2id()) {
			BizShopGroupClassify shopGroupClassify = new BizShopGroupClassify();
			shopGroupClassify.setId(UUIDTool.getUUID());
			shopGroupClassify.setUserid(bizshopGroup.getAssistant2id());
			shopGroupClassify.setGroupid(shopGroupid);
			shopGroupClassifyMapper.insertSelective(shopGroupClassify);
		}
		reMap.put("message", "保存成功");
		return reMap;
	}

	/**
	 * 
	 * <p>获取门店组</p>
	 * @param 
	 * @param 
	 * @return
	 * @author liliang
	 */
	public BizShopGroup queryshopGroupById(Integer id) {
		BizShopGroup shopGroup = bizShopGroupMapper.selectByPrimaryKey(id);
		return shopGroup;
	}

	/**
	 * 
	 * <p>获取门店组的门店list  根据门店组的id</p>
	 * @param 
	 * @param 
	 * @return
	 * @author liliang
	 */
	public List<BizShopGroupInterme> queryShopGroupIntermeByGroupId(Integer id) {
		BizShopGroupInterme record = new BizShopGroupInterme();
		record.setGroupid(id);
		List<BizShopGroupInterme> shopGroupInterme = shopGroupIntermeMapper.selectByCriteria(record);
		return shopGroupInterme;
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
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, rollbackFor = Exception.class)
	public Map<String, Object> groupeditsave(BizShopGroup bizshopGroup) {
		Map<String, Object> reMap = new HashMap<String, Object>();
		reMap.put("status", true);
		reMap.put("message", "");
		// 先校验名字是否存在
		BizShopGroup bsg = new  BizShopGroup();
		bsg.setName(bizshopGroup.getName());
	    List<BizShopGroup> loadbsg = bizShopGroupMapper.selectByFullName(bsg);
		if(loadbsg.size() > 0){
			if(null!=loadbsg.get(0) && !loadbsg.get(0).getId().equals(bizshopGroup.getId())){
				reMap.put("status", false);
				reMap.put("message", "用户名已存在");
				return reMap;
			}
			
		}
		
		// 以下是门店组 对象的 update
		BizShopGroup shopGroup = new BizShopGroup();
		shopGroup.setId(bizshopGroup.getId());
		shopGroup.setName(bizshopGroup.getName());
		shopGroup.setHostname(bizshopGroup.getHostname());
		shopGroup.setHostid(bizshopGroup.getHostid());
		shopGroup.setAssistant1id(bizshopGroup.getAssistant1id());
		shopGroup.setAssistant1name(bizshopGroup.getAssistant1name());
		shopGroup.setAssistant2id(bizshopGroup.getAssistant2id());
		shopGroup.setAssistant2name(bizshopGroup.getAssistant2name());
		shopGroup.setModifytime(new Date());
		shopGroup.setModifyuser(bizshopGroup.getModifyuser());
		bizShopGroupMapper.updateByPrimaryKeySelective(shopGroup);

		// 同一组门店的 update 先删除之前的

		BizShopGroupInterme delshopGroupInterme = new BizShopGroupInterme();
		delshopGroupInterme.setGroupid(bizshopGroup.getId());
		shopGroupIntermeMapper.deleteSelective(delshopGroupInterme);

		for (int i = 0; i < bizshopGroup.getShopids().size(); i++) {
			BizShopGroupInterme shopGroupInterme = new BizShopGroupInterme();
			shopGroupInterme.setId(UUIDTool.getUUID());
			shopGroupInterme.setGroupid(bizshopGroup.getId());
			shopGroupInterme.setShopid(bizshopGroup.getShopids().get(i));
			shopGroupIntermeMapper.insertSelective(shopGroupInterme);
		}
		// 主1 副1 副2 和组 报存 先删除之前的
		BizShopGroupClassify delshopGroupClassify = new BizShopGroupClassify();
		delshopGroupClassify.setGroupid(bizshopGroup.getId());
		shopGroupClassifyMapper.deleteSelective(delshopGroupClassify);

		if (null != bizshopGroup.getHostid()) {
			BizShopGroupClassify shopGroupClassify = new BizShopGroupClassify();
			shopGroupClassify.setId(UUIDTool.getUUID());
			shopGroupClassify.setUserid(bizshopGroup.getHostid());
			shopGroupClassify.setGroupid(bizshopGroup.getId());
			shopGroupClassifyMapper.insertSelective(shopGroupClassify);
		}
		if (null != bizshopGroup.getAssistant1id()) {
			BizShopGroupClassify shopGroupClassify = new BizShopGroupClassify();
			shopGroupClassify.setId(UUIDTool.getUUID());
			shopGroupClassify.setUserid(bizshopGroup.getAssistant1id());
			shopGroupClassify.setGroupid(bizshopGroup.getId());
			shopGroupClassifyMapper.insertSelective(shopGroupClassify);
		}
		if (null != bizshopGroup.getAssistant2id()) {
			BizShopGroupClassify shopGroupClassify = new BizShopGroupClassify();
			shopGroupClassify.setId(UUIDTool.getUUID());
			shopGroupClassify.setUserid(bizshopGroup.getAssistant2id());
			shopGroupClassify.setGroupid(bizshopGroup.getId());
			shopGroupClassifyMapper.insertSelective(shopGroupClassify);
		}
		reMap.put("message", "保存成功");
		return reMap;

	}
	
	/**
	 * 
	 * <p>组 删除</p>
	 * @param id
	 * @param shopId
	 * @author liliang
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, rollbackFor = Exception.class)
	public void groupDelete(String theId) {
		if (StringUtils.isNotBlank(theId)) {
			int id = Integer.valueOf(theId);
			// 同一组门店的 update 先删除之前的
			BizShopGroupInterme delshopGroupInterme = new BizShopGroupInterme();
			delshopGroupInterme.setGroupid(id);
			shopGroupIntermeMapper.deleteSelective(delshopGroupInterme);

			// 主1 副1 副2 和组 报存 先删除之前的
			BizShopGroupClassify delshopGroupClassify = new BizShopGroupClassify();
			delshopGroupClassify.setGroupid(id);
			shopGroupClassifyMapper.deleteSelective(delshopGroupClassify);

			// 以下是门店组 对象的
			bizShopGroupMapper.deleteByPrimaryKey(id);
		}
	}
	
	/**
	 *  公共方法 适合当主账号的 门店
	 * <p>1 根据传递参数中的userid   查询出来属于那几个 组
	 *    2 如果属于组中的主账号。则查询出所属组中的说有shipid  返回list</p>
	 * @param 
	 * @param 
	 * @return
	 * @author liliang
	 */
	public List<Integer> queryShopGroupIdsByUseridandShopid(Integer userid, Integer shopid) {
		List<Integer> shops = new ArrayList<Integer>();
		if (null != userid) {
			List<Integer> groups = new ArrayList<Integer>();
			// 查询出属于哪几个组
			BizShopGroupClassify record = new BizShopGroupClassify();
			record.setUserid(userid);
			List<BizShopGroupClassify> groupClassifyList = shopGroupClassifyMapper.selectByCriteria(record);
			for (BizShopGroupClassify grClassify : groupClassifyList) {
				BizShopGroup shopgroup = bizShopGroupMapper.selectByPrimaryKey(grClassify.getGroupid());
				if (shopgroup.getHostid().equals(userid)) {
					groups.add(shopgroup.getId());
				} else if (null != shopgroup.getAssistant1id() && shopgroup.getAssistant1id().equals(userid)) {
					groups.add(shopgroup.getId());
				} else if (null != shopgroup.getAssistant2id() && shopgroup.getAssistant2id().equals(userid)) {
					groups.add(shopgroup.getId());
				}
			}

			// 如果是所属组 的主账户 则把所属组中所有shopid 查询出来
			if (null != groups && groups.size() > 0) {
				for (Integer g : groups) {
					BizShopGroupInterme groupInterme = new BizShopGroupInterme();
					groupInterme.setGroupid(g);
					List<BizShopGroupInterme> gIntermes = shopGroupIntermeMapper.selectByCriteria(groupInterme);
					for (BizShopGroupInterme gInterme : gIntermes) {
						shops.add(gInterme.getShopid());
					}
				}
				shops.add(shopid);//添加主账户门店id2018年8月27日14:41:40 x
			} else {
				shops.add(shopid);
			}

		}

		return shops;
	}

}
