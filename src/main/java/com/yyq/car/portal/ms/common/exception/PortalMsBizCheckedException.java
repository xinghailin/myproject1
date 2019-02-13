/*******************************************************************************
 * Project   : portal-ms
 * Class Name: com.yyq.portal.ms.common.exception.PortalMsException
 * Created By: Jonathan 
 * Created on: 2014-6-5 下午4:26:32
 * Copyright © 2008-2014 NATIE All rights reserved.
 ******************************************************************************/
package com.yyq.car.portal.ms.common.exception;

import org.ufa.core.exception.UfaBizCheckedException;


/**
 * <P>系统异常</P>
 * @author Jonathan
 */
public class PortalMsBizCheckedException extends UfaBizCheckedException {

	/**
	 * TODO
	 */
	private static final long serialVersionUID = 7774853466336045949L;

	/**
	 * <p>Method for constructor</p>
	 * @param defaultMessage
	 */
	public PortalMsBizCheckedException(String defaultMessage) {
		super(defaultMessage);
	}

	/**
	 * <p>Method for constructor</p>
	 * @param code
	 * @param defaultMessage
	 */
	public PortalMsBizCheckedException(String code, String defaultMessage) {
		super(code, null, defaultMessage);
	}

	/**
	 * <p>Method for constructor</p>
	 * @param code
	 * @param params
	 * @param defaultMessage
	 */
	public PortalMsBizCheckedException(String code, String[] params, String defaultMessage) {
		super(code, params, defaultMessage);
	}

}
