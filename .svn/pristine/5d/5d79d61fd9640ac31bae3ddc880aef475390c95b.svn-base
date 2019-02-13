/*******************************************************************************
 * Project   : decorate-portal-ms
 * Class Name: com.yyq.decorate.portal.ms.app.service.BrandService
 * Created By: wangzh 
 * Created on: 2016年11月18日 下午3:21:00
 * Copyright © 2013-2014 YYQ All rights reserved.
 ******************************************************************************/
package com.yyq.car.portal.ms.app.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yyq.car.portal.common.mapper.comm.BrandMapper;
import com.yyq.car.portal.common.model.comm.Brand;


/**
 * <P>品牌service</P>
 * @author wangzh
 */
@Service
public class BrandService {

	@Autowired
	private BrandMapper brandMapper;

	public Map<String, Object> query(String brandName, String startPage, String pageSize) {
		Brand brand = new Brand();
		brand.setName(brandName);
		brand.setStatus(1);
		Integer ps = Integer.parseInt(pageSize);
		RowBounds rb = new RowBounds((Integer.parseInt(startPage) - 1) * ps, ps);
		List<Brand> lst = brandMapper.selectByCriteria(brand, rb);
		int total = brandMapper.countByCriteria(brand);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("lst", lst);
		returnMap.put("total", total);
		return returnMap;
	}

	public int add(String brandName) {
		Brand brand = new Brand();
		brand.setName(brandName);
		brand.setStatus(1);
		int count = brandMapper.countByCriteria(brand);
		if (count > 0) {
			return -1;
		}
		brand.setCreateTime(new Date());
		return brandMapper.insertSelective(brand);
	}

	public Brand queryById(Integer id) {
		Brand brand = brandMapper.selectByPrimaryKey(id);
		return brand;
	}

	public List<Map<String, Object>> queryMembersByBrandId(Integer id) {
		List<Map<String, Object>> lst = brandMapper.queryMembersByBrandId(id);
		return lst;
	}

	public int edit(Integer id, String brandName) {
		Brand brand = new Brand();
		brand.setName(brandName);
		brand.setStatus(1);
		int count = brandMapper.countByCriteria(brand);
		if (count > 0) {
			return -1;
		}
		brand.setId(id);
		return brandMapper.updateByPrimaryKeySelective(brand);
	}

	public int delete(Integer id) {
		List<Map<String, Object>> lst = brandMapper.queryMembersByBrandId(id);
		if (lst != null && lst.size() > 0) {
			return -1;
		}
		brandMapper.deleteByPrimaryKey(id);
		return 1;
	}
}
