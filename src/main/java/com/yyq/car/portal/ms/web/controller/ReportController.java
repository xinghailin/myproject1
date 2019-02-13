package com.yyq.car.portal.ms.web.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yyq.car.portal.common.dto.CarAveragePriceDto;
import com.yyq.car.portal.common.model.product.Shop;
import com.yyq.car.portal.ms.app.service.ReportService;
import com.yyq.car.portal.ms.web.constant.Url;
import com.yyq.car.portal.ms.web.constant.View;


/**
 * 报表控制器
 * <P>TODO</P>
 * @author mjy
 */
@Controller
public class ReportController {

	@Autowired
	private ReportService reportService;

	/**
	 * 跳转到每天卖车销售率页面
	 * <p>TODO</p>
	 * @param startTime
	 * @param endTime
	 * @param start
	 * @param pageSize
	 * @param map
	 * @return
	 * @author mjy
	 */
	@RequestMapping(value = Url.COUNTCOMR_INDEX, method = RequestMethod.GET)
	public String reportBuyers() {

		return View.COUNT_INDEX;
	}

	/**
	 * 跳转到每天卖车销售率页面后-----统计每天来店人数和买车人数，销售率
	 * <p>TODO</p>
	 * @param startTime
	 * @param endTime
	 * @param map
	 * @author mjy
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = Url.COUNTCOMR_INDEX_CAR, method = RequestMethod.GET)
	public void reportBuyer(String startTime, String endTime, ModelMap map) {
		Map m1 = new HashMap();
		m1.put("startTime", startTime);
		m1.put("endTime", endTime);
		int buysize = reportService.CountBuyCar(m1);
		int comesize = reportService.CountComeShop(m1);
		//List<Map> re = (List<Map>) new HashMap(comesize);
		//List<Map> mp = (List<Map>) new HashMap(buysize);
		List<Map> lst = new ArrayList<Map>();
		Map<String, Object> m = new HashMap();
		m.put("a", startTime + "至" + endTime);
		if (comesize != 0 && buysize != 0) {
			m.put("b", comesize);
			m.put("c", buysize);
			BigDecimal percentage = new BigDecimal((double) buysize / (double) comesize * 100);
			double percent = percentage.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
			m.put("d", percent);
			lst.add(m);
			map.put("total", 1);
			map.put("result", lst);
		} else if (comesize == 0 && buysize != 0) {
			m.put("b", 0);
			m.put("c", buysize);
			m.put("d", buysize + "/0");
			lst.add(m);
			map.put("total", 1);
			map.put("result", lst);
		} else if (buysize == 0 && comesize == 0) {
			m.put("b", 0);
			m.put("c", 0);
			m.put("d", 0);
			lst.add(m);
			map.put("total", 1);
			map.put("result", 0);
		} else if (buysize == 0 && comesize != 0) {
			m.put("b", comesize);
			m.put("c", 0);
			m.put("d", 0);
			lst.add(m);
			map.put("total", 1);
			map.put("result", lst);
		}
	}

	/**
	 * 进入统计车辆平均价页面
	 */
	@RequestMapping(value = Url.COUNTCAR_PRICE_CAR, method = RequestMethod.GET)
	public String CarPrice(ModelMap map, String shopId) {
		List<Shop> shoplist = reportService.queryshop();
		map.put("shoplist", shoplist);
		return View.COUNTCAR_PRICECAR;
	}

	@RequestMapping(value = Url.COUNT_PRICE_CAR, method = RequestMethod.POST)
	public Map<String, Object> CarPricePage(CarAveragePriceDto price, String start, String pageSize) {

		Map<String, Object> returnMap = reportService.countCarPrice(price, start, pageSize);

		return returnMap;

	}

	/**
	 * 进入转介绍成交率页面
	 * <p>TODO</p>
	 * @param startTime
	 * @param endTime
	 * @param start
	 * @param pageSize
	 * @param map
	 * @return
	 * @author mjy
	 */
	@RequestMapping(value = Url.COUNTINTRODUCE_BUYTABLE, method = RequestMethod.GET)
	public String countIntroduce() {

		return View.INTRODUCEBUY_INDEX;
	}

