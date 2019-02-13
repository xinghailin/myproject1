/*******************************************************************************
 * Project   : car-ms
 * Class Name: com.yyq.car.portal.ms.web.controller.JndPurchaseController
 * Created By: wangzh 
 * Created on: 2017年11月28日 上午10:51:02
 * Copyright © 2013-2014 YYQ All rights reserved.
 ******************************************************************************/
package com.yyq.car.portal.ms.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.yyq.car.portal.common.dto.UserDTO;
import com.yyq.car.portal.common.exception.PortalAppUnCheckedException;
import com.yyq.car.portal.common.model.jnd.jndSupplier;
import com.yyq.car.portal.common.service.security.SecurityHelper;
import com.yyq.car.portal.ms.app.service.BlackSupplierService;
import com.yyq.car.portal.ms.app.service.JndPurchaseService;
import com.yyq.car.portal.ms.web.command.ApplypaySaveCmd;
import com.yyq.car.portal.ms.web.command.ContractSaveCmd;
import com.yyq.car.portal.ms.web.command.PurchaseCmd;
import com.yyq.car.portal.ms.web.constant.Url;
import com.yyq.car.portal.ms.web.constant.View;


/**
 * <P>加拿大采购业务</P>
 * @author wangzh
 */
@Controller
public class JndPurchaseController {

	// private static final Logger log = LoggerFactory.getLogger(JndPurchaseController.class);
	// private final static String USER_COUNTRY = "usercountry";// 区域常理
	@Autowired
	JndPurchaseService jndPurchaseService;

	@Autowired
	BlackSupplierService blackSupplierService;

	/**
	 * <p>到加拿大采购计划列表页</p>
	 * @param modelMap
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.jndPurchaseLstIndex, method = RequestMethod.GET)
	public String purchaseLstIndex(ModelMap modelMap, String currpage) {
		modelMap.put("currpage", currpage);
		return "jndPurchaseLstIndex";
	}

	/**
	 * <p>到加拿大采购计划列表页--------新</p>
	 * @param modelMap
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.njndPurchaseLstIndex, method = RequestMethod.GET)
	public String njndPurchaseLstIndex(ModelMap modelMap, String userCountry, String currpage) {
		modelMap.put("currpage", currpage);
		if (StringUtils.isBlank(userCountry)) {
			UserDTO userDTO = SecurityHelper.getAdminUserInfo();
			if (userDTO != null && userDTO.getCountry() != null) {
				modelMap.put("userCountry", userDTO.getCountry());
			}
		} else {
			modelMap.put("userCountry", userCountry);
		}
		return "njndPurchaseLstIndex";
	}

	/**
	 * <p>采购计划列表查询do</p>
	 * @param modelMap
	 * @param code编号
	 * @param time数据
	 * @param name名称
	 * @param forapay付款申请标示
	 * @return
	 * @author wangzh
	 */
	@ResponseBody
	@RequestMapping(value = Url.jndPurchaseLstQuery, method = RequestMethod.POST)
	public Map<String, Object> purchaseLstQuery(ModelMap modelMap, String userCountry, Integer start, Integer pageSize, String code, String time, String name,
			String forapay) {
		Map<String, Object> paraMap = new HashMap<String, Object>();
		paraMap.put("start", (start - 1) * pageSize);
		paraMap.put("pageSize", pageSize);
		if (StringUtils.isNotBlank(code))
			paraMap.put("code", code);
		if (StringUtils.isNotBlank(time))
			paraMap.put("time", time);
		if (StringUtils.isNotBlank(name))
			paraMap.put("name", name);
		if (StringUtils.isNotBlank(forapay))
			paraMap.put("forapay", forapay);
		if (StringUtils.isNotBlank(userCountry)) {
			paraMap.put("country", userCountry);
		}
		return jndPurchaseService.getPurchaseLstAndCount(paraMap);
	}

