package com.yyq.snakerflow.portal.ms.web.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.snaker.engine.access.Page;
import org.snaker.engine.access.QueryFilter;
import org.snaker.engine.entity.HistoryOrder;
import org.snaker.engine.entity.Task;
import org.snaker.engine.entity.WorkItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yyq.car.portal.common.model.auth.Role;
import com.yyq.car.portal.common.service.security.SecurityHelper;
import com.yyq.car.portal.ms.app.service.CarMoveService;
import com.yyq.car.portal.ms.web.constant.Url;
import com.yyq.car.portal.ms.web.dto.MyTaskDTO;


@Controller
public class TaskAction extends SnakerController {

	@Autowired
	private CarMoveService carMoveService;

	public static final String RESULT_ACTIVETASK = "snaker/task/active";
	public static final String RESULT_TASKHOME = "snaker.task.home";
	public static final String RESULT_ACTOR = "snaker.task.actor";
	public static final String RESULT_TASKMORE = "snaker.task.more";
	public static final String RESULT_CCMORE = "snaker.task.cc.more";
	public static final String RESULT_TASKHISTORY = "snaker.task.history";
	private Page<WorkItem> page = new Page<WorkItem>();
	private Page<HistoryOrder> ccPage = new Page<HistoryOrder>();
	private String orderId;
	private String taskId;
	private String taskName;
	private Integer taskType;

	@RequestMapping(value = Url.SNAKER_TASK_LIST_PAGE, method = RequestMethod.GET)
	public String activePage() {
		return RESULT_TASKHOME;
	}

	/**
	 * <p>ajax查询数据</p>
	 * @return
	 * @author nj
	 */
	@RequestMapping(value = Url.SNAKER_TASK_LIST, method = RequestMethod.GET)
	public void active(Integer pageStart, Integer pageSize, ModelMap modelMap) {
		// 查询出登录用户的role
		List<Role> roles = carMoveService.getRolesByUserId(SecurityHelper.getAdminUserInfo().getId());
		String roleName = "";
		for (Role role : roles) {
			if (null != role.getAppId() && role.getAppId().intValue() == 0) {
				roleName = role.getName();
				break;
			}
		}
		String[] assignees = null;
		List<WorkItem> majorWorks = null;
		if (StringUtils.isBlank(roleName)) {
			majorWorks = new ArrayList<WorkItem>();
			modelMap.addAttribute("result", majorWorks);
			modelMap.addAttribute("total", 0);
			return;
		} else {
			assignees = new String[] { roleName };

			Page<WorkItem> majorPage = new Page<WorkItem>(pageSize);
			majorPage.setPageNo(pageStart);
			majorWorks = facets.getEngine().query().getWorkItems(majorPage, new QueryFilter().setOperators(assignees));

			// List<MyTaskDTO> taskList = new ArrayList<MyTaskDTO>();
			// 重新组织查询结果并返回给页面
			// wrapTaskResult(majorWorks, taskList);
			modelMap.addAttribute("result", majorWorks);
			modelMap.addAttribute("total", majorPage.getTotalCount());
		}
	}

	/**
	 * <p>到查看所有任务页</p>
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.SNAKER_ALLTASK_LIST_PAGE, method = RequestMethod.GET)
	public String activePageAll() {
		return "snaker.alltask.home";
	}

	/**
	 * <p>查看所有任务</p>
	 * @param pageStart
	 * @param pageSize
	 * @param modelMap
	 * @author wangzh
	 */
	@RequestMapping(value = Url.SNAKER_ALLTASK_LIST, method = RequestMethod.GET)
	public void activeAll(Integer pageStart, Integer pageSize, ModelMap modelMap) {
		Page<WorkItem> majorPage = new Page<WorkItem>(pageSize);
		majorPage.setPageNo(pageStart);
		List<WorkItem> majorWorks = facets.getEngine().query().getWorkItems(majorPage, new QueryFilter());
		modelMap.addAttribute("result", majorWorks);
		modelMap.addAttribute("total", majorPage.getTotalCount());
	}

