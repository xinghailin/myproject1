package com.yyq.car.portal.ms.app.service;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yyq.car.portal.common.mapper.auth.UserMapper;
import com.yyq.car.portal.common.mapper.biz.bizcarsourceMapper;
import com.yyq.car.portal.common.model.auth.User;
import com.yyq.car.portal.common.model.biz.bizcarsource;
import com.yyq.car.portal.common.model.product.Shop;


@Service
public class CarSourceService {
	
	@Autowired
	private bizcarsourceMapper bizcarsourceMapper;
	
	@Autowired
	private UserMapper userMapper;
	
	/***
	 * 车源列表查询
	 * @param bizcarsource
	 * @param start
	 * @param pageSize
	 * @return
	 */
	public Map<String , Object> carsourcelist(bizcarsource bizcarsource,String start, String pageSize ){
		Map<String, Object> map = new HashMap<String, Object>();
		int ps = Integer.parseInt(pageSize);
		List<bizcarsource> list=  bizcarsourceMapper.selectByCriteria(bizcarsource, new RowBounds(
				(Integer.parseInt(start) - 1) * ps, ps));
		int c = bizcarsourceMapper.countByCriteria(bizcarsource);
		map.put("num", c);
		map.put("result", list);
		return map;
	}

	public User user(Integer loginid) {
		// TODO Auto-generated method stub
		return userMapper.selectByPrimaryKey(loginid);
	}

	public void carSourcesave(bizcarsource bizcarsource,String starttimes,String endtimes) throws ParseException {
		// TODO Auto-generated method stub
		DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		bizcarsource.setStarttime(format1.parse(starttimes));
		bizcarsource.setEndtime(format1.parse(endtimes));
		bizcarsource.setCreatime(new Date());
		bizcarsourceMapper.insertSelective(bizcarsource);
	}

	public bizcarsource auditCarSource(Integer id) {
		return bizcarsourceMapper.selectByPrimaryKey(id);
		// TODO Auto-generated method stub
		
	}

	public void carSourcesavePass(bizcarsource bizcarsource, Integer loginid) {
		// TODO Auto-generated method stub
		bizcarsourceMapper.updateByPrimaryKeySelective(bizcarsource);
	}


}
