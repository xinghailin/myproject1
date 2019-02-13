/*******************************************************************************
 * Class Name: com.yyq.car.portal.ms.web.controller.BizClient
 * Created By: wangzh 
 * Created on: 2018年4月2日 下午2:59:48
 * Copyright © 2013-2014 YYQ All rights reserved.
 ******************************************************************************/
package com.yyq.car.portal.ms.web.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.yyq.car.portal.common.constant.Constants;
import com.yyq.car.portal.common.constant.MasterDataType;
import com.yyq.car.portal.common.dto.CarTypeinDto;
import com.yyq.car.portal.common.dto.ClientInfoDto;
import com.yyq.car.portal.common.dto.UserDTO;
import com.yyq.car.portal.common.model.auth.User;
import com.yyq.car.portal.common.model.biz.Bizcontract;
import com.yyq.car.portal.common.model.biz.Bizzeropurchase;
import com.yyq.car.portal.common.model.comm.Abrand;
import com.yyq.car.portal.common.model.product.Shop;
import com.yyq.car.portal.common.model.product.Store;
import com.yyq.car.portal.common.service.security.SecurityHelper;
import com.yyq.car.portal.common.util.CachFactory;
import com.yyq.car.portal.common.util.DateUtils;
import com.yyq.car.portal.ms.app.service.AssetRepositoryService;
import com.yyq.car.portal.ms.app.service.BrandAndModelService;
import com.yyq.car.portal.ms.app.service.ClientService;
import com.yyq.car.portal.ms.web.command.InvoiceAuditCmd;
import com.yyq.car.portal.ms.web.constant.Url;
import com.yyq.car.portal.ms.web.constant.View;
import com.yyq.car.portal.ms.web.constant.WebConstants;


/**
 * <P>新销售管理</P>
 * @author wangzh
 */
@Controller
class BizClientController {

	@Autowired
	ClientService clientService;

	@Autowired
	AssetRepositoryService assetService;

	@Autowired
	BrandAndModelService brandAndModelService;

	@Autowired
	AssetRepositoryService assetRepositoryService;

	/**
	 * 定金到账审核页面
	 * @param currpage
	 * @param map
	 * @return
	 */
	@RequestMapping(value = Url.bizcontractfinance, method = RequestMethod.GET)
	public String bizcontractfinance(String currpage, ModelMap map) {
		map.put("currpage", currpage);
		UserDTO user = SecurityHelper.getAdminUserInfo();
		map.put("loginid", user.getId());
		return "bizcontractfinancepage";

	}

	/**
	 * 
	 * <p>直接定位到jsp</p>
	 * @param url
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = "/jsp/{url}", method = RequestMethod.GET)
	public String test(@PathVariable String url) {
		return url;
	}

	@RequestMapping(value = "/jsp/{url}/{url1}", method = RequestMethod.GET)
	public String test1(@PathVariable String url, @PathVariable String url1) {
		return url + "/" + url1;
	}

	/**
	 * 
	 * <p>到客户信息表首页</p>
	 * @param map
	 * @param clienttype
	 * @param all
	 * @param currpage
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.bizclientinfoindex, method = RequestMethod.GET)
	public String bizclientinfoindex(ModelMap map, String worktype, String all, String currpage) {
		map.put("currpage", currpage);
		if (StringUtils.isNotBlank(worktype))
			map.put("worktype", worktype);
		if (StringUtils.isNotBlank(all)) {
			List<Shop> shopLst = assetService.queryAllShop();
			map.put("shopLst", shopLst);
			return "bizclientinfolstallview";
		}
		return "bizclientinfolstview";
	}

	/**
	 * 
	 * <p>客户信息表数据查询</p>
	 * @param dto
	 * @param start
	 * @param pageSize
	 * @param all 1代表总览
	 * @param map
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.bizclientinfoquery, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> bizclientinfoquery(ClientInfoDto dto, String start, String pageSize, String all, ModelMap map) {
		Map<String, Object> returnMap = clientService.clientFindListDo(dto, start, pageSize, all);
		return returnMap;
	}

	/**
	 * 
	 * <p>到客户信息表门店总览  首页</p>
	 * @param map
	 * @param clienttype
	 * @param all
	 * @param currpage
	 * @return
	 * @author liliang
	 */
	@RequestMapping(value = Url.bizclientinfoindex_shopGroup, method = RequestMethod.GET)
	public String bizclientinfoindex_shopGroup(ModelMap map, String worktype, String all, String currpage) {
		map.put("currpage", currpage);
		if (StringUtils.isNotBlank(worktype))
			map.put("worktype", worktype);
		if (StringUtils.isNotBlank(all)) {
			List<Shop> shopLst = assetService.queryAllShop();
			map.put("shopLst", shopLst);
		}
		return "bizclientinfolst_shopGroupview";
	}

