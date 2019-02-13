/*******************************************************************************
 * Project   : car-ms
 * Class Name: com.yyq.car.portal.ms.web.controller.NeedReportController
 * Created By: wangzh 
 * Created on: 2017年9月26日 上午11:14:33
 * Copyright © 2013-2014 YYQ All rights reserved.
 ******************************************************************************/
package com.yyq.car.portal.ms.web.controller;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
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
import org.ufa.log.Logger;
import org.ufa.log.LoggerFactory;

import com.yyq.car.portal.common.dto.UserDTO;
import com.yyq.car.portal.common.model.cif.NeedBill;
import com.yyq.car.portal.common.model.cif.Offerbill;
import com.yyq.car.portal.common.model.cif.Purchasebill;
import com.yyq.car.portal.common.model.comm.Abrand;
import com.yyq.car.portal.common.model.comm.Areaprice;
import com.yyq.car.portal.common.model.comm.Weblocation;
import com.yyq.car.portal.common.service.security.SecurityHelper;
import com.yyq.car.portal.ms.app.service.BrandAndModelService;
import com.yyq.car.portal.ms.app.service.NeedReportService;
import com.yyq.car.portal.ms.web.command.NeedbillSaveCmd;
import com.yyq.car.portal.ms.web.constant.Url;


/**
 * <P>需求报价controller</P>
 * @author wangzh
 */
@Controller
public class NeedReportController {

	private static final Logger log = LoggerFactory.getLogger(NeedReportController.class);

	@Autowired
	private NeedReportService needReportService;

	@Autowired
	private BrandAndModelService brandAndModelService;

