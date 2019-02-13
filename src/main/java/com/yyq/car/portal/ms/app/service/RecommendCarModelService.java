package com.yyq.car.portal.ms.app.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
  
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yyq.car.portal.common.mapper.comm.RecommendMapper;
import com.yyq.car.portal.common.mapper.product.CarTypeMapper;
import com.yyq.car.portal.common.model.comm.Recommend;
import com.yyq.car.portal.common.model.product.CarType;
import com.yyq.car.portal.common.service.ResourcePersistenceService;


@Service
public class RecommendCarModelService {

	@Autowired
	private RecommendMapper recommendMapper;

	@Autowired
	private CarTypeMapper carTypeMapper;

	@Autowired
	private ResourcePersistenceService resourceService;
	/**
	 * 推存车型查询
	 * <p>TODO</p>
	 * @param record
	 * @param start
	 * @param pageSize
	 * @return
	 * @author mjy
	 */
	public Map<String, Object> recommendCarType(Recommend record, String start, String pageSize) {
		Map<String, Object> map = new HashMap<String, Object>();
		int ps = Integer.parseInt(pageSize);
		List<Recommend> lst = recommendMapper.selectByCriteria(record, new RowBounds((Integer.parseInt(start) - 1) * ps, ps));
		int c = recommendMapper.countByCriteria(record);
		map.put("result", lst);
		map.put("total", c);
		return map;

	}

	/**
	 * 删除推荐车型
	 * <p>TODO</p>
	 * @param id
	 * @author mjy
	 */
	public void deleteCarModel(Integer id) {
		recommendMapper.deleteByPrimaryKey(id);

	}



	/**
	 * 查询单条推荐车型详情
	 * <p>TODO</p>
	 * @param id
	 * @return
	 * @author mjy
	 */
	public Recommend findByCarModel(Integer id) {
		return recommendMapper.selectByPrimaryKey(id);

	}


	public Integer queryByTypeId(Integer typeid) {
		


		return recommendMapper.queryByTypeId(typeid);

	}

//
//	public String queryCarByputaway(CarType carType){
//		
//		return carTypeMapper.queryCarByputaway(carType);
//	}
	/**
	 * 根据品牌，车型和版别来查询对应的车型id
	 * <p>TODO</p>
	 * @param carType
	 * @return
	 * @author mjy
	 */
	
	public String queryCarByidputaway(Integer id) {


		return carTypeMapper.queryCarByidputaway(id);
	}

	/**
	 * 统计是否有已经推荐的品牌和车型
	 * @param recommend
	 * @return
	 */
	public int countByBrandAndModel(Recommend recommend){
		return recommendMapper.countByCriteria(recommend);
	}
	/**
	 * 修改推荐车型
	 * <p>TODO</p>
	 * @param recommend
	 * @author mjy
	 */
	public void updateCarModel(Recommend recommend) {

		recommendMapper.updateByPrimaryKeySelective(recommend);
	}
	/**
	 * 车型修改推荐也修改
	 * @param recommend
	 */
	public void updateByTypeidSelective(Recommend recommend) {

		recommendMapper.updateByTypeidSelective(recommend);
	}
	/**
	 * 添加推荐车型
	 * <p>TODO</p>
	 * @param recommend
	 * @author mjy
	 */
	public void addRecommendCarModel(Recommend recommend) {

		recommendMapper.insertSelective(recommend);
	}

	/**
	 * 车型下架
	 * <p>TODO</p>
	 * @param carType
	 * @author mjy
	 */
	public void updatePutaway(Integer id) {

		carTypeMapper.updateParamById(id);
	}

	/**
	 * 车型上架
	 * @param id
	 */
	public void addPutaway(Integer id) {

		carTypeMapper.updateParam(id);
	}

	/**
	 * 查询上架品牌
	 * <p>TODO</p>
	 * @param map
	 * @return
	 * @author mjy
	 */
	public List<Map<String, Object>> queryCarType() {

		return carTypeMapper.queryCarType();
	}

	/**
	 * 查询上架车型
	 * <p>TODO</p>
	 * @param map
	 * @return
	 * @author mjy
	 */

	public List<Map<String, Object>> queryCarTypeModel(CarType carType) {

		return carTypeMapper.queryCarTypeModel(carType);
	}

	/**
	 * 查询上架版别
	 * <p>TODO</p>
	 * @param map
	 * @return
	 * @author mjy
	 */
	public List<Map<String, Object>> queryCarTypeVersion(CarType carType) {

		return carTypeMapper.queryCarTypeVersion(carType);
	}

	/**
	 * 根据品牌，车型和版别来查询对应的车型id
	 * <p>TODO</p>
	 * @param carType
	 * @return
	 * @author mjy
	 */
	public CarType queryCarByid(CarType carType) {

		return carTypeMapper.queryCarByid(carType);
	}

	/**
	 * 分页查询所有车型 queryCarTypeVersion
	 * <p>TODO</p>
	 * @param carType
	 * @param start                                                                                                                                           
	 * @param pageSize
	 * @return                                  
	 * @author mjy
	 */
	public Map<String, Object> queryCarType(CarType carType, String start, String pageSize) {
		Map<String, Object> map = new HashMap<String, Object>();
		int ps = Integer.parseInt(pageSize);
		List<CarType> lst = carTypeMapper.selectByCriteria(carType, new RowBounds((Integer.parseInt(start) - 1) * ps, ps));
		int c = carTypeMapper.countByCriteria(carType);
		map.put("result", lst);
		map.put("total", c);
		return map;
	}
}