	/**
	 * 
	 * <p>客户信息表数据查询</p>
	 * @param dto
	 * @param start
	 * @param pageSize
	 * @param all 1代表总览
	 * @param map
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.bizclientinfoquery_shopGroup, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> bizclientinfoquery_shopGroup(ClientInfoDto dto, String start, String pageSize, String all, ModelMap map) {
		Map<String, Object> returnMap = clientService.clientFindListDo_shopGroup(dto, start, pageSize, all);
		return returnMap;
	}

	/**
	 * 到客户信息新增页
	 * 
	 * @param map
	 * @param worktype
	 * @return
	 * @author wangzh
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = Url.bizclientinfoadd, method = RequestMethod.GET)
	public String bizclientinfoadd(ModelMap map, String worktype, String currpage) {
		Map<String, Object> pMap = (Map<String, Object>) CachFactory.getInstance().get(Constants.MASTER_DATA_LIST);
		Map<String, Object> priceLst = (Map<String, Object>) pMap.get(MasterDataType.PRICE.getValue());// 价格
		map.put("priceLst", priceLst);
		map.put("worktype", worktype);
		map.put("currpage", currpage);
		// 获取登陆信息
		UserDTO userInfo = SecurityHelper.getAdminUserInfo();
		String shopId = userInfo.getShop();
		if (StringUtils.isNotBlank(shopId)) {
			Shop shop = assetService.queryShopById(Integer.parseInt(shopId));
			if (shop != null) {
				map.put("shop", shop);
			}
		}
		Integer key = assetService.querySequenceValue(400);// 选择客户信息表的下一个主键
		map.put("infoId", key);
		String now = DateUtils.formate(DateUtils.getCurrentTime(), DateUtils.COMPACT_DATE_FORMAT);
		map.put("filenum", WebConstants.FILE_PREFIX + now.substring(2) + key);
		List<Abrand> initials = brandAndModelService.queryBrandinitial();
		map.put("initials", initials);// 品牌首字母
		return "bizclientinfoaddview";
	}

	/**
	 * 新增一条交流信息接着查询所有的
	 * 
	 * @param sellerId
	 * @param clientId
	 * @param content
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.bizcommuaddquery, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> bizcommuaddquery(String sellerId, String clientId, String content) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			clientService.addCommuAndQuery(sellerId, clientId, content, map);
			map.put("status", "1");
		} catch (Exception e) {
			map.put("status", "0");
		}
		return map;
	}

	/**
	 * 根据当前登录账号查询沟通列表
	 * 
	 * @param infoId 登录账号
	 * @param start
	 * @param pageSize
	 * @param map
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.bizcommuquery, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> bizcommuquery(String infoId, String start, String pageSize, ModelMap map) {
		Map<String, Object> returnMap = clientService.CommuLstDo(infoId, start, pageSize);
		return returnMap;
	}

	/**
	 * 到客户信息编辑页
	 * 
	 * @param id
	 * @param currpage
	 * @param worktype
	 * @param map
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.bizclientinfoedit, method = RequestMethod.GET)
	public String bizclientinfoedit(String id, String currpage, String worktype, ModelMap map) {
		// 根据id获取client
		clientService.getEditClient(id, map);
		map.put("currpage", currpage);
		map.put("worktype", worktype);
		if ("0".equals(map.get("editstatus"))) {
			return "bizclientinfoviewview";
		}
		return "bizclientinfoeditview";
	}

	/**
	 * 
	 * <p>信息表保存</p>
	 * @param dto
	 * @param currpage
	 * @param map
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.bizclientinfosave, method = RequestMethod.POST)
	public String bizclientinfosave(ClientInfoDto dto, String worktype, String shopName, String type, ModelMap map, String currpage) {
		try {
			String flag = clientService.UpdateSaveClients(dto, worktype, type, shopName, map);
			if ("1".equals(flag)) {// 立即购买
				// 到合同填写页
				map.put("currpage", currpage);
				map.put("worktype", worktype);
				return "biz/contractadd";
				// 定位到WEB-INF/views/biz/contractadd.jsp
				// return "bizcontractaddview";
			} else if ("2".equals(flag)) {
				return bizclientinfoindex(map, worktype, null, currpage);
			}
		} catch (Exception e) {
			e.printStackTrace();
			map.put("message", e.getMessage());
			return View.ERROR_MESSAGE_NOLOGIN;
		}
		return View.ERROR_MESSAGE_NOLOGIN;
	}

	/**
	 * 到客户信息总览查看
	 * 
	 * @param id
	 * @param currpage
	 * @param worktype
	 * @param map
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.bizclientinfoallview, method = RequestMethod.GET)
	public String bizclientinfoallview(String id, String currpage, String worktype, ModelMap map) {
		// 根据id获取client
		clientService.getViewAllClient(id, map);
		map.put("all", "1");
		map.put("currpage", currpage);
		map.put("worktype", worktype);
		return "bizclientinfoviewview";
	}

	/**
	 * 
	 * <p>保存合同</p>
	 * @param dto
	 * @param salecontract
	 * @param reportbill
	 * @param downposbill
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.bizcontractsave, method = RequestMethod.POST)
	public String bizcontractsave(ModelMap map, Bizcontract dto, MultipartFile fsalecontract, MultipartFile freportbill, MultipartFile fdownposbill,
			String currpage) {
		try {
			clientService.contractsave(dto, fsalecontract, freportbill, fdownposbill);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("message", e.getMessage());
			return View.ERROR_MESSAGE;
		}
		if (dto.getId() == null) {
			return bizclientinfoindex(map, null, null, null);
		}
		return bizcontractindex(map, null, currpage, null);
	}

	/**
	 * 
	 * <p>到合同首页</p>
	 * @param map
	 * @param clienttype
	 * @param all
	 * @param currpage
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.bizcontractindex, method = RequestMethod.GET)
	public String bizcontractindex(ModelMap map, String node, String currpage, String all) {

		User user = SecurityHelper.getAdminUserInfo();
		map.put("loginid", user.getId());
		if (StringUtils.isNotBlank(currpage)) {
			map.put("currpage", currpage);
		}
		if (StringUtils.isNotBlank(node)) {
			map.put("node", node);
		}
		if (StringUtils.isNotBlank(all)) {
			map.put("all", all);
		}
		return "bizcontractlstview";
	}

	/**
	 * 
	 * <p>合同表数据查询</p>
	 * @param dto
	 * @param start
	 * @param pageSize
	 * @param map
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.bizcontractquery, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> bizcontractquery(ModelMap map, String filecode, String name, String bname, String workType, String identify,
			Integer start, Integer pageSize, String all, String node) {
		Map<String, Object> returnMap = clientService.contractquery(filecode, name, bname, workType, identify, start, pageSize, all, node);
		return returnMap;
	}

	/**
	 * 
	 * <p>进入合同流程操作页面</p>
	 * @param map
	 * @param id 合同主键
	 * @param currpage
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.bizcontractoperate, method = RequestMethod.GET)
	public String bizcontractoperate(ModelMap map, Integer id, String currpage, String node) {
		map.put("currpage", currpage);
		if (StringUtils.isNotBlank(node)) {
			map.put("node", node);
		}
		return clientService.getcontractbyidforoperate(map, id, node);
	}

	/**
	 * 
	 * <p>合同信息查看</p>
	 * @param map
	 * @param id
	 * @param currpage
	 * @param all
	 * @return
	 * @author wangzh insurance添加保险列表查看时用来返回
	 */
	@RequestMapping(value = Url.bizcontractbaseview, method = RequestMethod.GET)
	public String bizcontractbaseview(ModelMap map, Integer id, String currpage, String all, String type, String node, String insurance) {
		map.put("currpage", currpage);
		if (StringUtils.isNotBlank(all)) {
			map.put("all", all);
		}
		if (StringUtils.isNotBlank(node)) {
			map.put("node", node);
		}
		return clientService.getbasecontractbyidforview(map, id, type, insurance);
	}

	/**
	 * 
	 * <p>门店部审核合同</p>
	 * @param id
	 * @param pas
	 * @param zero
	 * @param map
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.bizcontractshopaudit, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> bizcontractshopaudit(Integer id, String pas, String zero, String reason, ModelMap map) {
		Map<String, Object> rMap = new HashMap<String, Object>();
		try {
			clientService.contractshopaudit(id, pas, zero, reason);
			rMap.put("status", true);
		} catch (Exception e) {
			rMap.put("status", false);
			rMap.put("msg", e.getMessage());
		}
		return rMap;
	}

	/**
	 * 
	 * <p>门店确认客户是否接受金融审批金额</p>
	 * @param map
	 * @param id
	 * @param riskid
	 * @param ret
	 * @param dontagreereason
	 * @param downpay
	 * @param fdownposbill
	 * @param currpage
	 * @return
	 * @throws Exception
	 * @author wangzh
	 */
	@RequestMapping(value = Url.bizcontractfinfirstpay, method = RequestMethod.POST)
	public String bizcontractfinfirstpay(ModelMap map, Integer id, Integer riskid, String ret, String dontagreereason, BigDecimal downpay,
			MultipartFile fdownposbill, String currpage) throws Exception {

		clientService.bizcontractfinfirstpay(id, riskid, ret, dontagreereason, downpay, fdownposbill);

		return bizcontractindex(map, null, currpage, null);
	}

