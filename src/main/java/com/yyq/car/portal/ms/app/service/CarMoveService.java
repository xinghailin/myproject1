package com.yyq.car.portal.ms.app.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.ibatis.session.RowBounds;
import org.snaker.engine.TaskAccessStrategy;
import org.snaker.engine.core.ServiceContext;
import org.snaker.engine.impl.GeneralAccessStrategy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.ufa.log.Logger;
import org.ufa.log.LoggerFactory;

import com.yyq.car.portal.common.dto.CarTypeinDto;
import com.yyq.car.portal.common.mapper.auth.RoleMapper;
import com.yyq.car.portal.common.mapper.product.CarMapper;
import com.yyq.car.portal.common.mapper.product.CarTransferMapper;
import com.yyq.car.portal.common.mapper.product.ShopMapper;
import com.yyq.car.portal.common.mapper.product.StoreMapper;
import com.yyq.car.portal.common.model.auth.Role;
import com.yyq.car.portal.common.model.product.Car;
import com.yyq.car.portal.common.model.product.CarTransfer;
import com.yyq.car.portal.common.model.product.Shop;
import com.yyq.car.portal.common.model.product.Store;
import com.yyq.car.portal.common.util.DateUtils;
import com.yyq.car.portal.common.web.constant.Constraints;
import com.yyq.car.portal.ms.web.constant.RoleEnum;
import com.yyq.car.portal.ms.web.constant.StoreStatusEnum;
import com.yyq.car.portal.ms.web.constant.WebConstants;


/**
 * 用于车辆移库
 * @author nj
 *
 */
@Service
public class CarMoveService {
	private final Logger logger = LoggerFactory.getLogger(CarMoveService.class);

	@Autowired
	private RoleMapper roleMapper;
	@Autowired
	private CarMapper carMapper;
	@Autowired
	private CarTransferMapper carTransferMapper;
	@Autowired
	private SnakerService snakerService;
	@Autowired
	private ShopMapper shopMapper;

	@Autowired
	private StoreMapper storeMapper;
	/**
	 * 根据用户ID查询其拥有的角色
	 * @param userId
	 * @return
	 */
	public List<Role> getRolesByUserId(Integer userId) {
		return roleMapper.selectByUserId(userId);
	}

	/**
	 * 查询控制资产库车辆列表
	 * @param dto
	 * @param start
	 * @param pageSize
	 * @return
	 */
	public Map<String, Object> carTypeinLstDo(CarTypeinDto dto, String start, String pageSize) {
		Car car = new Car();
		Map<String, Object> map = new HashMap<String, Object>();
		car.setStatus(6);// 如果值为6，查询状态1和3的值
		car.setIsStored(StoreStatusEnum.HAVESTORE.getValue());// 查询状态为1的记录 审核通过已入库
		car.setVin(dto.getVin());
		car.setBrand(dto.getBrand());
		car.setModel(dto.getModel());
		car.setCarAddress(dto.getCarAddress());
		if (StringUtils.isNotBlank(dto.getStatus())) {
			int st = Integer.parseInt(dto.getStatus());
			// <option value="1">库存车辆</option><option value="2">移库中</option><option
			// value="3">已移库门店</option>
			// <option value="4">购车锁定</option><option value="5">购车物流中</option><option
			// value="6">已销未提</option>
			// <option value="7">已销已提</option>
			if (st > 3&&st<9) {
				car.setSaleStatus(st - 3);
			} else {
				car.setStatus(st);
				car.setSaleStatus(66);
			}
		}
		if (StringUtils.isNotBlank(dto.getLeaveFactoryTime()))
			car.setLeaveFactoryTime(DateUtils.parse(dto.getLeaveFactoryTime(), DateUtils.DEFAULT_DATE_FORMAT_DEFAULT));
		int ps = Integer.parseInt(pageSize);
		List<Car> lst = carMapper.selectByCriteria(car, new RowBounds((Integer.parseInt(start) - 1) * ps, ps));
		map.put("result", lst);
		int size = carMapper.countByCriteria(car);
		map.put("total", size);
		return map;
	}

