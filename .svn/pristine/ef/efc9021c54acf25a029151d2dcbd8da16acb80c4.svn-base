package com.yyq.car.portal.ms.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.snaker.engine.IOrderService;
import org.snaker.engine.ITaskService;
import org.snaker.engine.SnakerEngine;
import org.snaker.engine.entity.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.ufa.log.Logger;
import org.ufa.log.LoggerFactory;

import com.yyq.car.portal.common.dto.CarTypeinDto;
import com.yyq.car.portal.common.model.auth.Role;
import com.yyq.car.portal.common.model.product.Car;
import com.yyq.car.portal.common.model.product.CarTransfer;
import com.yyq.car.portal.common.model.product.Shop;
import com.yyq.car.portal.common.service.security.SecurityHelper;
import com.yyq.car.portal.ms.app.service.AssetRepositoryService;
import com.yyq.car.portal.ms.app.service.CarMoveService;
import com.yyq.car.portal.ms.web.constant.RoleEnum;
import com.yyq.car.portal.ms.web.constant.Url;
import com.yyq.car.portal.ms.web.constant.View;
import com.yyq.car.portal.ms.web.constant.WebConstants;
import com.yyq.car.portal.ms.web.dto.BaseResultDTO;
import com.yyq.car.portal.ms.web.dto.BaseSnakerDTO;
import com.yyq.snakerflow.portal.ms.web.controller.SnakerController;


/**
 * 
 * @author 控制总资产库车辆
 *
 */
@Controller
public class ControlRepositoryController extends SnakerController {
	private final Logger logger = LoggerFactory.getLogger(ControlRepositoryController.class);
	@Autowired
	private AssetRepositoryService assetRepositoryService;
	@Autowired
	private CarMoveService carMoveService;
	@Autowired
	private ITaskService taskService;
	@Autowired
	private IOrderService orderService;