	/**
	 * 
	 * <p>到添加或编辑采购计划页</p>
	 * @param modelMap
	 * @param id
	 * @param currpage
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.jndPurchaseEdit, method = RequestMethod.GET)
	public String purchaseEdit(ModelMap modelMap, Integer id, String currpage) {
		modelMap.put("currpage", currpage);
		return jndPurchaseService.queryNeedBuyDetailsByNeedId(modelMap, id);
	}

	/**
	 * 
	 * <p>到添加或编辑采购计划页--------新</p>
	 * @param modelMap
	 * @param id
	 * @param currpage
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.njndPurchaseEdit, method = RequestMethod.GET)
	public String njndPurchaseEdit(ModelMap modelMap, String userCountry, Integer id, String currpage) {
		modelMap.put("currpage", currpage);
		if (StringUtils.isNotBlank(userCountry)) {
			modelMap.put("country", userCountry);
		}
		return jndPurchaseService.nqueryNeedBuyDetailsByNeedId(modelMap, id);
	}

	/**
	 * <p>采购计划编辑保存</p>
	 * @param modelMap
	 * @param cmd
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.jndPurchaseEditSave, method = RequestMethod.POST)
	@ResponseBody
	public Object purchaseEditSave(ModelMap modelMap, PurchaseCmd cmd) {
		// modelMap.put("currpage", currpage);
		Map<String, Object> reMap = new HashMap<String, Object>();
		reMap.put("status", false);
		try {
			jndPurchaseService.editSave(modelMap, cmd);
			reMap.put("status", true);
		} catch (PortalAppUnCheckedException e) {
			reMap.put("msg", e.getMessage());
		} catch (Exception e) {
			reMap.put("msg", e.getMessage());
		}
		return reMap;
	}

	/**
	 * <p>采购计划编辑保存--------新</p>
	 * @param modelMap
	 * @param cmd
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.njndPurchaseEditSave, method = RequestMethod.POST)
	@ResponseBody
	public Object njndPurchaseEditSave(ModelMap modelMap, PurchaseCmd cmd) {
		// modelMap.put("currpage", currpage);
		Map<String, Object> reMap = new HashMap<String, Object>();
		reMap.put("status", false);
		try {
			jndPurchaseService.neditSave(modelMap, cmd);
			reMap.put("status", true);
		} catch (PortalAppUnCheckedException e) {
			reMap.put("msg", e.getMessage());
		} catch (Exception e) {
			reMap.put("msg", e.getMessage());
		}
		return reMap;
	}

	/**
	 * <p>到付款申请页</p>
	 * @param modelMap
	 * @param currpage
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.jndApplyPayLstIndex, method = RequestMethod.GET)
	public String applyPayLstIndex(ModelMap modelMap, String currpage) {
		if (StringUtils.isNotBlank(currpage)) {
			modelMap.put("currpage", currpage);
		}
		return "jndApplyPayLstIndex";
	}

	/**
	 * <p>获取付款申请列表</p>
	 * @param modelMap
	 * @param start
	 * @param pageSize
	 * @param code
	 * @param supplyname
	 * @param name
	 * @return
	 * @author wangzh
	 */
	@ResponseBody
	@RequestMapping(value = Url.jndApplyPayLstQuery, method = RequestMethod.POST)
	public Map<String, Object> applyPayLstQuery(ModelMap modelMap, String audit, Integer start, Integer pageSize, String code, String name, String supplyname,
			String createtime, String status) {
		Map<String, Object> paraMap = new HashMap<String, Object>();
		paraMap.put("start", (start - 1) * pageSize);
		paraMap.put("pageSize", pageSize);
		if (StringUtils.isNotBlank(code)) {
			paraMap.put("code", code);
		}
		if (StringUtils.isNotBlank(name)) {
			paraMap.put("name", name);
		}
		if (StringUtils.isNotBlank(supplyname)) {
			paraMap.put("supplyname", supplyname);
		}
		if (StringUtils.isNotBlank(createtime)) {
			paraMap.put("createtime", createtime);
		}
		if (StringUtils.isNotBlank(status)) {
			paraMap.put("status", status);
		}
		if (StringUtils.isNotBlank(audit)) {
			paraMap.put("audit", audit);
		}
		return jndPurchaseService.getApplypayLstAndCount(paraMap);
	}