	/**
	 * 根据车辆id查询车辆信息
	 * @param carId
	 * @return
	 */
	public Map<String, Object> getCarinfoById(Integer carId) {
		return carMapper.selectCarInfoById(carId);
	}
	/**
	 * 从门店入库审核
	 * @param id
	 */
	public void updateStatuss(Car car){
		carMapper.updateStatus(car);
	}
	/**
	 * 审核通过车辆入库
	 * @param car
	 */
	public void updateCarStatus(Car car){
		carMapper.updateCarStatus(car);
	}
	public Store selectByPrimaryKey(int id){
		return storeMapper.selectByPrimaryKey(id);
		
	}
	/**
	 * 通过id查询详情
	 * @param id
	 * @return
	 */
	public Car selectByIdCar(int id){
		return carMapper.selectByPrimaryKey(id);
	}
	/**
	 * 根据ID获取门店信息
	 * @param shopId
	 * @return
	 */
	public Shop getShopById(Integer shopId) {
		return shopMapper.selectByPrimaryKey(shopId);
	}

	/**
	 * 车辆移库申请提交
	 * @param carId
	 * @param userId
	 * @param roleName
	 * @return
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, rollbackFor = Exception.class, timeout = 3)
	public Map<String, Object> submitCarMoveApply(Integer carId, Integer userId, String roleName, String remark, Integer shopId) {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("message", "操作成功");
		result.put("status", 1);

		// 获取车辆信息
		Car car = carMapper.selectByPrimaryKey(carId);

		// 检查车辆状态是否为1或3，否则禁止重复提交申请
		if (null != car && (car.getStatus() == 1 || car.getStatus() == 3)) {
			// 更改car表状态为移库中，同时更改移库状态为已提交申请
			Car param = new Car();
			param.setId(carId);
			param.setStatus(2);// 运输中 即移库中
			param.setMoveStatus(1);// 移库申请已提交
			carMapper.updateByPrimaryKeySelective(param);

			// 往移库申请表插入一条记录
			CarTransfer carTransfer = new CarTransfer();
			carTransfer.setCarId(carId);
			carTransfer.setAuthUserId(userId);
			carTransfer.setStatus(0);// 默认状态
			carTransfer.setFromType(car.getStatus());
			carTransfer.setCreateTime(new Date());
			carTransfer.setRemark(remark);
			carTransferMapper.insert(carTransfer);

			// 开启流程
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("shop.operator", roleName);// 当前处理人
			params.put("carId", carId);
			params.put("shopId", shopId);
			params.put("applyId", carTransfer.getId());// 移库申请id
			params.put("carDep.operator", RoleEnum.ROLE_HQ_CAR.getName());// 待处理人
			params.put("carOldStatus", car.getStatus());// 车辆原始状态
			/**
			 * 加入初始化角色
			 */
			params.put(WebConstants.startUserId, roleName);

			ServiceContext.put(TaskAccessStrategy.class.getName(), GeneralAccessStrategy.class);
			snakerService.startAndExecute(Constraints.CAR_MOVE_PROCESS_ID, roleName, params);
		} else {
			logger.error("carId={}，status={}的车辆状态异常，禁止提交移库申请!", carId, car.getStatus());
			result.put("message", "目前车辆不在库存或门店中，不可移库");
			result.put("status", 0);
			return result;
		}

		return result;
	}

	/**
	 * 根据ID获取移库申请信息
	 * @param id
	 * @return
	 */
	public CarTransfer getCarMoveApplyById(Integer id) {
		return carTransferMapper.selectByPrimaryKey(id);
	}

	/**
	 * 更新car表移库状态
	 * @param carId
	 * @param movewStatus
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, rollbackFor = Exception.class, timeout = 3)
	public void updateCarMoveStatus(Car param) {
		carMapper.updateByPrimaryKeySelective(param);
	}

	/**
	 * 车辆移库申请-门店到店确认审核
	 * @param param
	 * @param applyId
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, rollbackFor = Exception.class, timeout = 3)
	public void shopEnsureMoveApply(Car param, Integer applyId) {
		// 更新移库状态，更改车辆所在地，更改存储类型为门店，更改门店id
		carMapper.updateByPrimaryKeySelective(param);

		// 更新移库申请表中的状态为已完结
		carTransferMapper.updateStatusById(applyId);
	}

}
