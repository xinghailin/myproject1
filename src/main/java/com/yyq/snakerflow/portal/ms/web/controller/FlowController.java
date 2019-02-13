package com.yyq.snakerflow.portal.ms.web.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.lang.StringUtils;
import org.snaker.engine.access.QueryFilter;
import org.snaker.engine.cache.CacheManager;
import org.snaker.engine.entity.Process;
import org.snaker.engine.model.TaskModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yyq.car.portal.common.service.security.SecurityHelper;


@Controller
public class FlowController extends SnakerController {

	public static final String RESULT_ACTIVETASK = "snaker/task/active";
	public static final String RESULT_ORDER = "snaker.flow.order";
	public static final String RESULT_ALL = "snaker.flow.all";
	public static final String RESULT_VIEW = "VIEW";

	private String processId;

	private String orderId;

	private String taskId;

	@RequestMapping(value = "/snaker/flow/process", method = RequestMethod.POST)
	public String process(HttpServletResponse response) {
		Map<String, Object> params = new HashMap<String, Object>();
		Enumeration<String> paraNames = request.getParameterNames();
		while (paraNames.hasMoreElements()) {
			String element = paraNames.nextElement();
			int index = element.indexOf("_");
			String paraValue = request.getParameter(element);
			if (index == -1) {
				params.put(element, request.getParameter(element));
			} else {
				char type = element.charAt(0);
				String name = element.substring(index + 1);
				Object value = null;
				switch (type) {
					case 'S':
						value = paraValue;
						break;
					case 'I':
						value = ConvertUtils.convert(paraValue, Integer.class);
						break;
					case 'L':
						value = ConvertUtils.convert(paraValue, Long.class);
						break;
					case 'B':
						value = ConvertUtils.convert(paraValue, Boolean.class);
						break;
					case 'D':
						value = ConvertUtils.convert(paraValue, Date.class);
						break;
					case 'N':
						value = ConvertUtils.convert(paraValue, Double.class);
						break;
					default:
						value = ConvertUtils.convert(paraValue, Double.class);
						break;
				}
				params.put(name, value);
			}
		}
		String processId = request.getParameter("processId");//
		String orderId = request.getParameter("orderId");
		String taskId = request.getParameter("taskId");
		String nextOperator = request.getParameter("nextOperator");
		// 获取当前登录用户名称
		String userName = SecurityHelper.getAdminUserInfo().getLoginName();
		if (StringUtils.isEmpty(orderId) && StringUtils.isEmpty(taskId)) {
			startAndExecute(processId, userName, params);
		} else {
			String methodStr = request.getParameter("method");
			int method;
			try {
				method = Integer.parseInt(methodStr);
			} catch (Exception e) {
				method = 0;
			}
			switch (method) {
				case 0:// 任务执行
						// 当前登录用户为任务执行者
					execute(taskId, userName, params);
					break;
				case -1:// 驳回、任意跳转
					executeAndJump(taskId, userName, params, request.getParameter(PARA_NODENAME));
					break;
				case 1:// 转办
					if (StringUtils.isNotEmpty(nextOperator)) {
						transferMajor(taskId, userName, nextOperator.split(","));
					}
					break;
				case 2:// 协办
					if (StringUtils.isNotEmpty(nextOperator)) {
						transferAidant(taskId, userName, nextOperator.split(","));
					}
					break;
				default:
					execute(taskId, userName, params);
					break;
			}
		}
		String ccOperator = request.getParameter(PARA_CCOPERATOR);
		if (StringUtils.isNotEmpty(ccOperator)) {
			facets.getEngine().order().createCCOrder(orderId, "admin", ccOperator.split(","));
		}
		return "redirect:" + "/" + RESULT_ACTIVETASK;
		// try {
		// response.sendRedirect(RESULT_ACTIVETASK);
		// } catch (IOException e) {
		// e.printStackTrace();
		// }
	}

	/**
	* 流程实例查询
	* @param model
	* @param page
	* @return
	*/
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/snaker/flow/order", method = RequestMethod.GET)
	public String order() {
		facets.getEngine().query().getHistoryOrders(page, new QueryFilter());
		return RESULT_ORDER;
	}

	/**
	 * 抄送实例已读
	 * @param id
	 * @param url
	 * @return
	 */
	@RequestMapping(value = "/snaker/flow/ccread", method = RequestMethod.GET)
	public void ccread(HttpServletResponse response) {
		String id = request.getParameter("id");
		String url = request.getParameter("url");
		String[] assignees = new String[] { "admin" };
		facets.getEngine().order().updateCCStatus(id, assignees);
		try {
			response.sendRedirect(url);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 通用的流程展现页面入口
	 * 将流程中的各环节表单以tab+iframe方式展现
	 */
	@RequestMapping(value = "/snaker/flow/all", method = RequestMethod.GET)
	public String all(String processId, String orderId, String taskId, ModelMap modelMap) {
		if (StringUtils.isNotEmpty(processId)) {
			request.setAttribute("process", facets.getEngine().process().getProcessById(processId));
		}
		if (StringUtils.isNotEmpty(orderId)) {
			request.setAttribute("order", facets.getEngine().query().getOrder(orderId));
		}
		if (StringUtils.isNotEmpty(taskId)) {
			request.setAttribute("task", facets.getEngine().query().getTask(taskId));
		}
		modelMap.put("processId", processId);
		modelMap.put("orderId", orderId);
		modelMap.put("taskId", taskId);
		return RESULT_ALL;
	}

	@Autowired
	private CacheManager cacheManager;

	/**
	 * 节点信息以json格式返回
	 * all页面以节点信息构造tab及加载iframe
	 */
	@RequestMapping(value = "/snaker/flow/node", method = RequestMethod.GET)
	public void node(HttpServletResponse response, String processId) {
		cacheManager.destroy();
		Process process = facets.getEngine().process().getProcessById(processId);
		List<TaskModel> models = process.getModel().getModels(TaskModel.class);
		List<TaskModel> viewModels = new ArrayList<TaskModel>();
		for (TaskModel model : models) {
			TaskModel viewModel = new TaskModel();
			viewModel.setName(model.getName());
			viewModel.setDisplayName(model.getDisplayName());
			viewModel.setForm(model.getForm());
			viewModels.add(viewModel);
		}
		super.renderJson(response, viewModels);
	}

	public CacheManager getCacheManager() {
		return cacheManager;
	}

	public void setCacheManager(CacheManager cacheManager) {
		this.cacheManager = cacheManager;
	}

	public String getProcessId() {
		return processId;
	}

	public void setProcessId(String processId) {
		this.processId = processId;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getTaskId() {
		return taskId;
	}

	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}

}
