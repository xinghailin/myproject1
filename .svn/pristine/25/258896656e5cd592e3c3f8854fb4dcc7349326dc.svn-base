/*******************************************************************************
 * Project   : decorate-portal-ms
 * Class Name: com.yyq.decorate.portal.ms.app.service.GetDataByTypeMsService
 * Created By: wangzh 
 * Created on: 2016年5月27日 下午4:36:40
 * Copyright © 2013-2014 YYQ All rights reserved.
 ******************************************************************************/
package com.yyq.car.portal.ms.app.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yyq.car.portal.common.mapper.comm.GetDataByTypeMapper;


/**
 * <P>TODO</P>
 * @author wangzh
 */
@Service
public class GetDataByTypeMsService {

	@Autowired
	private GetDataByTypeMapper getDataByTypeMapper;

	/**
	 * <p>TODO</p>
	 * @param provinceId
	 * @return
	 * @author mjy
	 */
	@SuppressWarnings("rawtypes")
	public List<Map> getCityAndProvinceMessage(String provinceId) {

		return getDataByTypeMapper.getCityAndProvinceMessage(provinceId);
	}

	/**
	 * <p>TODO</p>
	 * @return
	 * @author mjy
	 */
	@SuppressWarnings("rawtypes")
	public List<Map> getProvincesMessage() {
		return getDataByTypeMapper.getProvincesMessage();
	}

	@SuppressWarnings("rawtypes")
	public List<Map> getAreaMessage(String id) {

		return getDataByTypeMapper.getAreaMessage(id);
	}

	@SuppressWarnings("rawtypes")
	public List<Map> getAllBrandMemberRelate(Integer memberId) {
		if (memberId == null)
			return getDataByTypeMapper.getAllBrand();
		else
			return getDataByTypeMapper.getAllBrandMemberRelate(memberId);
	}
}