	/**
	 * 进入转介绍成交率页面----计算转介绍买车成交率
	 * <p>TODO</p>
	 * @param startTime
	 * @param endTime
	 * @param map
	 * @author mjy
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = Url.COUNTINTRODUCE_BUYRATIO, method = RequestMethod.GET)
	public void countIntroduceBuyRatio(String startTime, String endTime, ModelMap map) {
		Map m1 = new HashMap();
		m1.put("startTime", startTime);
		m1.put("endTime", endTime);
		int buysize = reportService.CountBuyCar(m1);
		int introducebuy = reportService.countIntroduceBuyRatio(m1);
		List<Map> lst = new ArrayList<Map>();
		Map<String, Object> ma = new HashMap();
		ma.put("time", startTime + "至" + endTime);
		if (buysize != 0 && introducebuy != 0) {
			ma.put("buysize", buysize);
			ma.put("introducebuy", introducebuy);
			BigDecimal percentage = new BigDecimal((double) introducebuy / (double) buysize * 100);
			double percent = percentage.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
			ma.put("ratio", percent + "%");
			lst.add(ma);
			map.put("total", 1);
			map.put("result", lst);
		} else if (buysize != 0 && introducebuy == 0) {
			ma.put("buysize", buysize);
			ma.put("introducebuy", 0);
			ma.put("ratio", "0");
			lst.add(ma);
			map.put("total", 1);
			map.put("result", lst);

		} else if (buysize == 0 && introducebuy == 0) {
			map.put("total", 1);
			map.put("result", 0);
		}

	}

	/**
	 * 进入热门车型成交率页面
	 * <p>TODO</p>
	 * @param startTime
	 * @param endTime
	 * @param start
	 * @param pageSize
	 * @param map
	 * @return
	 * @author mjy
	 */
	@RequestMapping(value = Url.COUNTMODEL_SELLTABLE, method = RequestMethod.GET)
	public String countmodelratio(String startTime, String endTime, String shopId, String start, String pageSize, ModelMap map) {
		List<Shop> shoplist = reportService.queryshop();
		map.put("shoplist", shoplist);
		return View.COUNTMODEL_SELLTABLE;
	}

	/**
	 * 进入热门车型成交率页面--并计算成交率
	 * <p>TODO</p>
	 * @param price
	 * @param start
	 * @param pageSize
	 * @return
	 * @author mjy
	 */
	@RequestMapping(value = Url.COUNTMODEL_SELLPAGE, method = RequestMethod.POST)
	public Map<String, Object> countmodelsellratio(CarAveragePriceDto price, String start, String pageSize) {
		Map<String, Object> returnMap = reportService.countModelSalesRatio(price, start, pageSize);
		return returnMap;

	}

	/**
	 * 进入未卖出车辆车龄页面
	 * <p>TODO</p>
	 * @param startTime
	 * @param endTime
	 * @param start
	 * @param pageSize
	 * @param map
	 * @return
	 * @author mjy
	 */
	@RequestMapping(value = Url.COUNTCAE_AVGWAREHOUSEAGE, method = RequestMethod.GET)
	public String countCar(String startTime, String endTime, String start, String pageSize, ModelMap map) {

		return View.COUNTCAE_AVGWAREHOUSEAGE;
	}

	/**
	 * 进入未卖出车辆车龄页面--计算平均车龄
	 * <p>TODO</p>
	 * @param price
	 * @param start
	 * @param pageSize
	 * @return
	 * @author mjy
	 */
	@RequestMapping(value = Url.COUNTCAR_AVGAGE, method = RequestMethod.POST)
	public Map<String, Object> countCarAvgAge(CarAveragePriceDto price, String start, String pageSize) {
		Map<String, Object> returnmap = reportService.countAvgWarehouseAge(price, start, pageSize);
		return returnmap;

	}

	/**
	 * 进入客户购车情况页面
	 * <p>TODO</p>
	 * @return
	 * @author mjy
	 */
	@RequestMapping(value = Url.COUNTBUYCAR_BUYCAR, method = RequestMethod.GET)
	public String countBuyCar() {

		return View.COUNTBUYCAR_BUYCAR;
	}

