package com.yyq.car.portal.ms.web.controller;

import java.io.IOException;
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
import org.springframework.web.multipart.MultipartFile;

import com.yyq.car.portal.common.constant.FileTypeEnum;
import com.yyq.car.portal.common.model.comm.Recommend;
import com.yyq.car.portal.common.model.product.CarType;
import com.yyq.car.portal.common.service.ResourcePersistenceService;
import com.yyq.car.portal.ms.app.service.RecommendCarModelService;
import com.yyq.car.portal.ms.web.constant.Url;
import com.yyq.car.portal.ms.web.constant.View;


@Controller
public class recommendCarModelController {

	@Autowired
	private RecommendCarModelService recommendCarModelService;

	@Autowired
	private ResourcePersistenceService resourceService;

	/**
	 * 到推存车辆页面
	 * <p>TODO</p>
	 * @return
	 * @author mjy
	 */
	@RequestMapping(value = Url.RECOMMEND_CARTYPE, method = RequestMethod.GET)
	public String recommendCar(ModelMap map,String currpage) {
		map.put("currpage", currpage);
		return View.RECOMMEND_CARTYPE_VIEW;
	}
	/**
	 * 推荐车型列表
	 * <p>TODO</p>
	 * @param recommend
	 * @param start
	 * @param pageSize
	 * @param map
	 * @return
	 * @author mjy
	 */
	@RequestMapping(value = Url.RECOMMEND_CARTYPE_INDEX, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> recommendCarType(Recommend recommend, String start, String pageSize, ModelMap map) {
		Map<String, Object> maplistMap = recommendCarModelService.recommendCarType(recommend, start, pageSize);
		return maplistMap;

	}

	/**
	 *进入上架管理页面
	 * <p>TODO</p>
	 * @return
	 * @author mjy
	 */
	@RequestMapping(value = Url.PUTAWAY_MANAGE, method = RequestMethod.GET)
	public String queryCartype() {
		return View.PUTAWAY_MANAGE_VIEW;
	}

	/**
	 * 上架管理列表
	 * <p>TODO</p>
	 * @param carType
	 * @param start
	 * @param pageSize
	 * @param map
	 * @return
	 * @author mjy
	 */
	@RequestMapping(value = Url.PUTAWAY_MANAGE_INDEX, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> queryCartype(CarType carType, String start, String pageSize, ModelMap map) {
		Map<String, Object> maplistMap = recommendCarModelService.queryCarType(carType, start, pageSize);
		return maplistMap;

	}

	/**
	 * 删除推荐车型
	 * <p>TODO</p>
	 * @param id
	 * @return
	 * @author mjy
	 */
	@RequestMapping(value = Url.DELETE_CAR_MODEL, method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> deleteCarModel(Integer id) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			recommendCarModelService.deleteCarModel(id);
			map.put("status", true);
		} catch (Exception e) {
			// TODO: handle exception
			map.put("status", false);
			map.put("message", e.getMessage());
		}
		return map;
	}

	/**
	 * 到修改推荐车型页面
	 * <p>TODO</p>
	 * @param id
	 * @param map
	 * @return
	 * @author mjy
	 */
	@RequestMapping(value = Url.FIND_BY_CAR_MODEL, method = RequestMethod.GET)
	public String findByCarModel(Integer id, ModelMap map,String currpage) {
		Recommend reco = recommendCarModelService.findByCarModel(id);
		map.put("re", reco);
		map.put("currpage", currpage);
		return View.FIND_BY_CAR_MODEL_VIEW;

	}

	/**
	 * 到添加推荐页面
	 * <p>TODO</p>
	 * @return
	 * @author mjy
	 */
	@RequestMapping(value = Url.FIND_CAR_MODEL, method = RequestMethod.GET)
	public String addCarModelPage() {

		return View.FIND_BY_CAR_MODEL_VIEW;
	}

	/**
	 * 车辆上架
	 * <p>TODO</p>
	 * @param carType
	 * @return
	 * @author mjy
	 */
	@RequestMapping(value = Url.UPDTE_PUTAWAY, method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> updatePutaway(Integer id) {
		String putaway = recommendCarModelService.queryCarByidputaway(id);
		Map<String, Object> map = new HashMap<String, Object>();
		if (putaway != null) {
			map.put("status", false);
			map.put("message", "车型已上架");
		} else {
			recommendCarModelService.addPutaway(id);
			map.put("status", true);
		}
		return map;
	}

	/**
	 * 车辆下架
	 * <p>TODO</p>
	 * @param carType
	 * @return
	 * @author mjy
	 */
	@RequestMapping(value = Url.UPDTE_PUTAWAY_SOLD_OUT, method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> updatePutawaySoldOut(Integer id) {
		Map<String, Object> map = new HashMap<String, Object>();
		Integer recomm = recommendCarModelService.queryByTypeId(id);// 是否推荐
		if (recomm != null) {
			map.put("status", false);
			map.put("message", "请先删除推荐，再下架");
		} else {
			recommendCarModelService.updatePutaway(id);
			map.put("status", true);
		}

		return map;
	}
   /**
	 * 修改和添加推荐列表
	 * <p>TODO</p>
	 * @param recommend
	 * @return
	 * @author mjy
	 * @throws IOException 
	 */
	@RequestMapping(value = Url.UPDATE_CAR_MODEL, method = RequestMethod.POST)
	public String updateCarModel(Recommend recommend, CarType carType, MultipartFile picture,String currpage,ModelMap maps) throws IOException {
		recommend.setPic(resourceService.uploadFileProcessStr(picture, FileTypeEnum.CARIDENTIFY));
		Map<String, Map<String, Object>> map = new HashMap<String, Map<String, Object>>();
		if (StringUtils.isNotBlank(recommend.getPic())) {
			Map<String, Object> tMap = new HashMap<String, Object>();
			tMap.put("is", picture.getInputStream());
			tMap.put("size", picture.getSize());
			map.put(recommend.getPic(), tMap);
			
		}
		if (map.entrySet().size() > 0) {
			resourceService.asyncSaveFiles(map, true);
		}
		int recommendNum=recommendCarModelService.countByBrandAndModel(recommend);
		CarType c = recommendCarModelService.queryCarByid(carType);
		recommend.setTypeid(c.getId());//////putaway
		if (recommend.getId() != null) {
			if (recommendNum>0) {
				maps.put("result", 1);
				return View.FIND_BY_CAR_MODEL_VIEW;
			}else{
				maps.put("result", 0);
				if (StringUtils.isNotBlank(c.getEveryMonthPay())) {
					recommend.setEveryMonthPay(c.getEveryMonthPay());
				}
				if (StringUtils.isNotBlank(c.getFirstMonthPay())) {
					recommend.setFirstMonthPay(c.getFirstMonthPay());
				}
				recommendCarModelService.updateCarModel(recommend);
			}
		
		} else {
			if (recommendNum>0) {
				maps.put("result", 1);
				return View.FIND_BY_CAR_MODEL_VIEW;
			}else{
				maps.put("result", 0);
			recommend.setCreatetime(new Date());
//			recommend.setVersion(c.getVersion());
			if (StringUtils.isNotBlank(c.getEveryMonthPay())) {
				recommend.setEveryMonthPay(c.getEveryMonthPay());
			}
			if (StringUtils.isNotBlank(c.getFirstMonthPay())) {
				recommend.setFirstMonthPay(c.getFirstMonthPay());
			}
			
			recommendCarModelService.addRecommendCarModel(recommend);
			}
		}
		maps.put("currpage", currpage);
		return View.RECOMMEND_CARTYPE_VIEW;
	}
	/**
	 * 查询所有品牌
	 * <p>TODO</p>
	 * @return
	 * @author mjy
	 */

	@RequestMapping(value = Url.UPDATE_RECOMMEND_CAR, method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> queryCarType() {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Map<String, Object>> lst = recommendCarModelService.queryCarType();
		map.put("car", lst);
		return map;
	}

	/**
	 * 查询所有型号
	 * <p>TODO</p>
	 * @return
	 * @author mjy
	 */
	@RequestMapping(value = Url.UPDATE_RECOMMEND_CAR_MODEL, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> queryCarTypeModel(CarType carType) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Map<String, Object>> lst = recommendCarModelService.queryCarTypeModel(carType);
		map.put("models", lst);
		return map;

	}

	/**
	 * 查询所有版别
	 * <p>TODO</p>
	 * @return
	 * @author mjy
	 */
	@RequestMapping(value = Url.UPDATE_RECOMMEND_CAR_VERSION, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> queryCarTypeVersion(CarType carType) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Map<String, Object>> lst = recommendCarModelService.queryCarTypeVersion(carType);
		map.put("versions", lst);
		return map;

	}

}