	/**
	 * 
	 * <p>全款--定金到账审核</p>
	 * @param id
	 * @param rdp
	 * @param map
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.bizcontractdownpay, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> bizcontractdownpay(ModelMap map, Integer id, String pay) {
		Map<String, Object> rMap = new HashMap<String, Object>();
		try {
			clientService.contractdownpay(id, pay);
			rMap.put("status", true);
		} catch (Exception e) {
			rMap.put("status", false);
			rMap.put("msg", e.getMessage());
		}
		return rMap;
	}

	/**
	 * 
	 * <p>到零采首页</p>
	 * @param map
	 * @param currpage
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.bizzeropurindex, method = RequestMethod.GET)
	public String bizzeropurindex(ModelMap map, String currpage) {
		map.put("currpage", currpage);
		return "bizzeropurlstview";
	}

	/**
	 * 
	 * <p>零采表数据查询</p>
	 * @param dto
	 * @param start
	 * @param pageSize
	 * @param map
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.bizzeropurquery, method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> bizzeropurquery(ModelMap map, String brand, String vin, String code, String status, String start, String pageSize) {
		Map<String, Object> returnMap = clientService.zeropurquery(brand, vin, code, status, start, pageSize);
		return returnMap;
	}

	/**
	 * 
	 * <p>到零采操作页面 包括查看</p>
	 * @param map
	 * @param id
	 * @param currpage
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.bizzeropuroperate, method = RequestMethod.GET)
	public String bizzeropuroperate(ModelMap map, Integer id, String currpage) {
		map.put("currpage", currpage);
		clientService.zeropuroperate(map, id);
		return "biz/zeropur";
	}

	/**
	 * 
	 * <p>零采保存</p>
	 * @param map
	 * @param biz
	 * @param currpage
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.bizzeropursave, method = RequestMethod.POST)
	public String bizzeropursave(ModelMap map, Bizzeropurchase biz, String currpage) {
		clientService.zeropursave(biz);
		return bizzeropurindex(map, currpage);
	}

	/**
	 * 
	 * <p>到零采入库首页</p>
	 * @param map
	 * @param currpage
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.bizzeropurstoreindex, method = RequestMethod.GET)
	public String bizzeropurstoreindex(ModelMap map, String currpage) {
		map.put("currpage", currpage);
		return "bizzeropurstorelstview";
	}

	/**
	 * 
	 * <p>零采入库表数据查询</p>
	 * @param dto
	 * @param start
	 * @param pageSize
	 * @param map
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.bizzeropurstorequery, method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> bizzeropurstorequery(ModelMap map, String brand, String vin, String status, String start, String pageSize) {
		Map<String, Object> returnMap = clientService.zeropurstorequery(brand, vin, status, start, pageSize);
		return returnMap;
	}

	/**
	 * 
	 * <p>获取零采入库详情</p>
	 * @param map
	 * @param id
	 * @param currpage
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.bizzeropurstore, method = RequestMethod.GET)
	public String bizzeropurstore(ModelMap map, Integer id, String currpage) {
		map.put("currpage", currpage);
		Bizzeropurchase zp = clientService.zeropurstore(id);
		map.put("zp", zp);
		return "biz/zeropurstore";
	}

	/**
	 * 
	 * <p>零采入库到车辆录入页</p>
	 * @param map
	 * @param id
	 * @param currpage
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.bizzeropurstoretosave, method = RequestMethod.POST)
	public String bizzeropurstoretosave(ModelMap map, Integer id, String currpage) {
		map.put("currpage", currpage);
		Bizzeropurchase zp = clientService.zeropurstore(id);
		CarTypein(map);
		map.put("zp", zp);
		return "biz.cartypeinview";
	}

	public void CarTypein(ModelMap map) {
		// 获取仓库列表
		List<Store> storeLst = assetRepositoryService.queryAllStore();
		map.put("storeLst", storeLst);
		// 查询拥有门店管理权限的账户
		List<User> user = assetRepositoryService.queryName();
		map.put("user", user);
		List<Abrand> brand = brandAndModelService.queryBrandinitial();
		List<Shop> shopLst = assetRepositoryService.queryAllShop();
		List<Map<String, String>> shopStoreLst = new ArrayList<Map<String, String>>();
		for (int i = 0; i < storeLst.size(); i++) {
			Map<String, String> maps = new HashMap<String, String>();
			maps.put("name", storeLst.get(i).getName());
			maps.put("id", "s" + storeLst.get(i).getId());// 仓库
			shopStoreLst.add(maps);
		}
		for (int i = 0; i < shopLst.size(); i++) {
			Map<String, String> maps = new HashMap<String, String>();
			maps.put("name", shopLst.get(i).getName());
			maps.put("id", "h" + shopLst.get(i).getId());// 门店
			shopStoreLst.add(maps);
		}
		map.put("shop", shopStoreLst);
		map.put("brand", brand);
		// return View.CAR_TYPEIN_VIEW;
	}

	/**
	 * 提交车辆录入审核
	 * 
	 * @param dto
	 * @param map
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.bizcartypeinsubmit, method = RequestMethod.POST)
	public String CarTypeinSubmit(CarTypeinDto dto, String currpage, ModelMap map) {
		clientService.checkvinishave(dto.getVin());
		try {
			assetRepositoryService.saveCarTypein(dto);
			// map.put("message", "保存成功！");
			// return CarTypein(map);
			// "redirect:" + "/" + Url.CAR_TYPEIN;
			return bizzeropurstoreindex(map, currpage);
		} catch (IOException e) {
			e.printStackTrace();
			map.put("message", e.getMessage());
			return View.ERROR_MESSAGE;
		}

	}

	/**
	 * 
	 * <p>风控进件保存</p>
	 * @param map
	 * @param id
	 * @param conid
	 * @param concode
	 * @param str json字符串
	 * @return
	 * @author wangzh
	 * @throws Exception 
	 */
	@RequestMapping(value = Url.bizriskadd, method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> bizriskadd(ModelMap map, Integer conid, String concode, String str) throws Exception {
		Map<String, Object> reMap = new HashMap<String, Object>();
		// try {
		clientService.saverisknew(conid, concode, str);
		reMap.put("status", true);
		// } catch (Exception e) {
		// reMap.put("status", false);
		// reMap.put("message", e.getMessage());
		// // return "error.message.nologin";
		// }
		// return bizcontractindex(map, null, currpage, null);
		return reMap;
	}

	/**
	 * 
	 * <p>风控进件审核</p>
	 * @param map
	 * @param id
	 * @param ret
	 * @param node
	 * @param currpage
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.bizriskaudit, method = RequestMethod.POST)
	public String bizriskaudit(ModelMap map, Integer id, Integer riskid, BigDecimal aproveprice, BigDecimal missmoney, MultipartFile fapprovaltable,
			String ret, String repairreason, String refusereason, String node, String currpage) {
		try {
			clientService.contractriskaudit(id, riskid, aproveprice, missmoney, fapprovaltable, ret, repairreason, refusereason, node);
			return bizcontractindex(map, node, currpage, null);
		} catch (Exception e) {
			return View.ERROR_MESSAGE_NOLOGIN;
		}
	}

	/**
	 * 
	 * <p>全款合同车架号添加</p>
	 * @param id
	 * @param carid
	 * @param vin
	 * @param map
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.bizcontractvin, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> bizcontractvin(Integer id, Integer carid, String vin, ModelMap map) {
		Map<String, Object> rMap = new HashMap<String, Object>();
		try {
			clientService.contractvin(id, carid, vin);
			rMap.put("status", true);
		} catch (Exception e) {
			rMap.put("status", false);
			rMap.put("msg", e.getMessage());
		}
		return rMap;
	}

	/**
	 * 
	 * <p>根据id查询合同</p>
	 * @param id
	 * @param map
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.bizquerycontractbyid, method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> bizquerycontractbyid(Integer id, ModelMap map) {
		Map<String, Object> rMap = new HashMap<String, Object>();
		try {
			Bizcontract co = clientService.getcontractbyid(id);
			rMap.put("status", true);
			rMap.put("result", co);
		} catch (Exception e) {
			rMap.put("status", false);
			rMap.put("msg", e.getMessage());
		}
		return rMap;
	}

	/**
	 * 
	 * <p>为全款合同选择车辆</p>
	 * @param map
	 * @param stepflow
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.carrealsalechoose, method = RequestMethod.GET)
	public String CarAssetLstRealForChoose(ModelMap map, Integer carid, String vin, String stepflow) {
		// 获取仓库列表
		List<Store> storeLst = assetRepositoryService.queryAllStore();
		map.put("storeLst", storeLst);
		map.put("stepflow", stepflow);
		if (carid != null) {
			map.put("carid", carid);
		}
		if (StringUtils.isNotBlank(vin)) {
			try {
				vin = new String(vin.getBytes("iso8859-1"), "utf-8");
				map.put("vin", vin);
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}

		return "biz.chooserealSale";
	}

	/**
	 * 
	 * <p>风控进件编辑保存</p>
	 * @param map
	 * @param id
	 * @param conid
	 * @param dels
	 * @param str {@link JSONObject}字符串
	 * @return
	 * @author wangzh
	 * @throws Exception 
	 */
	@RequestMapping(value = Url.bizriskedit, method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> bizriskedit(ModelMap map, Integer id, Integer conid, String dels, String str) throws Exception {
		Map<String, Object> reMap = new HashMap<String, Object>();
		// try {
		clientService.saveriskforeditnew(id, conid, dels, str);
		reMap.put("status", true);
		// } catch (Exception e) {
		// map.put("message", e.getMessage());
		// return "error.message.nologin";
		// }
		return reMap;// bizcontractindex(map, null, currpage, null);
	}

	/**
	 * 
	 * <p>单个文件上传处理</p>
	 * @param type
	 * @param file_data
	 * @return
	 * @author wangzh
	 * @throws Exception 
	 */
	@RequestMapping(value = Url.bizriskfilesbatupload, method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> bizriskfilesbatupload(String type, MultipartFile file_data) throws Exception {
		Map<String, Object> re = new HashMap<String, Object>();
		String picPath = clientService.uploadonefile(Integer.parseInt(type), file_data);
		re.put("type", type);
		re.put("add", picPath);
		return re;
	}

	/**
	 * 
	 * <p>到组首页</p>
	 * @param map
	 * @param currpage
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.bizshoptermindex, method = RequestMethod.GET)
	public String bizshoptermindex(ModelMap map, String currpage) {
		map.put("currpage", currpage);
		return "bizshoptermlstview";
	}

	/**
	 * 
	 * <p>组表数据查询</p>
	 * @param dto
	 * @param start
	 * @param pageSize
	 * @param map
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.bizshoptermquery, method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> bizshoptermquery(ModelMap map, String name, String start, String pageSize) {
		Map<String, Object> returnMap = clientService.termquery(name, start, pageSize);
		return returnMap;
	}

	/**
	 * 
	 * <p>到组添加页面</p>
	 * @param map
	 * @param currpage
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.bizshoptermtoadd, method = RequestMethod.GET)
	public String bizshoptermtoadd(ModelMap map) {
		List<Shop> lst = clientService.queryshoplstbyfinancetype(map, null);// 1 样车 金融 2采购 金融
		map.put("shopList", lst);
		return "bizshoptermaddview";
	}

	/**
	 * 
	 * <p>到组编辑页</p>
	 * @param map
	 * @param id 组id
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.bizshoptermtoedit, method = RequestMethod.GET)
	public String bizshoptermtoedit(ModelMap map, Integer id) {
		List<Shop> lst = clientService.queryshoplstbyfinancetype(map, id);// 1 样车 金融 2采购 金融
		map.put("shopList", lst);
		return "bizshoptermeditview";
	}

	/**
	 * 
	 * <p>组新增保存</p>
	 * @param map
	 * @param name
	 * @param totalmoney
	 * @param bigScale
	 * @param principal
	 * @param shopFirstCreatTime
	 * @param shopId
	 * @return
	 * @throws Exception
	 * @author wangzh
	 */
	@RequestMapping(value = Url.bizshoptermadd, method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> bizshoptermadd(ModelMap map, String name, BigDecimal totalmoney, BigDecimal bigScale, String principal,
			String shopFirstCreatTime, String[] shopId) throws Exception {
		Map<String, Object> reMap = new HashMap<String, Object>();
		clientService.termaddsave(name, totalmoney, bigScale, principal, shopFirstCreatTime, shopId);
		reMap.put("status", true);
		return reMap;
	}

	/**
	 * 
	 * <p>组编辑保存</p>
	 * @param map
	 * @param id
	 * @param name
	 * @param totalmoney
	 * @param bigScale
	 * @param principal
	 * @param shopFirstCreatTime
	 * @param shopId
	 * @return
	 * @throws Exception
	 * @author wangzh
	 */
	@RequestMapping(value = Url.bizshoptermedit, method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> bizshoptermedit(ModelMap map, Integer id, String name, BigDecimal totalmoney, BigDecimal bigScale, String principal,
			String shopFirstCreatTime, String[] shopId) throws Exception {
		Map<String, Object> reMap = new HashMap<String, Object>();
		clientService.termeditsave(id, name, totalmoney, bigScale, principal, shopFirstCreatTime, shopId);
		reMap.put("status", true);
		return reMap;
	}

	/**
	 * 
	 * <p>申请开票</p>
	 * @param map
	 * @param currpage
	 * @author wangzh
	 */
	@RequestMapping(value = Url.invoicelist, method = RequestMethod.GET)
	public void invoicelist(ModelMap map, String currpage) {
		if (StringUtils.isNotBlank(currpage)) {
			map.put("currpage", currpage);
		}
	}

	/**
	 * 
	 * <p>门店部填写销售结算表</p>
	 * @param map
	 * @param currpage
	 * @author wangzh
	 */
	@RequestMapping(value = Url.invoiceshoplist, method = RequestMethod.GET)
	public void invoiceshoplist(ModelMap map, String currpage) {
		if (StringUtils.isNotBlank(currpage)) {
			map.put("currpage", currpage);
		}
	}

	/**
	 * 
	 * <p>财务部填写销售结算表并开票</p>
	 * @param map
	 * @param currpage
	 * @author wangzh
	 */
	@RequestMapping(value = Url.invoicefinancelist, method = RequestMethod.GET)
	public void invoicefinancelist(ModelMap map, String currpage) {
		if (StringUtils.isNotBlank(currpage)) {
			map.put("currpage", currpage);
		}
	}

	/**
	 * 
	 * <p>查看可开票的合同列表</p>
	 * @param map
	 * @param code
	 * @param name
	 * @param vin
	 * @param status
	 * @param start
	 * @param pageSize
	 * @return
	 * @author wangzh
	 */
	@ResponseBody
	@RequestMapping(value = Url.invoicelistquery, method = RequestMethod.POST)
	public Map<String, Object> invoicelistquery(ModelMap map, String code, String name, String vin, String status, Integer start, Integer pageSize) {
		return clientService.invoicequery(code, name, vin, status, start, pageSize, 1);
	}

	// 门店部开票查询
	@ResponseBody
	@RequestMapping(value = Url.invoicelistshopquery, method = RequestMethod.POST)
	public Map<String, Object> invoicelistshopquery(ModelMap map, String code, String name, String vin, String status, Integer start, Integer pageSize) {
		return clientService.invoicequery(code, name, vin, status, start, pageSize, 2);
	}

	// 财务部开票查询
	@ResponseBody
	@RequestMapping(value = Url.invoicelistfinancequery, method = RequestMethod.POST)
	public Map<String, Object> invoicelistfinancequery(ModelMap map, String code, String name, String vin, String status, Integer start, Integer pageSize) {
		return clientService.invoicequery(code, name, vin, status, start, pageSize, 3);
	}

	/**
	 * 
	 * <p>到开票操作页</p>
	 * @param map
	 * @param process 1开票申请 2门店部操作 3财务部操作
	 * @param id
	 * @param currpage
	 * @param view
	 * @author wangzh
	 */
	@RequestMapping(value = Url.invoiceoperate, method = RequestMethod.GET)
	public String invoiceoperate(ModelMap map, String process, Integer id, String currpage, String view) {
		return clientService.invoiceoperate(map, process, id, currpage, view);
	}

	/**
	 * 
	 * <p>开票保存</p>
	 * @param map
	 * @param conid
	 * @param money
	 * @param name
	 * @param phone
	 * @param cardId
	 * @param arr
	 * @param currpage
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.invoicesave, method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> invoicesave(ModelMap map, Integer id, Integer conid, Integer big, Integer small, BigDecimal money, String name, String phone,
			String cardId, String tax, String bank, String bankCard, String address, String arr, String replace, String currpage) {
		clientService.invoicesave(id, conid, big, small, money, name, phone, cardId, tax, bank, bankCard, address, arr, replace);
		Map<String, Object> reMap = new HashMap<String, Object>();
		reMap.put("status", true);
		return reMap;
	}

	/**
	 * 
	 * <p>单个开票文件上传</p>
	 * @param type
	 * @param file_data
	 * @return
	 * @throws Exception
	 * @author wangzh
	 */
	@RequestMapping(value = Url.invoicefileupload, method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> invoicefileupload(String type, MultipartFile file_data) throws Exception {
		Map<String, Object> re = new HashMap<String, Object>();
		String picPath = clientService.uploadoneinvoicefile(Integer.parseInt(type), file_data);
		re.put("type", type);
		re.put("add", picPath);
		return re;
	}

	/**
	 * 
	 * <p>开票审核</p>
	 * @param cmd
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.invoiceshopfinancesave, method = RequestMethod.POST)
	@ResponseBody
	public String invoiceshopfinancesave(InvoiceAuditCmd cmd) {
		clientService.invoiceaudit(cmd);
		return "1";
	}

	/**
	 * 
	 * <p>开票编辑保存</p>
	 * @param map
	 * @param id
	 * @param conid
	 * @param dels
	 * @param arr
	 * @param money
	 * @param name
	 * @param phone
	 * @param cardId
	 * @param tax
	 * @param bank
	 * @param bankCard
	 * @param address
	 * @return
	 * @throws Exception
	 * @author wangzh
	 */
	@RequestMapping(value = Url.invoiceeditsave, method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> invoiceeditsave(ModelMap map, Integer id, Integer conid, String dels, String arr, BigDecimal money, String name, String phone,
			String cardId, String tax, String bank, String bankCard, String address) throws Exception {
		Map<String, Object> reMap = new HashMap<String, Object>();
		clientService.invoiceeditsave(id, conid, dels, arr, money, name, phone, cardId, tax, bank, bankCard, address);
		reMap.put("status", true);
		return reMap;
	}

	/**
	 * 2018-07-17
	 * <p>风控进件总览</p>
	 * @param map
	 * @return
	 * @author liang
	 */
	@RequestMapping(value = Url.bizcontractpandect, method = RequestMethod.GET)
	public String bizcontractpandect(ModelMap map) {
		return "bizcontractpandectlstview";
	}

	/**
	 * 
	 * <p>风控进件总览  数据查询</p>
	 * @param dto
	 * @param start
	 * @param pageSize
	 * @param map
	 * @return
	 * @author liang
	 */
	@RequestMapping(value = Url.bizcontractpandectquery, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> bizcontractpandectquery(ModelMap map, String filecode, String bphone, String bname, String identify,
			Integer start, Integer pageSize) {
		Map<String, Object> returnMap = clientService.contractpandectquery(filecode, bphone, bname, identify, start, pageSize);
		return returnMap;
	}

	/**
	 * 
	 * <p>风控进件总览    合同信息查看</p>
	 * @param map
	 * @param id
	 * @param currpage
	 * @param all
	 * @return
	 * @author liang 
	 */
	@RequestMapping(value = Url.bizcontractpandectbaseview, method = RequestMethod.GET)
	public String bizcontractpandectbaseview(ModelMap map, Integer id) {
		return clientService.getpandectbasecontractbyidforview(map, id);
	}

	/**
	 * 
	 * <p>到立案金融逾期首页</p>
	 * @param map
	 * @param currpage
	 * @author wangzh
	 */
	@RequestMapping(value = Url.caselst, method = RequestMethod.GET)
	public String caselst(ModelMap map, String currpage) {
		if (StringUtils.isNotBlank(currpage)) {
			map.put("currpage", currpage);
		}
		map.put("backadd", Url.caselst);
		return "caselst";
	}

	/**
	 * 
	 * <p>立案金融逾期查询</p>
	 * @param map
	 * @param name
	 * @param start
	 * @param pageSize
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.casequery, method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> casequery(ModelMap map, String name, String bname, Integer start, Integer pageSize) {
		// 风控案件类型 1、融资租赁逾期 2、我司资产二抵 3、其他
		Map<String, Object> returnMap = clientService.casequery(1, name, bname, start, pageSize);
		return returnMap;
	}

	/**
	 * 
	 * <p>到为立案选择售后回租合同列表</p>
	 * @param map
	 * @param currpage
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.saleborrowlstforcasechoose, method = RequestMethod.GET)
	public String saleborrowlstforcasechoose(ModelMap map, String currpage) {
		if (StringUtils.isNotBlank(currpage)) {
			map.put("currpage", currpage);
		}
		return "saleborrowlstforcasechoose";
	}

	/**
	 * 
	 * <p>回租合同查询</p>
	 * @param map
	 * @param filecode
	 * @param firstcode
	 * @param bname
	 * @param start
	 * @param pageSize
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.sbforcasechoosequery, method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> sbforcasechoosequery(ModelMap map, String filecode, String firstyearccode, String bname, Integer start, Integer pageSize) {
		Map<String, Object> returnMap = clientService.sbforcasechoosequery(filecode, firstyearccode, bname, start, pageSize);
		return returnMap;
	}

	/**
	 * 
	 * <p>到新增金融逾期立案页</p>
	 * @param map
	 * @param id
	 * @param currpage
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.case1toadd, method = RequestMethod.GET)
	public String case1toadd(ModelMap map, Integer id, String currpage) {
		if (StringUtils.isNotBlank(currpage)) {
			map.put("currpage", currpage);
		}
		return clientService.case1toadd(map, id);
	}

	/**
	 * 
	 * <p>立案保存</p>
	 * @param map
	 * @param casename
	 * @param type
	 * @param id
	 * @param f1
	 * @param f2
	 * @param f3
	 * @param note
	 * @return
	 * @throws Exception
	 * @author wangzh
	 */
	@RequestMapping(value = Url.casesave, method = RequestMethod.POST)
	public String casesave(ModelMap map, String casename, String type, Integer id, MultipartFile f1, MultipartFile f2, MultipartFile f3, String note)
			throws Exception {
		clientService.casesave(casename, type, id, f1, f2, f3, note);
		if ("1".equals(type)) {
			return "redirect:/caselst";
		}
		return "redirect:" + Url.caseotherlst;
	}

	/**
	 * 
	 * <p>立案法务操作列表</p>
	 * @param map
	 * @param currpage
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.caselawlst, method = RequestMethod.GET)
	public String caselawlst(ModelMap map, String currpage) {
		if (StringUtils.isNotBlank(currpage)) {
			map.put("currpage", currpage);
		}
		map.put("backadd", Url.caselawlst);
		return "caselawlst";
	}

	/**
	 * 
	 * <p>查看流程图</p>
	 * @param map
	 * @param node
	 * @param id
	 * @param currpage
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.riskcaseflow, method = RequestMethod.GET)
	public String riskcaseflow(ModelMap map, String node, Integer id, String currpage, String backadd) {
		if (StringUtils.isNotBlank(currpage)) {
			map.put("currpage", currpage);
		}
		if (StringUtils.isNotBlank(node)) {
			map.put("node", node);
		}
		map.put("backadd", backadd);
		clientService.riskcaseflow(map, id);
		return "biz/caseflow";
	}

	/**
	 * 
	 * <p>到立案操作页面</p>
	 * @param map
	 * @param node
	 * @param view
	 * @param id
	 * @param currpage
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.riskcaseoperate, method = RequestMethod.GET)
	public String riskcaseoperate(ModelMap map, /* String node, String view, */Integer id, String currpage) {
		if (StringUtils.isNotBlank(currpage)) {
			map.put("currpage", currpage);
		}
		// if (StringUtils.isNotBlank(node)) {
		// map.put("node", node);
		// }
		// if (StringUtils.isNotBlank(view)) {
		// map.put("view", view);
		// }
		return clientService.riskcaseoperate(map, id/* , view */);
	}

	/**
	 * 
	 * <p>立案查看</p>
	 * @param map
	 * @param id
	 * @param currpage
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.riskcaseview, method = RequestMethod.GET)
	public String riskcaseview(ModelMap map, /* String node, String view, */Integer id, String currpage) {
		if (StringUtils.isNotBlank(currpage)) {
			map.put("currpage", currpage);
		}
		// if (StringUtils.isNotBlank(node)) {
		// map.put("node", node);
		// }
		// if (StringUtils.isNotBlank(view)) {
		// map.put("view", view);
		// }
		return clientService.riskcaseview(map, id/* , view */);
	}

	@RequestMapping(value = Url.casesave2, method = RequestMethod.POST)
	public String casesave2(ModelMap map, Integer id, Integer status, String currpage, String prefixsafe, MultipartFile pf1, MultipartFile pf2,
			MultipartFile pf3, String pnote) throws Exception {
		// clientService.checkriskcasestatus(id, status);
		// if (CaseStepEnum.risksubmit.getValue().equals(status)) {
		return backWhere(clientService.caseoperatesave2(id, status, prefixsafe, pf1, pf2, pf3, pnote), currpage);
		// }
		// return caselawlst(map, currpage);
	}

	@RequestMapping(value = Url.casesave3, method = RequestMethod.POST)
	public String casesave3(ModelMap map, Integer id, Integer status, String currpage, String suffixsafe, Integer type2, MultipartFile sf1, MultipartFile sf2,
			MultipartFile sf3, String snote) throws Exception {
		boolean type1 = (clientService.caseoperatesave3(id, status, suffixsafe, type2, sf1, sf2, sf3, snote));
		// return caselawlst(map, currpage);
		// if (istype1) {
		// return "redirect:"+Url.caselawlst;
		// }
		// return "redirect:"+Url.caseotherlawlst;
		return backWhere(type1, currpage);
	}

	/**
	 * 
	 * <p>重定向到逾期类或其他二抵类法务页面</p>
	 * @param type1 逾期类吗
	 * @return
	 * @author wangzh
	 */
	String backWhere(boolean type1, String currpage) {
		return type1 ? "redirect:" + Url.caselawlst + "?currpage=" + currpage : "redirect:" + Url.caseotherlawlst + "?currpage=" + currpage;
	}

	/**
	 * 
	 * <p>立案保存一审开庭时间</p>
	 * @param map
	 * @param id
	 * @param status
	 * @param currpage
	 * @param instancetime
	 * @param casetime
	 * @return
	 * @throws Exception
	 * @author wangzh
	 */
	@RequestMapping(value = Url.casesave4, method = RequestMethod.POST)
	public String casesave4(ModelMap map, Integer id, Integer status, String currpage, String instancetime, String casetime) throws Exception {
		return backWhere(clientService.caseoperatesave4(id, status, instancetime, casetime), currpage);
		// return caselawlst(map, currpage);
	}

	@RequestMapping(value = Url.casesave5, method = RequestMethod.POST)
	public String casesave5(ModelMap map, Integer id, Integer status, String currpage, String judgeresult, MultipartFile book, String judgetime1)
			throws Exception {
		return backWhere(clientService.caseoperatesave5(id, status, judgeresult, book, judgetime1), currpage);
		// return caselawlst(map, currpage);
	}

	@RequestMapping(value = Url.casesave6, method = RequestMethod.POST)
	public String casesave6(ModelMap map, Integer id, Integer status, String currpage, Integer need2judge) throws Exception {
		return backWhere(clientService.caseoperatesave6(id, status, need2judge), currpage);
		// return caselawlst(map, currpage);
	}

	@RequestMapping(value = Url.casesave7, method = RequestMethod.POST)
	public String casesave7(ModelMap map, Integer id, Integer status, String currpage, String instancetime2) throws Exception {
		return backWhere(clientService.caseoperatesave7(id, status, instancetime2), currpage);
		// return caselawlst(map, currpage);
	}

	@RequestMapping(value = Url.casesave8, method = RequestMethod.POST)
	public String casesave8(ModelMap map, Integer id, Integer status, String currpage, String judgeresult2, MultipartFile book2, String judgetime2)
			throws Exception {
		return backWhere(clientService.caseoperatesave8(id, status, judgeresult2, book2, judgetime2), currpage);
		// return caselawlst(map, currpage);
	}

	@RequestMapping(value = Url.casesave9, method = RequestMethod.POST)
	public String casesave9(ModelMap map, Integer id, Integer status, String currpage, Integer applyexecute, Integer applyexecute2, String applyexe1,
			String applyexe2) throws Exception {
		return backWhere(clientService.caseoperatesave9(id, status, applyexecute, applyexecute2, applyexe1, applyexe2), currpage);
		// return caselawlst(map, currpage);
	}

	@RequestMapping(value = Url.casesave10, method = RequestMethod.POST)
	public String casesave10(ModelMap map, Integer id, Integer status, String currpage, Integer excecuteresult, Integer excecuteresult2,
			Integer excecute2result, Integer excecute2result2, String excecute1) throws Exception {
		return backWhere(clientService.caseoperatesave10(id, status, excecuteresult, excecuteresult2, excecute2result, excecute2result2, excecute1), currpage);
		// return caselawlst(map, currpage);
	}

	/**
	 * 
	 * <p>到其他、二抵首页</p>
	 * @param map
	 * @param currpage
	 * @author wangzh
	 */
	@RequestMapping(value = Url.caseotherlst, method = RequestMethod.GET)
	public String caseotherlst(ModelMap map, String currpage) {
		if (StringUtils.isNotBlank(currpage)) {
			map.put("currpage", currpage);
		}
		map.put("backadd", Url.caseotherlst);
		return "caseotherlst";
	}

	@RequestMapping(value = Url.caseotherlawlst, method = RequestMethod.GET)
	public String caseotherlawlst(ModelMap map, String currpage) {
		if (StringUtils.isNotBlank(currpage)) {
			map.put("currpage", currpage);
		}
		map.put("backadd", Url.caseotherlawlst);
		return "caseotherlawlst";
	}

	/**
	 * 
	 * <p>立案金融逾期查询</p>
	 * @param map
	 * @param name
	 * @param start
	 * @param pageSize
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.caseotherquery, method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> caseotherquery(ModelMap map, String name, String bname, Integer start, Integer pageSize) {
		// 风控案件类型 1、融资租赁逾期 2、我司资产二抵/其他
		Map<String, Object> returnMap = clientService.caseotherquery(name, start, pageSize);
		return returnMap;
	}

	/**
	 * 
	 * <p>到二抵、其他类案件新增页</p>
	 * @param map
	 * @param currpage
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.toaddothercase, method = RequestMethod.GET)
	public String toaddothercase(ModelMap map, String currpage) {
		if (StringUtils.isNotBlank(currpage)) {
			map.put("currpage", currpage);
		}
		return "biz/caseothertoadd";
	}

	/**
	 * 
	 * <p>到金融逾期类资产监控首页</p>
	 * @param map
	 * @param currpage
	 * @author wangzh
	 */
	@RequestMapping(value = Url.case1riskmonitor, method = RequestMethod.GET)
	public String case1riskmonitor(ModelMap map, String currpage, String backadd) {
		if (StringUtils.isNotBlank(currpage)) {
			map.put("currpage", currpage);
		}
		map.put("backadd", Url.case1riskmonitor);
		return "biz/case1riskmonitorlst";
	}

	/**
	 * 
	 * <p>到其他、二抵类资产监控首页</p>
	 * @param map
	 * @param currpage
	 * @author wangzh
	 */
	@RequestMapping(value = Url.case2riskmonitor, method = RequestMethod.GET)
	public String case2riskmonitor(ModelMap map, String currpage) {
		if (StringUtils.isNotBlank(currpage)) {
			map.put("currpage", currpage);
		}
		map.put("backadd", Url.case2riskmonitor);
		return "biz/case2riskmonitorlst";
	}

	@ResponseBody
	@RequestMapping(value = Url.casemonitorquery, method = RequestMethod.POST)
	public Map<String, Object> casemonitorquery(ModelMap map, Integer type, String name, String bname, Integer start, Integer pageSize) {
		Map<String, Object> returnMap = clientService.casemonitorquery(type, name, bname, start, pageSize);
		return returnMap;
	}

	@RequestMapping(value = Url.casemonitorviewlist, method = RequestMethod.GET)
	public String casemonitorviewlist(ModelMap map, Integer id, String currpage, String backadd) {
		clientService.casemonitorviewlist(map, id);
		if (StringUtils.isNotBlank(currpage)) {
			map.put("currpage", currpage);
		}
		map.put("backadd", backadd);
		return "biz/monitorlst";
	}

	@RequestMapping(value = Url.uploadcasemonitor, method = RequestMethod.GET)
	public String uploadcasemonitor(ModelMap map, Integer id, String currpage, String backadd) {
		clientService.uploadcasemonitor(map, id);
		if (StringUtils.isNotBlank(currpage)) {
			map.put("currpage", currpage);
		}
		map.put("backadd", backadd);
		return "biz/casemonitor";
	}

	@RequestMapping(value = Url.uploadcasemonitorsave, method = RequestMethod.POST)
	public String uploadcasemonitorsave(ModelMap map, Integer id, String property, String person, String currpage) {
		boolean type1 = clientService.uploadcasemonitorsave(map, id, property, person);
		return type1 ? "redirect:" + Url.case1riskmonitor + "?currpage=" + currpage : "redirect:" + Url.case2riskmonitor + "?currpage=" + currpage;
	}

	/**
	 * 
	 * <p>到金融逾期类资产法务监控首页</p>
	 * @param map
	 * @param currpage
	 * @author wangzh
	 */
	@RequestMapping(value = Url.case1lawmonitor, method = RequestMethod.GET)
	public String case1lawmonitor(ModelMap map, String currpage) {
		if (StringUtils.isNotBlank(currpage)) {
			map.put("currpage", currpage);
		}
		map.put("law", 1);
		map.put("backadd", Url.case1lawmonitor);
		return "biz/case1lawmonitorlst";
	}

	/**
	 * 
	 * <p>到其他、二抵类资产法务监控首页</p>
	 * @param map
	 * @param currpage
	 * @author wangzh
	 */
	@RequestMapping(value = Url.case2lawmonitor, method = RequestMethod.GET)
	public String case2lawmonitor(ModelMap map, String currpage) {
		if (StringUtils.isNotBlank(currpage)) {
			map.put("currpage", currpage);
		}
		map.put("law", 1);
		map.put("backadd", Url.case2lawmonitor);
		return "biz/case2lawmonitorlst";
	}

	/**
	 * 
	 * <p>到合同首页</p>
	 * @param map
	 * @param clienttype
	 * @param all
	 * @param currpage
	 * @return
	 * @author liliang
	 */
	@RequestMapping(value = Url.bizcontractindex_shopgroup, method = RequestMethod.GET)
	public String bizcontractindex_shopgroup(ModelMap map, String node, String currpage, String all) {

		User user = SecurityHelper.getAdminUserInfo();
		map.put("loginid", user.getId());
		if (StringUtils.isNotBlank(currpage)) {
			map.put("currpage", currpage);
		}
		if (StringUtils.isNotBlank(node)) {
			map.put("node", node);
		}
		if (StringUtils.isNotBlank(all)) {
			map.put("all", all);
		}
		return "bizcontractlstview_shopgroupview";
	}

	/**
	 * 
	 * <p>合同表数据查询</p>
	 * @param dto
	 * @param start
	 * @param pageSize
	 * @param map
	 * @return
	 * @author liliang
	 */
	@RequestMapping(value = Url.bizcontractquery_shopgroup, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> bizcontractquery_shopgroup(ModelMap map, String filecode, String name, String bname, String workType,
			String identify, Integer start, Integer pageSize, String all, String node) {
		UserDTO user = SecurityHelper.getAdminUserInfo();
		Map<String, Object> returnMap = clientService.contractquery_shopgroup(user, filecode, name, bname, workType, identify, start, pageSize, all, node);
		return returnMap;
	}

	/**
	 * 
	 * <p>到车辆批发开票申请首页</p>
	 * @param map
	 * @param process 流程环节标识
	 * @param currpage
	 * @author wangzh
	 */
	@RequestMapping(value = Url.batchinvoicelist, method = RequestMethod.GET)
	public String batchinvoicelist(ModelMap map, String process, String currpage) {
		if (StringUtils.isNotBlank(process)) {
			map.put("process", process);
		}
		if (StringUtils.isNotBlank(currpage)) {
			map.put("currpage", currpage);
		}
		return "biz/wholecarsaled";
	}

	/**
	 * 
	 * <p>车辆批发开票查询</p>
	 * @param map
	 * @param brand
	 * @param vin
	 * @param start
	 * @param pageSize
	 * @return
	 * @author wangzh
	 */
	@ResponseBody
	@RequestMapping(value = Url.batchinvoicequery, method = RequestMethod.POST)
	public Map<String, Object> batchinvoicequery(ModelMap map, String brand, String vin, String status, Integer start, Integer pageSize,
			Integer /* int也可以的 */process) {
		return clientService.batchinvoicequery(brand, vin, status, start, pageSize, process);
	}

	/**
	 * 
	 * <p>到车辆批发开票操作页</p>
	 * @param map
	 * @param process 1开票申请 2门店部操作 3财务部操作
	 * @param id
	 * @param currpage
	 * @param view
	 * @author wangzh
	 */
	@RequestMapping(value = Url.batchinvoiceoperate, method = RequestMethod.GET)
	public String batchinvoiceoperate(ModelMap map, String process, String id, String currpage, String view) {
		return clientService.batchinvoiceoperate(map, process, id, currpage, view);
	}

	// 车辆批发开票保存
	@RequestMapping(value = Url.batchinvoicesave, method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> batchinvoicesave(ModelMap map, Integer id, String conid, Integer big, Integer small, BigDecimal money, String name,
			String phone, String cardId, String tax, String bank, String bankCard, String address, String arr, String replace, String currpage) {
		clientService.batchinvoicesave(id, conid, big, small, money, name, phone, cardId, tax, bank, bankCard, address, arr, replace);
		Map<String, Object> reMap = new HashMap<String, Object>();
		reMap.put("status", true);
		return reMap;
	}

	// 车辆批发开票编辑保存
	@RequestMapping(value = Url.batchinvoiceeditsave, method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> batchinvoiceeditsave(ModelMap map, Integer id, String conid, String dels, String arr, BigDecimal money, String name,
			String phone, String cardId, String tax, String bank, String bankCard, String address) throws Exception {
		Map<String, Object> reMap = new HashMap<String, Object>();
		clientService.batchinvoiceeditsave(id, conid, dels, arr, money, name, phone, cardId, tax, bank, bankCard, address);
		reMap.put("status", true);
		return reMap;
	}
}
