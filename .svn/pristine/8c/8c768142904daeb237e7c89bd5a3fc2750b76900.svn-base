/*******************************************************************************
 * Project   : car-ms
 * Class Name: com.yyq.car.portal.ms.app.service.testsevice
 * Created By: wangzh 
 * Created on: 2017年9月29日 上午11:37:49
 * Copyright © 2013-2014 YYQ All rights reserved.
 ******************************************************************************/
package com.yyq.car.portal.ms.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.yyq.car.portal.common.mapper.comm.WeblocationMapper;
import com.yyq.car.portal.common.model.comm.Weblocation;
import com.yyq.car.portal.ms.web.command.location;


/**
 * <P>TODO</P>
 * @author wangzh
 */
@Service
public class Weblocationsevice {

	@Autowired
	private WeblocationMapper wp;

	@SuppressWarnings("unchecked")
	@Transactional(propagation = Propagation.REQUIRED, timeout = 3)
	public int insert(List<location> lst) {
		int size = 0;
		// 只插两级啊
		for (int i = 0; i < lst.size(); i++) {
			location location = lst.get(i);
			Weblocation wl = new Weblocation();
			wl.setName(location.getName());
			wl.setType("0");
			wl.setParent(0);
			wp.insertSelective(wl);

			net.sf.json.JSONArray json = net.sf.json.JSONArray.fromObject(location.getSub());
			List<location> lst2 = (List<location>) net.sf.json.JSONArray.toCollection(json, location.class);

			// List<location> lst2 = location.getSub();
			for (int j = 0; j < lst2.size(); j++) {
				Weblocation wl1 = new Weblocation();
				wl1.setName(lst2.get(j).getName());
				wl1.setType("1");
				wl1.setParent(wl.getId());
				wp.insertSelective(wl1);
			}
			size++;
		}
		return size;
	}
}
