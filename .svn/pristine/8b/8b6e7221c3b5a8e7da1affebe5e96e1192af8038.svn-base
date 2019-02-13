package com.yyq.car.portal.ms.app.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.yyq.car.portal.common.dto.UserDTO;
import com.yyq.car.portal.common.exception.PortalAppUnCheckedException;
import com.yyq.car.portal.common.mapper.biz.BizCarAccessoryMapper;
import com.yyq.car.portal.common.mapper.biz.BizCarAccessoryStatusMapper;
import com.yyq.car.portal.common.model.biz.BizCarAccessory;
import com.yyq.car.portal.common.model.biz.BizCarAccessoryStatus;
import com.yyq.car.portal.common.service.security.SecurityHelper;


@Service
public class CarAccessoryService {
	@Autowired
	private BizCarAccessoryMapper bizCarAccessoryMapper;

	@Autowired
	private BizCarAccessoryStatusMapper bizCarAccessoryStatusMapper;

	@Autowired
	private ShopService shopService;

	public Map<String, Object> carAccessorylist(Map<String, Object> paraMap) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Map<String, Object>> list = bizCarAccessoryMapper.selectByCriteriaGroupByVin(paraMap);
		int c = bizCarAccessoryMapper.countByCriteriaGroupByVin(paraMap);
		map.put("num", c);
		map.put("result", list);
		return map;
	}

	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void addCarAccessorySave(BizCarAccessory bizCarAccessory, BizCarAccessoryStatus bizCarAccessoryStatus) {
		
		BizCarAccessory CarAccessory = new BizCarAccessory();
		CarAccessory.setVin(bizCarAccessory.getVin());
		List<BizCarAccessory> car = bizCarAccessoryMapper.selectByCriteria(CarAccessory);
		if (car.size() > 0) {
			throw new PortalAppUnCheckedException("车架号重复！");
		}
		UserDTO user = SecurityHelper.getAdminUserInfo();
		bizCarAccessory.setCreatorname(user.getName());
		bizCarAccessoryStatus.setCreatorname(user.getName());
		Date date = new Date();
		bizCarAccessory.setCreatime(date);
		bizCarAccessoryStatus.setCreatime(date);
		bizCarAccessoryMapper.insertSelective(bizCarAccessory);
		bizCarAccessoryStatus.setCarid(bizCarAccessory.getId());
		bizCarAccessoryStatusMapper.insertSelective(bizCarAccessoryStatus);
	}

	public Map<String, Object> CarAccessorydetailsList(Integer carid, Integer type) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		if (type == 4) {//总记录查询
			List<Map<String, Object>> list = bizCarAccessoryStatusMapper.getCarAccessorydetailsList(carid);
			map.put("result", list);
		} else {
			List<Map<String, Object>> list = bizCarAccessoryStatusMapper.CarAccessorydetailsList(carid);
			map.put("result", list);
		}
		return map;
	}

	public BizCarAccessory selectByPrimaryKey(Integer carid) {
		
		return bizCarAccessoryMapper.selectByPrimaryKey(carid);
	}

	public BizCarAccessoryStatus selectByPrimaryKeyStatus(Integer id) {
		
		return bizCarAccessoryStatusMapper.selectByPrimaryKey(id);
	}

	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void newAddCarAccessorySave(BizCarAccessoryStatus bizCarAccessoryStatus, BizCarAccessory bizCarAccessory) {
		
		UserDTO user = SecurityHelper.getAdminUserInfo();
		bizCarAccessoryStatus.setCreatorname(user.getName());
		bizCarAccessoryStatusMapper.insertSelective(bizCarAccessoryStatus);
		bizCarAccessory.setId(bizCarAccessoryStatus.getCarid());
		bizCarAccessoryMapper.updateByPrimaryKeySelective(bizCarAccessory);
	}

	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void CarAccessoryAuditPass(BizCarAccessory bizCarAccessory,String remarks1, Integer carid) {
		
		UserDTO user = SecurityHelper.getAdminUserInfo();
		bizCarAccessoryMapper.updateByPrimaryKeySelective(bizCarAccessory);
		BizCarAccessoryStatus bizcarStatus=bizCarAccessoryStatusMapper.selectByPrimaryKey(carid);
		BizCarAccessoryStatus bizcar = new BizCarAccessoryStatus();
		
		if (bizcarStatus.getStatus()==2) {//接受已经审核通过
			throw new PortalAppUnCheckedException("附件已经接收！");
		}else if (bizcarStatus.getStatus()==4) {//领取审核通过
			throw new PortalAppUnCheckedException("附件领取审核通过！");
		}else if (bizcarStatus.getStatus()==1) {//接收审核通过
			bizcar.setStatus(2);// 财务接收审核通过
		}else if(bizcarStatus.getStatus()==3){//bizcarStatus.getStatus()==3//领取审核通过
			bizcar.setStatus(4);// 财务领取审核通过
		}
		bizcar.setId(carid);
		bizcar.setRemarks1(remarks1);
		bizcar.setReceivename(user.getName());
		bizCarAccessoryStatusMapper.updateByPrimaryKeySelective(bizcar);
	}

	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void CarAccessoryAuditNoPass(BizCarAccessory bizCarAccessory, Integer carid) {
		
			bizCarAccessoryMapper.deleteByPrimaryKeySelective(bizCarAccessory);
			bizCarAccessoryStatusMapper.deleteByPrimaryKey(carid);
	}
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void getCarAccessorySave(BizCarAccessory bizCarAccessory, BizCarAccessoryStatus bizCarAccessoryStatus) {
		
		UserDTO user = SecurityHelper.getAdminUserInfo();
		bizCarAccessory.setId(bizCarAccessoryStatus.getCarid());
		bizCarAccessoryMapper.updateByPrimaryKeySelective(bizCarAccessory);
		bizCarAccessoryStatus.setStatus(3);// 领取状态
		bizCarAccessoryStatus.setCreatime(new Date());
		bizCarAccessoryStatus.setGetname(user.getName());
		bizCarAccessoryStatusMapper.insertSelective(bizCarAccessoryStatus);
	}

	public List<BizCarAccessoryStatus> getBizCarAccessoryStatusRemarks1(BizCarAccessoryStatus bizCarAccessoryStatus){
		return bizCarAccessoryStatusMapper.selectByCriteria(bizCarAccessoryStatus);
	}
}