	/**
	 * 跳转控制总资产库车辆列表页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value = Url.CONTROL_REPOSITORY_LIST_PAGE, method = RequestMethod.GET)
	public String goControlRepositoryPage(ModelMap map,String currpage) {
		map.put("currpage", currpage);
		return View.CONTROL_REPOSITORY_LIST_VIEW;
	}

	/**
	 * 控制总资产库车辆列表查询
	 * @param dto
	 * @param start
	 * @param pageSize
	 * @param map
	 * @return
	 */
	@RequestMapping(value = Url.CONTROL_REPOSITORY_LIST, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> CarTypeinLstDo(CarTypeinDto dto, String start, String pageSize, ModelMap map) {
		Map<String, Object> returnMap = carMoveService.carTypeinLstDo(dto, start, pageSize);
		return returnMap;
	}

	/**
	 * 跳转车辆移库申请页面
	 * @param carId
	 * @return
	 */
	@RequestMapping(value = Url.CONTROL_REPOSITORY_CAR_MOVE_APPLY_PAGE, method = RequestMethod.GET)
	public String goCarMoveApplyPage(Integer carId, ModelMap map,String currpage) {

		// 获取车辆信息
		Map<String, Object> carInfo = carMoveService.getCarinfoById(carId);
		map.addAttribute("carInfo", carInfo);

		// 获取门店信息
		String shopIdStr = SecurityHelper.getAdminUserInfo().getShop();
		if (StringUtils.isNotBlank(shopIdStr)) {
			// map.addAttribute("shopId", shopIdStr);
			Shop shop = carMoveService.getShopById(Integer.parseInt(shopIdStr));
			map.addAttribute("shop", shop);
		}
		map.put("currpage", currpage);

		return View.CONTROL_REPOSITORY_CAR_MOVE_APPLY_VIEW;
	}

	/**
	 * 移库申请提交
	 * @param map
	 * @param carId
	 * @param remark
	 * @return
	 */
	@RequestMapping(value = Url.CONTROL_REPOSITORY_CAR_MOVE_APPLY, method = RequestMethod.POST)
	@SuppressWarnings("all")
	public Map<String, Object> carMoveApply(ModelMap map, Integer carId, String remark, Integer shopId) {
		// 查询出登录用户的role
		List<Role> roles = carMoveService.getRolesByUserId(SecurityHelper.getAdminUserInfo().getId());

		String roleName = "";
		for (Role role : roles) {
			if (null != role.getAppId() && role.getAppId().intValue() == 0) {
				roleName = role.getName();
				break;
			}
		}
		// 提交移库申请
		Map<String, Object> result = carMoveService.submitCarMoveApply(carId, SecurityHelper.getAdminUserInfo().getId(), roleName, remark,shopId);
		return result;
	}

	/**
	 * 跳转车辆总部移库申请审核页面
	 * @param modelMap
	 * @param processId
	 * @param orderId
	 * @param taskId
	 * @param taskName
	 * @return
	 */
	@RequestMapping(value = Url.CONTROL_REPOSITORY_CAR_MOVE_HQ_AUDIT, method = RequestMethod.GET)
	public String goCarmoveApplyOfHQauditPage(ModelMap modelMap, String processId, String orderId, String taskId, String taskName) {
		// 将请求参数继续传递给视图页面
		modelMap.addAttribute("processId", processId);
		modelMap.addAttribute("orderId", orderId);
		modelMap.addAttribute("taskId", taskId);

		// 查询出登录用户的role
		// List<Role> roles =
		// carMoveService.getRolesByUserId(SecurityHelper.getAdminUserInfo().getId());
		// String roleName = "";
		// for (Role role : roles) {
		// if (null != role.getAppId() && role.getAppId().intValue() == 0) {
		// roleName = role.getName();
		// }
		// }

		if (StringUtils.isNotEmpty(taskId)) {
			String carId = "";// 移库申请车辆ID
			String applyId = "";// 移库申请ID
			String shopId = "";// 门店ID
			String startroleString = "";
			Task task = null;
			String carOldStatus = "";// 车辆原始状态
			try {
				// 从task表中查询carid，申请记录id
				// task = taskService.take(taskId, roleName);
				task = facets.getEngine().query().getTask(taskId);// 查询任务
			} catch (Exception e) {
				logger.error(e.getMessage());
				// 该任务已被处理，无需再次处理
				return View.CONTROL_REPOSITORY_TASK_OVERDUE_VIEW;
			}
			String[] arguments = task.getVariable().replace("\"", "").replace("{", "").replace("}", "").split(",");
			for (int i = 0; i < arguments.length; i++) {
				String temp = arguments[i];
				if (temp.indexOf("carId") > -1) {
					int numCar = temp.indexOf(":");
					carId = temp.substring(numCar + 1);
				}
				if (temp.indexOf("applyId") > -1) {
					int numApply = temp.indexOf(":");
					applyId = temp.substring(numApply + 1);
				}
				if (temp.indexOf("shopId") > -1) {
					int numShop = temp.indexOf(":");
					shopId = temp.substring(numShop + 1);
				}
				if (temp.indexOf("carOldStatus") > -1) {
					int index = temp.indexOf(":");
					carOldStatus = temp.substring(index + 1);
				}
				if (temp.indexOf(WebConstants.startUserId) > -1) {
					int numRole = temp.indexOf(":");
					startroleString = temp.substring(numRole + 1);
				}
			}

			// 获取移库车辆信息
			Map<String, Object> carInfo = carMoveService.getCarinfoById(Integer.parseInt(carId));
			// 获取移库申请信息
			CarTransfer carTransfer = carMoveService.getCarMoveApplyById(Integer.parseInt(applyId));
			Shop shop = carMoveService.getShopById(Integer.parseInt(shopId));

			modelMap.addAttribute("carInfo", carInfo);
			modelMap.addAttribute("shop", shop);
			modelMap.addAttribute("moveReason", carTransfer.getRemark());// 移库原因
			modelMap.addAttribute("applyId", applyId);// 移库申请id
			modelMap.put("carOldStatus", carOldStatus);
			/**
			 * 加入初始化角色
			 */
			modelMap.put(WebConstants.startUserId, startroleString);
			return View.CONTROL_REPOSITORY_CAR_MOVE_HQ_AUDIT_VIEW;
		}
		modelMap.addAttribute("message", "任务不存在");
		return View.ERROR_MESSAGE;// 返回错误页面

	}

	/**
	 * 车辆移库申请-车辆总部审核
	 * @param snakerDto
	 * @return
	 */
	@RequestMapping(value = Url.CAR_HQ_AUDIT_OF_CAR_MOVE, method = RequestMethod.POST)
	@ResponseBody
	public BaseResultDTO<String> carmoveApplyOfHQaudit(BaseSnakerDTO snakerDto, String startUserId, String carOldStatus) {
		BaseResultDTO<String> result = new BaseResultDTO<String>();
		result.setMessage("操作成功");
		result.setStatus("1");
		Map<String, Object> params = new HashMap<String, Object>();

		// 获取基础流程参数
		String processId = snakerDto.getProcessId();
		String orderId = snakerDto.getOrderId();
		String taskId = snakerDto.getTaskId();
		String applyId = snakerDto.getApplyId();
		Integer carId = snakerDto.getCarId();
		Integer shopId = snakerDto.getShopId();

		// 查询出登录用户的role
		List<Role> roles = carMoveService.getRolesByUserId(SecurityHelper.getAdminUserInfo().getId());
		String roleName = "";
		for (Role role : roles) {
			if (null != role.getAppId() && role.getAppId().intValue() == 0) {
				roleName = role.getName();
				break;
			}
		}

		params.put("processId", processId);
		params.put("orderId", orderId);
		params.put("taskId", taskId);
		if (StringUtils.isNotBlank(applyId)) {
			params.put("applyId", Integer.parseInt(applyId));
		}
		params.put("carId", carId);
		params.put("shopId", shopId);
		params.put("carDep.operator", roleName);// 当前处理人
		params.put("logistic.operator", RoleEnum.ROLE_TRANSPORT.getName());// 待处理人
		params.put("carOldStatus", carOldStatus);
		/**
		 * 加入初始化角色
		 */
		params.put(WebConstants.startUserId, startUserId);

		if (StringUtils.isEmpty(orderId) && StringUtils.isEmpty(taskId)) {
			startAndExecute(processId, roleName, params);
		} else {
			Integer method = snakerDto.getMethod();
			switch (method) {
				case 1:// 任务执行
						// 更新移库状态
					Car car = new Car();
					car.setId(carId);
					car.setMoveStatus(2);// 移库申请 车辆部门审核中
					carMoveService.updateCarMoveStatus(car);// 车辆部门已审核
					// 执行流程
					execute(taskId, roleName, params);
					break;
				case 0:// 驳回、任意跳转
						// 更新采购申请状态为已作废并且更新步骤为采购失败
						// 更新移库状态
					Car car2 = new Car();
					car2.setId(carId);
					// car2.setStatus(1);// 重新变回库存中
					if (StringUtils.isNotBlank(carOldStatus)) {
						car2.setStatus(Integer.parseInt(carOldStatus));// 变回车辆原始状态 1库存 3门店锁定
						carMoveService.updateCarMoveStatus(car2);// 移库申请已提交
					}
					// car2.setMoveStatus(1);//不做处理了 进行到哪就放什么状态好了

					// 驳回申请到门店,流程申请的第一步就是车辆总部审核，所以这里无法驳回到门店
					/*
					 * params.put("auditor", "车辆总部"); params.put("auditRemark",
					 * snakerDto.getReason()); executeAndJump(taskId, roleName, params,
					 * "shopApply");
					 */

					// 直接终止流程
					orderService.terminate(orderId, SnakerEngine.ADMIN);
					break;
				default:
					break;
			}
		}
		return result;
	}

	/**
	 * 跳转物流任务-开始物流页面
	 * @param modelMap
	 * @param processId
	 * @param orderId
	 * @param taskId
	 * @param taskName
	 * @return
	 */
	@RequestMapping(value = Url.CAR_MOVE_LOGISTIC_BEGIN, method = RequestMethod.GET)
	public String goCarmoveApplyOfTransauditPage(ModelMap modelMap, String processId, String orderId, String taskId, String taskName) {
		// 将请求参数继续传递给视图页面
		modelMap.addAttribute("processId", processId);
		modelMap.addAttribute("orderId", orderId);
		modelMap.addAttribute("taskId", taskId);

		// 查询出登录用户的role
		// List<Role> roles =
		// carMoveService.getRolesByUserId(SecurityHelper.getAdminUserInfo().getId());
		// String roleName = "";
		// for (Role role : roles) {
		// if (null != role.getAppId() && role.getAppId().intValue() == 0) {
		// roleName = role.getName();
		// break;
		// }
		// }

		if (StringUtils.isNotEmpty(taskId)) {
			String carId = "";// 移库申请车辆ID
			String applyId = "";// 移库申请ID
			String shopId = "";// 门店ID
			Task task = null;
			String carOldStatus = "";
			String startroleString = "";
			try {
				// 从task表中查询carid，申请记录id
				task = facets.getEngine().query().getTask(taskId);// 查询任务//taskService.take(taskId,
																	// roleName);
			} catch (Exception e) {
				logger.error(e.getMessage());
				// 该任务已被处理，无需再次处理
				return View.CONTROL_REPOSITORY_TASK_OVERDUE_VIEW;
			}

			String[] arguments = task.getVariable().replace("\"", "").replace("{", "").replace("}", "").split(",");
			for (int i = 0; i < arguments.length; i++) {
				String temp = arguments[i];
				if (temp.indexOf("carId") > -1) {
					int numCar = temp.indexOf(":");
					carId = temp.substring(numCar + 1);
				}
				if (temp.indexOf("applyId") > -1) {
					int numApply = temp.indexOf(":");
					applyId = temp.substring(numApply + 1);
				}
				if (temp.indexOf("shopId") > -1) {
					int numShop = temp.indexOf(":");
					shopId = temp.substring(numShop + 1);
				}
				if (temp.indexOf("carOldStatus") > -1) {
					int index = temp.indexOf(":");
					carOldStatus = temp.substring(index + 1);
				}
				if (temp.indexOf(WebConstants.startUserId) > -1) {
					int numRole = temp.indexOf(":");
					startroleString = temp.substring(numRole + 1);
				}

			}

			// 获取移库车辆信息
			Map<String, Object> carInfo = carMoveService.getCarinfoById(Integer.parseInt(carId));
			// 获取移库申请信息
			CarTransfer carTransfer = carMoveService.getCarMoveApplyById(Integer.parseInt(applyId));
			Shop shop = carMoveService.getShopById(Integer.parseInt(shopId));

			modelMap.addAttribute("shop", shop);
			modelMap.addAttribute("carInfo", carInfo);
			modelMap.addAttribute("moveReason", carTransfer.getRemark());// 移库原因
			modelMap.addAttribute("applyId", applyId);// 移库申请id

			modelMap.addAttribute("carOldStatus", carOldStatus);// 车辆原始状态
			modelMap.addAttribute(WebConstants.startUserId, startroleString);// 开始role
			return View.CAR_MOVE_LOGISTIC_BEGIN_VIEW;
		}
		modelMap.addAttribute("message", "查无此任务");
		return View.ERROR_MESSAGE;// 返回错误页面【未提供该页面】
	}

	/**
	 * 物流任务-物流开始审核
	 * @param snakerDto
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = Url.CAR_MOVE_LOGISTIC_BEGIN_AUDIT, method = RequestMethod.POST)
	@ResponseBody
	public BaseResultDTO carmoveApplyOfTransauditBegin(BaseSnakerDTO snakerDto, String startUserId, String carOldStatus) {
		BaseResultDTO result = new BaseResultDTO();
		result.setMessage("操作成功");
		result.setStatus("1");
		Map<String, Object> params = new HashMap<String, Object>();

		// 获取基础流程参数
		String processId = snakerDto.getProcessId();
		String orderId = snakerDto.getOrderId();
		String taskId = snakerDto.getTaskId();
		String applyId = snakerDto.getApplyId();
		Integer carId = snakerDto.getCarId();
		Integer shopId = snakerDto.getShopId();

		// 查询出登录用户的role
		List<Role> roles = carMoveService.getRolesByUserId(SecurityHelper.getAdminUserInfo().getId());
		String roleName = "";
		for (Role role : roles) {
			if (null != role.getAppId() && role.getAppId().intValue() == 0) {
				roleName = role.getName();
				break;
			}
		}

		params.put("processId", processId);
		params.put("orderId", orderId);
		params.put("taskId", taskId);
		if (StringUtils.isNotBlank(applyId)) {
			params.put("applyId", Integer.parseInt(applyId));
		}
		params.put("carId", carId);
		params.put("shopId", shopId);
		params.put("carDep.operator", roleName);// 当前处理人
		params.put("logistic.operator", RoleEnum.ROLE_TRANSPORT.getName());// 待处理人

		/**
		 * 加入初始化角色
		 */
		params.put(WebConstants.startUserId, startUserId);

		params.put("carOldStatus", carOldStatus);// 车辆原始状态

		if (StringUtils.isEmpty(orderId) && StringUtils.isEmpty(taskId)) {
			startAndExecute(processId, roleName, params);
		} else {
			Integer method = snakerDto.getMethod();
			switch (method) {
				case 1:// 任务执行
						// 更新移库状态
					Car car = new Car();
					car.setId(carId);
					car.setMoveStatus(3);
					carMoveService.updateCarMoveStatus(car);// 物流开始
					// 执行流程
					execute(taskId, roleName, params);
					break;
				case 0:// 驳回、任意跳转
						// 更新移库状态
					Car car2 = new Car();
					car2.setId(carId);

					if (StringUtils.isNotBlank(carOldStatus)) {
						car2.setStatus(Integer.parseInt(carOldStatus));// 变回车辆原始状态 1库存 3门店锁定
						carMoveService.updateCarMoveStatus(car2);
					}

					// car2.setMoveStatus(1);
					// carMoveService.updateCarMoveStatus(car2);// 移库申请已提交
					// 驳回申请到门店,流程申请的第一步就是车辆总部审核，所以这里无法驳回到门店
					/*
					 * params.put("auditor", "车辆总部"); params.put("auditRemark",
					 * snakerDto.getReason()); executeAndJump(taskId, roleName, params,
					 * "shopApply");
					 */

					// 直接终止流程
					orderService.terminate(orderId, SnakerEngine.ADMIN);
					break;
				default:
					break;
			}
		}
		return result;
	}

