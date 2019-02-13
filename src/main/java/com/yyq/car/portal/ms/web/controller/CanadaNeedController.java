package com.yyq.car.portal.ms.web.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.yyq.car.portal.common.dto.CarTypeinDto;
import com.yyq.car.portal.common.dto.UserDTO;
import com.yyq.car.portal.common.exception.PortalAppUnCheckedException;
import com.yyq.car.portal.common.mapper.mallcontract.JndCarorderDetailMapper;
import com.yyq.car.portal.common.mapper.product.StoreMapper;
import com.yyq.car.portal.common.mapper.product.flowschemeMapper;
import com.yyq.car.portal.common.model.auth.User;
import com.yyq.car.portal.common.model.comm.Abrand;
import com.yyq.car.portal.common.model.jnd.Contractapplypay;
import com.yyq.car.portal.common.model.jnd.Jndapplypay;
import com.yyq.car.portal.common.model.jnd.Jndbuy;
import com.yyq.car.portal.common.model.jnd.Jndcar;
import com.yyq.car.portal.common.model.jnd.Jndcarcheck;
import com.yyq.car.portal.common.model.jnd.Jndcontract;
import com.yyq.car.portal.common.model.jnd.Jndfile;
import com.yyq.car.portal.common.model.jnd.Jndneed;
import com.yyq.car.portal.common.model.jnd.jndSite;
import com.yyq.car.portal.common.model.jnd.jndSupplier;
import com.yyq.car.portal.common.model.jnd.jndfreight;
import com.yyq.car.portal.common.model.product.Shop;
import com.yyq.car.portal.common.model.product.Store;
import com.yyq.car.portal.common.model.product.flowscheme;
import com.yyq.car.portal.common.service.ResourcePersistenceService;
import com.yyq.car.portal.common.service.security.SecurityHelper;
import com.yyq.car.portal.common.util.DateUtils;
import com.yyq.car.portal.common.util.ValidationUtils;
import com.yyq.car.portal.ms.app.service.AssetRepositoryService;
import com.yyq.car.portal.ms.app.service.BrandAndModelService;
import com.yyq.car.portal.ms.app.service.CanadaNeedService;
import com.yyq.car.portal.ms.web.constant.Url;
import com.yyq.car.portal.ms.web.constant.View;


@Controller
public class CanadaNeedController {

	@Autowired
	private CanadaNeedService canadaNeedService;
	@Autowired
	private BrandAndModelService brandAndModelService;
	@Autowired
	private AssetRepositoryService assetRepositoryService;
	@Autowired
	private ResourcePersistenceService resourceService;
	@Autowired
	private StoreMapper storeMapper;
	@Autowired
	private JndCarorderDetailMapper jndCarorderDetailMapper;

	@Autowired
	private flowschemeMapper flowschemeMapper;

	/**
	 * 查询预估费用
	 * @author xhl
	 * @param id
	 * @param map
	 * @return
	 *2018年9月14日下午4:09:59
	 *
	 */
	@RequestMapping(value = Url.selectJndCar, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> selectJndCar(int id) {
		Map<String, Object> map = new HashMap<String, Object>();
		Jndcar car = canadaNeedService.Customsupdatejndcar(id);
		map.put("car", car);
		return map;
	}

	@RequestMapping(value = Url.updatesave, method = RequestMethod.POST)
	public @ResponseBody Object updatesavecar(Jndcar jndcar, MultipartFile siden1, MultipartFile siden2, MultipartFile siden3, MultipartFile siden4,
			MultipartFile siden5) throws IOException {
		canadaNeedService.updatesavecar(jndcar, siden1, siden2, siden3, siden4, siden5);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", true);
		return map;

	}

	/**
	 * 报关出库列表修改车辆
	 * @param map
	 * @param currpage
	 * @param id
	 * @return
	 */
	@RequestMapping(value = Url.updatejndcar, method = RequestMethod.GET)
	public String updatejndcar(ModelMap map, String currpage, Integer id) {
		Jndcar jnd = canadaNeedService.Customsupdatejndcar(id);
		Jndcontract con = canadaNeedService.jndcontractdetails(jnd.getContractid());

		String c[] = con.getOutcolor().split("/");

		String c1[] = con.getIncolor().split("/");

		map.put("list1", c);
		map.put("list2", c1);
		map.put("currpage", currpage);
		map.put("jnd", jnd);
		return "updatejndcar";

	}

	/**
	 * 供应商列表页面
	 * @param map
	 * @param currpage
	 * @return
	 */
	@RequestMapping(value = Url.Supplier, method = RequestMethod.GET)
	public String Supplierpage(ModelMap map, String currpage) {
		map.put("currpage", currpage);
		return "Supplier";
	}

	/**
	 * 供应商列表查询
	 * @param jndSupplier
	 * @param start
	 * @param pageSize
	 * @return
	 */
	@RequestMapping(value = Url.supplierlist, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> supplierlist(jndSupplier jndSupplier, String start, String pageSize) {
		Map<String, Object> resultMap = canadaNeedService.supplierlist(jndSupplier, start, pageSize);
		return resultMap;
	}

	/**
	 * 
	 * <p>供应方保存</p>
	 * @param modelMap
	 * @param sp
	 * @param currpage
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.supplierSave, method = RequestMethod.POST)
	public String supplierSave(ModelMap modelMap, jndSupplier sp, String currpage) {
		// modelMap.put("currpage", currpage);
		try {
			canadaNeedService.supplierSave(sp);
			return Supplierpage(modelMap, currpage);
		} catch (PortalAppUnCheckedException e) {
			modelMap.put("message", e.getMessage());
			return View.ERROR_MESSAGE;
		} catch (Exception e) {
			modelMap.put("message", e.getMessage());
			return View.ERROR_MESSAGE;
		}
	}

	/**
	 * 
	 * <p>供应方删除</p>
	 * @param modelMap
	 * @param id
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.supplierdelete, method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> supplierdelete(ModelMap modelMap, Integer id) {
		Map<String, Object> reMap = new HashMap<String, Object>();
		reMap.put("status", false);
		try {
			canadaNeedService.supplierdelete(id);
			reMap.put("status", true);
		} catch (Exception e) {
			reMap.put("msg", e.getMessage());
		}
		return reMap;
	}

	/**
	 * 到供应商添加页面
	 * @return
	 */
	@RequestMapping(value = Url.supplieradd, method = RequestMethod.GET)
	public String supplieradd(ModelMap modelMap, String currpage) {
		modelMap.put("currpage", currpage);
		return "supplieradd";
	}

	/**
	 * 
	 * <p>到供应方编辑页</p>
	 * @param modelMap
	 * @param id
	 * @param currpage
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.supplieredit, method = RequestMethod.GET)
	public String supplieredit(ModelMap modelMap, Integer id, String currpage) {
		modelMap.put("currpage", currpage);
		canadaNeedService.getSupplierById(modelMap, id);
		return "supplieredit";
	}

	/**
	 * 申请单中合同详情查看
	 * @param map
	 * @param id
	 * @param audit
	 * @param payid
	 * @return
	 */
	@RequestMapping(value = Url.jndcontractdetails, method = RequestMethod.GET)
	public String jndcontractapplypaydetails(String username, ModelMap map, Integer id, Integer audit, Integer payid, String finals) {
		map.put("audit", audit);// audit=1 是从添加付款申请过来的 audit=2 是从审核过来的
		map.put("payid", payid);// 付款申请id
		Jndcontract jndc = canadaNeedService.jndcontractdetails(id);
		Jndbuy buy = canadaNeedService.selectByPrimaryKey(jndc.getBuyid());
		Store st = canadaNeedService.queryStoreNameById(Integer.parseInt(jndc.getApponitadd()));
		map.put("buy", buy);
		map.put("st", st);
		map.put("con", jndc);
		map.put("finals", finals);
		map.put("username", username);
		return "jndcontractdetails";

	}

	/**
	 * 合同付款申请单编辑查询
	 * @param id
	 * @return
	 */
	@RequestMapping(value = Url.updatequery, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> updatequery(Integer id) {
		Map<String, Object> paraMap = new HashMap<String, Object>();
		paraMap.put("id", id);
		return canadaNeedService.updatequery(paraMap, id);
	}

	/**
	 * 删除付款申请单
	 * @param id
	 * @return
	 */
	@RequestMapping(value = Url.njndApplyPayDel, method = RequestMethod.POST)
	public @ResponseBody Object njndApplyPayDel(Integer id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", false);
		try {
			canadaNeedService.njndApplyPayDel(id);
			map.put("status", true);
		} catch (PortalAppUnCheckedException e) {
			// TODO: handle exception
			map.put("msg", e.getMessage());
		} catch (Exception e) {
			// TODO: handle exception
			map.put("msg", e.getMessage());
		}
		return map;
	}

	/**
	 * 尾款提交
	 * @param id
	 * @return
	 */
	@RequestMapping(value = Url.finalsubmit, method = RequestMethod.POST)
	public @ResponseBody Object finalsubmit(Integer id, Contractapplypay contractapplypay, MultipartFile othercosturl1, MultipartFile trimurl2,
			MultipartFile otherurl3) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", false);
		try {
			canadaNeedService.finalsubmit(id, contractapplypay, othercosturl1, trimurl2, otherurl3);
			map.put("status", true);
		} catch (PortalAppUnCheckedException e) {
			// TODO: handle exception
			map.put("msg", e.getMessage());
		} catch (Exception e) {
			// TODO: handle exception
			map.put("msg", e.getMessage());
		}
		return map;

	}

	/**
	 * 添加页面查询显示
	 * @param checkvalc
	 * @param paytype
	 * @return
	 */
	@RequestMapping(value = Url.choosecontractshow, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> choosecontractshow(String[] checkvalc, Integer paytype) {
		return canadaNeedService.choosecontractshow(checkvalc, paytype);

	}

	/**
	 * 审核撤销
	 * @param id
	 * @return
	 */
	@RequestMapping(value = Url.revocationapply, method = RequestMethod.GET)
	public @ResponseBody Object revocationapply(Integer id) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", false);
		try {
			canadaNeedService.revocationapply(id);
			map.put("status", true);
		} catch (PortalAppUnCheckedException e) {
			// TODO: handle exception
			map.put("msg", e.getMessage());
		} catch (Exception e) {
			// TODO: handle exception
			map.put("msg", e.getMessage());
		}
		return map;
	}

	/**
	 * 付款申请单添加或修改保存
	 * @param checkval
	 * @return
	 */
	@RequestMapping(value = Url.applyadd, method = RequestMethod.POST)
	public @ResponseBody Object applyadd(String[] checkvalc, BigDecimal appliedamount, String id, Contractapplypay contractapplypay,
			MultipartFile othercosturl1, MultipartFile trimurl2, MultipartFile otherurl3) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", false);
		try {
			canadaNeedService.applyadd(checkvalc, appliedamount, id, contractapplypay, othercosturl1, trimurl2, otherurl3);
			map.put("status", true);
		} catch (PortalAppUnCheckedException e) {
			// TODO: handle exception
			map.put("msg", e.getMessage());
		} catch (Exception e) {
			// TODO: handle exception
			map.put("msg", e.getMessage());
		}
		return map;

	}

	/**
	 * 合同付款申请审核通过
	 * @param id
	 * @param currpage
	 * @param username
	 * @return
	 */
	@RequestMapping(value = Url.updatecontract, method = RequestMethod.POST)
	public @ResponseBody Object updatecontract(int id, String currpage, String username) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", false);
		try {
			canadaNeedService.updatecontract(id, username);
			map.put("status", true);
		} catch (PortalAppUnCheckedException e) {
			// TODO: handle exception
			map.put("msg", e.getMessage());
		} catch (Exception e) {
			// TODO: handle exception
			map.put("msg", e.getMessage());
		}
		return map;
	}

