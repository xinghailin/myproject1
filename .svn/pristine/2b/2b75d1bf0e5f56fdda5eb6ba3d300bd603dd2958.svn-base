package com.yyq.snakerflow.portal.ms.web.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.codehaus.jackson.map.ObjectMapper;
import org.snaker.engine.access.Page;
import org.snaker.engine.access.QueryFilter;
import org.snaker.engine.entity.Order;
import org.snaker.engine.entity.Process;
import org.snaker.engine.entity.Surrogate;
import org.snaker.engine.entity.Task;
import org.snaker.engine.helper.StreamHelper;
import org.snaker.engine.model.TaskModel.TaskType;
import org.springframework.beans.factory.annotation.Autowired;

import com.yyq.car.portal.ms.app.service.SnakerEngineFacets;


public class SnakerController {

	protected static final String PARA_PROCESSID = "processId";
	protected static final String PARA_ORDERID = "orderId";
	protected static final String PARA_TASKID = "taskId";
	protected static final String PARA_TASKNAME = "taskName";
	protected static final String PARA_METHOD = "method";
	protected static final String PARA_NEXTOPERATOR = "nextOperator";
	protected static final String PARA_NODENAME = "nodeName";
	protected static final String PARA_CCOPERATOR = "ccOperator";
	protected static final String URL_ACTIVETASK = "/snaker/task/active";

	@Autowired
	protected HttpServletRequest request;

	@Autowired
	protected SnakerEngineFacets facets;

	@SuppressWarnings("rawtypes")
	protected Page page = new Page();

	/**
	 * 初始化请假、借款流程示例
	 */
	public void initFlows() {
		/*
		 * facets.getEngine().process().deploy(StreamHelper.getStreamFromClasspath("flows/leave.snaker"
		 * ));
		 * facets.getEngine().process().deploy(StreamHelper.getStreamFromClasspath("flows/borrow.snaker"
		 * )); facets.getEngine().process().deploy(StreamHelper.getStreamFromClasspath(
		 * "flows/purshase.snaker"));
		 */

		/*
		 * facets.getEngine().process().deploy(StreamHelper.getStreamFromClasspath(
		 * "flows/loanApproval.snaker"));
		 */
		// System.out.println("======获取的工作流路径是："+StreamHelper.getStreamFromClasspath("flows/carMove.snaker"));
		facets.getEngine().process().deploy(StreamHelper.getStreamFromClasspath("flows/outRepository.snaker"));
	}

	/**
	 * 获取所有流程定义的名称
	 * @return
	 */
	public List<String> getAllProcessNames() {
		List<Process> list = facets.getEngine().process().getProcesss(new QueryFilter());
		List<String> names = new ArrayList<String>();
		for (Process entity : list) {
			if (names.contains(entity.getName())) {
				continue;
			} else {
				names.add(entity.getName());
			}
		}
		return names;
	}

	public Order startInstanceById(String processId, String operator, Map<String, Object> args) {
		return facets.getEngine().startInstanceById(processId, operator, args);
	}

	public Order startInstanceByName(String name, Integer version, String operator, Map<String, Object> args) {
		return facets.getEngine().startInstanceByName(name, version, operator, args);
	}

	public Order startAndExecute(String name, Integer version, String operator, Map<String, Object> args) {
		Order order = facets.getEngine().startInstanceByName(name, version, operator, args);
		List<Task> tasks = facets.getEngine().query().getActiveTasks(new QueryFilter().setOrderId(order.getId()));
		List<Task> newTasks = new ArrayList<Task>();
		if (tasks != null && tasks.size() > 0) {
			Task task = tasks.get(0);
			newTasks.addAll(facets.getEngine().executeTask(task.getId(), operator, args));
		}
		return order;
	}

	public Order startAndExecute(String processId, String operator, Map<String, Object> args) {
		Order order = facets.getEngine().startInstanceById(processId, operator, args);
		List<Task> tasks = facets.getEngine().query().getActiveTasks(new QueryFilter().setOrderId(order.getId()));
		List<Task> newTasks = new ArrayList<Task>();
		if (tasks != null && tasks.size() > 0) {
			Task task = tasks.get(0);
			newTasks.addAll(facets.getEngine().executeTask(task.getId(), operator, args));
		}
		return order;
	}

	public List<Task> execute(String taskId, String operator, Map<String, Object> args) {
		return facets.getEngine().executeTask(taskId, operator, args);
	}

	public List<Task> executeAndJump(String taskId, String operator, Map<String, Object> args, String nodeName) {
		return facets.getEngine().executeAndJumpTask(taskId, operator, args, nodeName);
	}

	public List<Task> transferMajor(String taskId, String operator, String... actors) {
		List<Task> tasks = facets.getEngine().task().createNewTask(taskId, TaskType.Major.ordinal(), actors);
		facets.getEngine().task().complete(taskId, operator);
		return tasks;
	}

	public List<Task> transferAidant(String taskId, String operator, String... actors) {
		List<Task> tasks = facets.getEngine().task().createNewTask(taskId, TaskType.Aidant.ordinal(), actors);
		facets.getEngine().task().complete(taskId, operator);
		return tasks;
	}

	public void addSurrogate(Surrogate entity) {
		if (entity.getState() == null) {
			entity.setState(1);
		}
		facets.getEngine().manager().saveOrUpdate(entity);
	}

	public void deleteSurrogate(String id) {
		facets.getEngine().manager().deleteSurrogate(id);
	}

	public Surrogate getSurrogate(String id) {
		return facets.getEngine().manager().getSurrogate(id);
	}

