package com.yyq.car.portal.ms.web.controller;

import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
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
import com.yyq.car.portal.common.mapper.biz.BizBondsmanMapper;
import com.yyq.car.portal.common.mapper.biz.BizShopTermMapper;
import com.yyq.car.portal.common.mapper.biz.BizcontractMapper;
import com.yyq.car.portal.common.mapper.biz.BizpayplanMapper;
import com.yyq.car.portal.common.mapper.biz.BizsaleborrowMapper;
import com.yyq.car.portal.common.mapper.product.CarMapper;
import com.yyq.car.portal.common.mapper.product.ShopMapper;
import com.yyq.car.portal.common.mapper.product.prosupplycarMapper;
import com.yyq.car.portal.common.mapper.product.prosupplycartableMapper;
import com.yyq.car.portal.common.model.auth.User;
import com.yyq.car.portal.common.model.biz.BizBondsman;
import com.yyq.car.portal.common.model.biz.Bizcontract;
import com.yyq.car.portal.common.model.biz.Bizpayplan;
import com.yyq.car.portal.common.model.biz.Bizrisk;
import com.yyq.car.portal.common.model.biz.Bizsaleborrow;
import com.yyq.car.portal.common.model.product.Car;
import com.yyq.car.portal.common.model.product.Shop;
import com.yyq.car.portal.common.model.product.procarcase;
import com.yyq.car.portal.common.model.product.prosupplycar;
import com.yyq.car.portal.common.model.product.prosupplycartable;
import com.yyq.car.portal.common.service.security.SecurityHelper;
import com.yyq.car.portal.ms.app.service.BrandAndModelService;
import com.yyq.car.portal.ms.app.service.ClientService;
import com.yyq.car.portal.ms.app.service.SellContractService;
import com.yyq.car.portal.ms.app.service.ShopService;
import com.yyq.car.portal.ms.web.constant.Url;


@Controller
public class SellContractController {

	@Autowired
	private SellContractService sellContractService;
	@Autowired
	private BizsaleborrowMapper bizsaleborrowMapper;
	@Autowired
	private BizpayplanMapper bizpayplanMapper;
	@Autowired
	private BizcontractMapper bizcontractMapper;
	@Autowired
	private BizBondsmanMapper bizBondsmanMapper;
	@Autowired
	private ShopService shopService;
	@Autowired
	private CarMapper carMapper;
	@Autowired
	private ShopMapper shopMapper;
	@Autowired
	private prosupplycarMapper prosupplycarMapper;
	@Autowired
	private prosupplycartableMapper prosupplycartableMapper;
	@Autowired
	private BizShopTermMapper bizshoptermMapper;

