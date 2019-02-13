/*******************************************************************************
 * Project   : car-ms
 * Class Name: com.yyq.car.portal.ms.app.service.BlackSupplierService
 * Created By: wangzh 
 * Created on: 2017年12月26日 下午12:43:21
 * Copyright © 2013-2014 YYQ All rights reserved.
 ******************************************************************************/
package com.yyq.car.portal.ms.app.service;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Lazy;
//import org.springframework.context.annotation.Lazy;
import org.springframework.scheduling.annotation.Scheduled;
//import org.springframework.stereotype.Service;
import org.springframework.stereotype.Service;

import com.yyq.car.portal.common.mapper.jnd.JndblacksupplierMapper;
import com.yyq.car.portal.common.util.DateUtils;


/**
 * <P>定时任务插入黑名单Service</P>
 * @author wangzh
 */
@Service
@Lazy(value = false)
public class BlackSupplierService implements InitializingBean {
	Logger log = LoggerFactory.getLogger(BlackSupplierService.class);

	@Value("${is_prduction}")
	private Boolean is_prduction;

	@Autowired
	JndblacksupplierMapper blacksupplierMapper;

	@Scheduled(cron = "0 0 1,13 * * ? ")
	// @Scheduled(cron = "0 0/1 * * * ? ")
	public void job() {
		// log.info("5分钟检测过期未入库车辆，并将供应方插入黑名单");
		if (!is_prduction) {
			log.info("不执行定时任务..  黑名单 .....is_prduction=" + is_prduction);
			return;
		}
		int c = 0;
		try {
			String now = DateUtils.formate(new Date(), DateUtils.DEFAULT_DATE_FORMAT_DEFAULT);
			c = blacksupplierMapper.checkAndInsertSupplierNew(now);
			log.info("每天1点13点检测过期未入库车辆，将对应供应方插入黑名单，插入" + c + "条");
			// log.info("每分钟检测过期未入库车辆，将对应供应方插入黑名单，插入" + c + "条");
		} catch (Exception e) {
			log.info("插入黑名单异常！");
		}
	}

	/*
	 * (non-Javadoc)
	 * @see org.springframework.beans.factory.InitializingBean#afterPropertiesSet()
	 * @author wangzh
	 */
	@Override
	public void afterPropertiesSet() throws Exception {
		// TODO Auto-generated method stub
		// job();
		log.info("初始新需求黑名单服务...");
	}
}
