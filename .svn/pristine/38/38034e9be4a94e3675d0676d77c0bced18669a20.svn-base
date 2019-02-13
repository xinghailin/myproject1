package com.yyq.car.portal.ms.app.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yyq.car.portal.common.mapper.comm.BargainConfigMapper;
import com.yyq.car.portal.common.mapper.comm.InterestTalkMapper;
import com.yyq.car.portal.common.model.comm.BargainConfig;
import com.yyq.car.portal.common.model.comm.InterestTalk;

@Service
public class InterestTalkService {

	@Autowired
	private InterestTalkMapper interestTalkMapper;
	
	@Autowired
	private BargainConfigMapper bargainConfigMapper;
	/**
	 * 查询趣话
	 * @param interestTalk
	 * @param start
	 * @param pageSize
	 * @return
	 */
	public Map<String, Object> queryInterestTalk(InterestTalk interestTalk,String start, String pageSize){
		Map<String, Object> map = new HashMap<String, Object>();
		int ps = Integer.parseInt(pageSize);
		List<InterestTalk> lst=interestTalkMapper.selectByCriteria(interestTalk,new RowBounds((Integer.parseInt(start) - 1) * ps, ps));
		int i=interestTalkMapper.countByCriteria(interestTalk);
		map.put("result", lst);
		map.put("total", i);
		return map;
	}
	/**
	 * 查询所有趣话
	 * @param interestTalk
	 * @return
	 */
	public List<InterestTalk> queryAllInterestTalk(InterestTalk interestTalk){
		List<InterestTalk> talk=interestTalkMapper.selectByCriteria(interestTalk);
		return talk;
	}
	/**
	 * 查询单个趣话
	 * @param id
	 * @return
	 */
	public InterestTalk findByIdInterestTalk(Integer id){
		return interestTalkMapper.selectByPrimaryKey(id);
		
	}
	
	/**
	 * 添加趣话
	 * @param interestTalk
	 */
	public void addInterestTalk(InterestTalk interestTalk){
		interestTalkMapper.insertSelective(interestTalk);
	}
	/**
	 * 修改趣话
	 * @param interestTalk
	 */
	public void updateInterestTalk(InterestTalk interestTalk){
		interestTalkMapper.updateByPrimaryKeySelective(interestTalk);
	}
	/**
	 * 删除趣话
	 * @param id
	 */
	public void deleteInterestTalk(Integer id){
		interestTalkMapper.deleteByPrimaryKey(id);
	}
	/**
	 * 查询砍价配置
	 * @param id
	 * @return
	 */
	public BargainConfig fingByBargainConfiguration(Integer id){
		return bargainConfigMapper.selectByPrimaryKey(id);
		
	}
	/**
	 * 修改配置砍价
	 * @param baeBargainConfiguration
	 */
	public void updateBargainConfiguration(BargainConfig baeBargainConfig){
		bargainConfigMapper.updateByPrimaryKeySelective(baeBargainConfig);
	}
	
}