	@Autowired
	private ClientService clientService;
	@Autowired
	private BrandAndModelService brandAndModelService;
	/**
	 * 配车移库详情页面
	 * @author xhl
	 * @param map
	 * @param currpage
	 * @return
	 *2018年9月27日下午3:26:24
	 *
	 */
	@RequestMapping(value = Url.moveLibraryListDetailsPage, method = RequestMethod.GET)
	public String moveLibraryListDetailsPage(ModelMap map,String currpage){
		map.put("currpage", currpage);
		return "addleasebackcontract/moveLibraryListDetails";
	}
	@RequestMapping(value = Url.moveLibraryListDetails, method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> moveLibraryListDetails(String brand ,String model,String version ,String vin,String name,String status, String start, String pageSize) {
			return sellContractService.moveLibraryListDetails(brand,model,version,vin,name,status, start, pageSize);
	}
	@RequestMapping(value = Url.fselectcar, method = RequestMethod.GET)
	public String fselectcar(String currpage,Integer id,ModelMap map,Integer type){
		Bizcontract bizcontract=bizcontractMapper.selectByPrimaryKey(id);
		map.put("co", bizcontract);
		map.put("currpage", currpage);
		String a1 = bizcontract.getSalecontract();// 销售合同
		String a2 = bizcontract.getDownposbill();// 定金pos单
		String a3 = bizcontract.getReportbill();// 报价单
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
		if(type==1){
			return "contractselectcarpage";
		}
		return "contractvin";
		
	}
	/**
	 * 金融合同选车列表页面
	 * @param map
	 * @param currpage
	 * @return
	 */
	@RequestMapping(value = Url.financialselectcar, method = RequestMethod.GET)
	public String financialselectcar(ModelMap map,String currpage){
		
		map.put("currpage", currpage);
		return "financialselectcar";
	}
	/**
	 * 详情车看
	 * @param id
	 * @param currpage
	 * @param map
	 * @return
	 */
	@RequestMapping(value = Url.contractdetails, method = RequestMethod.GET)
	public String  contractdetails(Integer id,String currpage,ModelMap map){
		Bizcontract co=clientService.getcontractbyid(id);
		map.put("co", co);
		map.put("currpage", currpage);
		return "contractdetails";
		
	}
	
	/**
	 * 售后回租合同撤销与编辑列表
	 * @param filecode
	 * @param name
	 * @param bname
	 * @param workType
	 * @param identify
	 * @param start
	 * @param pageSize
	 * @param type
	 * @return
	 */
	@RequestMapping(value = Url.financialcontractslist, method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> financialcontractslist(String filecode, String name, String bname, String workType, String identify, String start, String pageSize,Integer type) {
			return sellContractService.financialcontractslist(filecode,name,bname,workType,identify, start, pageSize,type);
	}
	
	/**
	 * 金融合同添加列表页面
	 * @param type
	 * @param map
	 * @param currpage 
	 * @return
	 */
	@RequestMapping(value = Url.financialcontracts, method = RequestMethod.GET)
	public String financialcontracts(Integer type, ModelMap map, String currpage) {
		User user=SecurityHelper.getAdminUserInfo();
		map.put("loginid", user.getId());
		map.put("type", type);
		map.put("currpage", currpage);
		if (type==1) {
			return "financialcontracts";//金融合同列表
		}
		return "quoteofInsurance";//保险报价列表
		
	}
	/**
	 * 结算保存通过
	 * @param balance
	 * @param id
	 * @param loginid
	 * @param totalreceiveprice
	 * @return
	 */
	@RequestMapping(value = Url.bizcontractbalance, method = RequestMethod.POST)
	@ResponseBody
	public Object bizcontractbalance(BigDecimal balance, Integer id, Integer loginid, BigDecimal totalreceiveprice) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", false);
		try {
			sellContractService.bizcontractbalance(balance, loginid, id, totalreceiveprice);
			map.put("status", true);
		} catch (Exception e) {
			map.put("msg", e.getMessage());
		}
		return map;
	}

	/**
	 * 结算
	 * @param id
	 * @param loginid
	 * @param map
	 * @param currpage
	 * @return
	 */
	@RequestMapping(value = Url.settleaccounts, method = RequestMethod.GET)
	public String settleaccounts(Integer id, Integer loginid, ModelMap map, String currpage) {
		map.put("loginid", loginid);
		Bizcontract con = bizcontractMapper.selectByPrimaryKey(id);
		map.put("con", con);
		map.put("currpage", currpage);
		BigDecimal money4 = BigDecimal.ZERO;// 合同保险总额
		if (con.getInsurance() != null) {
			money4 = money4.add(con.getInsurance());
		}
		if (con.getCinsurance() != null) {
			money4 = money4.add(con.getCinsurance());
		}
		map.put("money4", money4);
		map.put("plateprice", con.getPlateprice());
		map.put("delayprice", con.getDelayprice());
		map.put("decorateprice", con.getDecorateprice());
		map.put("id", id);
		if (("2").equals(con.getFinance())) {// 全款
			BigDecimal money = BigDecimal.ZERO;// 实到金额
			BigDecimal money1 = BigDecimal.ZERO;// 应到金额
			money = money.add(con.getRealdownpay()).add(con.getRealfinalpay());// 实到定金加实到尾款
			money1 = money1.add(con.getSaleprice());
			if (con.getInsurancesure() != null) {// 报价保险总额
				money1 = money1.add(con.getInsurancesure());
			}
			/*if (con.getCardamageinsurance()!=null) {
				money1 = money1.add(con.getCardamageinsurance());//报价车损险
			}*/
			if (con.getQualityprice1() != null) {// 报价质保
				money1 = money1.add(con.getQualityprice1());
			}
			if (con.getDecorateprice() != null) {// 合同装潢
				money1 = money1.add(con.getDecorateprice());
			}
			if (con.getDelayprice() != null) {// 合同延保费用
				money1 = money1.add(con.getDelayprice());
			}
			if (con.getPlateprice() != null) {// 合同上牌费
				money1 = money1.add(con.getPlateprice());
			}
			if (con.getPurchasetax()!=null) {//购置税
				money1 = money1.add(con.getPurchasetax());
			}
			map.put("money", money);
			map.put("money1", money1);
		} else {// 金融
			Bizsaleborrow bizsaleborrow = new Bizsaleborrow();
			bizsaleborrow.setContractid(con.getId());
			List<Bizsaleborrow> biz = bizsaleborrowMapper.selectByCriteria(bizsaleborrow);
			map.put("leaseprice", biz.get(0).getLeaseprice());
		
			map.put("money7", con.getRepairmoney());//补额
			
			map.put("money5", con.getRealdownpay());
			map.put("money6", con.getFinancerealdownpay());
		}
		return "settleaccounts";
	}
	/**
	 * 材料出库通过
	 * @param bizcontract
	 * @param loginid
	 * @return
	 */
	@RequestMapping(value = Url.MaterialOutboundpass, method = RequestMethod.POST)
	@ResponseBody
	public Object MaterialOutboundpass(Bizcontract bizcontract, Integer loginid) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", false);
		try {
			sellContractService.MaterialOutboundpass(bizcontract, loginid);
			map.put("status", true);
		} catch (Exception e) {
			map.put("msg", e.getMessage());
		}
		return map;

	}

	/**
	 * 到材料出库页面
	 * @param id
	 * @param loginid
	 * @param map
	 * @param currpage
	 * @return
	 */
	@RequestMapping(value = Url.MaterialOutbound, method = RequestMethod.GET)
	public String MaterialOutbound(Integer id, Integer loginid, ModelMap map, String currpage) {
		map.put("loginid", loginid);
		Bizcontract con = bizcontractMapper.selectByPrimaryKey(id);
		map.put("con", con);
		map.put("id", id);
		map.put("currpage", currpage);
		return "MaterialOutbound";
	}