	/**
	 * 跳转物流任务-物流确认页面
	 * @param modelMap
	 * @param processId
	 * @param orderId
	 * @param taskId
	 * @param taskName
	 * @return
	 */
	@RequestMapping(value = Url.CAR_MOVE_LOGISTIC_END, method = RequestMethod.GET)
	public String goCarmoveApplyOfTransauditEndPage(ModelMap modelMap, String processId, String orderId, String taskId, String taskName) {
		// 将请求参数继续传递给视图页面
		modelMap.addAttribute("processId", processId);
		modelMap.addAttribute("orderId", orderId);
		modelMap.addAttribute("taskId", taskId);

		// 查询出登录用户的role
		// List<Role> roles =
		// carMoveService.getRolesByUserId(SecurityHelper.getAdminUserInfo().getId());
		// String roleName = "";
		// for (Role role : roles) {
		// if (null != role.getAppId() && role.getAppId().intValue() == 0) {
		// roleName = role.getName();
		// }
		// }

		if (StringUtils.isNotEmpty(taskId)) {
			String carId = "";// 移库申请车辆ID
			String applyId = "";// 移库申请ID
			String shopId = "";// 门店ID
			Task task = null;
			String carOldStatus = "";

			String startroleString = "";
			try {
				// 从task表中查询carid，申请记录id
				task = facets.getEngine().query().getTask(taskId);// 查询任务//taskService.take(taskId,
																	// roleName);
			} catch (Exception e) {
				logger.error(e.getMessage());
				// 该任务已被处理，无需再次处理
				return View.CONTROL_REPOSITORY_TASK_OVERDUE_VIEW;
			}

			String[] arguments = task.getVariable().replace("\"", "").replace("{", "").replace("}", "").split(",");
			for (int i = 0; i < arguments.length; i++) {
				String temp = arguments[i];
				if (temp.indexOf("carId") > -1) {
					int numCar = temp.indexOf(":");
					carId = temp.substring(numCar + 1);
				}
				if (temp.indexOf("applyId") > -1) {
					int numApply = temp.indexOf(":");
					applyId = temp.substring(numApply + 1);
				}
				if (temp.indexOf("shopId") > -1) {
					int numShop = temp.indexOf(":");
					shopId = temp.substring(numShop + 1);
				}
				if (temp.indexOf("carOldStatus") > -1) {
					int index = temp.indexOf(":");
					carOldStatus = temp.substring(index + 1);
				}
				if (temp.indexOf(WebConstants.startUserId) > -1) {
					int numRole = temp.indexOf(":");
					startroleString = temp.substring(numRole + 1);
				}
			}

			// 获取移库车辆信息
			Map<String, Object> carInfo = carMoveService.getCarinfoById(Integer.parseInt(carId));
			// 获取移库申请信息
			CarTransfer carTransfer = carMoveService.getCarMoveApplyById(Integer.parseInt(applyId));
			Shop shop = carMoveService.getShopById(Integer.parseInt(shopId));

			modelMap.addAttribute("carOldStatus", carOldStatus);// 车辆原始状态
			modelMap.addAttribute(WebConstants.startUserId, startroleString);// 开始role

			modelMap.addAttribute("shop", shop);
			modelMap.addAttribute("carInfo", carInfo);
			modelMap.addAttribute("moveReason", carTransfer.getRemark());// 移库原因
			modelMap.addAttribute("applyId", applyId);// 移库申请id
			return View.CAR_MOVE_LOGISTIC_END_VIEW;
		}
		return "error.view";// 返回错误页面【未提供该页面】
	}

