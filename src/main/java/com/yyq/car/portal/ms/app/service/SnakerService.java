package com.yyq.car.portal.ms.app.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.snaker.engine.access.QueryFilter;
import org.snaker.engine.entity.Order;
import org.snaker.engine.entity.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class SnakerService {

	@Autowired
	protected SnakerEngineFacets facets;

	/**
	 * <p>开启流程</p>
	 * @param processId
	 * @param operator
	 * @param args
	 * @return
	 * @author nj
	 */
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

	/**
	 * 
	 * <p>执行流程</p>
	 * @param taskId
	 * @param operator
	 * @param args
	 * @return
	 * @author lkd
	 */
	public List<Task> execute(String taskId, String operator, Map<String, Object> args) {
		return facets.getEngine().executeTask(taskId, operator, args);
	}

}
