/*******************************************************************************
 * Project   : car-ms
 * Class Name: com.yyq.car.portal.ms.web.controller.location
 * Created By: wangzh 
 * Created on: 2017年9月29日 上午11:20:55
 * Copyright © 2013-2014 YYQ All rights reserved.
 ******************************************************************************/
package com.yyq.car.portal.ms.web.command;

import java.util.List;


/**
 * <P>TODO</P>
 * @author wangzh
 */
public class location {

	private String name;
	private String code;
	

	private List<location> sub;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public List<location> getSub() {
		return sub;
	}

	public void setSub(List<location> sub) {
		this.sub = sub;
	}

}