	/**
	 * 物流任务-物流确认审核
	 * @param snakerDto
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = Url.CAR_MOVE_LOGISTIC_END_AUDIT, method = RequestMethod.POST)
	@ResponseBody
	public BaseResultDTO carmoveApplyOfTransauditEnd(BaseSnakerDTO snakerDto, String startUserId, String carOldStatus) {
		BaseResultDTO result = new BaseResultDTO();
		result.setMessage("操作成功");
		result.setStatus("1");
		Map<String, Object> params = new HashMap<String, Object>();

		// 获取基础流程参数
		String processId = snakerDto.getProcessId();
		String orderId = snakerDto.getOrderId();
		String taskId = snakerDto.getTaskId();
		String applyId = snakerDto.getApplyId();
		Integer carId = snakerDto.getCarId();
		Integer shopId = snakerDto.getShopId();

		// 查询出登录用户的role
		List<Role> roles = carMoveService.getRolesByUserId(SecurityHelper.getAdminUserInfo().getId());
		String roleName = "";
		for (Role role : roles) {
			if (null != role.getAppId() && role.getAppId().intValue() == 0) {
				roleName = role.getName();
				break;
			}
		}

		params.put("processId", processId);
		params.put("orderId", orderId);
		params.put("taskId", taskId);
		if (StringUtils.isNotBlank(applyId))
			params.put("applyId", Integer.parseInt(applyId));
		params.put("carId", carId);
		params.put("shopId", shopId);
		params.put("logistic.operator", roleName);// 当前处理人
		params.put("shop.operator", // RoleEnum.ROLE_SHOP.getName()
				startUserId);// 动态指定 给原始发起者的那个门店角色

		/**
		 * 加入初始化角色
		 */
		params.put(WebConstants.startUserId, startUserId);