	/**
	 * <p>到付款申请编辑、查看页</p>
	 * @param modelMap
	 * @param id
	 * @param currpage
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.jndApplyPayEdit, method = RequestMethod.GET)
	public String applyPayEdit(ModelMap modelMap, Integer id, String view, String currpage) {
		if (StringUtils.isNotBlank(currpage)) {
			modelMap.put("currpage", currpage);
		}
		String reString = null;
		try {
			String rs = jndPurchaseService.getApplypayEdit(modelMap, id);
			if ("1".equals(rs)) {// 关于定金
				if ("1".equals(view)) {
					reString = "jndApplyPayView";// 返回定金查看
				} else {
					reString = "jndApplyPayEdit";// 返回定金编辑
					// 当定金审核通过时 显示编辑 此时编辑的是下一步的尾款页面
					Object nextObject = modelMap.get("next");
					if (nextObject != null && (boolean) nextObject) {
						reString = "jndApplyPayEdit2";// 返回尾款编辑
					}
				}
			} else if ("2".equals(rs)) {// 关于尾款
				if ("1".equals(view)) {
					reString = "jndApplyPayView2";// 返回尾款查看
				} else {
					reString = "jndApplyPayEdit2";// 返回尾款编辑
				}
			} else {
				modelMap.put("message", "付款申请状态异常");
				return View.ERROR_MESSAGE;
			}
			return reString;
		} catch (Exception e) {
			modelMap.put("message", e.getMessage());
			return View.ERROR_MESSAGE;
		}
	}

	/**
	 * 
	 * <p>到付款申请新增页</p>
	 * @param modelMap
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.jndApplyPayAdd, method = RequestMethod.GET)
	public String applyPayAdd(ModelMap modelMap, String currpage) {
		if (StringUtils.isNotBlank(currpage)) {
			modelMap.put("currpage", currpage);
		}
		// jndPurchaseService.readyapayadd(modelMap);
		return "jndApplyPayAdd";
	}

	/**
	 * <p>到加拿大采购计划列表页for付款申请选择</p>
	 * @param modelMap
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.jndPurchaseLstForApayIndex, method = RequestMethod.GET)
	public String purchaseLstForApayIndex(ModelMap modelMap, String currpage) {
		if (StringUtils.isNotBlank(currpage)) {
			modelMap.put("currpage", currpage);
		}
		return "jndPurchaseLstForApayIndex";
	}

	/**
	 * <p>到加拿大子采购计划列表页for付款申请选择</p>
	 * @param modelMap
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.jndSubPurchaseLstForApayIndex, method = RequestMethod.GET)
	public String subPurchaseLstForApayIndex(ModelMap modelMap, String currpage, Integer buyid) {
		if (StringUtils.isNotBlank(currpage)) {
			modelMap.put("currpage", currpage);
		}
		modelMap.put("buyid", buyid);
		return "jndSubPurchaseLstForApayIndex";
	}

	/**
	 * 
	 * <p>子采购查询for付款申请</p>
	 * @param modelMap
	 * @param start
	 * @param pageSize
	 * @param brand
	 * @param time
	 * @return
	 * @author wangzh
	 */
	@ResponseBody
	@RequestMapping(value = Url.jndSubPurchaseLstForApayQuery, method = RequestMethod.POST)
	public Map<String, Object> subPurchaseLstForApayQuery(ModelMap modelMap, Integer start, Integer pageSize, Integer buyid, String brand, String time) {
		Map<String, Object> paraMap = new HashMap<String, Object>();
		paraMap.put("start", (start - 1) * pageSize);
		paraMap.put("pageSize", pageSize);
		paraMap.put("buyid", buyid);
		if (StringUtils.isNotBlank(brand))
			paraMap.put("brand", brand);
		if (StringUtils.isNotBlank(time))
			paraMap.put("createtime", time);
		return jndPurchaseService.getSubPurchaseLstAndCountForApay(paraMap);
	}