	public List<Surrogate> searchSurrogate(Page<Surrogate> page, QueryFilter filter) {
		return facets.getEngine().manager().getSurrogate(page, filter);
	}

	/**
	 * 直接输出内容的简便函数.
	 * eg.
	 * render("text/plain", "hello", "encoding:GBK");
	 * render("text/plain", "hello", "no-cache:false");
	 * render("text/plain", "hello", "encoding:GBK", "no-cache:false");
	 * 
	 * @param headers 可变的header数组，目前接受的值为"encoding:"或"no-cache:",默认值分别为UTF-8和true.
	 */
	public void render(HttpServletResponse response1, final String contentType, final String content, final String... headers) {
		HttpServletResponse response = initResponseHeader(response1, contentType, headers);
		try {
			response.getWriter().write(content);
			response.getWriter().flush();
		} catch (IOException e) {
			throw new RuntimeException(e.getMessage(), e);
		}
	}

	/**
	 * 直接输出文本.
	 * @see #render(String, String, String...)
	 */
	public void renderText(HttpServletResponse response, final String text, final String... headers) {
		render(response, TEXT_TYPE, text, headers);
	}

	/**
	 * 直接输出HTML.
	 * @see #render(String, String, String...)
	 */
	public void renderHtml(HttpServletResponse response, final String html, final String... headers) {
		render(response, HTML_TYPE, html, headers);
	}

	/**
	 * 直接输出XML.
	 * @see #render(String, String, String...)
	 */
	public void renderXml(HttpServletResponse response, final String xml, final String... headers) {
		render(response, XML_TYPE, xml, headers);
	}

	/**
	 * 直接输出JSON.
	 * 
	 * @param jsonString json字符串.
	 * @see #render(String, String, String...)
	 */
	public void renderJson(HttpServletResponse response, final String jsonString, final String... headers) {
		render(response, JSON_TYPE, jsonString, headers);
	}

	/**
	 * 直接输出JSON,使用Jackson转换Java对象.
	 * 
	 * @param data 可以是List<POJO>, POJO[], POJO, 也可以Map名值对.
	 * @see #render(String, String, String...)
	 */
	public void renderJson(HttpServletResponse response1, final Object data, final String... headers) {
		HttpServletResponse response = initResponseHeader(response1, JSON_TYPE, headers);
		try {
			mapper.writeValue(response.getWriter(), data);
		} catch (IOException e) {
			throw new IllegalArgumentException(e);
		}
	}

	/**
	 * 直接输出支持跨域Mashup的JSONP.
	 * 
	 * @param callbackName callback函数名.
	 * @param object Java对象,可以是List<POJO>, POJO[], POJO ,也可以Map名值对, 将被转化为json字符串.
	 */
	public void renderJsonp(HttpServletResponse response, final String callbackName, final Object object, final String... headers) {
		String jsonString = null;
		try {
			jsonString = mapper.writeValueAsString(object);
		} catch (IOException e) {
			throw new IllegalArgumentException(e);
		}

		String result = new StringBuilder().append(callbackName).append("(").append(jsonString).append(");").toString();

		// 渲染Content-Type为javascript的返回内容,输出结果为javascript语句,
		// 如callback197("{html:'Hello World!!!'}");
		render(response, JS_TYPE, result, headers);
	}

	/**
	 * 分析并设置contentType与headers.
	 */
	private HttpServletResponse initResponseHeader(HttpServletResponse response, final String contentType, final String... headers) {
		// 分析headers参数
		String encoding = DEFAULT_ENCODING;
		boolean noCache = DEFAULT_NOCACHE;
		for (String header : headers) {
			String headerName = StringUtils.substringBefore(header, ":");
			String headerValue = StringUtils.substringAfter(header, ":");

			if (StringUtils.equalsIgnoreCase(headerName, HEADER_ENCODING)) {
				encoding = headerValue;
			} else if (StringUtils.equalsIgnoreCase(headerName, HEADER_NOCACHE)) {
				noCache = Boolean.parseBoolean(headerValue);
			} else {
				throw new IllegalArgumentException(headerName + "不是一个合法的header类型");
			}
		}

		// 设置headers参数
		String fullContentType = contentType + ";charset=" + encoding;
		response.setContentType(fullContentType);
		if (noCache) {
			setDisableCacheHeader(response);
		}

		return response;
	}

	public static void setDisableCacheHeader(HttpServletResponse response) {
		// Http 1.0 header
		response.setDateHeader("Expires", 1L);
		response.addHeader("Pragma", "no-cache");
		// Http 1.1 header
		response.setHeader("Cache-Control", "no-cache, no-store, max-age=0");
	}

	public static final String TEXT_TYPE = "text/plain";
	public static final String JSON_TYPE = "application/json";
	public static final String XML_TYPE = "text/xml";
	public static final String HTML_TYPE = "text/html";
	public static final String JS_TYPE = "text/javascript";
	public static final String EXCEL_TYPE = "application/vnd.ms-excel";

	// -- header 常量定义 --//
	private static final String HEADER_ENCODING = "encoding";
	private static final String HEADER_NOCACHE = "no-cache";
	private static final String DEFAULT_ENCODING = "UTF-8";
	private static final boolean DEFAULT_NOCACHE = true;

	private static ObjectMapper mapper = new ObjectMapper();

	@SuppressWarnings("rawtypes")
	public Page getPage() {
		return page;
	}

	public void setPage(@SuppressWarnings("rawtypes") Page page) {
		this.page = page;
	}

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

}
