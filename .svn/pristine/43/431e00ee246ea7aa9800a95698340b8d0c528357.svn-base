package com.yyq.car.portal.ms.app.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.yyq.car.portal.common.exception.PortalAppUnCheckedException;
import com.yyq.car.portal.common.mapper.auth.UserMapper;
import com.yyq.car.portal.common.mapper.kr.KrcarMapper;
import com.yyq.car.portal.common.mapper.kr.KrpoolMapper;
import com.yyq.car.portal.common.mapper.product.flowschemeMapper;
import com.yyq.car.portal.common.model.auth.User;
import com.yyq.car.portal.common.model.kr.Krcar;
import com.yyq.car.portal.common.model.kr.Krpool;
import com.yyq.car.portal.common.model.product.flowscheme;
import com.yyq.car.portal.ms.web.util.UUIDTool;


@Service
public class KrPoolService {
	@Autowired
	private KrcarMapper krcarMapper;

	@Autowired
	private KrpoolMapper krpoolMapper;
	@Autowired
	private flowschemeMapper flowschemeMapper;
	@Autowired
	private UserMapper userMapper;

	/**
	 * 
	 * @param krpool
	 * @param pageSize
	 * @param start
	 * @return
	 */
	public Map<String, Object> Poolmanagementlist(Krpool krpool, String pageSize, String start) {
		// TODO Auto-generated method stub
		int ps = Integer.parseInt(pageSize);
		Map<String, Object> map = new HashMap<String, Object>();
		List<Krpool> list = krpoolMapper
				.selectByCriteria(krpool, new RowBounds((Integer.parseInt(start) - 1) * ps, ps));
		int num = krpoolMapper.countByCriteria(krpool);
		map.put("result", list);
		map.put("num", num);
		return map;
	}

	public Krpool getkrpool(String id) {
		// TODO Auto-generated method stub
		return krpoolMapper.selectByPrimaryKey(id);
	}

	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void addpoolsave(Krpool krpool, String loginid, String loantime1) throws ParseException {
		// TODO Auto-generated method stub
		User user = new User();
		user.setLoginName(loginid);
		List<User> user1 = userMapper.selectByCriteria(user);
		flowscheme flow = new flowscheme();
		Date date = new Date();
		flow.setCreatetime(date);
		flow.setUserid(user1.get(0).getId());
		flow.setUsername(user1.get(0).getName());
		if (StringUtils.isNotBlank(loantime1)) {
			SimpleDateFormat lonatime = new SimpleDateFormat("yyyy-MM-dd");
			krpool.setLoantime(lonatime.parse(loantime1));
			flow.setTaskname("添加库融放款时间" + krpool.toString());
			krpoolMapper.updateByPrimaryKeySelective(krpool);
		} else {
			if (StringUtils.isNotBlank(krpool.getId())) {
				Krpool kr = new Krpool();
				kr.setName(krpool.getName());

				List<Krpool> list = krpoolMapper.selectByCriteria(kr);
				if (list.size() > 0) {
					if (list.get(0).getId().equals(krpool.getId())) {
						flow.setTaskname("修改库融" + krpool.toString());
						krpoolMapper.updateByPrimaryKeySelective(krpool);
					} else {
						throw new PortalAppUnCheckedException("库融名称重复！");
					}
				} else {
					flow.setTaskname("修改库融" + krpool.toString());
					krpoolMapper.updateByPrimaryKeySelective(krpool);
				}

			} else {
				Krpool kr = new Krpool();
				kr.setName(krpool.getName());
				List<Krpool> list = krpoolMapper.selectByCriteria(kr);
				if (list.size() > 0) {
					throw new PortalAppUnCheckedException("库融名称重复！");
				}
				krpool.setCreatetime(date);
				krpool.setId(UUIDTool.getUUID());
				krpoolMapper.insertSelective(krpool);
				flow.setTaskname("添加库融" + krpool.toString());
			}
		}
		flowschemeMapper.insertSelective(flow);
	}

	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void pooldelete(String id, String loginid) {
		// TODO Auto-generated method stub
		Krcar car = new Krcar();
		car.setPoolid(id);
		car.setStatus(2);
		List<Krcar> list = krcarMapper.selectByCriteria(car);
		if (list.size() > 0) {
			throw new PortalAppUnCheckedException("库融池中有车！");
		}
		User user = new User();
		user.setLoginName(loginid);
		List<User> user1 = userMapper.selectByCriteria(user);
		flowscheme flow = new flowscheme();
		Date date = new Date();
		flow.setCreatetime(date);
		Krpool krpool = krpoolMapper.selectByPrimaryKey(id);
		flow.setUserid(user1.get(0).getId());
		flow.setUsername(user1.get(0).getName());
		flow.setTaskname("删除库融" + krpool.toString());
		flowschemeMapper.insertSelective(flow);
		krpoolMapper.deleteByPrimaryKey(id);
	}
}