	/**
	 * 
	 * <p>付款申请选择子计划</p>
	 * @param modelMap
	 * @param id 子计划id
	 * @param apayid 付款申请id
	 * @return
	 * @author wangzh
	 */
	@ResponseBody
	@RequestMapping(value = Url.jndSubPurchaseById, method = RequestMethod.GET)
	public Map<String, Object> subPurchaseById(ModelMap modelMap, Integer id, Integer apayid) {
		Map<String, Object> reMap = new HashMap<String, Object>();
		Map<String, Object> paMap = new HashMap<String, Object>();
		paMap.put("sbid", id);
		if (apayid != null) {
			paMap.put("apayid", apayid);
		}
		Map<String, Object> sb = jndPurchaseService.getSubPurchaseById(paMap);
		if (sb != null) {
			reMap.put("status", true);
			reMap.put("sb", sb);
			return reMap;
		}
		reMap.put("status", false);
		reMap.put("msg", "子采购计划不存在！");
		return reMap;
	}

	/**
	 * 
	 * <p>付款申请编辑保存</p>
	 * @param modelMap
	 * @param cmd
	 * @return
	 * @author wangzh
	 */
	@ResponseBody
	@RequestMapping(value = Url.jndapplypaysave, method = RequestMethod.POST)
	public Map<String, Object> jndapplypaysave(ModelMap modelMap, ApplypaySaveCmd cmd) {
		Map<String, Object> reMap = new HashMap<String, Object>();
		reMap.put("status", false);
		try {
			jndPurchaseService.applypaySave(modelMap, cmd);
			reMap.put("status", true);
		} catch (PortalAppUnCheckedException e) {
			reMap.put("msg", e.getMessage());
		} catch (Exception e) {
			reMap.put("msg", e.getMessage());
		}
		return reMap;
	}

	/**
	 * 
	 * <p>删除、撤销付款申请单</p>
	 * @param modelMap
	 * @param id
	 * @param revocation 撤销标示
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.jndApplyPayDel, method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> jndapplypaydel(ModelMap modelMap, String revocation, Integer id) {
		Map<String, Object> reMap = new HashMap<String, Object>();
		reMap.put("status", false);
		try {
			if (StringUtils.isBlank(revocation)) {
				jndPurchaseService.applypayDelete(id);
			} else {
				jndPurchaseService.applypayrevocation(id);
			}
			reMap.put("status", true);
		} catch (Exception e) {
			reMap.put("msg", e.getMessage());
		}
		return reMap;
	}

	/**
	 * 
	 * <p>到付款申请财务审核列表页</p>
	 * @param modelMap
	 * @param currpage
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.jndpayapplyauditindex, method = RequestMethod.GET)
	public String jndpayapplyauditindex(ModelMap modelMap, String currpage) {
		if (StringUtils.isNotBlank(currpage)) {
			modelMap.put("currpage", currpage);
		}
		return "jndpayapplyauditindexview";
	}

	/**
	 * 
	 * <p>到单个付款申请审核、查看页面</p>
	 * @param modelMap
	 * @param currpage
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.jndpayapplyauditone, method = RequestMethod.GET)
	public String jndpayapplyauditone(ModelMap modelMap, String view, Integer id, String currpage) {
		if (StringUtils.isNotBlank(currpage)) {
			modelMap.put("currpage", currpage);
		}
		String rs = jndPurchaseService.getpayapplyforaudit(modelMap, id);

		String reString = null;

		if ("1".equals(rs)) {// 关于定金
			if ("1".equals(view)) {
				reString = "jndpayapplyauditoneview";// 返回定金查看
			} else {
				reString = "jndpayapplyauditone";// 返回定金审核
			}
		} else if ("2".equals(rs)) {// 关于尾款
			if ("1".equals(view)) {
				reString = "jndpayapplyauditoneview2";// 返回尾款查看
			} else {
				reString = "jndpayapplyauditone2";// 返回尾款审核
			}
		} else {
			modelMap.put("message", "付款申请状态异常！");
			return View.ERROR_MESSAGE;
		}
		return reString;
	}

	/**
	 * 
	 * <p>付款申请审核do</p>
	 * @param modelMap
	 * @param pass
	 * @param status 表单提交过来的本条申请的状态
	 * @param id
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.jndpayapplyauditdo, method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> jndpayapplyauditdo(ModelMap modelMap, String pass, String reason, String status, Integer id) {
		Map<String, Object> reMap = new HashMap<String, Object>();
		reMap.put("status", false);
		try {
			jndPurchaseService.applypayAuditDo(id, pass, reason, status);
			reMap.put("status", true);
		} catch (PortalAppUnCheckedException e) {
			reMap.put("msg", e.getMessage());
		} catch (Exception e) {
			reMap.put("msg", e.getMessage());
		}
		return reMap;
	}

	/**
	 * 
	 * <p>预入库车辆页</p>
	 * @param modelMap
	 * @param currpage
	 * @return
	 * @author wangzh
	 */
	// @RequestMapping(value = Url.jndprecarlstindex, method = RequestMethod.GET)
	public String jndprecarlstindex(ModelMap modelMap, String currpage) {
		if (StringUtils.isNotBlank(currpage)) {
			modelMap.put("currpage", currpage);
		}
		return "jndprecarlstview";
	}