	/**
	 * 进入客户购车情况页面--并计算比例
	 * <p>TODO</p>
	 * @param startTime
	 * @param endTime
	 * @param map 
	 * @author mjy
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = Url.COUNTBUYCAR_BUYCARCASE, method = RequestMethod.GET)
	public void countbuycarcase(String startTime, String endTime, ModelMap map) {
		Map m1 = new HashMap();
		m1.put("startTime", startTime);
		m1.put("endTime", endTime);
		int comesize = reportService.CountComeShop(m1);
		int firstBuyCar = reportService.countFirstBuyCar(m1);
		int permuteCar = reportService.countPermuteCar(m1);
		int addCar = reportService.countAddCar(m1);
		int lookCar = reportService.countLookCar(m1);
		List<Map> lst = new ArrayList<Map>();
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("time", startTime + "至" + endTime);
		if (comesize != 0) {
			m.put("comesize", comesize);
			if (firstBuyCar != 0) {
				m.put("firstBuyCar", firstBuyCar);
				BigDecimal percentage = new BigDecimal((double) firstBuyCar / (double) comesize * 100);
				double firstBuyCarRatio = percentage.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
				m.put("firstBuyCarRatio", firstBuyCarRatio + "%");
			} else {
				m.put("firstBuyCar", 0);
				m.put("firstBuyCarRatio", "0%");
			}
			if (permuteCar != 0) {
				m.put("permuteCar", permuteCar);
				BigDecimal percentagee = new BigDecimal((double) permuteCar / (double) comesize * 100);
				double permuteCarRatio = percentagee.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
				m.put("permuteCarRatio", permuteCarRatio + "%");
			} else {
				m.put("permuteCar", 0);
				m.put("permuteCarRatio", "0%");
			}
			if (addCar != 0) {
				m.put("addCar", addCar);
				BigDecimal percentageee = new BigDecimal((double) addCar / (double) comesize * 100);
				double addCarRatio = percentageee.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
				m.put("addCarRatio", addCarRatio + "%");
			} else {
				m.put("addCar", 0);
				m.put("addCarRatio", "0%");
			}
			if (lookCar != 0) {
				m.put("lookCar", lookCar);
				BigDecimal lookCarRati = new BigDecimal((double) lookCar / (double) comesize * 100);
				double lookCarRatio = lookCarRati.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
				m.put("lookCarRatio", lookCarRatio + "%");
			} else {
				m.put("lookCar", 0);
				m.put("lookCarRatio", "0%");
			}
			lst.add(m);
			map.put("total", 1);
			map.put("result", lst);

		} else if (comesize == 0) {
			map.put("total", 1);
			map.put("result", 0);

		}

	}

	/**
	 * 进入客户车辆用途页面
	 * <p>TODO</p>
	 * @return
	 * @author mjy
	 */
	@RequestMapping(value = Url.COUNTBUYCARPURPOSE_BUYCAR, method = RequestMethod.GET)
	public String countPurposeCar() {

		return View.COUNTBUYCARPURPOSE_BUYCAR;
	}

