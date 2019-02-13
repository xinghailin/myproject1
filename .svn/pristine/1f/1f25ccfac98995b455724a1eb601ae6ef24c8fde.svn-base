package com.yyq.car.portal.ms.app.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yyq.car.portal.common.dto.InitiatorDto;
import com.yyq.car.portal.common.mapper.cif.BargainMapper;
import com.yyq.car.portal.common.mapper.cif.InitiatorMapper;
import com.yyq.car.portal.common.model.cif.Bargain;
import com.yyq.car.portal.common.model.cif.Initiator;


//import com.yyq.car.portal.common.model.comm.InterestTalk;

@Service
public class BargainService {

	@Autowired
	private BargainMapper bargainMapper;

	@Autowired
	private InitiatorMapper initiatorMapper;

	/**
	 * 发起者信息
	 * @param initiator
	 * @param start
	 * @param pageSize
	 * @returnpublic
	 */
	public Map<String, Object> queryAllInitiator(InitiatorDto initiatorDto) {
		Map<String, Object> map = new HashMap<String, Object>();
		int start = (initiatorDto.getPageStart() - 1) * initiatorDto.getPageSize();
		initiatorDto.setPageStart(start);
		List<InitiatorDto> lst = initiatorMapper.selectInitiator(initiatorDto);
		Initiator in = new Initiator();
		in.setName(initiatorDto.getName());
		in.setFlow(initiatorDto.getFlow());
		int c = initiatorMapper.countByCriteria(in);
		map.put("result", lst);
		map.put("total", c);
		return map;

	}

	/**
	 * 发起者数量
	 * @param initiator
	 * @return
	 */
	public int countInitatorNum(Initiator initiator) {
		return initiatorMapper.countByCriteria(initiator);

	}

	/**
	 * 查询帮我砍价的所有人员信息和砍价金额
	 * @param bargain
	 * @return
	 */
	public List<Bargain> selectBargain(Bargain record, RowBounds rowBounds) {
		List<Bargain> lis = bargainMapper.selectByCriteria(record, rowBounds);
		return lis;

	}

	/**
	 * <p>统计发起砍价</p>
	 * @param in
	 * @return
	 * @author wangzh
	 */
	public List<Initiator> selectInitiatorLstCriteria(Initiator in) {
		return initiatorMapper.selectByCriteria(in);
	}

	/**
	 * 核销
	 * @param id
	 * @return
	 */
	public int confirmSell(int id) {
		return initiatorMapper.confirmSell(id);
	}

	/**
	 * <p>更新</p>
	 * @param record
	 * @author wangzh
	 */
	public void updateInitiatorByPrimary(Initiator record) {
		initiatorMapper.updateByPrimaryKeySelective(record);
	}
}
