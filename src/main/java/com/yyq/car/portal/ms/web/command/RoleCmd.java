/*******************************************************************************
 * Project   : portal-ms
 * Class Name: com.yyq.portal.ms.web.command.QueryRoleCommand
 * Created By: Jonathan 
 * Created on: 2014-6-8 上午1:16:36
 * Copyright © 2008-2014 NATIE All rights reserved.
 ******************************************************************************/
package com.yyq.car.portal.ms.web.command;

/**
 * <P>角色查询对象</P>
 * @author Jonathan
 */
public class RoleCmd extends Pager {

	private Integer id;

	private String name;

	private String appId;

	private String description;

	public String getAppId() {
		return appId;
	}

	public void setAppId(String appId) {
		this.appId = appId;
	}

	/**
	 * @return the roleId
	 */
	public Integer getId() {
		return id;
	}

	/**
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * @param description the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	/**
	 * @param roleId the roleId to set
	 */
	public void setId(Integer id) {
		this.id = id;
	}

	/**
	 * @return the roleName
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param roleName the roleName to set
	 */
	public void setName(String name) {
		this.name = name;
	}

}
