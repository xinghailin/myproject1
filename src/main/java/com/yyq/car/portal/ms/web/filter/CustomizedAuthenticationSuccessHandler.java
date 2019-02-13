/*******************************************************************************
 * Project   : portal-ms
 * Class Name: com.yyq.portal.ms.web.filter.CustomizedAuthenticationSuccessHandler
 * Created By: Jonathan 
 * Created on: 2014-8-9 下午3:01:05
 * Copyright © 2008-2014 NATIE All rights reserved.
 ******************************************************************************/
package com.yyq.car.portal.ms.web.filter;

import javax.servlet.http.HttpSession;

import org.ufa.log.Logger;
import org.ufa.log.LoggerFactory;
import org.ufa.security.filter.AbstractAuthenticationSuccessHandler;

import com.yyq.car.portal.common.constant.Constants;
import com.yyq.car.portal.common.dto.UserDTO;
import com.yyq.car.portal.common.service.security.SecurityHelper;


/**
 * <P>TODO</P>
 * @author Jonathan
 */
public class CustomizedAuthenticationSuccessHandler extends AbstractAuthenticationSuccessHandler {

	protected final Logger logger = LoggerFactory.getLogger(CustomizedAuthenticationSuccessHandler.class);

	public void initializeUserInfo(HttpSession session) {
		UserDTO userInfo = SecurityHelper.getAdminUserInfoForInit();
		session.setAttribute(Constants.ACCOUNT_INFO, userInfo);
		// edit by wangzhen at 2018年3月23日11:12:37
		session.setMaxInactiveInterval(60 * 60 * 8);// 8小时
	}
}
