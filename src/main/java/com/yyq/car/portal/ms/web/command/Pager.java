/*******************************************************************************
 * Project   : portal-ms
 * Class Name: com.yyq.portal.ms.web.command.AbstractPagerCommand
 * Created By: Jonathan 
 * Created on: 2014-6-8 上午1:23:06
 * Copyright © 2008-2014 NATIE All rights reserved.
 ******************************************************************************/
package com.yyq.car.portal.ms.web.command;

/**
 * <P>TODO</P>
 * @author Jonathan
 */
abstract public class Pager {
	
	private Integer pageSize;
	
	private Integer startPage;
	
	/**
	 * @return the pageSize
	 */
	public Integer getPageSize() {
		return pageSize;
	}
	/**
	 * @param pageSize the pageSize to set
	 */
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	/**
	 * @return the startPage
	 */
	public Integer getStartPage() {
		return startPage;
	}
	/**
	 * @param startPage the startPage to set
	 */
	public void setStartPage(Integer startPage) {
		this.startPage = startPage;
	}
	
}