	/**
	 * <p>到需求列表首页</p>
	 * @param map
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.needbilllist, method = RequestMethod.GET)
	public String needbilllistIndex(ModelMap map, String currpage) {
		map.put("currpage", currpage);
		return "needbilllistview";
	}

	/**
	 * <p>需求列表查询</p>
	 * @param type
	 * @param createtime
	 * @param remaintime 单位小时 可带小数点
	 * @param brand 模糊查询
	 * @param model
	 * @param version
	 * @param start
	 * @param pageSize
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.needbilllistQuery, method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> needbilllistIndex(String type, String createtime, String remaintime, String brand, String model, String version, String start,
			String pageSize) {
		Map<String, Object> parmMap = new HashMap<String, Object>();
		if (StringUtils.isNotBlank(type)) {
			parmMap.put("type", type);
		}
		if (StringUtils.isNotBlank(createtime)) {
			parmMap.put("createtime", createtime);
		}
		if (StringUtils.isNotBlank(remaintime)) {
			try {
				float float1 = Float.parseFloat(remaintime.trim().replaceAll(" ", ""));
				parmMap.put("remaintime", float1 * 3600);
			} catch (Exception e) {
				log.debug("剩余时间[\"{}\"]格式错误", remaintime);
			}
		}
		if (StringUtils.isNotBlank(brand)) {
			parmMap.put("brand", brand);
		}
		if (StringUtils.isNotBlank(model)) {
			parmMap.put("model", model);
		}
		if (StringUtils.isNotBlank(version)) {
			parmMap.put("version", version);
		}
		int ps = Integer.parseInt(pageSize);
		parmMap.put("start", (Integer.parseInt(start) - 1) * ps);
		parmMap.put("pageSize", ps);
		List<Map<String, Object>> lst = needReportService.queryNeedbilllst(parmMap);
		int total = needReportService.countNeedbill(parmMap);
		Map<String, Object> retMap = new HashMap<String, Object>();
		retMap.put("result", lst);
		retMap.put("total", total);
		return retMap;
	}

	/**
	 * <p>需求单点击处理、查看</p>
	 * @param map
	 * @param id
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.needbldeal, method = RequestMethod.GET)
	public String needbldeal(ModelMap map, Integer id, String currpage) {
		map.put("currpage", currpage);
		NeedBill nb = needReportService.queryNeedbillById(id);
		map.put("need", nb);
		String status = nb.getStatus();
		if (StringUtils.isBlank(status)) {// 未被处理过 进行自动匹配 编辑处理
			Purchasebill pb = new Purchasebill();
			pb.setBrand(nb.getBrand());
			pb.setModel(nb.getModel());
			pb.setVersion(nb.getVersion());
			pb.setStatus("1");// 有效
			// 根据品牌型号版别全字符，状态为有效匹配车
			List<Purchasebill> lst = needReportService.queryPurchaseBillLstByCriteria(pb);
			if (lst.size() > 0) {
				Purchasebill first = lst.get(0);// 就取第一个好了 若添加重复的车（品牌型号版别一样）那就覆盖吧
				// 继续分析
				// 分析first
				String have = first.getNowhave();// 现车or期货
				Date vtime = first.getValidtime();
				Date taketime = nb.getTakecartime();// 提车时间
				if ("1".equals(have)) {// 现车
					if (taketime != null) {
						if (vtime != null) {
							Calendar c = Calendar.getInstance();
							c.setTime(taketime);
							c.add(Calendar.DATE, 1);
							if (vtime.compareTo(c.getTime()) > 0) {
								map.put("purchase", first);
							}
						} else {
							map.put("purchase", first);
						}
					} else {
						map.put("purchase", first);
					}

				} else {// 期货
					Date fDate = first.getFuturetime();
					if (taketime != null) {
						if (fDate != null && vtime != null) {
							Calendar c = Calendar.getInstance();
							c.setTime(taketime);
							c.add(Calendar.DATE, 1);
							if (vtime.compareTo(c.getTime()) > 0 && taketime.compareTo(fDate) >= 0) {
								map.put("purchase", first);
							}
						}
					}
					// 有效期要大于等于提车时间
					else {
						map.put("purchase", first);
					}
				}
			}
			// 区域定价
			String city = nb.getCity();
			String[] cis = city.split(" ");
			if (cis.length == 2) {
				Areaprice apri = new Areaprice();
				apri.setProvince(cis[0]);
				apri.setCity(cis[1]);
				apri.setBrand(nb.getBrand());
				apri.setModel(nb.getModel());
				apri.setVersion(nb.getVersion());
				List<Areaprice> apLst = needReportService.queryAreapriceByCriteria(apri);
				if (apLst.size() > 0) {
					map.put("areaprice", apLst.get(0));
				}
			}
			return "needdealview";
		} else if (nb.getBuybillid() != null) {// 查看
			Purchasebill pb = needReportService.queryPurchaseBillById(nb.getBuybillid());// 采购单
			map.put("purchase", pb);
			// 查询报价单
			Offerbill offerbill = new Offerbill();
			offerbill.setNeedid(id);
			Offerbill ob = needReportService.queryOfferbillByCriteria(offerbill);
			if (ob != null) {
				map.put("ob", ob);
			}
			return "needoverview";
		}
		return "error.message";
	}

	/**
	 * <p>需求处理提交</p>
	 * @param map
	 * @param cmd
	 * @param currpage
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.needblsave, method = RequestMethod.POST)
	public String needblsave(ModelMap map, NeedbillSaveCmd cmd, String currpage) {
		map.put("currpage", currpage);

		NeedBill nBill = needReportService.queryNeedbillById(cmd.getNeedid());

		Offerbill ob = new Offerbill();
		ob.setNeedid(cmd.getNeedid());
		ob.setCreatetime(new Date());
		if (StringUtils.isNotBlank(nBill.getCity())) {
			ob.setDistrict(nBill.getCity());
		}
		if (StringUtils.isNotBlank(cmd.getAreaprice())) {
			ob.setAreaprice(new BigDecimal(cmd.getAreaprice()));
		}
		if (StringUtils.isNotBlank(cmd.getValidtime())) {
			ob.setValidtime(cmd.getValidtime());
		}
		// 采购单的冗余字段
		if (StringUtils.isNotBlank(cmd.getBodyprice())) {
			ob.setBodyprice(new BigDecimal(cmd.getBodyprice()));
		}
		if (StringUtils.isNotBlank(cmd.getTpprice())) {
			ob.setTpprice(new BigDecimal(cmd.getTpprice()));
		}
		if (StringUtils.isNotBlank(cmd.getCnsystem())) {
			ob.setCnsystem(new BigDecimal(cmd.getCnsystem()));
		}
		if (StringUtils.isNotBlank(cmd.getDecorateprice())) {
			ob.setDecorateprice(new BigDecimal(cmd.getDecorateprice()));
		}
		if (StringUtils.isNotBlank(cmd.getMiddleman())) {
			ob.setMiddleman(cmd.getMiddleman());
		}
		if ("2".equals(cmd.getMiddleman()) && StringUtils.isNotBlank(cmd.getChannelprice())) {
			ob.setChannelprice(new BigDecimal(cmd.getChannelprice()));
		}
		// 计算全款=========>
		BigDecimal allprice = BigDecimal.ZERO;
		if (StringUtils.isNotBlank(cmd.getBodyprice())) {
			allprice = allprice.add(new BigDecimal(cmd.getBodyprice()));
		}
		if (StringUtils.isNotBlank(cmd.getTpprice())) {
			allprice = allprice.add(new BigDecimal(cmd.getTpprice()));
		}

		if (StringUtils.isNotBlank(cmd.getCnsystem())) {
			allprice = allprice.add(new BigDecimal(cmd.getCnsystem()));
		}
		if (StringUtils.isNotBlank(cmd.getDecorateprice())) {
			allprice = allprice.add(new BigDecimal(cmd.getDecorateprice()));
		}

		if (StringUtils.isNotBlank(cmd.getChannelprice())) {
			allprice = allprice.add(new BigDecimal(cmd.getChannelprice()));
		}
		// 计算利润
		/*
		 * 成本价小于20w +1k 20w<成本价<30w +1.5k 30w<成本价<50w +2k 50w<成本价80w +3k 80w<成本价<100w +4k 100w<成本价
		 * +5k
		 */
		if (allprice.compareTo(new BigDecimal(200000)) < 0) {
			allprice = allprice.add(new BigDecimal(1000));
		} else if (allprice.compareTo(new BigDecimal(300000)) < 0) {
			allprice = allprice.add(new BigDecimal(1500));
		} else if (allprice.compareTo(new BigDecimal(500000)) < 0) {
			allprice = allprice.add(new BigDecimal(2000));
		} else if (allprice.compareTo(new BigDecimal(800000)) < 0) {
			allprice = allprice.add(new BigDecimal(3000));
		} else if (allprice.compareTo(new BigDecimal(1000000)) < 0) {
			allprice = allprice.add(new BigDecimal(4000));
		} else {
			allprice = allprice.add(new BigDecimal(5000));
		}

