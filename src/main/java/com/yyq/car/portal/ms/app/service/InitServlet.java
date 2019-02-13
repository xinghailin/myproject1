/*******************************************************************************
 * Project   : car-web
 * Class Name: com.yyq.car.app.back.common.util.InitServlet
 * Created By: wangzh 
 * Created on: 2017年8月25日 下午7:26:32
 * Copyright © 2013-2014 YYQ All rights reserved.
 ******************************************************************************/
package com.yyq.car.portal.ms.app.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.annotation.Scheduled;

import com.yyq.car.portal.common.mapper.cif.PurchasebillMapper;
import com.yyq.car.portal.common.model.cif.Purchasebill;


/**
 * <P>采购过期检测</P>
 * @author wangzh
 */
/**
 * <P>定时任务</P>
 * @author wangzh
 */
// @Service
// @Lazy(value = false)
public class InitServlet // implements InitializingBean
{
	Logger log = LoggerFactory.getLogger(InitServlet.class);
	@Autowired
	private PurchasebillMapper purchaseBillMapper;

	@Value("${is_prduction}")
	private Boolean is_prduction;

	// static {
	// // 初始化配置参数
	// WeixinUtil.appid = "wx4946914950615f21";
	// WeixinUtil.appsecret = "02b105011d0497cd587aa5b2d44ba51f";
	// // 顺便初始化common包的类
	// AdvancedUtil.appid = WeixinUtil.appid;
	// AdvancedUtil.appsecret = WeixinUtil.appsecret;
	// WeixinUtil.access_token_url =
	// "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=" +
	// WeixinUtil.appid + "&secret="
	// + WeixinUtil.appsecret;
	// // log.info("weixin api appid:{}", WeixinUtil.appid);
	// // log.info("weixin api appsecret:{}", WeixinUtil.appsecret);
	// }

	@Scheduled(cron = "0 0 0 * * ? ")
	public void job() {
		if (!is_prduction) {
			log.info("不执行定时任务..  每天0点采购过期检测类 .....is_prduction=" + is_prduction);
			return;
		}
		log.info("每天0点采购过期检测");
		List<Purchasebill> lst = purchaseBillMapper.selectOverdueLst();
		log.info("过期记录条数：{}；", lst.size());
		int size = purchaseBillMapper.updateOverdueLst();
		log.info("更新记录条数：{}；", size);
		if (lst.size() == size) {
			log.info("准确更新所有过期记录：{}条。", size);
		} else {
			log.info("未准确更新所有过期记录：请检查。");
		}
	}

	/*
	 * (non-Javadoc)
	 * @see org.springframework.beans.factory.InitializingBean#afterPropertiesSet()
	 * @author wangzh
	 */
	// @Override
	// public void afterPropertiesSet() throws Exception {
	// // TODO Auto-generated method stub
	// job();
	// log.info("初始时获取一次token");
	// }
}