	/**
	 * 金融定金审核通过
	 * @param id
	 * @param loginid
	 * @param financerealdownpay
	 * @return
	 */
	@RequestMapping(value = Url.downpaypass, method = RequestMethod.POST)
	@ResponseBody
	public Object downpaypass(Integer id, Integer loginid, BigDecimal financerealdownpay, BigDecimal repairmoney) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", false);
		try {
			sellContractService.downpaypass(id, loginid, financerealdownpay, repairmoney);
			map.put("status", true);
		} catch (Exception e) {
			map.put("msg", e.getMessage());
		}
		return map;
	}

	/**
	 * 全款回款确定通过
	 * @param id
	 * @param loginid
	 * @param realfinalpay
	 * @return
	 */
	@RequestMapping(value = Url.totalpaymentpass, method = RequestMethod.POST)
	@ResponseBody
	public Object totalpaymentpass(Integer id, Integer loginid, BigDecimal realfinalpay, BigDecimal finalpay) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", false);
		try {
			sellContractService.totalpaymentpass(id, loginid, realfinalpay, finalpay);
			map.put("status", true);
		} catch (Exception e) {
			map.put("msg", e.getMessage());
		}
		return map;
	}

	/**
	 *全款回款确定页面type=1 金融首付款 type=2
	 * @param id
	 * @param loginid
	 * @param map
	 * @return
	 */
	@RequestMapping(value = Url.fullpaymentsure, method = RequestMethod.GET)
	public String fullpaymentsure(Integer id, Integer loginid, ModelMap map, String currpage, Integer type) {
		map.put("loginid", loginid);
		Bizcontract con = bizcontractMapper.selectByPrimaryKey(id);
		map.put("con", con);
		map.put("currpage", currpage);
		map.put("id", id);
		if (type == 1) {// 全款回款确定页面type=1
			BigDecimal money = BigDecimal.ZERO;// 车价尾款
			BigDecimal money2 = BigDecimal.ZERO;// 计算出的实到尾款
			BigDecimal money3 = BigDecimal.ZERO;// 合同保险总额
			money2 = con.getSaleprice().subtract(con.getRealdownpay());// 车价尾款
			money = money.add(money2);
			if (con.getInsurance() != null) {// 合同签订时交强险
				money = money.add(con.getInsurance());
				money3=money3.add(con.getInsurance());
			}
			if (con.getCinsurance() != null) {// 合同签订时的商业险
				money = money.add(con.getCinsurance());
				money3=money3.add(con.getCinsurance());
			}
			if (con.getPlateprice() != null) {// 上牌费
				money = money.add(con.getPlateprice());
			}
			if (con.getDecorateprice() != null) {// 装潢费
				money = money.add(con.getDecorateprice());
			}
			if (con.getQualityprice() != null) {// 质保费
				money = money.add(con.getQualityprice());
			}
			map.put("money2", money2);
			map.put("money", money);
			map.put("money3", money3);

			return "fullpaymentsure";
		} else {
			Bizsaleborrow bizsaleborrow = new Bizsaleborrow();
			bizsaleborrow.setContractid(con.getId());
			List<Bizsaleborrow> biz = bizsaleborrowMapper.selectByCriteria(bizsaleborrow);
			List<Bizrisk> risk=sellContractService.selsectmissmoney(con.getId());
			BigDecimal money4 = (biz.get(0).getLeaseprice()).multiply(new BigDecimal(0.025));
			if (con.getInsurancesure() != null) {
				money4 = money4.add(con.getInsurancesure());//保险报价总和
			}
			if (con.getQualityprice1() != null) {
				money4 = money4.add(con.getQualityprice1());//保险报价质保
			}
			if (con.getCardamageinsurance()!=null) {
				money4 = money4.add(con.getCardamageinsurance());//保险报价车损险
			}
			map.put("missmoney", risk.get(0).getMissmoney());
			money4 = money4.add(risk.get(0).getMissmoney());//风控缺额
			map.put("leaseprice", biz.get(0).getLeaseprice());
			map.put("downpayment", money4.setScale(2, BigDecimal.ROUND_HALF_UP));//多余的保留两位小数，先不改
			return "financialDownPayment";
		}
	}

	/**
	 * 定金到账审核页面
	 * @param currpage
	 * @param map
	 * @return
	 */
	@RequestMapping(value = Url.bizcontractfinancepage, method = RequestMethod.GET)
	public String bizcontractfinance(String currpage, ModelMap map) {
		map.put("currpage", currpage);
		UserDTO user = SecurityHelper.getAdminUserInfo();
		map.put("loginid", user.getId());
		return "bizcontractfinancepage";

	}

	/**
	 * 合同全款回款/金融首付/结算 查询
	 * @param map
	 * @param filecode
	 * @param name
	 * @param bname
	 * @param workType
	 * @param identify
	 * @param start
	 * @param pageSize
	 * @param type
	 * @return
	 */
	@RequestMapping(value = Url.bizcontractfinancelist, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> bizcontractquery(ModelMap map, String filecode, String name, String bname,
			String workType, String identify, String start, String pageSize, String type) {
		Map<String, Object> returnMap = sellContractService.contractquery(filecode, name, bname, workType, identify,
				start, pageSize, type);
		return returnMap;
	}

	/**
	 * 验车不通过解绑销售的车辆
	 * @param id
	 * @param loginid
	 * @param refundcause
	 * @return
	 */
	@RequestMapping(value = Url.paycarnopass, method = RequestMethod.POST)
	@ResponseBody
	public Object paycarnopass(Integer id, Integer loginid, String refundcause) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", false);
		try {
			sellContractService.paycarnopass(id, loginid, refundcause);
			map.put("status", true);
		} catch (Exception e) {
			map.put("msg", e.getMessage());
		}
		return map;
	}

	/**
	 * 验车通过
	 * @param id
	 * @param loginid
	 * @return
	 */
	@RequestMapping(value = Url.paycarpass, method = RequestMethod.POST)
	@ResponseBody
	public Object paycarpass(Integer id, Integer loginid, String vin) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", false);
		try {
			sellContractService.paycarpass(id, loginid, vin);
			map.put("status", true);
		} catch (Exception e) {
			map.put("msg", e.getMessage());
		}
		return map;
	}

	/**
	 * 到交车验车页面
	 * @param loginid
	 * @param currpage
	 * @param id
	 * @param map
	 * @return
	 */
	@RequestMapping(value = Url.paycarandtest, method = RequestMethod.GET)
	public String paycarandtest(Integer loginid, String currpage, Integer id, ModelMap map) {
		Bizcontract con = bizcontractMapper.selectByPrimaryKey(id);
		map.put("loginid", loginid);
		map.put("con", con);
		map.put("currpage", currpage);
		map.put("id", id);
		return "paycarandtest";

	}

	/**
	 * 门店确认到店
	 * @param id
	 * @return
	 */
	@RequestMapping(value = Url.shopconfirmed, method = RequestMethod.POST)
	@ResponseBody
	public Object shopconfirmed(Integer id, Integer loginid) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", false);
		try {
			sellContractService.shopconfirmed(id, loginid);
			map.put("status", true);
		} catch (Exception e) {
			map.put("msg", e.getMessage());
		}
		return map;

	}

	/**
	 * 门店确认列表页面
	 * @param map
	 * @param currpage
	 * @return
	 */
	@RequestMapping(value = Url.shopconfirmedlistpage, method = RequestMethod.GET)
	public String shopconfirmedlistpage(ModelMap map, String currpage) {
		map.put("currpage", currpage);
		UserDTO user = SecurityHelper.getAdminUserInfo();
		map.put("shopid", user.getShop());
		map.put("loginid", user.getId());
		return "shopconfirmedlistpage";

	}

	/**
	 * 门店确认到店列表查询
	 * @param prosupplycartable
	 * @param start
	 * @param pageSize
	 * @return
	 */
	@RequestMapping(value = Url.shopconfirmedlist, method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> shopconfirmedlist(prosupplycartable prosupplycartable, String start, String pageSize) {
		prosupplycartable.setStatus(60);// /临时数据 用来查询物流确认到店的数据和门店确认到店的数据
		UserDTO user = SecurityHelper.getAdminUserInfo();
		return sellContractService.shopconfirmedlist(user,prosupplycartable, start, pageSize);

	}

	/**
	 * 物流确认到店
	 * @param id
	 * @return
	 */
	@RequestMapping(value = Url.moveaffirm, method = RequestMethod.POST)
	@ResponseBody
	public Object moveaffirm(Integer id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", false);
		try {
			sellContractService.moveaffirm(id);
			map.put("status", true);
		} catch (Exception e) {
			map.put("msg", e.getMessage());
		}
		return map;

	}

	/**
	 * 配车物流开始
	 * @param id
	 * @param loginid
	 * @return
	 */
	@RequestMapping(value = Url.movestart, method = RequestMethod.POST)
	@ResponseBody
	public Object movestart(Integer id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", false);
		try {
			sellContractService.movestart(id);
			map.put("status", true);
		} catch (Exception e) {
			map.put("msg", e.getMessage());
		}
		return map;

	}

	/**
	 * 配车超额审核不通过
	 * @param id
	 * @param loginid
	 * @return
	 */
	@RequestMapping(value = Url.movelibraryauditnopass, method = RequestMethod.POST)
	public @ResponseBody Object movelibraryauditnopass(Integer id, Integer loginid, String nopasscause) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", false);
		try {
			sellContractService.movelibraryauditnopass(id, loginid, nopasscause);
			map.put("status", true);
		} catch (Exception e) {
			map.put("msg", e.getMessage());
		}
		return map;
	}
	/**
	 * 配车超额审核通过
	 * @param id
	 * @param loginid
	 * @return
	 */
	@RequestMapping(value = Url.movelibraryauditpass, method = RequestMethod.POST)
	public @ResponseBody Object movelibraryauditpass(Integer id, Integer loginid) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", false);
		try {
			sellContractService.movelibraryauditpass(id, loginid);
			map.put("status", true);
		} catch (Exception e) {
			map.put("msg", e.getMessage());
		}
		return map;
	}
	/**
	 * 配车审核列表查询
	 * @param prosupplycartable
	 * @param start
	 * @param pageSize
	 * @return
	 */
	@RequestMapping(value = Url.movelibraryauditlist, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> movelibraryauditlist(prosupplycartable prosupplycartable, String start,
			String pageSize) {
		prosupplycartable.setStatus(1);
		return sellContractService.supplycartablelist(prosupplycartable, start, pageSize);
	}
	/**
	 * 到审核超额配车列表页面
	 * @param currpage
	 * @param map
	 * @return
	 */
	@RequestMapping(value = Url.movelibraryauditlistpage, method = RequestMethod.GET)
	public String movelibraryauditlist(String currpage, ModelMap map) {
		map.put("currpage", currpage);
		UserDTO user = SecurityHelper.getAdminUserInfo();
		map.put("loginid", user.getId());
		return "movelibraryauditlistpage";
	}
	/**
	 *  配车单详情查看
	 * @param currpage
	 * @param id
	 * @param map
	 * @param type 1 是配车超额审核查看返回 2 配车发起运输查看返回 3配车超额审核 4发起物流 5物流确认到店 6门店确认到店返回 7门店确认到店
	 * @return
	 */
	@RequestMapping(value = Url.supplycartabledetails, method = RequestMethod.GET)
	public String supplycartabledetails(String currpage, Integer id, ModelMap map, Integer type, String loginid) {
		prosupplycar car = new prosupplycar();
		car.setSupplycartableid(id);
		List<prosupplycar> supplycar = prosupplycarMapper.selectByCriteria(car);
		prosupplycartable supplycartable = prosupplycartableMapper.selectByPrimaryKey(id);
		Shop shop = shopMapper.selectByPrimaryKey(supplycartable.getShopid());
		map.put("supplycartable", supplycartable);
		map.put("id", id);
		map.put("shop", shop);
		map.put("currpage", currpage);
		map.put("loginid", loginid);
		map.put("type", type);
		map.put("type1", shop.getType());
		map.put("type2", shop.getFinanceType());
		map.put("supplycar", supplycar);
		return "supplycartabledetails";
	}

	/**
	 * 配车单列表查看
	 * @param prosupplycartable
	 * @param start
	 * @param pageSize
	 * @return
	 */
	@RequestMapping(value = Url.supplycartablelist, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> supplycartablelist(prosupplycartable prosupplycartable, String start,
			String pageSize) {
		if (prosupplycartable.getStatus() == null) {
			prosupplycartable.setStatus(66);
		}
		return sellContractService.supplycartablelist(prosupplycartable, start, pageSize);
	}
	/**
	 * 配车申请移库列表页面
	 * @param map
	 * @param currpage
	 * @return
	 */
	@RequestMapping(value = Url.movelibrarylist, method = RequestMethod.GET)
	public String movelibrarylist(ModelMap map, String currpage) {
		map.put("currpage", currpage);
		return "movelibrarylist";
	}

	/**
	 * 配车单保存
	 * @param protocolurlfiles
	 * @param signingdate
	 * @param duedate
	 * @param checkval
	 * @param id
	 * @return
	 */
	@RequestMapping(value = Url.supplycarsave, method = RequestMethod.POST)
	@ResponseBody
	public Object supplycarsave(BigDecimal money, MultipartFile protocolurlfiles, String name, String signingdate,
			String duedate, String[] checkval, Integer id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", false);
		try {
			sellContractService.supplycarsave(money, protocolurlfiles, name, signingdate, duedate, checkval, id);
			map.put("status", true);
		} catch (Exception e) {
			map.put("msg", e.getMessage());
		}
		return map;
	}

	/**
	 * 到配车单页面
	 * @param checkval
	 * @param id
	 * @param map
	 * @return
	 */
	@RequestMapping(value = Url.supplycardetailedlist, method = RequestMethod.GET)
	public String supplycardetailedlist(String[] checkval, Integer id, ModelMap map) {
		map.put("id", id);
		String checkvals = "0";
		BigDecimal amount = BigDecimal.ZERO;// 门店额度
		BigDecimal nowamount = BigDecimal.ZERO;// 门店现有额度
		BigDecimal a = BigDecimal.ZERO;
		Shop shop = shopMapper.selectByPrimaryKey(id);
		map.put("address", shop.getAddress());
		List<Map<String, Object>> listmap = new ArrayList<Map<String, Object>>();
		for (int i = 0; i < checkval.length; i++) {
			Car car = carMapper.selectByPrimaryKey(Integer.parseInt(checkval[i]));
			Map<String, Object> maps = new HashMap<String, Object>();
			if (car.getSaleStatus()==null) {//未销售绑定的车才计算入现有额度
				if (car.getSettlementprice()!=null) {
					nowamount = nowamount.add(car.getSettlementprice());// 配的车
				}else{
					nowamount = nowamount.add(car.getTypeinsettleprice());// 配的车
				}
			}
			if (car.getSettlementprice()==null) {//结算价为空时就用录入的结算价
				car.setSettlementprice(car.getTypeinsettleprice());
			}
			maps.put("car", car);
			listmap.add(maps);
			checkvals += "," + checkval[i];
		}
		if (("2").equals(shop.getType())) {// 城市合伙人门店
			if (shop.getFinanceType() == 1) {// 样车金融
				amount = shop.getCredit().multiply(new BigDecimal("10000"));// 样车金融额度
				List<prosupplycar> pro = prosupplycarMapper.selectsupplycar(shop.getId());// 根据门店查询配车表中还没有到店的车
				if (pro.size() > 0) {
					for (prosupplycar prosupplycar : pro) {
						nowamount = nowamount.add(prosupplycar.getSettlementprice());
					}
				}
				List<Car> car = carMapper.shopcar(shop.getId());// 根据门店查询门店可售未销售绑定的车还有已经配到别的门店还没移库的车
				if (car.size() > 0) {
					for (Car car2 : car) {
						nowamount = nowamount.add(car2.getContractprice());// 加入门店的展销协议价格
					}
				}
				a = nowamount.subtract(amount);
				if (a.doubleValue() > 0) {
					map.put("a", a);
				} else {
					map.put("a", 0);
				}
			}
		}
		if (("0").equals(shop.getType()) || ("1").equals(shop.getType())) {// 自营和虚拟门店
			map.put("a", 0);
		}
		map.put("checkval", checkvals);
		map.put("type", shop.getType());
		map.put("financeype", shop.getFinanceType());
		map.put("listmap", listmap);
		return "supplycardetailedlist";
	}

	/**
	 * 配车时查看是否超额
	 * @param checkval
	 * @param id
	 * @return
	 */
	@RequestMapping(value = Url.comparisonTotaMoney, method = RequestMethod.POST)
	@ResponseBody
	public Object comparisonTotaMoney(String[] checkval, Integer id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", false);
		try {
			sellContractService.comparisonTotaMoney(checkval, id);
			map.put("status", true);
		} catch (PortalAppUnCheckedException e) {
			map.put("msg", e.getMessage());
		} catch (Exception e) {
			map.put("msg", e.getMessage());
		}
		return map;
	}

	/**
	 * 配车时查询所有合伙人门店
	 * @param me
	 * @param shop
	 * @param start
	 * @param pageSize
	 * @param map
	 */
	@RequestMapping(value = Url.supplycarshoplst, method = RequestMethod.POST)
	public void supplycarshoplst(String me, Shop shop, String start, String pageSize, ModelMap map) {
		if (StringUtils.isNotBlank(me)) {
			UserDTO user = SecurityHelper.getAdminUserInfo();
			if (user != null) {
				String shopId = user.getShop();
				if (StringUtils.isNotBlank(shopId)) {
					shop.setId(Integer.parseInt(shopId));
				}
			}
		}
		List<Shop> lst = shopService.supplycarshoplst(shop, start, pageSize);
		int count = shopService.countsupplycarshoplst(shop);
		map.put("result", lst);
		map.put("total", count);
	}

	/**
	 * 库表配车进入所有门店
	 * @return
	 */
	@RequestMapping(value = Url.supplycarshop, method = RequestMethod.GET)
	public String supplycarshop(String checkval, ModelMap map) {
		map.put("checkval", checkval);
		return "supplycarshop";
	}

	/**
	 * 车况保存
	 * @param carcase
	 * @param id
	 * @return
	 */
	@RequestMapping(value = Url.carcasesave, method = RequestMethod.POST)
	@ResponseBody
	public Object carcasesave(String carcase, Integer id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", false);
		try {
			sellContractService.carcasesave(carcase, id);
			map.put("status", true);
		} catch (PortalAppUnCheckedException e) {
			map.put("msg", e.getMessage());
		} catch (Exception e) {
			map.put("msg", e.getMessage());
		}
		return map;
	}

	/**
	 * 添加车况页面
	 * @param id
	 * @param map
	 * @param type 1查看 2 添加
	 * @return
	 */
	@RequestMapping(value = Url.addcarcase, method = RequestMethod.GET)
	public String addcarcase(Integer id, ModelMap map, Integer type) {
		map.put("id", id);
		map.put("type", type);
		if (type == 1) {// 查看车况
			List<procarcase> carcase = sellContractService.carcasedetails(id);
			map.put("carcase", carcase);
		}
		return "addcarcase";

	}

	/**
	 * 到库表页面
	 * @param currpage
	 * @param map
	 * @return
	 */
	@RequestMapping(value = Url.carlibrarylistpage, method = RequestMethod.GET)
	public String carlibrarylistpage(String currpage, ModelMap map) {
		map.put("currpage", currpage);
		return "carlibrarylistpage";

	}

	/**
	 * 库表查询列表
	 * @param start
	 * @param pageSize
	 * @param brand
	 * @param model
	 * @param version
	 * @param type
	 * @param name
	 * @param vin
	 * @return
	 */
	@RequestMapping(value = Url.carlibrarylist, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> carlibrarylist(Integer start, Integer pageSize, String brand,
			String model, String version, String type, String name, String vin) {
		Map<String, Object> paraMap = new HashMap<String, Object>();
		paraMap.put("start", (start - 1) * pageSize);
		paraMap.put("pageSize", pageSize);
		if (StringUtils.isNotBlank(vin)) {
			paraMap.put("vin", vin);
		}
		if (StringUtils.isNotBlank(brand)) {
			paraMap.put("brand", brand);
		}
		if (StringUtils.isNotBlank(model)) {
			paraMap.put("model", model);
		}
		if (StringUtils.isNotBlank(version)) {
			paraMap.put("version", version);
		}
		if (StringUtils.isNotBlank(name)) {
			paraMap.put("name", name);
		}
		if (StringUtils.isNotBlank(type)) {
			paraMap.put("type", type);
		}
		return sellContractService.carlibrarylist(paraMap);
	}

	/**
	 * 合同保险添加保存
	 * @param bizcontract
	 * @return
	 */
	@RequestMapping(value = Url.insurancesave, method = RequestMethod.POST)
	public @ResponseBody Object addinsurancesave(Bizcontract bizcontract,String  insurancetime) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", false);
		try {
			sellContractService.addinsurancesave(bizcontract,insurancetime);
			map.put("status", true);
		} catch (Exception e) {
			map.put("msg", e.getMessage());
		}
		return map;
	}

	/**
	 * 到合同保险添加页面
	 * @param map
	 * @param id
	 * @param currpage
	 * @return
	 */
	@RequestMapping(value = Url.addinsurance, method = RequestMethod.GET)
	public String addinsuranceUrl(ModelMap map, Integer id, String currpage) {
		Bizcontract biz = bizcontractMapper.selectByPrimaryKey(id);
		map.put("biz", biz);
		map.put("currpage", currpage);
		return "addinsurance";

	}

	/**
	 * 融资租赁合同修改保存
	 * @param saleborrowfile3
	 * @param saleborrowfile4
	 * @param sightime1
	 * @param id
	 * @param bizsaleborrow
	 * @param bondsman
	 * @param bmaddress
	 * @param bmrunaddress
	 * @param bmfaxes
	 * @param bmphone
	 * @param bondsman2
	 * @param bmaddress2
	 * @param bmrunaddress2
	 * @param bmfaxes2
	 * @param bmphone2
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping(value = Url.updateleasebacksave, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> updateleasebacksave(MultipartFile pledgefile3,MultipartFile pledgefile4,MultipartFile saleborrowfile3,
			MultipartFile saleborrowfile4, String sightime1, Integer id, Bizsaleborrow bizsaleborrow,
			String[] bondsman, String[] bmaddress, String[] bmrunaddress, String[] bmfaxes, String[] bmphone,
			String[] bondsman2, String[] bmaddress2, String[] bmrunaddress2, String[] bmfaxes2, String[] bmphone2)
			throws ParseException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", false);
		try {
			sellContractService.updateleasebacksave(pledgefile3,pledgefile4,saleborrowfile3, saleborrowfile4, sightime1, id, bizsaleborrow,
					bondsman, bmaddress, bmrunaddress, bmfaxes, bmphone, bondsman2, bmaddress, bmrunaddress2, bmfaxes2,
					bmphone2);
			map.put("status", true);
		} catch (Exception e) {
			map.put("msg", e.getMessage());
		}
		return map;
	}

	/**
	 * 金融合同审核门店撤销
	 * @param id
	 * @return
	 */
	@RequestMapping(value = Url.repealleaseback, method = RequestMethod.POST)
	public @ResponseBody Object repealleaseback(Integer id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", false);
		try {
			sellContractService.repealleaseback(id);
			map.put("status", true);
		} catch (Exception e) {
			// TODO: handle exception
			map.put("msg", e.getMessage());
		}
		return map;

	}

	/**
	 * 金融合同审核不通过
	 * @param id
	 * @param loginId
	 * @return
	 */
	@RequestMapping(value = Url.saleborrownopass, method = RequestMethod.POST)
	public @ResponseBody Object saleborrownopass(Integer id, Integer loginId, String nopass) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", false);
		try {
			sellContractService.saleborrownopass(id, loginId, nopass);
			map.put("status", true);
		} catch (Exception e) {
			// TODO: handle exception
			map.put("msg", e.getMessage());
		}
		return map;
	}

	/**
	 * 金融合同审核通过
	 * @param id
	 * @param loginId
	 * @return
	 */
	@RequestMapping(value = Url.saleborrowpass, method = RequestMethod.POST)
	public @ResponseBody Object saleborrowpass(Integer id, Integer loginId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", false);
		try {
			sellContractService.saleborrowpass(id, loginId);
			map.put("status", true);
		} catch (PortalAppUnCheckedException e) {
			map.put("msg", e.getMessage());
		} catch (Exception e) {
			// TODO: handle exception
			map.put("msg", e.getMessage());
		}
		return map;

	}

	/**
	 * 到融资租赁售后回租列表页面
	 * @param currpage
	 * @param map
	 * @return
	 */
	@RequestMapping(value = Url.leasebackListpage, method = RequestMethod.GET)
	public String leasebackpage(String currpage, ModelMap map,String type) {
		map.put("currpage", currpage);
		map.put("type", type);
		UserDTO username = SecurityHelper.getAdminUserInfo();
		map.put("loginId", username.getId());// 登录账户id
		map.put("shopid", username.getShop());// 登录人门店id
		return "leasebackListpage";
	}

	/**
	 * 融资租赁售后回租列表查询 
	 * @param bizsaleborrow
	 * @param start
	 * @param pageSize
	 * @return
	 */
	@RequestMapping(value = Url.leasebacklist, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> leasebacklist(Bizsaleborrow bizsaleborrow, String start, String pageSize) {
		Map<String, Object> resultMap = sellContractService.leasebacklist(bizsaleborrow, start, pageSize);
		return resultMap;
	}
	/**
	 * 售后回租列表查询  门店部查看
	 * @param bizsaleborrow
	 * @param start
	 * @param pageSize
	 * @return
	 */
	@RequestMapping(value = Url.leasebackshopgrouplist, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> leasebackshopgrouplist(Bizsaleborrow bizsaleborrow, String start, String pageSize) {
		UserDTO user = SecurityHelper.getAdminUserInfo();
		Map<String, Object> resultMap = sellContractService.leasebackshopgrouplist(user,bizsaleborrow, start, pageSize);
		return resultMap;
	}
	/**
	 * 融资租赁售后回租详情查看
	 * @param id
	 * @param currpage
	 * @return
	 */
	@RequestMapping(value = Url.leasebackdetails, method = RequestMethod.GET)
	public String leasebackdetails(ModelMap map, Integer id, String currpage, String loginId, String audit,
			String update,Integer type) {
		Bizsaleborrow biz=null;
		if (type==1) {//添加页面查看
			Bizsaleborrow biz1=new Bizsaleborrow();
			biz1.setContractid(id);
			List<Bizsaleborrow> biz2=bizsaleborrowMapper.selectByCriteria(biz1);
			biz=biz2.get(0);
		}else {
			biz=bizsaleborrowMapper.selectByPrimaryKey(id);
		}
		List<Bizpayplan> plan1 = bizpayplanMapper.selectByleasebackid1(biz.getId());
		List<Bizpayplan> plan2 = bizpayplanMapper.selectByleasebackid2(biz.getId());
		BizBondsman bizbond = new BizBondsman();
		bizbond.setSaleborrowid(id);
		bizbond.setType("1");
		List<BizBondsman> bizb1 = bizBondsmanMapper.selectByCriteria(bizbond);
		bizbond.setType("2");
		List<BizBondsman> bizb2 = bizBondsmanMapper.selectByCriteria(bizbond);
		BigDecimal first = BigDecimal.ZERO;
		BigDecimal second = BigDecimal.ZERO;
		BigDecimal thirdly = BigDecimal.ZERO;
		BigDecimal fourthly = BigDecimal.ZERO;
		for (int i = 0; i < plan1.size(); i++) {
			Bizpayplan plan = plan1.get(i);
			first = first.add(plan.getPrice());
		}
		for (int i = 0; i < plan2.size(); i++) {
			Bizpayplan plan = plan2.get(i);
			if (i < 12) {
				second = second.add(plan.getPrice());
			} else if (i > 11 && i < 24) {
				thirdly = thirdly.add(plan.getPrice());
			} else if (i > 23 && i < 36) {
				fourthly = fourthly.add(plan.getPrice());
			}
		}
		Bizcontract bizc = bizcontractMapper.selectByPrimaryKey(biz.getContractid());
		map.put("bizb1", bizb1);
		map.put("bizb2", bizb2);
		map.put("biz", biz);
		map.put("first", first);
		map.put("second", second);
		map.put("thirdly", thirdly);
		map.put("fourthly", fourthly);
		map.put("bizc", bizc);
		map.put("plan1", plan1);
		map.put("audit", audit);
		map.put("plan2", plan2);
		map.put("id", id);
		map.put("type", type);	
		map.put("currpage", currpage);
		map.put("loginId", loginId);
		if (StringUtils.isNotBlank(update)) {
			return "updateleaseback";
		} else {
			return "leasebackdetails";
		}
	}

	/**
	 * 到融资租赁合同添加页面
	 * @param map
	 * @param id
	 * @return
	 */
	@RequestMapping(value = Url.addleasebackcontract, method = RequestMethod.GET)
	public String addleasebackcontract(ModelMap map, Integer id, String currpage) {
		Bizcontract bizc = sellContractService.selectByPrimaryKey(id);
		List<Bizrisk> bizr = sellContractService.selectByBizcontractid(id);
		/* brandAndModelService.*/
		map.put("bizr", bizr.get(0).getAproveprice());
		map.put("bizc", bizc);
		map.put("id", id);
		map.put("currpage", currpage);
		return "addleasebackcontractpage";

	}

	/**
	 *  融资租赁物合同保存
	 * @param saleborrowfile3
	 * @param saleborrowfile4
	 * @param sightime1
	 * @param cid
	 * @param bizsaleborrow
	 * @param bondsman
	 * @param bmaddress
	 * @param bmrunaddress
	 * @param bmfaxes
	 * @param bmphone
	 * @param bondsman2
	 * @param bmaddress2
	 * @param bmrunaddress2
	 * @param bmfaxes2
	 * @param bmphone2
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping(value = Url.addleasebacksave, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> addleasebacksave(MultipartFile pledgefile11,MultipartFile pledgefile22,MultipartFile saleborrowfile3,
			MultipartFile saleborrowfile4, String sightime1, String cid, Bizsaleborrow bizsaleborrow,
			String[] bondsman, String[] bmaddress, String[] bmrunaddress, String[] bmfaxes, String[] bmphone,
			String[] bondsman2, String[] bmaddress2, String[] bmrunaddress2, String[] bmfaxes2, String[] bmphone2)
			throws ParseException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", false);
		try {
			sellContractService.addleasebacksave(pledgefile11,pledgefile22,saleborrowfile3, saleborrowfile4, sightime1, cid, bizsaleborrow,
					bondsman, bmaddress, bmrunaddress, bmfaxes, bmphone, bondsman2, bmaddress, bmrunaddress2, bmfaxes2,
					bmphone2);
			map.put("status", true);
		} catch (Exception e) {
			map.put("msg", e.getMessage());
		}
		return map;
	}

	/**
	 *计算每月还款日期和金额
	 * @param sightime1
	 * @param leaseprice
	 * @param type
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping(value = Url.calculate1, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> calculate1(String sightime1, String leaseprice, Integer type,String additionalinterestrate)
			throws ParseException {
		Map<String, Object> map1 = new HashMap<String, Object>();
		Double leaseprice1 = Double.parseDouble(leaseprice);
		DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		Calendar now = Calendar.getInstance();
		now.setTime(format1.parse(sightime1));
		now.add(Calendar.DATE, -1);
		int day = now.get(Calendar.DAY_OF_MONTH);
		int num = 0;
		if (type == 1) {
			num = 12;
		}
		if (type == 2) {
			now.add(Calendar.YEAR, 1);
			num = 36;
		}
		if (type == 1) {// 第一年的租赁物货款
			BigDecimal additionalmoney=BigDecimal.ZERO;//额外利率金额
			if (StringUtils.isNotBlank(additionalinterestrate)) {
			 additionalmoney=(new BigDecimal(leaseprice1*Double.parseDouble(additionalinterestrate)/100)).setScale(2,
						BigDecimal.ROUND_HALF_UP);
			}
			Double leaseprice2 = (new BigDecimal(leaseprice1 / 48 + leaseprice1 * 0.04 * 4 / 48 + leaseprice1 * 0.018
					* 4)).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();// 第一个月的租金
			Double leaseprice3 = (new BigDecimal(leaseprice1 / 48 + leaseprice1 * 0.04 * 4 / 48)).setScale(2,
					BigDecimal.ROUND_HALF_UP).doubleValue();// 第二到十二个每月
			Double totalleaseprice =  (new BigDecimal(leaseprice2 + leaseprice3 * 11).setScale(2,BigDecimal.ROUND_HALF_UP).doubleValue());// 第一年总租金
			map1.put("leaseprice2", leaseprice2+additionalmoney.doubleValue());
			map1.put("leaseprice3", leaseprice3);
			map1.put("totalleaseprice1", totalleaseprice);
		}
		if (type == 2) {// 第一年的租赁物货款
			Double leaseprice2 = (new BigDecimal(leaseprice1 * 3 / 4 / 36 + leaseprice1 * 3 / 4 * 0.02 * 3 / 36
					+ leaseprice1 * 3 / 4 * 0.02 * 3)).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();// 第十三月个月的租金
			Double leaseprice3 = (new BigDecimal(leaseprice1 * 3 / 4 / 36 + leaseprice1 * 3 / 4 * 0.02 * 3 / 36))
					.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();// 第十四到四十八个每月
			Double totalleaseprice2 = (new BigDecimal(leaseprice2 + leaseprice3 * 11)).setScale(2,
					BigDecimal.ROUND_HALF_UP).doubleValue();// 第二年总租金
			map1.put("leaseprice2", leaseprice2);// 第十三月个月的租金
			map1.put("leaseprice3", leaseprice3);// 第十四到四十八个每月
			map1.put("totalleaseprice2", totalleaseprice2);// 第二年总租金
			map1.put("totalleaseprice3", (new BigDecimal(leaseprice3 * 12)).setScale(2, BigDecimal.ROUND_HALF_UP)
					.doubleValue());// 第三年和第四年总租金
		}
		map1.put("time2",sellContractService.getday(day, now, num, format1));
		return map1;
	}
	
}