		// +区域定价
		if (StringUtils.isNotBlank(cmd.getAreaprice())) {
			allprice = allprice.add(new BigDecimal(cmd.getAreaprice()));
		}
		ob.setAllprice(allprice);
		// 全款计算结束<========

		// 计算金融=======>
		// 金融本金=销售价+销售价/11.7
		BigDecimal bj = allprice.add(allprice.divide(new BigDecimal(11.7), 10, BigDecimal.ROUND_HALF_DOWN));
		// 第一个月月供
		BigDecimal bjdivide48 = bj.divide(new BigDecimal(48), 10, BigDecimal.ROUND_HALF_DOWN);
		BigDecimal bjremain = bj.multiply(new BigDecimal(0.04 * 4 / 48));
		BigDecimal yg1 = bj.multiply(new BigDecimal(0.018 * 4)).add(bjdivide48).add(bjremain);// 第1个月月供
		BigDecimal yg2 = bjdivide48.add(bjremain);// 第2个月月供
		BigDecimal bj3d4 = bj.multiply(new BigDecimal(0.75));// 四分之三的本金
		BigDecimal yg13 = bj3d4.multiply(new BigDecimal(0.02 * 3 * 37 / 36)).add(bj3d4.divide(new BigDecimal(36), 10, BigDecimal.ROUND_HALF_DOWN));// 第13个月月供
		BigDecimal yg14 = bj3d4.divide(new BigDecimal(36), 10, BigDecimal.ROUND_HALF_DOWN).add(bj3d4.multiply(new BigDecimal(0.02 * 3 / 36)));// 第14个月月供
		ob.setFirstpay(yg1.setScale(2, BigDecimal.ROUND_HALF_DOWN));
		ob.setSecondpay(yg2.setScale(2, BigDecimal.ROUND_HALF_DOWN));
		ob.setThirteenthpay(yg13.setScale(2, BigDecimal.ROUND_HALF_DOWN));
		ob.setFourteenthpay(yg14.setScale(2, BigDecimal.ROUND_HALF_DOWN));
		ob.setFinpri(bj);// 金融本金
		ob.setRemainprice(bj3d4.setScale(2, BigDecimal.ROUND_HALF_DOWN));
		// 金融计算结束<======
		// if (cmd.getBuybillid()!=null) {//此需求单有对应的采购单，不需要新增一个采购，只保存到报价单
		//
		// }
		// else {//没有
		needReportService.saveNeeddeal(cmd, nBill, ob);
		return needbilllistIndex(map, currpage);
		// }
	}

	/**
	 * 到需求添加页
	 * @param map
	 * @return
	 */
	@RequestMapping(value = Url.addneedbillpage, method = RequestMethod.GET)
	public String addneedbllpage(ModelMap map) {
		List<Abrand> brand = brandAndModelService.queryBrandinitial();
		map.put("brand", brand);
		List<Weblocation> weblocations = needReportService.weblocation(new Weblocation());
		map.put("weblocations", weblocations);
		return "addneedbill";
	}

	/**
	 * <p>需求单添加</p>
	 * @param map
	 * @param needBill
	 * @param province
	 * @param citys
	 * @param time
	 * @return
	 * @throws ParseException
	 * @author wangzh
	 */
	@RequestMapping(value = Url.addneedbill, method = RequestMethod.POST)
	public String addneedbllpage(ModelMap map, NeedBill needBill, String province, String citys, String time) throws ParseException {
		needBill.setCity(province + " " + citys);
		if (StringUtils.isNotBlank(time)) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date datef = sdf.parse(time);
			needBill.setTakecartime(datef);
		}
		Calendar c = Calendar.getInstance();
		needBill.setCreatetime(c.getTime());
		c.add(Calendar.DATE, 1);// 创建时间加一天
		needBill.setEndtime(c.getTime());
		UserDTO user = SecurityHelper.getAdminUserInfo();
		if (user != null) {
			String shop = user.getShop();
			if (StringUtils.isNotBlank(shop)) {// 有归属的门店 则是门店角色
				needBill.setType("1");// 门店
			} else {
				needBill.setType("2");// 总部
			}
		} else {
			return "error.message.nologin";
		}
		// 若姓名手机号都没填那么认为是姓名手机号置为后台人员的登陆信息
		if (StringUtils.isBlank(needBill.getName()) && StringUtils.isBlank(needBill.getTel()) && user != null) {
			needBill.setName(user.getName());
			needBill.setTel(user.getLoginName());
		} else {

		}
		needReportService.addneed(needBill);
		map.put("message", "保存成功！");
		return addneedbllpage(map);
	}

	// 采购===============>
	/**
	 * 到采购列表页
	 * @return
	 */
	@RequestMapping(value = Url.queryPurchaseBillPage, method = RequestMethod.GET)
	public String queryPurchaseBillPage() {
		return "queryPurchaseBillPage";
	}

	/**
	 * 采购列表查询
	 * @param purchaseBill
	 * @param start
	 * @param pageSize
	 * @return
	 * @throws ParseException 
	 */
	@RequestMapping(value = Url.queryPurchaseBill, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> queryPurchaseBill(Purchasebill purchaseBill, String vtime, String start, String pageSize) throws ParseException {
		if (StringUtils.isNotBlank(vtime)) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date datef = sdf.parse(vtime);
			purchaseBill.setValidtime(datef);
		}
		Map<String, Object> map = needReportService.queryPurchaseBill(purchaseBill, start, pageSize);
		return map;
	}

	/**
	 * 到采购添加页
	 * @param map
	 * @return
	 */
	@RequestMapping(value = Url.addPurchaseBillPage, method = RequestMethod.GET)
	public String addPurchaseBillPage(ModelMap map) {
		List<Abrand> brand = brandAndModelService.queryBrandinitial();
		map.put("brand", brand);
		return "addPurchaseBillPage";
	}

	/**
	 * 添加采购
	 * @param purchasebill
	 * @return
	 * @throws ParseException 
	 */
	@RequestMapping(value = Url.addPurchaseBill, method = RequestMethod.POST)
	public String addPurchaseBill(Purchasebill purchasebill, String f, String v, ModelMap map) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");// 小写的mm表示的是分钟
		if (StringUtils.isNotBlank(f)) {
			Date datef = sdf.parse(f);
			purchasebill.setFuturetime(datef);
		}
		if (StringUtils.isNotBlank(v)) {
			Date datev = sdf.parse(v);
			purchasebill.setValidtime(datev);// 采购报价有效期
			Calendar c = Calendar.getInstance();
			c.setTime(datev);
			c.add(Calendar.DATE, -2);
			purchasebill.setOffertime(c.getTime());// 报价有效期=采购报价有效期-2天
		}
		purchasebill.setCreatetime(new Date());
		UserDTO user = SecurityHelper.getAdminUserInfo();
		if (user != null) {
			purchasebill.setCreateid(user.getId());
			purchasebill.setCreateman(user.getLoginName());
		}
		if (purchasebill.getTpprice() != null) {
			purchasebill.setTicketpoint("1");
		}
		// 计算成本价=========>
		BigDecimal allprice = BigDecimal.ZERO;
		if (purchasebill.getBodyprice() != null) {// 裸车价
			allprice = allprice.add(purchasebill.getBodyprice());
		}
		if (purchasebill.getTpprice() != null) {// 服务费票点
			allprice = allprice.add(purchasebill.getTpprice());
		}
		if (purchasebill.getCnsystem() != null) {// 中文系统费
			allprice = allprice.add(purchasebill.getCnsystem());
		}
		if (purchasebill.getChannelprice() != null) {// 渠道费
			allprice = allprice.add(purchasebill.getChannelprice());
		}
		purchasebill.setOfferprice(allprice);// 成本价

		purchasebill.setStatus("1");// 有效

		needReportService.addPurchaseBill(purchasebill);
		// return "addPurchaseBillPage";
		map.put("message", "保存成功！");
		return addPurchaseBillPage(map);
	}

	// 采购<===============

	/**
	 * 到报价单列表页面
	 * @param map
	 * @return
	 */
	@RequestMapping(value = Url.queryOfferbillpage, method = RequestMethod.GET)
	public String queryOfferbill(ModelMap map, String currpage) {
		map.put("currpage", currpage);
		return "queryOfferbillpage";
	}

	/**
	 * 报价列表查询
	 * @param createtime
	 * @param remaintime
	 * @param brand
	 * @param model
	 * @param version
	 * @param start
	 * @param pageSize
	 * @return
	 */
	@RequestMapping(value = Url.queryOfferbill, method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> queryOfferbill(String validtime, String brand, String model, String version, String name, String city, String start,
			String pageSize) {
		Map<String, Object> parmMap = new HashMap<String, Object>();
		if (StringUtils.isNotBlank(validtime)) {
			parmMap.put("validtime", validtime);
		}
		if (StringUtils.isNotBlank(brand)) {
			parmMap.put("brand", brand);
		}
		if (StringUtils.isNotBlank(name)) {
			parmMap.put("name", name);
		}
		if (StringUtils.isNotBlank(city)) {
			parmMap.put("city", city);
		}
		if (StringUtils.isNotBlank(model)) {
			parmMap.put("model", model);
		}
		if (StringUtils.isNotBlank(version)) {
			parmMap.put("version", version);
		}
		int ps = Integer.parseInt(pageSize);
		parmMap.put("start", (Integer.parseInt(start) - 1) * ps);
		parmMap.put("pageSize", ps);
		List<Map<String, Object>> lst = needReportService.queryOfferbill(parmMap);
		int total = needReportService.countOfferbill(parmMap);
		Map<String, Object> retMap = new HashMap<String, Object>();
		retMap.put("result", lst);
		retMap.put("total", total);
		return retMap;
	}

	/**
	 * <p>查询报价详情</p>
	 * @param id
	 * @param maps
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.queryOfferbilldetails, method = RequestMethod.GET)
	public String queryOfferbilldetails(int id, ModelMap maps, String currpage) {
		Purchasebill need = needReportService.queryOfferbilldetails(id);
		maps.put("need", need);
		maps.put("currpage", currpage);
		return "queryOfferbilldetails";
	}

	/**
	 * <p>根据省名称查询市</p>
	 * @param province
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.citys, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> queryVersion(String province) {
		Map<String, Object> map = new HashMap<String, Object>();
		Weblocation w = new Weblocation();
		w.setName(province);
		List<Weblocation> weblocations = needReportService.weblocation(w);
		int a = 0;
		// for (int i = 0; i < weblocations.size(); i++) {
		// a = weblocations.get(i).getId();
		// }
		if (weblocations.size() > 0) {
			a = weblocations.get(0).getId();
		}
		List<Map<String, Object>> citys = needReportService.queryCity(a);
		map.put("citys", citys);
		// System.out.println(citys);
		return map;
	}

	// @RequestMapping(value = Url.editneedbill, method = RequestMethod.GET)
	// public String toneedbilledit(ModelMap modelMap, Integer id, String edit) {
	// NeedBill need = needReportService.queryByIdNeesBill(id);
	// modelMap.put("need", need.getBrand());
	// return "editneedbill.view";
	// }

}