		params.put("carOldStatus", carOldStatus);// 车辆原始状态

		if (StringUtils.isEmpty(orderId) && StringUtils.isEmpty(taskId)) {
			startAndExecute(processId, roleName, params);
		} else {
			Integer method = snakerDto.getMethod();
			switch (method) {
				case 1:// 任务执行
						// 更新移库状态
					Car car = new Car();
					car.setId(carId);
					car.setMoveStatus(4);
					carMoveService.updateCarMoveStatus(car);
					;// 物流确认
						// 执行流程
					execute(taskId, roleName, params);
					break;
				case 0:// 驳回、任意跳转
						// 更新移库状态
					Car car2 = new Car();
					car2.setId(carId);
					car2.setMoveStatus(1);
					carMoveService.updateCarMoveStatus(car2);// 移库申请已提交
					// 驳回申请到门店,流程申请的第一步就是车辆总部审核，所以这里无法驳回到门店
					/*
					 * params.put("auditor", "车辆总部"); params.put("auditRemark",
					 * snakerDto.getReason()); executeAndJump(taskId, roleName, params,
					 * "shopApply");
					 */

					// 直接终止流程
					orderService.terminate(orderId, SnakerEngine.ADMIN);
					break;
				default:
					break;
			}
		}
		return result;
	}

	/**
	 * 跳转移库申请-门店车辆到店确认页面
	 * @param modelMap
	 * @param processId
	 * @param orderId
	 * @param taskId
	 * @param taskName
	 * @return
	 */
	@RequestMapping(value = Url.CAR_MOVEW_SHOP_VERIFY, method = RequestMethod.GET)
	public String goCarmoveApplyOfShopVerifyPage(ModelMap modelMap, String processId, String orderId, String taskId, String taskName) {
		// 将请求参数继续传递给视图页面
		modelMap.addAttribute("processId", processId);
		modelMap.addAttribute("orderId", orderId);
		modelMap.addAttribute("taskId", taskId);

		// 查询出登录用户的role
		// List<Role> roles =
		// carMoveService.getRolesByUserId(SecurityHelper.getAdminUserInfo().getId());
		// String roleName = "";
		// for (Role role : roles) {
		// if (null != role.getAppId() && role.getAppId().intValue() == 0) {
		// roleName = role.getName();
		// }
		// }

		if (StringUtils.isNotEmpty(taskId)) {
			String carId = "";// 移库申请车辆ID
			String applyId = "";// 移库申请ID
			String shopId = "";// 门店ID
			Task task = null;
			String carOldStatus = "";
			String startroleString = "";
			try {
				// 从task表中查询carid，申请记录id
				task = facets.getEngine().query().getTask(taskId);// 查询任务//taskService.take(taskId,
																	// roleName);
			} catch (Exception e) {
				logger.error(e.getMessage());
				// 该任务已被处理，无需再次处理
				return View.CONTROL_REPOSITORY_TASK_OVERDUE_VIEW;
			}

			String[] arguments = task.getVariable().replace("\"", "").replace("{", "").replace("}", "").split(",");
			for (int i = 0; i < arguments.length; i++) {
				String temp = arguments[i];
				if (temp.indexOf("carId") > -1) {
					int numCar = temp.indexOf(":");
					carId = temp.substring(numCar + 1);
				}
				if (temp.indexOf("applyId") > -1) {
					int numApply = temp.indexOf(":");
					applyId = temp.substring(numApply + 1);
				}
				if (temp.indexOf("shopId") > -1) {
					int numShop = temp.indexOf(":");
					shopId = temp.substring(numShop + 1);
				}
				if (temp.indexOf("carOldStatus") > -1) {
					int index = temp.indexOf(":");
					carOldStatus = temp.substring(index + 1);
				}
				if (temp.indexOf(WebConstants.startUserId) > -1) {
					int numRole = temp.indexOf(":");
					startroleString = temp.substring(numRole + 1);
				}
			}

			// 获取移库车辆信息
			Map<String, Object> carInfo = carMoveService.getCarinfoById(Integer.parseInt(carId));
			// 获取移库申请信息
			CarTransfer carTransfer = carMoveService.getCarMoveApplyById(Integer.parseInt(applyId));
			Shop shop = carMoveService.getShopById(Integer.parseInt(shopId));

			modelMap.addAttribute("shop", shop);
			modelMap.addAttribute("carInfo", carInfo);
			modelMap.addAttribute("moveReason", carTransfer.getRemark());// 移库原因
			modelMap.addAttribute("applyId", applyId);// 移库申请id

			modelMap.addAttribute("carOldStatus", carOldStatus);// 车辆原始状态
			modelMap.addAttribute(WebConstants.startUserId, startroleString);// 开始role

			return View.CAR_MOVE_SHOP_VERIFY_VIEW;
		}
		return "error.view";// 返回错误页面【未提供该页面】
	}

	/**
	 * 移库申请-门店车辆到店审核
	 * @param snakerDto
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = Url.CAR_MOVEW_SHOP_VERIFY_AUDIT, method = RequestMethod.POST)
	@ResponseBody
	public BaseResultDTO carmoveApplyOfShopVerify(BaseSnakerDTO snakerDto) {
		BaseResultDTO result = new BaseResultDTO();
		result.setMessage("操作成功");
		result.setStatus("1");
		Map<String, Object> params = new HashMap<String, Object>();

		// 获取基础流程参数
		String processId = snakerDto.getProcessId();
		String orderId = snakerDto.getOrderId();
		String taskId = snakerDto.getTaskId();
		String applyId = snakerDto.getApplyId();
		Integer carId = snakerDto.getCarId();
		Integer shopId = snakerDto.getShopId();

		// 查询出登录用户的role
		List<Role> roles = carMoveService.getRolesByUserId(SecurityHelper.getAdminUserInfo().getId());
		String roleName = "";
		for (Role role : roles) {
			if (null != role.getAppId() && role.getAppId().intValue() == 0) {
				roleName = role.getName();
			}
		}

		params.put("processId", processId);
		params.put("orderId", orderId);
		params.put("taskId", taskId);
		params.put("applyId", Integer.parseInt(applyId));
		params.put("carId", carId);
		params.put("shopId", shopId);
		params.put("shop.operator", roleName);// 当前处理人

		if (StringUtils.isEmpty(orderId) && StringUtils.isEmpty(taskId)) {
			startAndExecute(processId, roleName, params);
		} else {
			Integer method = snakerDto.getMethod();
			switch (method) {
				case 1:// 任务执行
						// 更新移库状态，更改车辆所在地，更改存储类型为门店，更改门店id
					Car car = new Car();
					car.setId(carId);
					car.setMoveStatus(5);// 移库确认
					car.setCarAddress(snakerDto.getCarAddress());
					car.setStoreType(1);// 存储类型为门店
					car.setShopId(shopId);
					car.setStatus(3);// 门店锁定
					carMoveService.shopEnsureMoveApply(car, Integer.parseInt(applyId));

					// 执行流程
					execute(taskId, roleName, params);
					break;
				case 0:// 驳回、任意跳转
						// 更新采购申请状态为已作废并且更新步骤为采购失败
						// 更新移库状态
						// carMoveService.updateCarMoveStatus(carId, 1);//移库申请已提交
						// 驳回申请到门店,流程申请的第一步就是车辆总部审核，所以这里无法驳回到门店
					/*
					 * params.put("auditor", "车辆总部"); params.put("auditRemark",
					 * snakerDto.getReason()); executeAndJump(taskId, roleName, params,
					 * "shopApply");
					 */

					// 直接终止流程
					orderService.terminate(orderId, SnakerEngine.ADMIN);
					break;
				default:
					break;
			}
		}
		return result;
	}
}