	/**
	 * 进入客户车辆用途页面--并计算比率
	 * <p>TODO</p>
	 * @param startTime
	 * @param endTime
	 * @param map
	 * @author mjy
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = Url.COUNTBUYCAR_BUYCARPURPOSE, method = RequestMethod.GET)
	public void countbuycarpurpose(String startTime, String endTime, ModelMap map) {
		Map m = new HashMap();
		m.put("startTime", startTime);
		m.put("endTime", endTime);
		int comesize = reportService.CountComeShop(m);
		int personageBuyCar = reportService.countPersonageBuyCar(m);
		int firmBuyCar = reportService.countFirmBuyCar(m);
		List<Map> lst = new ArrayList<Map>();
		Map<String, Object> ma = new HashMap<String, Object>();
		ma.put("time", startTime + "至" + endTime);
		if (comesize != 0 && personageBuyCar != 0 && firmBuyCar != 0) {
			ma.put("comesize", comesize);
			ma.put("personagebuycar", personageBuyCar);
			ma.put("firmbuycar", firmBuyCar);
			BigDecimal personagebuycar = new BigDecimal((double) personageBuyCar / (double) comesize * 100);
			double personagebuycarRatio = personagebuycar.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
			ma.put("personagebuycarRatio", personagebuycarRatio + "%");
			BigDecimal firmBuyCarr = new BigDecimal((double) firmBuyCar / (double) comesize * 100);
			double firmbuycarRatio = firmBuyCarr.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
			ma.put("firmbuycarRatio", firmbuycarRatio + "%");
			lst.add(ma);
			map.put("total", 1);
			map.put("result", lst);
		} else if (comesize == 0) {
			map.put("total", 1);
			map.put("result", 0);
		} else if (comesize != 0 && personageBuyCar == 0 && firmBuyCar != 0) {
			ma.put("comesize", comesize);
			ma.put("personagebuycar", 0);
			ma.put("firmbuycar", firmBuyCar);
			ma.put("personagebuycarRatio", "0%");
			BigDecimal firmBuyCarr = new BigDecimal((double) firmBuyCar / (double) comesize * 100);
			double firmbuycarRatio = firmBuyCarr.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
			ma.put("firmbuycarRatio", firmbuycarRatio + "%");
			lst.add(ma);
			map.put("total", 1);
			map.put("result", lst);
		} else if (comesize != 0 && personageBuyCar != 0 && firmBuyCar == 0) {
			ma.put("comesize", comesize);
			ma.put("personagebuycar", personageBuyCar);
			ma.put("firmbuycar", 0);
			BigDecimal personagebuycar = new BigDecimal((double) personageBuyCar / (double) comesize * 100);
			double personagebuycarRatio = personagebuycar.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
			ma.put("personagebuycarRatio", personagebuycarRatio + "%");
			ma.put("firmbuycarRatio", "0%");
			lst.add(ma);
			map.put("total", 1);
			map.put("result", lst);
		}

	}

	/**
	 *进入进店客户等级比率页面
	 * <p>TODO</p>
	 * @return
	 * @author mjy
	 */
	@RequestMapping(value = Url.COUNTBUYCARGRADE_BUYCAR, method = RequestMethod.GET)
	public String countbuycar() {

		return View.COUNTBUYCARGRADE_BUYCAR;
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = Url.COUNTBUYCAR_BUYCARGRADE, method = RequestMethod.GET)
	public void countbuycargrade(String startTime, String endTime, ModelMap map) {
		Map m = new HashMap();
		m.put("startTime", startTime);
		m.put("endTime", endTime);
		int comesize = reportService.CountComeShop(m);
		int alreadyBuyCar = reportService.countAlreadyBuyCar(m);
		int highBuyCar = reportService.countHighBuyCar(m);
		int centerBuyCar = reportService.countCenterBuyCar(m);
		int bottomBuyCar = reportService.countBottomBuyCar(m);
		int notBuyCar = reportService.countNotBuyCar(m);
		int veryHighBuyCar = reportService.countVeryHighBuyCar(m);
		List<Map> lst = new ArrayList<Map>();
		Map<String, Object> m2 = new HashMap<String, Object>();
		m2.put("time", startTime + "至" + endTime);
		if (comesize != 0) {
			m2.put("comesize", comesize);
			if (alreadyBuyCar != 0) {
				m2.put("alreadyBuyCar", alreadyBuyCar);
				BigDecimal personagebuycar = new BigDecimal((double) alreadyBuyCar / (double) comesize * 100);
				double alreadyBuyCarRatio = personagebuycar.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
				m2.put("alreadyBuyCarRatio", alreadyBuyCarRatio + "%");
			} else {
				m2.put("alreadyBuyCar", 0);
				m2.put("alreadyBuyCarRatio", "0%");
			}
			if (veryHighBuyCar != 0) {
				m2.put("veryHighBuyCar", veryHighBuyCar);
				BigDecimal veryHighBuyCarRati = new BigDecimal((double) veryHighBuyCar / (double) comesize * 100);
				double veryHighBuyCarRatio = veryHighBuyCarRati.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
				m2.put("veryHighBuyCarRatio", veryHighBuyCarRatio + "%");
			} else {
				m2.put("veryHighBuyCar", 0);
				m2.put("veryHighBuyCarRatio", "0%");
			}
			if (highBuyCar != 0) {
				m2.put("highBuyCar", highBuyCar);
				BigDecimal highBuyCarRati = new BigDecimal((double) highBuyCar / (double) comesize * 100);
				double highBuyCarRatio = highBuyCarRati.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
				m2.put("highBuyCarRatio", highBuyCarRatio + "%");
			} else {
				m2.put("highBuyCar", 0);
				m2.put("highBuyCarRatio", "0%");
			}
			if (centerBuyCar != 0) {
				m2.put("centerBuyCar", centerBuyCar);
				BigDecimal centerBuyCarRati = new BigDecimal((double) centerBuyCar / (double) comesize * 100);
				double centerBuyCarRatio = centerBuyCarRati.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
				m2.put("centerBuyCarRatio", centerBuyCarRatio + "%");
			} else {
				m2.put("centerBuyCar", 0);
				m2.put("centerBuyCarRatio", "0%");
			}
			if (bottomBuyCar != 0) {
				m2.put("bottomBuyCar", bottomBuyCar);
				BigDecimal bottomBuyCarRati = new BigDecimal((double) bottomBuyCar / (double) comesize * 100);
				double bottomBuyCarRatio = bottomBuyCarRati.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
				m2.put("bottomBuyCarRatio", bottomBuyCarRatio + "%");
			} else {
				m2.put("bottomBuyCar", 0);
				m2.put("bottomBuyCarRatio", "0%");
			}
			if (notBuyCar != 0) {
				m2.put("notBuyCar", notBuyCar);
				BigDecimal notBuyCarRati = new BigDecimal((double) bottomBuyCar / (double) comesize * 100);
				double notBuyCarRatio = notBuyCarRati.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
				m2.put("notBuyCarRatio", notBuyCarRatio + "%");
			} else {
				m2.put("notBuyCar", 0);
				m2.put("notBuyCarRatio", "0%");
			}
			lst.add(m2);
			map.put("total", 1);
			map.put("result", lst);
		} else if (comesize == 0) {
			map.put("total", 1);
			map.put("result", 0);
		}
	}

}