	/**
	 * 合同付款申请审核不通过
	 * @param id
	 * @param currpage
	 * @param username
	 * @param cause
	 * @return
	 */
	@RequestMapping(value = Url.updatecontractNoPass, method = RequestMethod.POST)
	public @ResponseBody Object updatecontractNoPass(int id, String currpage, String username, String cause) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", false);

		try {
			canadaNeedService.updatecontractNoPass(id, username, cause);
			map.put("status", true);
		} catch (PortalAppUnCheckedException e) {
			// TODO: handle exception
			map.put("msg", e.getMessage());
		} catch (Exception e) {
			// TODO: handle exception
			map.put("msg", e.getMessage());
		}
		return map;
	}

	/**
	 * 查询合同
	 * @param id
	 * @return
	 */
	@RequestMapping(value = Url.selectContract, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> selectContract(Integer id, Integer start, Integer pageSize) {
		Map<String, Object> paraMap = new HashMap<String, Object>();
		paraMap.put("start", (start - 1) * pageSize);
		paraMap.put("pageSize", pageSize);
		paraMap.put("id", id);
		return canadaNeedService.selectContract(paraMap);
	}

	/**
	 * 添加需求单
	 * @param map
	 * @return
	 */
	@RequestMapping(value = Url.canadaaddneed, method = RequestMethod.GET)
	public String canadarequirementlist(ModelMap map) {
		Integer key = assetRepositoryService.querySequenceValue(706);// 选择客户信息表的下一个主键
		String now = DateUtils.formate(DateUtils.getCurrentTime(), DateUtils.COMPACT_DATETIME_FORMAT);
		map.put("filenum", "xqd" + now.substring(2) + key);// 需求单编号
		List<Abrand> brand = brandAndModelService.queryBrandinitial();
		map.put("brand", brand);
		map.put("key", key);
		List<jndSite> site = canadaNeedService.querysite();
		map.put("site", site);
		return "canadaaddneed";
	}

	/**
	 * 到需求单列表页
	 * @param map
	 * @param currpage
	 * @return
	 */
	@RequestMapping(value = Url.canadarequirementlistpage, method = RequestMethod.GET)
	public String queryjndneedlistpage(ModelMap map, String currpage) {
		map.put("currpage", currpage);
		UserDTO username = SecurityHelper.getAdminUserInfo();
		map.put("loginId", username.getId());// 登录账户id
		return "canadarequirementlistpage";
	}

	/**
	 * 到新的付款申请列表页面
	 * @param map
	 * @param currpage
	 * @return
	 */
	@RequestMapping(value = Url.njndApplyPayLstIndex, method = RequestMethod.GET)
	public String njndApplyPayLstIndex(ModelMap map, String currpage) {
		map.put("currpage", currpage);
		UserDTO username = SecurityHelper.getAdminUserInfo();
		map.put("loginId", username.getId());// 登录账户id
		map.put("userCountry", username.getCountry());// 登录账户国家地区
		return "njndApplyPayLstIndex";
	}

	/**
	 * 合同付款申请单添加列表查询
	 * @param contractapplypay
	 * @param start
	 * @param pageSize
	 * @return
	 * @throws ParseException 
	 */
	@RequestMapping(value = Url.anjndApplyPayLstpage, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> addnewjndApplyPayLstpage(String userCountry, Contractapplypay contractapplypay, Integer start, Integer pageSize,
			String code, String name, String ccreatetime, String cstatus, String mallcontractcode) throws ParseException {
		Map<String, Object> paraMap = new HashMap<String, Object>();
		paraMap.put("start", (start - 1) * pageSize);
		paraMap.put("pageSize", pageSize);
		if (StringUtils.isNotBlank(code)) {
			paraMap.put("code", code);
		}
		if (StringUtils.isNotBlank(userCountry)) {
			paraMap.put("country", userCountry);
		}
		if (StringUtils.isNotBlank(mallcontractcode)) {
			paraMap.put("mallcontractcode", mallcontractcode);
		}
		if (StringUtils.isNotBlank(name)) {
			paraMap.put("name", name);
		}
		if (StringUtils.isNotBlank(ccreatetime)) {
			paraMap.put("createtime", ccreatetime);
		}
		if (StringUtils.isNotBlank(cstatus)) {
			/**
			 * <option value="">--请选择--</option>
			<option value="1">定金通过</option>
			<option value="2">定金不通过</option>//cstatus 1 审核中 2 审核通过 3 审核不通过 4撤销
			<option value="3">定金审核中</option> paytype 付款类型1 定金 2全款 3尾款
			<option value="4">定金已撤销</option>
			<option value="5">尾款通过</option>
			<option value="6">尾款不通过</option>
			<option value="7">尾款审核中</option>
			<option value="8">尾款已撤销</option>
			<option value="9">全款通过</option>
			<option value="10">全款不通过</option>
			<option value="11">全款审核中</option>
			<option value="12">全款已撤销</option>
			 */
			if (Integer.parseInt(cstatus) == 1) {// 定金审核通过
				paraMap.put("cstatus", 2);// 审核通过
				paraMap.put("paytype", 1);// 定金
			} else if (Integer.parseInt(cstatus) == 2) {// 定金审核不通过
				paraMap.put("cstatus", 3);// 审核不通过
				paraMap.put("paytype", 1);
			} else if (Integer.parseInt(cstatus) == 3) {// 定金审核中
				paraMap.put("cstatus", 1);
				paraMap.put("paytype", 1);
			} else if (Integer.parseInt(cstatus) == 4) {// 定金已撤销
				paraMap.put("cstatus", 4);
				paraMap.put("paytype", 1);
			} else if (Integer.parseInt(cstatus) == 5) {// 尾款通过
				paraMap.put("cstatus", 2);
				paraMap.put("paytype", 3);
			} else if (Integer.parseInt(cstatus) == 6) {// 尾款不通过
				paraMap.put("cstatus", 3);
				paraMap.put("paytype", 3);
			} else if (Integer.parseInt(cstatus) == 7) {// 尾款审核中
				paraMap.put("cstatus", 1);
				paraMap.put("paytype", 3);
			} else if (Integer.parseInt(cstatus) == 8) {// 尾款已撤销
				paraMap.put("cstatus", 4);
				paraMap.put("paytype", 3);
			} else if (Integer.parseInt(cstatus) == 9) {// 全款通过
				paraMap.put("cstatus", 2);
				paraMap.put("paytype", 2);
			} else if (Integer.parseInt(cstatus) == 10) {// 全款不通过
				paraMap.put("cstatus", 3);
				paraMap.put("paytype", 2);
			} else if (Integer.parseInt(cstatus) == 11) {// 全款审核中
				paraMap.put("cstatus", 1);
				paraMap.put("paytype", 2);
			} else if (Integer.parseInt(cstatus) == 12) {// 全款已撤销
				paraMap.put("cstatus", 4);
				paraMap.put("paytype", 2);
			}
		}
		return canadaNeedService.addnewjndApplyPayLstIndex(paraMap);
	}

	/**
	 * 合同付款申请单审核列表查询
	 * @param contractapplypay
	 * @param start
	 * @param pageSize
	 * @return
	 * @throws ParseException 
	 */
	@RequestMapping(value = Url.njndApplyPayLstpage, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> njndApplyPayLstpage(Contractapplypay contractapplypay, Integer start, Integer pageSize, String code, String name,
			String ccreatetime, String cstatus) throws ParseException {
		Map<String, Object> paraMap = new HashMap<String, Object>();
		paraMap.put("start", (start - 1) * pageSize);
		paraMap.put("pageSize", pageSize);
		if (StringUtils.isNotBlank(code)) {
			paraMap.put("code", code);
		}
		if (StringUtils.isNotBlank(name)) {
			paraMap.put("name", name);
		}
		if (StringUtils.isNotBlank(ccreatetime)) {
			paraMap.put("createtime", ccreatetime);
		}
		if (StringUtils.isNotBlank(contractapplypay.getMallcontractcode())) {
			paraMap.put("mallcontractcode", contractapplypay.getMallcontractcode());
		}
		if (StringUtils.isNotBlank(cstatus)) {
			/**
			 * <option value="">--请选择--</option>
			<option value="1">定金通过</option>
			<option value="2">定金不通过</option>//cstatus 1 审核中 2 审核通过 3 审核不通过 4撤销
			<option value="3">定金审核中</option> paytype 付款类型1 定金 2全款 3尾款
			<option value="4">定金已撤销</option>
			<option value="5">尾款通过</option>
			<option value="6">尾款不通过</option>
			<option value="7">尾款审核中</option>
			<option value="8">尾款已撤销</option>
			<option value="9">全款通过</option>
			<option value="10">全款不通过</option>
			<option value="11">全款审核中</option>
			<option value="12">全款已撤销</option>
			 */
			if (Integer.parseInt(cstatus) == 1) {// 定金审核通过
				paraMap.put("cstatus", 2);// 审核通过
				paraMap.put("paytype", 1);// 定金
			} else if (Integer.parseInt(cstatus) == 2) {// 定金审核不通过
				paraMap.put("cstatus", 3);// 审核不通过
				paraMap.put("paytype", 1);
			} else if (Integer.parseInt(cstatus) == 3) {// 定金审核中
				paraMap.put("cstatus", 1);
				paraMap.put("paytype", 1);
			} else if (Integer.parseInt(cstatus) == 5) {// 尾款通过
				paraMap.put("cstatus", 2);
				paraMap.put("paytype", 3);
			} else if (Integer.parseInt(cstatus) == 6) {// 尾款不通过
				paraMap.put("cstatus", 3);
				paraMap.put("paytype", 3);
			} else if (Integer.parseInt(cstatus) == 7) {// 尾款审核中
				paraMap.put("cstatus", 1);
				paraMap.put("paytype", 3);
			} else if (Integer.parseInt(cstatus) == 9) {// 全款通过
				paraMap.put("cstatus", 2);
				paraMap.put("paytype", 2);
			} else if (Integer.parseInt(cstatus) == 10) {// 全款不通过
				paraMap.put("cstatus", 3);
				paraMap.put("paytype", 2);
			} else if (Integer.parseInt(cstatus) == 8) {// 全款审核中
				paraMap.put("cstatus", 1);
				paraMap.put("paytype", 2);
			}

		}
		return canadaNeedService.njndApplyPayLstIndex(paraMap);
	}

	/**
	 * 付款申请单合同添加页面
	 * @param userCountry 账户地区中东或加拿大
	 * @param modelMap
	 * @param id
	 * @param currpage
	 * @return
	 */
	@RequestMapping(value = Url.njndApplyPayAdd, method = RequestMethod.GET)
	public String njndApplyPayAdd(String userCountry, ModelMap modelMap, String id, String currpage) {
		modelMap.put("id", id);
		modelMap.put("currpage", currpage);
		modelMap.put("userCountry", userCountry);
		if (id != null) {// id为空时是添加 有值时是申请单编辑和不通过编辑
			Contractapplypay conpay = canadaNeedService.selectcontractapplipaybyid(id);
			modelMap.put("conpay", conpay);
		}
		return "njndApplyPayAdd";
	}

	/**
	 * 到选择采购计划页面
	 * @param userCountry  账户地区
	 * @param modelMap
	 * @param currpage
	 * @param buyid 编辑时采购计划id
	 * @param cid 编辑时付款申请单id
	 * @return
	 */
	@RequestMapping(value = Url.njndPurchaseLstForApayIndex, method = RequestMethod.GET)
	public String purchaseLstForApayIndex(String userCountry, ModelMap modelMap, String currpage, String buyid, String cid) {
		if (StringUtils.isNotBlank(currpage)) {
			modelMap.put("currpage", currpage);
		}
		modelMap.put("buyid", buyid);
		modelMap.put("userCountry", userCountry);
		modelMap.put("cid", cid);
		return "njndPurchaseLstForApayIndex";
	}

	/**
	 * <p>到加拿大合同页面付款申请选择</p>
	 * @param modelMap
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.njndSubPurchaseLstForApayIndex, method = RequestMethod.GET)
	public String subPurchaseLstForApayIndex(ModelMap modelMap, String currpage, Integer buyid) {
		if (StringUtils.isNotBlank(currpage)) {
			modelMap.put("currpage", currpage);
		}
		modelMap.put("buyid", buyid);
		return "njndSubPurchaseLstForApayIndex";
	}

	/**
	 * 到合同付款申请单审核列表页面
	 * @param modelMap
	 * @param currpage
	 * @return
	 */
	@RequestMapping(value = Url.njndpayapplyauditindex, method = RequestMethod.GET)
	public String njndpayapplyauditindex(ModelMap modelMap, String currpage) {
		if (StringUtils.isNotBlank(currpage)) {
			modelMap.put("currpage", currpage);
		}
		UserDTO username = SecurityHelper.getAdminUserInfo();
		modelMap.put("name", username.getId());// 登录账户id
		return "njndpayapplyauditindex";
	}

	/**
	 * 到付款申请单审核页面
	 * @param id
	 * @return 
	 */
	@RequestMapping(value = Url.njndApplyPayEdit, method = RequestMethod.GET)
	public String njndApplyPayEdit(String currpage, String id, String username, String view, String finals, ModelMap map) {
		Contractapplypay contract = canadaNeedService.njndApplyPayEdit(Integer.parseInt(id));
		Jndbuy buy = canadaNeedService.querybuy(contract.getBuyid());
		map.put("contract", contract);
		map.put("buy", buy);
		map.put("id", id);
		map.put("username", username);
		map.put("currpage", currpage);
		if (view != null) {// 添加列表查看
			map.put("finals", finals);
			return "addnjndApplyPayEdit";
		}
		return "njndApplyPayEdit";//审核列表查看
	}

	/**
	 * 根据采购id查询合同
	 * @param map
	 * @param buyid 采购计划id
	 * @param currpage
	 * @param paytype 是定金还是全款
	 * @param cbuyid
	 * @param cid 
	 * @param selfbuy 定金时是自采还是带采
	 * @return
	 */
	@RequestMapping(value = Url.contractIndexpage, method = RequestMethod.GET)
	public String contractIndexpage(ModelMap map, Integer buyid, String currpage, Integer paytype, String cbuyid, String cid, String selfbuy) {
		map.put("buyid", buyid);
		map.put("currpage", currpage);
		map.put("paytype", paytype);
		map.put("cbuyid", cbuyid);
		map.put("cid", cid);
		map.put("selfbuy", selfbuy);
		if (StringUtils.isNotBlank(selfbuy)) {
			if (selfbuy.equals("1")) {
				return "selfbuyContractIndexpage";
			} else {
				return "contractIndexpage";
			}
		} else {
			return "contractIndexpage";
		}
	}

	/**
	 * 根据采购id查询合同
	 * @param buyid 采购计划id
	 * @param paytype  定金还是全款
	 * @param cbuyid  
	 * @param cid  付款申请单id
	 * @param selfbuy 自采还是带采 1自采 2带采
	 * @return
	 */
	@RequestMapping(value = Url.contractIndex, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> contractIndex(Integer buyid, Integer paytype, String cbuyid, String cid, String selfbuy) {
		Map<String, Object> paraMap = new HashMap<String, Object>();
		paraMap.put("buyid", buyid);
		paraMap.put("paytype", paytype);
		paraMap.put("selfbuy", selfbuy);
		return canadaNeedService.selectcontracts(paraMap, buyid, cbuyid, cid);
	}

	/**
	 * 需求单列表查看
	 * @param jndneed
	 * @param start
	 * @param pageSize
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping(value = Url.canadarequirementlist, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> queryjndneedlist(Jndneed jndneed, String start, String pageSize, String createtimes, String status)
			throws ParseException {
		if (StringUtils.isNotBlank(createtimes)) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			jndneed.setCreatetime(sdf.parse(createtimes));
		}
		Map<String, Object> list = canadaNeedService.queryjndneedlist(jndneed, start, pageSize);
		return list;
	}

	/**
	 * 需求单列表添加保存
	 * @param result
	 * @param jndneed
	 * @return
	 */
	@RequestMapping(value = Url.jndneedadd, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> jndneedadd(String result, Jndneed jndneed, String site) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			jndSite currency = canadaNeedService.querycurrency(site);
			jndneed.setCurrency(currency.getCurrency());
			jndneed.setCountry(currency.getCountry());
			canadaNeedService.jndneedadd(result, jndneed);
			map.put("status", true);
		} catch (Exception e) {
			// TODO: handle exception
			map.put("status", false);
		}
		return map;
	}

	/**
	 * 删除需求单
	 * @param id
	 * @param currpage 
	 * @return
	 */
	@RequestMapping(value = Url.jndneeddelete, method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> deletejndneed(int id) {
		int c = canadaNeedService.countjndbuy(id);
		Map<String, Object> map = new HashMap<String, Object>();
		if (c == 0) {
			canadaNeedService.deletejndneed(id);
			map.put("status", true);
			return map;
		}
		map.put("status", false);
		return map;
	}

	/**
	 * 到查看和修改需求单页
	 * @param id
	 * @param currpage
	 * @param map
	 * @param details
	 * @return
	 */
	@RequestMapping(value = Url.updatejndsuneed, method = RequestMethod.GET)
	public String updatejndsuneedpage(int id, int currpage, ModelMap map, int details) {
		Jndneed jn = canadaNeedService.jndneed(id);
		List<Map<String, Object>> lst = canadaNeedService.jndsubneedlst(id);
		map.put("lst", lst);
		map.put("currpage", currpage);
		map.put("jn", jn);
		if (details == 1) {
			return "jndsuneeddetails";
		}
		if (details == 3) {// 商城需求审核页面
			return "mallneedAudit";
		}
		if (details == 4) {// 商城需求审核通过查看
			/*flowscheme flow = new flowscheme();
			flow.setTaskid(id);
			flow.setTaskname("商城需求单审核通过");
			List<flowscheme> flowlst = flowschemeMapper.selectByCriteria(flow);
			if (flowlst.size()>0) {
				map.put("flowlst", flowlst.get(0));
			}*/
			List<Map<String, Object>> vinlst = null;
			for (Map<String, Object> map2 : lst) {
				for (Entry<String, Object> entry : map2.entrySet()) {
					if (entry.getKey().equals("mallordercode")) {
						System.out.println(entry.getValue().toString());
						vinlst = jndCarorderDetailMapper.matchingVin(entry.getValue().toString());
					}
				}
				map2.put("vinlst", vinlst);
			}

			return "mallneedAuditdetails";
		}
		List<Map<String, Object>> abrand = null;
		List<Map<String, Object>> models = null;
		List<Map<String, Object>> versions = null;
		String subneedid = null;
		for (Map<String, Object> map2 : lst) {
			for (Entry<String, Object> entry : map2.entrySet()) {
				System.out.println(entry.getValue());
				if (entry.getKey().equals("initials")) {
					abrand = brandAndModelService.queryBrand(entry.getValue().toString());
				} else if (entry.getKey().equals("brand")) {
					Abrand lsts = brandAndModelService.queryId(entry.getValue().toString());
					models = brandAndModelService.queryByBrandidModel(lsts.getBrandid());
				} else if (entry.getKey().equals("model")) {
					versions = brandAndModelService.queryVersion(entry.getValue().toString());
				} else if (entry.getKey().equals("id")) {
					subneedid = (canadaNeedService.querysubbuyidBysubneedid(Integer.parseInt(entry.getValue().toString())));
				}
			}
			List<Map<String, Object>> result = brandAndModelService.queryBrandinitia();
			map2.put("subneedid", subneedid);
			map2.put("result", result);
			map2.put("abrand", abrand);
			map2.put("models", models);
			map2.put("versions", versions);
		}
		return "updatejndsuneed";
	}

	/**
	 * 修改保存
	 * @param result
	 * @param id
	 * @return
	 */
	@RequestMapping(value = Url.updatejndneed, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> updatejndneed(String result, String needer, int id) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			canadaNeedService.updatejndneed(result, needer, id);
			map.put("status", 1);
		} catch (Exception e) {
			// TODO: handle exception
			map.put("status", e.getMessage());
		}
		return map;
	}

	/**
	 * 加拿大资产库列表页面
	 * @param map
	 * @param currpage
	 * @return
	 */
	@RequestMapping(value = Url.jndAssetlibrarylistpage, method = RequestMethod.GET)
	public String jndAssetlibrarylist(ModelMap map, String currpage) {
		map.put("currpage", currpage);
		UserDTO username = SecurityHelper.getAdminUserInfo();
		map.put("userCountry", username.getCountry());// 登录账户国家地区
		if (username.getCountry() != null) {
			List<Store> store = canadaNeedService.userjndstore(username.getCountry());// 国外地区登录时查询相应的仓库
			List<Store> store1 = canadaNeedService.userjndstore(3);// 和其他有冲突刻意这样写
			for (Store store2 : store1) {
				store.add(store2);
			}
			map.put("store", store);
		} else {
			List<Store> store = canadaNeedService.jndstore();
			map.put("store", store);
		}
		List<jndSite> site = canadaNeedService.querysite();
		map.put("site", site);
		return "jndAssetlibrarylist";
	}

	/**
	 * 加拿大列表查看
	 * @param jndcar
	 * @param start
	 * @param pageSize
	 * @return
	 */
	@RequestMapping(value = Url.jndAssetlibrarylist, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> queryjndAssetlibrarylist(String userCountry, Jndcar jndcar, String start, String pageSize) {
		Map<String, Object> lst = canadaNeedService.queryjndAssetlibrarylist(userCountry, jndcar, start, pageSize);
		return lst;
	}

	/**
	 * 到报关出库页面
	 * @param map
	 * @param id
	 * @param currpage
	 * @return
	 */
	@RequestMapping(value = Url.CustomsDeclarationOutbound, method = RequestMethod.GET)
	public String CustomsDeclarationOutbound(ModelMap map, int id, String currpage) {
		Jndcar car = canadaNeedService.CustomsDeclarationOutbound(id);
		Jndapplypay applypay = canadaNeedService.Jndapplypaydetails(car.getApplypayid());
		Store stor = canadaNeedService.queryStoreNameById(car.getInstoreid());
		List<Store> store = canadaNeedService.jndstore();
		map.put("store", store);
		map.put("stor", stor);
		map.put("applypay", applypay);
		map.put("car", car);
		map.put("currpage", currpage);
		return "CustomsDeclarationOutbound";
	}

	/**
	 * 报关出库保存
	 * @param map
	 * @param jndcar
	 * @param currpage
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = Url.CustomsDeclarationOutboundSave, method = RequestMethod.POST)
	public String CustomsDeclarationOutboundsave(ModelMap map, Jndcar jndcar, String currpage, @RequestParam("files") MultipartFile[] files, String starttimes,
			String arrivetimes) throws Exception {
		canadaNeedService.CustomsDeclarationOutboundsave(files, jndcar, starttimes, arrivetimes);
		return jndAssetlibrarylist(map, currpage);
	}

	/**
	 * 已经报关车辆列表页面
	 * @param map
	 * @param currpage
	 * @return
	 */
	@RequestMapping(value = Url.ClearanceOfGoodsCarListpage, method = RequestMethod.GET)
	public String ClearanceOfGoodsCarListpage(ModelMap map, String currpage) {
		map.put("currpage", currpage);
		UserDTO username = SecurityHelper.getAdminUserInfo();
		map.put("userCountry", username.getCountry());// 登录账户国家地区
		if (username.getCountry() != null) {
			List<Store> store = canadaNeedService.userjndstore(username.getCountry());// 国外地区登录时查询相应的仓库
			map.put("store", store);
		} else {
			List<Store> store = canadaNeedService.jndstore();
			map.put("store", store);
		}
		List<jndSite> site = canadaNeedService.querysite();
		map.put("site", site);
		return "ClearanceOfGoodsCarListpage";
	}

	/**
	 * 已经报关车辆列表查询
	 * @param jndcar
	 * @param start
	 * @param pageSize
	 * @return
	 * @throws ParseException 
	 */
	@RequestMapping(value = Url.ClearanceOfGoodsCarList, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> ClearanceOfGoodsCarList(String userCountry, Jndcar jndcar, String start, String pageSize, String sstarttime)
			throws ParseException {
		Map<String, Object> lst = canadaNeedService.ClearanceOfGoodsCarList(userCountry, jndcar, start, pageSize, sstarttime);
		return lst;
	}

	/**
	 * 到已经报关车辆报关文件下载和退税凭证上传页面和退税凭证下载
	 * @param id
	 * @param currpage
	 * @return
	 */
	@RequestMapping(value = Url.fileDownloadAndUpload, method = RequestMethod.GET)
	public String fileDownloadAndUpload(ModelMap map, Jndfile jndfile, String currpage, int fileStatus) {
		List<Jndfile> files = canadaNeedService.fileDownloadAndUpload(jndfile);
		Jndcar car = canadaNeedService.CustomsDeclarationOutbound(jndfile.getCarid());
		Store stor = canadaNeedService.queryStoreNameById(car.getInstoreid());
		map.put("stor", stor);
		map.put("files", files);
		map.put("currpage", currpage);
		map.put("carid", jndfile.getCarid());
		map.put("car", car);
		if (fileStatus == 1) {
			return "fileDownloadAndUpload";// 报关文件下载和退税凭证上传
		}
		return "taxRefundAndClearanceOfGoodsFileDownload";// 报关文件下载和退税凭证下载
	}

	/**
	 * 退税文件保存
	 * @param files
	 * @param map
	 * @param currpage
	 * @param jndfile
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = Url.taxRefundFileUpload, method = RequestMethod.POST)
	public String taxRefundFileUpload(@RequestParam("files") MultipartFile[] files, ModelMap map, String currpage, Jndfile jndfile) throws IOException {
		canadaNeedService.taxRefundFileUpload(files, jndfile);
		map.put("currpage", currpage);
		return ClearanceOfGoodsCarListpage(map, currpage);
	}

	/**
	 * 到保税库入库列表页面
	 * @param map
	 * @param currpage
	 * @return
	 */
	@RequestMapping(value = Url.BondedWarehouseEntryListPage, method = RequestMethod.GET)
	public String BondedWarehouseEntryListpage(ModelMap map, String currpage) {
		List<Store> store = canadaNeedService.jndstore();
		map.put("store", store);
		map.put("currpage", currpage);
		List<jndSite> site = canadaNeedService.querysite();
		map.put("site", site);
		return "BondedWarehouseEntryList";
	}

	/**
	 * 保税库入库列表查询
	 * @param jndcar
	 * @param start
	 * @param pageSize
	 * @return
	 * @throws ParseException 
	 */
	@RequestMapping(value = Url.BondedWarehouseEntryList, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> BondedWarehouseEntryList(Jndcar jndcar, String start, String pageSize, String sarrivetime) throws ParseException {
		return canadaNeedService.BondedWarehouseEntryList(jndcar, start, pageSize, sarrivetime);
	}

	/**
	 * 到保税库入库检验单页面
	 * @param map
	 * @param currpage
	 * @return
	 */
	@RequestMapping(value = Url.GoToTheLibraryInspectionPage, method = RequestMethod.GET)
	public String GoToTheLibraryInspectionPage(ModelMap map, String currpage, int carid) {
		// int jnd = canadaNeedService.queryjndcarcheckBycarid(carid);// 根据车辆id查询检验单id
		// 修改时间2018年9月14日15:27:11
		Jndcar car = canadaNeedService.CustomsDeclarationOutbound(carid);
		Jndfile f = new Jndfile();
		f.setCarid(carid);
		List<Jndfile> file = canadaNeedService.fileDownloadAndUpload(f);
		Store stor = canadaNeedService.queryStoreNameById(car.getInstoreid());
		map.put("stor", stor);
		map.put("currpage", currpage);
		// map.put("id", jnd);
		map.put("carid", carid);
		map.put("currpage", currpage);
		map.put("file", file);
		map.put("car", car);
		return "GoToTheLibraryInspectionPage";
	}

	/**
	 * 保税区入库检验单保存
	 * @param map
	 * @param jndcarcheck
	 * @param currpage
	 * @return
	 * @throws IOException 
	 * @throws ParseException 
	 */
	@RequestMapping(value = Url.saveCheckTheBondedArea, method = RequestMethod.POST)
	public String saveCheckTheBondedArea(ModelMap map, Jndcarcheck jndcarcheck, String currpage, int carid, MultipartFile location, String sinbondedtime)
			throws IOException, ParseException {
		canadaNeedService.saveCheckTheBondedArea(jndcarcheck, carid, location, sinbondedtime);
		return BondedWarehouseEntryListpage(map, currpage);
	}

	/**
	 * 保税区到资产库
	 * @param map
	 * @param id
	 * @return
	 */
	@RequestMapping(value = Url.queryjndcarById, method = RequestMethod.GET)
	public String queryjndcarById(ModelMap map, int carid, String currpage) {
		Jndcar car = canadaNeedService.queryjndcarByid(carid);
		map.put("car", car);
		List<Store> storeLst = assetRepositoryService.queryAllStore();
		map.put("storeLst", storeLst);
		// 查询拥有门店管理权限的账户
		List<User> user = assetRepositoryService.queryName();
		List<Shop> shopLst = canadaNeedService.queryAllShop();
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
		map.put("user", user);
		map.put("currpage", currpage);
		return "cartypein";
	}

	/**
	 * 加拿大预入库列表页面
	 * @param currpage
	 * @param map
	 * @return
	 */
	@RequestMapping(value = Url.PreEntryVehicleListpage, method = RequestMethod.GET)
	public String PreEntryVehicleList(String currpage, ModelMap map) {
		map.put("currpage", currpage);
		List<jndSite> site = canadaNeedService.querysite();
		map.put("site", site);
		UserDTO username = SecurityHelper.getAdminUserInfo();
		map.put("userCountry", username.getCountry());// 登录账户id
		return "PreEntryVehicleListpage";
	}

	/**
	 * 加拿大预入库列表查询
	 * @param jndcar
	 * @param start
	 * @param pageSize
	 * @return
	 * @throws ParseException 
	 */
	@RequestMapping(value = Url.PreEntryVehicleList, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> PreEntryVehicleList(String userCountry, Jndcar jndcar, String start, String pageSize, String appointtimes)
			throws ParseException {
		return canadaNeedService.PreEntryVehicleList(userCountry, jndcar, start, pageSize, appointtimes);
	}

	/**
	 * 到加拿大预入库检验单
	 * @param id
	 * @param currpage
	 * @return
	 */
	@RequestMapping(value = Url.IncomingCheckListEntry, method = RequestMethod.GET)
	public String IncomingCheckListEntry(String userCountry, ModelMap map, int id, String currpage) {
		map.put("userCountry", userCountry);
		map.put("id", id);
		map.put("currpage", currpage);
		Jndcar car = canadaNeedService.CustomsDeclarationOutbound(id);
		ValidationUtils.notNull(car, "该车辆不存在，请核实！");
		map.put("car", car);
		if (StringUtils.isNotBlank(car.getOutcolor())) {
			map.put("list1", car.getOutcolor().split("/"));
		}
		if (StringUtils.isNotBlank(car.getIncolor())) {
			String arr[] = car.getIncolor().split("/");
			map.put("list2", arr);
		}
		// if (car.getInstoreid() != null) {
		// Store stor = canadaNeedService.queryStoreNameById(car.getInstoreid());
		// map.put("stor", stor);
		// }
		Jndcontract con = canadaNeedService.jndcontractdetails(car.getContractid());
		ValidationUtils.notNull(con, "该车辆对应的合同不存在，请核实！");

		List<Store> storeLst = new ArrayList<Store>();
		if (StringUtils.isNotBlank(con.getPaytype())) {
			Store st = new Store();
			if ("1".equals(con.getPaytype())) {// 1全款
				// 选择相应地区和境外仓库
				if (con.getCountry() != null) {
					st.setType(con.getCountry().toString());
					storeLst.addAll(canadaNeedService.storeListQuery(st));
				}
				st.setType("3");
				storeLst.addAll(canadaNeedService.storeListQuery(st));
			} else {// 2定金
				if ("1".equals(con.getSelfbuy())) {// 定金自采
					// 选择相应地区的仓库
					if (con.getCountry() != null) {
						st.setType(con.getCountry().toString());
						storeLst.addAll(canadaNeedService.storeListQuery(st));
					}
				} else if ("2".equals(con.getSelfbuy())) {// 定金代采
					// 选择境外仓库
					st.setType("3");
					storeLst.addAll(canadaNeedService.storeListQuery(st));
				}
			}
		}
		map.put("store", storeLst);
		return "IncomingCheckListEntry";
	}

	/**
	 * 加拿大入库检验单保存
	 * @param map
	 * @param jndcarcheck
	 * @param currpage
	 * @param carid
	 * @param location
	 * @param vin
	 * @param sleavefactime
	 * @param enginenum
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = Url.jndAdmissionCheckListsave, method = RequestMethod.POST)
	public String jndAdmissionCheckListsave(String canadaremarks, String selectvalue, String incolor, String seatnum, String outcolor, String Tiretype,
			String instoreid, ModelMap map, Jndcarcheck jndcarcheck, String currpage, int carid, MultipartFile location, String vin, String sleavefactime,
			String enginenum, MultipartFile siden1, MultipartFile siden2, MultipartFile siden3, MultipartFile siden4, MultipartFile siden5) throws Exception {
		canadaNeedService.jndsaveCheckTheBondedArea(canadaremarks, selectvalue, incolor, seatnum, outcolor, Tiretype, instoreid, jndcarcheck, carid, location,
				vin, sleavefactime, enginenum, siden1, siden2, siden3, siden4, siden5);
		map.put("currpage", currpage);
		/*
		 * List<Store> store = canadaNeedService.jndstore(); map.put("store", store);
		 */
		return PreEntryVehicleList(currpage, map);
	}

	/**
	 * 验证车架号是否重复
	 * @param vin
	 * @return
	 */
	@RequestMapping(value = Url.vinVerify, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> vinVerify(String vin) {
		Map<String, Object> map = new HashMap<String, Object>();
		String svin = canadaNeedService.vinVerify(vin);
		int cvin = canadaNeedService.cvinVerify(vin);
		if (svin != null || cvin > 0) {
			map.put("status", false);
		} else {
			map.put("status", true);
		}
		return map;
	}

	/**
	 * 发动机号验证
	 * @param enginenum
	 * @return
	 */
	@RequestMapping(value = Url.enginenumVerify, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> enginenumVerify(String enginenum) {
		Map<String, Object> map = new HashMap<String, Object>();
		String engine = canadaNeedService.enginenumVerify(enginenum);
		int cenginenum = canadaNeedService.cenginenumVerify(enginenum);
		if (engine != null || cenginenum > 0) {
			map.put("status", false);
		} else {
			map.put("status", true);
		}
		return map;
	}

	/**
	 * 短驳费和海运费申请页面
	 * @param map
	 * @param currpage
	 * @return
	 */
	@RequestMapping(value = Url.freightApplypage, method = RequestMethod.GET)
	public String freightApplyForpage(ModelMap map, String currpage) {
		UserDTO username = SecurityHelper.getAdminUserInfo();
		if (StringUtils.isBlank(username.getName())) {
			return "error.message.nologin";
		}
		map.put("userCountry", username.getCountry());// 登录账户国家地区
		if (username.getCountry() != null) {
			List<Store> store = canadaNeedService.userjndstore(username.getCountry());// 国外地区登录时查询相应的仓库
			map.put("store", store);
		} else {
			List<Store> store = canadaNeedService.jndstore();
			map.put("store", store);
		}
		List<jndSite> site = canadaNeedService.querysite();
		map.put("site", site);

		map.put("currpage", currpage);
		map.put("username", username.getName());
		return "freightApplyForpage";
	}

	/**
	 * 需要短驳费和海运费车辆查询
	 * @param jndcar
	 * @param start
	 * @param pageSize
	 * @return
	 * @throws ParseException 
	 */
	@RequestMapping(value = Url.freightApply, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> freightApplyFor(String userCountry, Jndcar jndcar, String sstarttime, String start, String pageSize)
			throws ParseException {
		return canadaNeedService.freightApplyFor(userCountry, jndcar, sstarttime, start, pageSize);
	}

	/**
	 * 短驳海运费用申请保存
	 * @param map
	 * @param checkval
	 * @param username
	 * @param drayage
	 * @param oceanfreight
	 * @param elsecost1
	 * @param elsecost2
	 * @return
	 */
	@RequestMapping(value = Url.freightAdd, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> freightAdd(Integer checkval, jndfreight jndfreight) {
		canadaNeedService.freightAdd(checkval, jndfreight);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", 1);
		return map;

	}

	/**
	 * 运费申请单列表页面
	 * @param map
	 * @param currpage
	 * @return
	 */
	@RequestMapping(value = Url.freightpage, method = RequestMethod.GET)
	public String freightpage(ModelMap map, String currpage) {
		map.put("currpage", currpage);
		UserDTO username = SecurityHelper.getAdminUserInfo();
		if (StringUtils.isBlank(username.getName())) {
			return "error.message.nologin";
		}
		map.put("username", username.getName());
		return "freightpage";
	}

	/**
	 * 运费申请单列表查询
	 * @param jndfreight
	 * @param start
	 * @param pageSize
	 * @return
	 */
	@RequestMapping(value = Url.freightlist, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> queryfreightpage(jndfreight jndfreight, String start, String pageSize) {
		return canadaNeedService.freightpage(jndfreight, start, pageSize);
	}

	/**
	 * 查询申请运费的车辆和查看
	 * @param map
	 * @param id
	 * @param currpage
	 * @param username
	 * @param roleid
	 * @return
	 */
	@RequestMapping(value = Url.freightCar, method = RequestMethod.GET)
	public String freightcarlook(ModelMap map, String id, String currpage, String username, String Updatefreight) {
		jndfreight jnd = canadaNeedService.queryjndfreight(Integer.parseInt(id));
		map.put("jnd", jnd);
		map.put("Updatefreight", Updatefreight);
		map.put("id", id);
		map.put("currpage", currpage);
		map.put("username", SecurityHelper.getAdminUserInfo().getName());
		return "freightCar";
	}

	/**
	 * 查询申请的车辆
	 * @param id
	 * @return
	 */
	@RequestMapping(value = Url.freightCarList, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> freightCarList(int id) {
		return canadaNeedService.freightCarList(id);
	}

	/**
	 * 运费审核通过保存
	 * @param id
	 * @return
	 */
	@RequestMapping(value = Url.freightCarupdate, method = RequestMethod.POST)
	public @ResponseBody Object freightCarUpdate(int id, String currpage, String username) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", false);
		try {
			canadaNeedService.freightCarUpdate(id, username);
			map.put("status", true);
		} catch (PortalAppUnCheckedException e) {
			// TODO: handle exception
			map.put("msg", e.getMessage());
		} catch (Exception e) {
			// TODO: handle exception
			map.put("msg", e.getMessage());
		}
		return map;
	}

	/**
	 * 审核不通过保存
	 * @param id
	 * @param currpage
	 * @param reason
	 * @return
	 */
	@RequestMapping(value = Url.freightCarNoPass, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> freightCarNoPass(int id, String currpage, String reason, String username) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", false);
		try {
			canadaNeedService.freightCarNoPass(id, reason, username);
			map.put("status", true);
		} catch (PortalAppUnCheckedException e) {
			// TODO: handle exception
			map.put("msg", e.getMessage());
		} catch (Exception e) {
			// TODO: handle exception
			map.put("msg", e.getMessage());
		}
		return map;
	}

	/**
	 * 加拿大查看修改申请运费页面
	 * @param map
	 * @param currpage
	 * @return
	 */
	@RequestMapping(value = Url.freightApplyUpdatepage, method = RequestMethod.GET)
	public String freightApplyUpdatepage(ModelMap map, String currpage) {
		map.put("currpage", currpage);
		UserDTO username = SecurityHelper.getAdminUserInfo();
		if (StringUtils.isBlank(username.getName())) {
			return "error.message.nologin";
		}
		map.put("userCountry", username.getCountry());// 登录账户国家地区
		map.put("username", username.getName());
		return "freightApplyUpdatepage";
	}

	/**
	 * 加拿大查看修改申请运费页面查询
	 * @param jndfreight
	 * @param start
	 * @param pageSize
	 * @return
	 */
	@RequestMapping(value = Url.freightApplyUpdatelist, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> freightApplyUpdatelist(String userCountry, jndfreight jndfreight, String start, String pageSize) {
		return canadaNeedService.freightApplyUpdatelist(userCountry, jndfreight, start, pageSize);
	}

	/**
	 * 撤销运费申请
	 * @param id
	 * @return
	 */
	@RequestMapping(value = Url.repealfreight, method = RequestMethod.POST)
	public @ResponseBody Object repealfreight(int id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", false);
		try {
			canadaNeedService.repealfreight(id);
			map.put("status", true);
		} catch (PortalAppUnCheckedException e) {
			// TODO: handle exception
			map.put("msg", e.getMessage());
		} catch (Exception e) {
			// TODO: handle exception
			map.put("msg", e.getMessage());
		}
		return map;
	}

	/**
	 * 删除运费申请
	 * @param id
	 * @return
	 */
	@RequestMapping(value = Url.deletefreight, method = RequestMethod.POST)
	public @ResponseBody Object deletefreight(int id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", false);
		try {
			canadaNeedService.deletefreight(id);
			map.put("status", true);
		} catch (PortalAppUnCheckedException e) {
			// TODO: handle exception
			map.put("msg", e.getMessage());
		} catch (Exception e) {
			// TODO: handle exception
			map.put("msg", e.getMessage());
		}
		return map;
	}

	/**
	 * 到运费申请单修改页面
	 * @param map
	 * @param id
	 * @param Updatefreight
	 * @return
	 */
	@RequestMapping(value = Url.Updatefreight, method = RequestMethod.GET)
	public String Updatefreight(ModelMap map, String id, String Updatefreight, String currpage) {
		jndfreight jnd = canadaNeedService.Updatefreight(Integer.parseInt(id));
		map.put("jnd", jnd);
		map.put("Updatefreight", Updatefreight);
		map.put("id", id);
		map.put("currpage", currpage);
		return "Updatefreight";
	}

	/**
	 * 运费修改保存
	 * @param jndfreight
	 * @param currpage
	 * @return
	 */
	@RequestMapping(value = Url.updatefreightsave, method = RequestMethod.POST)
	public @ResponseBody Object updatefreightsave(jndfreight jndfreight, String currpage) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", false);
		try {
			canadaNeedService.updatefreightsave(jndfreight);
			map.put("status", true);
		} catch (PortalAppUnCheckedException e) {
			// TODO: handle exception
			map.put("msg", e.getMessage());
		} catch (Exception e) {
			// TODO: handle exception
			map.put("msg", e.getMessage());
		}
		return map;
	}

	/**
	 * 车辆详情
	 * @param map
	 * @param id
	 * @param currpage
	 * @return
	 */
	@RequestMapping(value = Url.jndcardetails, method = RequestMethod.GET)
	public String jndcardetails(ModelMap map, int id, String currpage, String examine, String freightid, String username, String Updatefreight) {
		Jndcar car = canadaNeedService.CustomsDeclarationOutbound(id);
		Jndfile f = new Jndfile();
		f.setCarid(id);
		List<Jndfile> file = canadaNeedService.fileDownloadAndUpload(f);
		map.put("file", file);
		map.put("car", car);
		Store stor = canadaNeedService.queryStoreNameById(car.getInstoreid());
		map.put("stor", stor);
		map.put("currpage", currpage);
		map.put("examine", examine);
		map.put("Updatefreight", Updatefreight);
		map.put("username", username);// 审核人姓名
		map.put("freightid", freightid);// 运费申请单id
		return "jndcardetails";
	}

	/**
	 * 加拿大仓库入中国资产库
	 * @param dto
	 * @param map
	 * @param currpage
	 * @param carid
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = Url.jndcartypein, method = RequestMethod.POST)
	public String jndcartypein(String iden11, String iden22, String iden33, String iden44, String iden55, CarTypeinDto dto, ModelMap map, String currpage,
			String carid) throws IOException {
		canadaNeedService.saveCarTypein(iden11, iden22, iden33, iden44, iden55, dto, carid);
		List<Store> store = storeMapper.jndstore();
		map.put("store", store);
		map.put("currpage", currpage);
		return "BondedWarehouseEntryList";
	}

	/**
	 * 加拿大仓库待入库 （入中国资产库之前 如果资料不齐  可以进入待入库状态）
	 * @param dto
	 * @param map
	 * @param currpage
	 * @param carid
	 * @return
	 * @throws IOException
	 * by liliang 2018/9/3
	 */
	@RequestMapping(value = Url.jndtempsavecar, method = RequestMethod.POST)
	public String jndtempsavecar(CarTypeinDto dto, ModelMap map, String carid) throws IOException {
		canadaNeedService.tempsaveCar(dto, carid);

		List<Store> storeLst = assetRepositoryService.queryAllStore();
		List<Shop> shopLst = canadaNeedService.queryAllShop();
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
		map.put("store", shopStoreLst);
		return "tempsavecarList";
	}

	/**
	 * 到 待入中国库列表页面(入中国库之前因材料不齐)
	 * @param map
	 * @param currpage
	 * @return
	 */
	@RequestMapping(value = Url.tempsavecarListPage, method = RequestMethod.GET)
	public String tempsavecarListPage(ModelMap map, String currpage) {
		List<Store> storeLst = assetRepositoryService.queryAllStore();
		List<Shop> shopLst = canadaNeedService.queryAllShop();
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
		map.put("store", shopStoreLst);
		return "tempsavecarList";
	}

	/**
	 * 待入中国库列表查询
	 * @param jndcar
	 * @param start
	 * @param pageSize
	 * @return
	 * @throws ParseException 
	 */
	@RequestMapping(value = Url.tempsavecarList, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> tempsavecarList(Jndcar jndcar, String start, String pageSize, String leavefactime1) throws ParseException {
		return canadaNeedService.tempsavecarList(jndcar, start, pageSize, leavefactime1);
	}

	/**
	 * 
	 * <p>到商城需求单审核页</p>
	 * @param map
	 * @param currpage
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.mallNeedAudit, method = RequestMethod.GET)
	public String mallNeedAudit(ModelMap map, String currpage) {
		map.put("currpage", currpage);
		return "jndneed/mallneedAuditLst";
	}

	/**
	 * 
	 * <p>商城需求单审核保存</p>
	 * @param result json格式字符串
	 * @param id 需求单id
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.mallNeedAuditSave, method = RequestMethod.POST)
	@ResponseBody
	public Object mallNeedAuditSave(String result, Integer id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", false);
		try {
			canadaNeedService.mallNeedAuditSave(result, id);
			map.put("status", true);
		} catch (PortalAppUnCheckedException e) {
			// TODO: handle exception
			map.put("msg", e.getMessage());
		}
		return map;
	}
}