	/**
	 * 
	 * <p>预入库车辆列表</p>
	 * @param modelMap
	 * @param start
	 * @param pageSize
	 * @param buyname 采购单名称
	 * @param brand 品牌
	 * @param vin
	 * @param time
	 * @return
	 * @author wangzh
	 */
	// @RequestMapping(value = Url.jndprecarlstquery, method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> jndprecarlstquery(ModelMap modelMap, Integer start, Integer pageSize, String buyname, String brand, String vin,
			String appointtime) {
		Map<String, Object> paraMap = new HashMap<String, Object>();
		paraMap.put("start", (start - 1) * pageSize);
		paraMap.put("pageSize", pageSize);
		paraMap.put("status", "0");// 初始化状态
		if (StringUtils.isNotBlank(buyname))
			paraMap.put("buyname", buyname);
		if (StringUtils.isNotBlank(brand))
			paraMap.put("brand", brand);
		if (StringUtils.isNotBlank(vin))
			paraMap.put("vin", vin);
		if (StringUtils.isNotBlank(appointtime))
			paraMap.put("appointtime", appointtime);

		Map<String, Object> reMap = new HashMap<String, Object>();
		jndPurchaseService.precarlstquery(paraMap, reMap);
		return reMap;
	}

	/**
	 * 
	 * <p>到黑名单首页</p>
	 * @param modelMap
	 * @param currpage
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.jndblacksupplierIndex, method = RequestMethod.GET)
	public String jndblacksupplierIndex(ModelMap modelMap, String currpage) {
		if (StringUtils.isNotBlank(currpage)) {
			modelMap.put("currpage", currpage);
		}
		return "jndblacksupplierIndexview";
	}

	/**
	 * 
	 * <p>黑名单查询</p>
	 * @param modelMap
	 * @param start
	 * @param pageSize
	 * @param name
	 * @return
	 * @author wangzh
	 */
	@ResponseBody
	@RequestMapping(value = Url.jndblacksupplierQuery, method = RequestMethod.POST)
	public Map<String, Object> jndblacksupplierQuery(ModelMap modelMap, Integer start, Integer pageSize, String name) {
		return jndPurchaseService.getblacksupplierLstAndCount(start, pageSize, name);
	}

	/**
	 * 
	 * <p>黑名单删除</p>
	 * @param modelMap
	 * @param id
	 * @return
	 * @author wangzh
	 */
	@ResponseBody
	@RequestMapping(value = Url.jndblacksupplierDel, method = RequestMethod.GET)
	public Map<String, Object> jndblacksupplierDel(ModelMap modelMap, Integer id) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			jndPurchaseService.blacksupplierDel(id);
			map.put("status", true);
		} catch (PortalAppUnCheckedException e) {
			map.put("status", false);
			map.put("msg", e.getMessage());
		}
		return map;
	}

	// ////////////以下是新增业务在采购计划和付款申请中间加上合同环节
	/**
	 * 
	 * <p>到合同首页</p>
	 * @param modelMap
	 * @param currpage
	 * @param node 从菜单进入时的标示 0管理1采购2法务3财务
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.jndcontractindex, method = RequestMethod.GET)
	public String jndcontractindex(ModelMap modelMap, String userCountry, String currpage, String node) {
		if (StringUtils.isNotBlank(currpage)) {
			modelMap.put("currpage", currpage);
		}
		if (StringUtils.isNotBlank(node)) {
			modelMap.put("node", node);
		} else {
			modelMap.put("node", "0");
		}
		String nd = modelMap.get("node").toString();
		if ("0".equals(nd)) {
			if (StringUtils.isNotBlank(userCountry)) {
				modelMap.put("userCountry", userCountry);
			} else if (userCountry == null) {
				UserDTO userDTO = SecurityHelper.getAdminUserInfo();
				if (userDTO != null && userDTO.getCountry() != null) {
					modelMap.put("userCountry", userDTO.getCountry());
				}
			}
		}
		return "jndcontractindexview";
	}

	/**
	 * 
	 * <p>合同列表查询</p>
	 * @param modelMap
	 * @param start
	 * @param pageSize
	 * @param code
	 * @param time
	 * @param brand
	 * @return
	 * @author wangzh
	 */
	@ResponseBody
	@RequestMapping(value = Url.jndcontractquery, method = RequestMethod.POST)
	public Map<String, Object> jndcontractquery(ModelMap modelMap, String userCountry, String node, Integer start, Integer pageSize, String pcode, String name,
			String code, String brand, String createtime, Integer status) {
		return jndPurchaseService.getcontractLstAndCount(node, userCountry, start, pageSize, pcode, name, code, brand, createtime, status);
	}

	/**
	 * 
	 * <p>到合同添加页面</p>
	 * @param modelMap
	 * @param currpage
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.jndcontractadd, method = RequestMethod.GET)
	public String jndcontractadd(ModelMap modelMap, String userCountry, String currpage) {
		if (StringUtils.isNotBlank(currpage)) {
			modelMap.put("currpage", currpage);
		}
		if (StringUtils.isNotBlank(userCountry)) {
			modelMap.put("userCountry", userCountry);
		}
		return "jndcontractaddview";
	}

	/**
	 * 
	 * <p>到合同编辑页面</p>
	 * @param modelMap
	 * @param currpage
	 * @param id
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.jndcontractedit, method = RequestMethod.GET)
	public String jndcontractedit(ModelMap modelMap, String userCountry, String currpage, Integer id) {
		if (StringUtils.isNotBlank(currpage)) {
			modelMap.put("currpage", currpage);
		}
		if (StringUtils.isNotBlank(userCountry)) {
			modelMap.put("userCountry", userCountry);
		}
		jndPurchaseService.getContractById(modelMap, id);
		@SuppressWarnings("unchecked")
		List<jndSupplier> splst = jndPurchaseService.querySpLst(((Map<String, Object>) modelMap.get("con")).get("currency").toString());
		modelMap.put("splst", splst);
		return "jndcontracteditview";
	}

	/**
	 * 
	 * <p>查询供应方列表</p>
	 * @param type
	 * @return
	 * @author wangzh
	 */
	@ResponseBody
	@RequestMapping(value = Url.jndSpLst, method = RequestMethod.GET)
	public Map<String, Object> jndSpLst(String type) {
		if (StringUtils.isNotBlank(type)) {
			Map<String, Object> reMap = new HashMap<String, Object>();
			reMap.put("splst", jndPurchaseService.querySpLst(type));
			return reMap;
		}
		return null;
	}

	/**
	 * 
	 * <p>为合同选择采购计划</p>
	 * @param modelMap
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.jndPurchaseLstForContractIndex, method = RequestMethod.GET)
	public String jndPurchaseLstForContractIndex(ModelMap modelMap, String userCountry, String currpage) {
		if (StringUtils.isNotBlank(currpage)) {
			modelMap.put("currpage", currpage);
		}
		if (StringUtils.isNotBlank(userCountry)) {
			modelMap.put("userCountry", userCountry);
		}
		return "jndPurchaseLstForContractIndexView";
	}

	/**
	 * 
	 * <p>为合同选择子采购计划</p>
	 * @param modelMap
	 * @param currpage
	 * @param buyid
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.jndSubPurchaseLstForContractIndex, method = RequestMethod.GET)
	public String jndSubPurchaseLstForContractIndex(ModelMap modelMap, String userCountry, String currpage, Integer buyid) {
		if (StringUtils.isNotBlank(currpage)) {
			modelMap.put("currpage", currpage);
		}
		if (StringUtils.isNotBlank(userCountry)) {
			modelMap.put("userCountry", userCountry);
		}
		modelMap.put("buyid", buyid);
		return "jndSubPurchaseLstForContractIndexView";
	}

	/**
	 * 
	 * <p>为合同选择子采购</p>
	 * @param modelMap
	 * @param start
	 * @param pageSize
	 * @param buyid
	 * @param brand
	 * @param time
	 * @return
	 * @author wangzh
	 */
	@ResponseBody
	@RequestMapping(value = Url.jndSubPurchaseLstForContractQuery, method = RequestMethod.POST)
	public Map<String, Object> jndSubPurchaseLstForContractQuery(ModelMap modelMap, Integer start, Integer pageSize, Integer buyid, String brand, String time) {
		Map<String, Object> paraMap = new HashMap<String, Object>();
		paraMap.put("start", (start - 1) * pageSize);
		paraMap.put("pageSize", pageSize);
		paraMap.put("buyid", buyid);
		if (StringUtils.isNotBlank(brand))
			paraMap.put("brand", brand);
		if (StringUtils.isNotBlank(time))
			paraMap.put("createtime", time);
		return jndPurchaseService.getSubPurchaseLstAndCountForContract(paraMap);
	}

	/**
	 * 
	 * <p>选择子采购后查询其内容为合同填充</p>
	 * @param modelMap
	 * @param id 子采购id
	 * @param contractid 合同id
	 * @return
	 * @author wangzh
	 */
	@ResponseBody
	@RequestMapping(value = Url.jndSubPurchaseForContractById, method = RequestMethod.GET)
	public Map<String, Object> jndSubPurchaseForContractById(ModelMap modelMap, Integer id, Integer contractid) {
		Map<String, Object> reMap = new HashMap<String, Object>();
		Map<String, Object> paMap = new HashMap<String, Object>();
		paMap.put("sbid", id);
		if (contractid != null) {
			paMap.put("contractid", contractid);
		}
		Map<String, Object> sb = jndPurchaseService.getSubPurchaseForContractById(paMap);
		if (sb != null) {
			reMap.put("status", true);
			reMap.put("sb", sb);
			return reMap;
		}
		reMap.put("status", false);
		reMap.put("msg", "子采购计划不存在！");
		return reMap;
	}

	/**
	 * 
	 * <p>合同新增、编辑保存</p>
	 * @param modelMap
	 * @param cmd
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.jndContractsave, method = RequestMethod.POST)
	public String jndContractsave(ModelMap modelMap, ContractSaveCmd cmd) {
		try {
			jndPurchaseService.contractSave(modelMap, cmd);
			modelMap.put("status", true);
		} catch (PortalAppUnCheckedException e) {
			modelMap.put("message", e.getMessage());
			return "error.message";
		} catch (Exception e) {
			modelMap.put("message", e.getMessage());
			return "error.message";
		}
		return jndcontractindex(modelMap, null, StringUtils.isNotBlank(cmd.getNewadd()) ? null : cmd.getCurrpage(), "0");
	}

	/**
	 * 
	 * <p>到合同查看页</p>
	 * @param modelMap
	 * @param currpage
	 * @param id
	 * @param target 从菜单进入时的标示 0管理1采购2法务3财务
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.jndContractview, method = RequestMethod.GET)
	public String jndContractview(ModelMap modelMap, String currpage, Integer id, String node) {
		if (StringUtils.isNotBlank(currpage)) {
			modelMap.put("currpage", currpage);
		}
		if (StringUtils.isNotBlank(node)) {
			modelMap.put("node", node);
		}
		jndPurchaseService.jndContractview(modelMap, id, node);
		return "jndContractviewView";
	}

	/**
	 * 
	 * <p>合同删除、撤销</p>
	 * @param modelMap
	 * @param revocation
	 * @param id
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.jndContractdel, method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> jndContractdel(ModelMap modelMap, String revocation, Integer id) {
		Map<String, Object> reMap = new HashMap<String, Object>();
		reMap.put("status", false);
		try {
			jndPurchaseService.contractDelete(id, revocation);
			reMap.put("status", true);
		} catch (PortalAppUnCheckedException e) {
			reMap.put("msg", e.getMessage());
		} catch (Exception e) {
			reMap.put("msg", e.getMessage());
		}
		return reMap;
	}

	/**
	 * 
	 * <p>到合同审核页</p>
	 * @param modelMap
	 * @param currpage
	 * @param id
	 * @param node
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.jndContractaudit, method = RequestMethod.GET)
	public String jndContractaudit(ModelMap modelMap, String currpage, Integer id, String node) {
		if (StringUtils.isNotBlank(currpage)) {
			modelMap.put("currpage", currpage);
		}
		jndPurchaseService.jndContractaudit(modelMap, id, node);
		return "jndContractauditView";
	}

	/**
	 * 
	 * <p>审核do</p>
	 * @param modelMap
	 * @param id
	 * @param node
	 * @param type
	 * @param reason
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.jndContractauditdo, method = RequestMethod.POST)
	public String jndContractauditdo(ModelMap modelMap, Integer id, String node, String type, String reason, String currpage) {
		modelMap.put("node", node);
		try {
			jndPurchaseService.contractauditdo(modelMap, id, node, type, reason);
			modelMap.put("status", true);
		} catch (PortalAppUnCheckedException e) {
			modelMap.put("message", e.getMessage());
			return "error.message";
		} catch (Exception e) {
			modelMap.put("message", e.getMessage());
			return "error.message";
		}
		return jndcontractindex(modelMap, null, currpage, node);
	}

	/**
	 * 
	 * <p>上传正式签字文件</p>
	 * @param modelMap
	 * @param text1url
	 * @param id
	 * @param currpage
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.jndContractsign, method = RequestMethod.POST)
	public String jndContractsign(ModelMap modelMap, MultipartFile text1url, Integer id, String currpage) {
		// modelMap.put("currpage", currpage);
		try {
			jndPurchaseService.contractsign(text1url, id);
			modelMap.put("status", true);
		} catch (PortalAppUnCheckedException e) {
			modelMap.put("message", e.getMessage());
			return "error.message";
		} catch (Exception e) {
			modelMap.put("message", e.getMessage());
			return "error.message";
		}
		return jndcontractindex(modelMap, null, currpage, "0");
	}

	/**
	 * 
	 * <p>手动触发黑名单服务</p>
	 * @param modelMap
	 * @param currpage
	 * @param id
	 * @param node
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = "/manualblackname", method = RequestMethod.GET)
	@ResponseBody
	public String manualblackname(ModelMap modelMap, String currpage, Integer id, String node) {
		blackSupplierService.job();
		return "manualblacknameView";
	}
}