package com.yyq.snakerflow.portal.ms.web.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.snaker.engine.access.Page;
import org.snaker.engine.access.QueryFilter;
import org.snaker.engine.entity.HistoryOrder;
import org.snaker.engine.entity.HistoryTask;
import org.snaker.engine.entity.Process;
import org.snaker.engine.entity.Task;
import org.snaker.engine.helper.AssertHelper;
import org.snaker.engine.helper.StreamHelper;
import org.snaker.engine.helper.StringHelper;
import org.snaker.engine.model.ProcessModel;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yyq.car.portal.ms.app.service.SnakerHelper;


@Controller
public class ProcessController extends SnakerController {

	public static final String JSON_TYPE = "application/json";
	public static final String RESULT_RELOAD = "RELOAD";
	public static final String RESULT_LIST = "snaker.process.list";
	public static final String RESULT_EDIT = "snaker.process.edit";
	public static final String RESULT_VIEW = "snaker.process.view";
	public static final String RESULT_DESIGNER = "snaker.process.designer";
	public static final String RESULT_DIAGRAM = "snaker.process.diagram";
	public static final String RESULT_DEPLOY = "snaker.process.deploy";

	private Process process;
	private String processId;
	private String orderId;
	private File attach;
	private String attachFileName;

	/**
	 * 流程定义查询列表
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/snaker/index", method = RequestMethod.GET)
	public String index(ModelMap modelMap) {
		String displayName = request.getParameter("displayName");
		QueryFilter filter = new QueryFilter();
		if (StringHelper.isNotEmpty(displayName)) {
			filter.setDisplayName(displayName);
		}
		facets.getEngine().process().getProcesss(page, filter);
		System.out.println(page.getTotalCount());
		modelMap.put("page", page);
		return RESULT_LIST;
	}

	/**
	 * 流程定义查询列表
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/snaker/process/list", method = RequestMethod.GET)
	public String processList(Model model, Page<Process> page, String displayName) {
		QueryFilter filter = new QueryFilter();
		if (StringHelper.isNotEmpty(displayName)) {
			filter.setDisplayName(displayName);
		}
		facets.getEngine().process().getProcesss(page, filter);
		model.addAttribute("page", page);
		return RESULT_LIST;
	}

	@RequestMapping(value = "/snaker/process/init", method = RequestMethod.GET)
	public String init() throws Exception {
		// facets.initFlows();
		initFlows();
		// return RESULT_RELOAD ;
		return "redirect:/snaker/process/list";
	}

	@RequestMapping(value = "/snaker/process/deploy", method = RequestMethod.GET)
	public String deploy() throws Exception {
		return RESULT_DEPLOY;
	}

	@RequestMapping(value = "/snaker/process/designer", method = RequestMethod.GET)
	public String designer(String processId) throws Exception {
		if (StringUtils.isNotEmpty(processId)) {
			Process process = facets.getEngine().process().getProcessById(processId);
			AssertHelper.notNull(process);
			ProcessModel processModel = process.getModel();
			if (processModel != null) {
				String json = SnakerHelper.getModelJson(processModel);
				request.setAttribute("process", json);
			}
		}
		return RESULT_DESIGNER;
	}

	/**
	 * 编辑流程定义
	 */
	@RequestMapping(value = "/snaker/process/edit", method = RequestMethod.GET)
	public String processEdit(String processId) throws Exception {
		process = facets.getEngine().process().getProcessById(processId);
		if (process.getDBContent() != null) {
			try {
				request.setAttribute("content", StringHelper.textXML(new String(process.getDBContent(), "UTF-8")));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		request.setAttribute("processId", processId);
		return RESULT_EDIT;
	}

	/**
	 * 根据流程定义ID，删除流程定义
	 */
	@RequestMapping(value = "/snaker/process/delete", method = RequestMethod.GET)
	public String delete(String processId) throws Exception {
		facets.getEngine().process().undeploy(processId);
		return RESULT_RELOAD;
	}

	/**
	 * 添加流程定义后的部署
	 */
	@RequestMapping(value = "/snaker/process/deploy/after", method = RequestMethod.GET)
	public String processDeploy(String processId) throws Exception {
		InputStream input = null;
		try {
			input = new FileInputStream(attach);
			if (StringUtils.isNotEmpty(processId)) {
				facets.getEngine().process().redeploy(processId, input);
			} else {
				facets.getEngine().process().deploy(input);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (input != null) {
				try {
					input.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return RESULT_RELOAD;
	}

	/**
	 * 保存流程定义[web流程设计器]
	 */
	@RequestMapping(value = "/snaker/process/save", method = RequestMethod.GET)
	public void deployXml(HttpServletResponse response, String processId) throws Exception {
		boolean result = true;
		InputStream input = null;
		try {
			String model = request.getParameter("model");
			String xml = "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n" + SnakerHelper.convertXml(model);
			System.out.println("model xml=\n" + xml);
			input = StreamHelper.getStreamFromString(xml);
			if (StringUtils.isNotEmpty(processId)) {
				facets.getEngine().process().redeploy(processId, input);
			} else {
				facets.getEngine().process().deploy(input);
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		} finally {
			if (input != null) {
				try {
					input.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		super.renderJson(response, result);
	}

	@RequestMapping(value = "/snaker/process/json", method = RequestMethod.GET)
	public void json(HttpServletResponse response, String processId, String orderId) throws Exception {
		List<Task> tasks = null;
		if (StringUtils.isNotEmpty(orderId)) {
			tasks = facets.getEngine().query().getActiveTasks(new QueryFilter().setOrderId(orderId));
		}
		process = facets.getEngine().process().getProcessById(processId);
		AssertHelper.notNull(process);
		ProcessModel model = process.getModel();
		Map<String, String> jsonMap = new HashMap<String, String>();
		if (model != null) {
			jsonMap.put("process", SnakerHelper.getModelJson(model));
		}
		// {"activeRects":{"rects":[{"paths":[],"name":"任务3"},{"paths":[],"name":"任务4"},{"paths":[],"name":"任务2"}]},"historyRects":{"rects":[{"paths":["TO 任务1"],"name":"开始"},{"paths":["TO 分支"],"name":"任务1"},{"paths":["TO 任务3","TO 任务4","TO 任务2"],"name":"分支"}]}}
		if (tasks != null && !tasks.isEmpty()) {
			jsonMap.put("active", SnakerHelper.getActiveJson(tasks));
		}
		request.setAttribute("processId", processId);
		request.setAttribute("orderId", orderId);
		super.renderJson(response, jsonMap);
	}

	@RequestMapping(value = "/snaker/process/display", method = RequestMethod.GET)
	public String display(String orderId, String processId) throws Exception {
		HistoryOrder order = facets.getEngine().query().getHistOrder(orderId);
		request.setAttribute("order", order);
		List<HistoryTask> tasks = facets.getEngine().query().getHistoryTasks(new QueryFilter().setOrderId(orderId));
		request.setAttribute("tasks", tasks);
		request.setAttribute("processId", processId);
		request.setAttribute("orderId", orderId);
		return RESULT_VIEW;
	}

	/**
	 * 显示独立的流程图
	 */
	@RequestMapping(value = "/snaker/process/diagram", method = RequestMethod.GET)
	public String diagram(String orderId, String processId) throws Exception {
		request.setAttribute("processId", processId);
		request.setAttribute("orderId", orderId);
		return RESULT_DIAGRAM;
	}

	public Process getProcess() {
		return process;
	}

	public void setProcess(Process process) {
		this.process = process;
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

	public File getAttach() {
		return attach;
	}

	public void setAttach(File attach) {
		this.attach = attach;
	}

	public String getAttachFileName() {
		return attachFileName;
	}

	public void setAttachFileName(String attachFileName) {
		this.attachFileName = attachFileName;
	}

}
