package com.yyq.car.portal.ms.app.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yyq.car.portal.common.dto.CarAveragePriceDto;
import com.yyq.car.portal.common.mapper.cif.BuyerMapper;
import com.yyq.car.portal.common.mapper.product.CarMapper;
import com.yyq.car.portal.common.mapper.product.ShopMapper;
import com.yyq.car.portal.common.model.product.Shop;


/**
 * 报表service
 * <P>TODO</P>
 * @author mjy
 */
@Service
@SuppressWarnings("rawtypes")
public class ReportService {

	@Autowired
	private BuyerMapper buyerMapper;
	@Autowired
	private CarMapper carMapper;
	@Autowired
	private ShopMapper shopMapper;

	/*
	 * public List<Store> queryAllStore() { return storeMapper.selectByCriteria(new Store()); } }
	 */
	public List<Shop> queryshop() {

		return shopMapper.selectByCriteria(new Shop());

	}

	/**
	 * 统计买车人数
	 * <p>TODO</p>
	 * @param map
	 * @return
	 * @author mjy
	 */
	@SuppressWarnings({})
	public int CountBuyCar(Map map) {
		return carMapper.countBuyCar(map);
	}

	/**
	 * 统计进店人数
	 * <p>TODO</p>
	 * @param map
	 * @return
	 * @author mjy
	 */
	@SuppressWarnings({})
	public int CountComeShop(Map map) {
		return buyerMapper.countComeShop(map);
	}

	/**
	 * 计算平均价格
	 * <p>TODO</p>
	 * @param price
	 * if (StringUtils.isNotBlank(dto.getLeaveFactoryTime()))
			car.setLeaveFactoryTime(DateUtils.parse(dto.getLeaveFactoryTime(), DateUtils.DEFAULT_DATE_FORMAT_DEFAULT));
	 * @return
	 * @author mjy
	 */
	public Map<String, Object> countCarPrice(CarAveragePriceDto price, String pageStart, String pageSize) {
		Map<String, Object> map = new HashMap<String, Object>();
		int ps = Integer.parseInt(pageSize);
		List<CarAveragePriceDto> lst = carMapper.countCarPrice(price, new RowBounds((Integer.parseInt(pageStart) - 1) * ps, ps));
		map.put("result", lst);

		int c = carMapper.countCarPriceCount(price);
		map.put("total", c);
		return map;
	}

	/**
	 * 熟客介绍买车人数
	 * <p>TODO</p>
	 * @param map
	 * @return
	 * @author mjy
	 */
	public int countIntroduceBuyRatio(Map map) {

		return buyerMapper.countIntroduce(map);

	}

	/**
	 * 汽车型号销售比例
	 * <p>TODO</p>
	 * @param price
	 * @param pageStart
	 * @param pageSize
	 * @return
	 * @author mjy
	 */
	public Map<String, Object> countModelSalesRatio(CarAveragePriceDto price, String pageStart, String pageSize) {
		Map<String, Object> map = new HashMap<String, Object>();
		int ps = Integer.parseInt(pageSize);
		List<CarAveragePriceDto> lst = carMapper.countPopularModel(price, new RowBounds((Integer.parseInt(pageStart) - 1) * ps, ps));
		map.put("result", lst);
		int modelnumber = carMapper.countmodel(price);
		map.put("total", modelnumber);
		return map;

	}

	/**
	 * 汽车平均库龄
	 * <p>TODO</p>
	 * @param price
	 * @param pageStart
	 * @param pageSize
	 * @return
	 * @author mjy
	 */
	public Map<String, Object> countAvgWarehouseAge(CarAveragePriceDto price, String pageStart, String pageSize) {
		Map<String, Object> map = new HashMap<String, Object>();
		int ps = Integer.parseInt(pageSize);
		List<CarAveragePriceDto> lst = carMapper.countAvgWarehouseAge(price, new RowBounds((Integer.parseInt(pageStart) - 1) * ps, ps));
		map.put("result", lst);
		int carNumber = carMapper.countCarNumber(price);
		map.put("total", carNumber);
		return map;

	}

	/**
	 * 首次购车人数
	 * <p>TODO</p>
	 * @param map
	 * @return
	 * @author mjy
	 */
	public int countFirstBuyCar(Map map) {
		return buyerMapper.countFirstBuyCar(map);
	}

	/**
	 * 统计置换车辆人数
	 * <p>TODO</p>
	 * @param map
	 * @return
	 * @author mjy
	 */
	public int countPermuteCar(Map map) {
		return buyerMapper.countPermuteCar(map);
	}

	/**
	 * 统计添加车辆人数
	 * <p>TODO</p>
	 * @param map
	 * @return
	 * @author mjy
	 */
	public int countAddCar(Map map) {
		return buyerMapper.countAddCar(map);
	}

	/**
	 * 只是看车
	 * <p>TODO</p>
	 * @param map
	 * @return
	 * @author mjy
	 */
	public int countLookCar(Map map) {
		return buyerMapper.countLookCar(map);
	}

	/**
	 * 个人用车统计
	 * <p>TODO</p>
	 * @param map
	 * @return
	 * @author mjy
	 */
	public int countPersonageBuyCar(Map map) {
		return buyerMapper.countPersonageBuyCar(map);
	}

	/**
	 * 单位用车统计
	 * <p>TODO</p>
	 * @param map
	 * @return
	 * @author mjy
	 */
	public int countFirmBuyCar(Map map) {
		return buyerMapper.countFirmBuyCar(map);
	}

	/**
	 * 统计进店已经购买人数(购买意愿) H
	 * <p>TODO</p>
	 * @param map
	 * @return
	 * @author mjy
	 */
	public int countAlreadyBuyCar(Map map) {
		return buyerMapper.countAlreadyBuyCar(map);
	}

	/**
	 * 统计进店客户级别为很高(购买意愿) A
	 * <p>TODO</p>
	 * @param map
	 * @return
	 * @author mjy
	 */
	public int countHighBuyCar(Map map) {
		return buyerMapper.countHighBuyCar(map);
	}

	/**
	 * 统计进店客户级别为(购买意愿) B
	 * <p>TODO</p>
	 * @param map
	 * @return
	 * @author mjy
	 */
	public int countCenterBuyCar(Map map) {
		return buyerMapper.countCenterBuyCar(map);
	}

	/**
	 * 统计进店客户级别(购买意愿)C
	 * <p>TODO</p>
	 * @param map
	 * @return
	 * @author mjy
	 */
	public int countBottomBuyCar(Map map) {
		return buyerMapper.countBottomBuyCar(map);
	}

	/**
	 * 统计进店客户不买的 N
	 * <p>TODO</p>
	 * @param map
	 * @return
	 * @author mjy
	 */
	public int countNotBuyCar(Map map) {
		return buyerMapper.countNotBuyCar(map);
	}

	/**
	 * 
	 * <p>TODO</p>
	 * @param map
	 * @return
	 * @author mjy
	 */
	public int countVeryHighBuyCar(Map map) {
		return buyerMapper.countVeryHighBuyCar(map);
	}
}