	/**
	 * <p>重新包装任务列表查询结果</p>
	 * @param majorWorks
	 * @param taskList
	 * @author nj
	 */
	public void wrapTaskResult(List<WorkItem> majorWorks, List<MyTaskDTO> taskList) {
		for (WorkItem workItem : majorWorks) {
			MyTaskDTO mytask = new MyTaskDTO();
			String processId = workItem.getProcessId();// 流程ID

			mytask.setProcessId(processId);
			mytask.setOrderId(workItem.getOrderId());
			mytask.setTaskId(workItem.getTaskId());
			mytask.setTaskName(workItem.getTaskName());
			mytask.setProcessName(workItem.getProcessName());
			mytask.setTaskCreateTime(workItem.getTaskCreateTime());
			mytask.setActionUrl(workItem.getActionUrl());

			taskList.add(mytask);
		}
	}

	@RequestMapping(value = "/snaker/task/add/actor", method = RequestMethod.GET)
	public String addActor() {
		return RESULT_ACTOR;
	}

	@RequestMapping(value = "/snaker/task/do/add/actor", method = RequestMethod.GET)
	public void doAddActor(HttpServletResponse response) {
		List<Task> tasks = facets.getEngine().query().getActiveTasks(new QueryFilter().setOrderId(orderId));
		String operator = request.getParameter("operator");
		for (Task task : tasks) {
			if (task.getTaskName().equalsIgnoreCase(taskName) && StringUtils.isNotEmpty(operator)) {
				facets.getEngine().task().addTaskActor(task.getId(), operator);
			}
		}
		super.renderJson(response, "success");
	}

	@RequestMapping(value = "/snaker/task/tip", method = RequestMethod.GET)
	public void tip(String orderId, String taskName, HttpServletResponse response) {
		List<Task> tasks = facets.getEngine().query().getActiveTasks(new QueryFilter().setOrderId(orderId));
		StringBuilder builder = new StringBuilder();
		String createTime = "";
		for (Task task : tasks) {
			if (task.getTaskName().equalsIgnoreCase(taskName)) {
				String[] actors = facets.getEngine().query().getTaskActorsByTaskId(task.getId());
				for (String actor : actors) {
					builder.append(actor).append(",");
				}
				createTime = task.getCreateTime();
			}
		}
		if (builder.length() > 0) {
			builder.deleteCharAt(builder.length() - 1);
		}
		Map<String, String> data = new HashMap<String, String>();
		data.put("actors", builder.toString());
		data.put("createTime", createTime);
		super.renderJson(response, data);
	}

	/**
	 * 活动任务查询列表
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/snaker/task/active/list", method = RequestMethod.GET)
	public String activeTaskList() {
		String[] assignees = new String[] { "admin" };
		facets.getEngine().query().getWorkItems(page, new QueryFilter().setOperators(assignees).setTaskType(taskType));
		return RESULT_TASKMORE;
	}

	/**
	 * 活动任务查询列表
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/snaker/task/active/cc/list", method = RequestMethod.GET)
	public String activeCCList() {
		String[] assignees = new String[] { "admin" };
		facets.getEngine().query().getCCWorks(ccPage, new QueryFilter().setOperators(assignees).setState(1));
		return RESULT_CCMORE;
	}

	/**
	 * 活动任务的驳回
	 * @param model
	 * @param taskId
	 * @return
	 */
	@RequestMapping(value = "/snaker/task/reject", method = RequestMethod.GET)
	public void reject(HttpServletResponse response) {
		String error = "";
		try {
			facets.executeAndJump(taskId, "admin", null, null);
		} catch (Exception e) {
			error = "?error=1";
		}
		try {
			response.sendRedirect("/snaker/task/active.action" + error);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 历史完成任务查询列表
	 */
	@RequestMapping(value = "/snaker/task/history", method = RequestMethod.GET)
	public String history() {
		facets.getEngine().query().getHistoryWorkItems(page, new QueryFilter().setOperator("admin"));
		return RESULT_TASKHISTORY;
	}

}
