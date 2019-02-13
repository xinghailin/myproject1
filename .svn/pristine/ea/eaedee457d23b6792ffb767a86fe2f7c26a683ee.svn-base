package com.yyq.snakerflow.portal.ms.web.controller;

import org.snaker.engine.access.QueryFilter;
import org.snaker.engine.entity.Surrogate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class SurrogateAction extends SnakerController {

	public static final String RESULT_RELOAD = "RELOAD";
	public static final String RESULT_LIST = "LIST";
	public static final String RESULT_EDIT = "EDIT";
	public static final String RESULT_VIEW = "VIEW";
	private Surrogate surrogate;
	private String id;

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/snaker/surrogate/list", method = RequestMethod.GET)
	public String list() {
		facets.searchSurrogate(page, new QueryFilter());
		return RESULT_LIST;
	}

	@RequestMapping(value = "/snaker/surrogate/create", method = RequestMethod.GET)
	public String create() {
		request.setAttribute("processNames", facets.getAllProcessNames());
		return RESULT_EDIT;
	}

	@RequestMapping(value = "/snaker/surrogate/edit", method = RequestMethod.GET)
	public String edit() {
		surrogate = facets.getSurrogate(id);
		request.setAttribute("processNames", facets.getAllProcessNames());
		return RESULT_EDIT;
	}

	@RequestMapping(value = "/snaker/surrogate/view", method = RequestMethod.GET)
	public String view() {
		surrogate = facets.getSurrogate(id);
		return RESULT_VIEW;
	}

	@RequestMapping(value = "/snaker/surrogate/update", method = RequestMethod.GET)
	public String update() {
		surrogate.setSdate(surrogate.getSdate() + " 00:00:00");
		surrogate.setEdate(surrogate.getEdate() + " 23:59:59");
		facets.addSurrogate(surrogate);
		return RESULT_RELOAD;
	}

	@RequestMapping(value = "/snaker/surrogate/delete", method = RequestMethod.GET)
	public String delete() {
		facets.deleteSurrogate(id);
		return RESULT_RELOAD;
	}

	public Surrogate getSurrogate() {
		return surrogate;
	}

	public void setSurrogate(Surrogate surrogate) {
		this.surrogate = surrogate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

}
