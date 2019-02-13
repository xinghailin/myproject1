package com.yyq.car.portal.ms.app.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yyq.car.portal.common.mapper.cif.HelpFindMapper;
import com.yyq.car.portal.common.mapper.cif.InitiatorMapper;
import com.yyq.car.portal.common.mapper.cif.MeetMapper;
import com.yyq.car.portal.common.model.cif.HelpFind;
import com.yyq.car.portal.common.model.cif.Initiator;
import com.yyq.car.portal.common.model.cif.Meet;


@Service
public class FindCarService {

	@Autowired
	private MeetMapper meetMapper;

	@Autowired
	private HelpFindMapper helpFindMapper;

	@Autowired
	private InitiatorMapper initiatorMapper;

	/**
	 * 
	 * <p>TODO</p>
	 * @param meet
	 * @param start
	 * @param pageSize
	 * @return
	 * @author mjy
	 */
	public Map<String, Object> findAllMeet(Meet meet, String start, String pageSize) {
		Map<String, Object> map = new HashMap<String, Object>();
		int ps = Integer.parseInt(pageSize);
		List<Meet> lst = meetMapper.selectByCriteria(meet, new RowBounds((Integer.parseInt(start) - 1) * ps, ps));
		int cmeet = meetMapper.countByCriteria(meet);
		map.put("result", lst);
		map.put("total", cmeet);
		return map;
	}

	/**
	 * 查询预到店详情
	 * <p>TODO</p>
	 * @param id
	 * @return
	 * @author mjy
	 */
	public Meet meetDetails(Integer id) {
		return meetMapper.selectByPrimaryKey(id);
	}

	/**
	 * 预约到店处理
	 * <p>TODO</p>
	 * @param meet
	 * @author mjy
	 */
	public void manageMeet(Meet meet) {
		meetMapper.updateByPrimaryKeySelective(meet);
	}

	/**
	 * 帮我找车查询
	 * <p>TODO</p>
	 * @param helpFind
	 * @param start
	 * @param pageSize
	 * @return
	 * @author mjy
	 */
	public Map<String, Object> queryHelpFindCar(HelpFind helpFind, String start, String pageSize) {
		Map<String, Object> map = new HashMap<String, Object>();
		int ps = Integer.parseInt(pageSize);
		List<HelpFind> lst = helpFindMapper.selectByCriteria(helpFind, new RowBounds((Integer.parseInt(start) - 1) * ps, ps));
		int h = helpFindMapper.countByCriteria(helpFind);
		map.put("result", lst);
		map.put("total", h);
		return map;

	}

	/**
	 * 帮我找车详情查看
	 * <p>TODO</p>
	 * @param id
	 * @return
	 * @author mjy
	 */
	public HelpFind helpFindCarDetails(Integer id) {
		return helpFindMapper.selectByPrimaryKey(id);

	}

	/**
	 * 后台处理完询底价后改变状态为2 就可以再次发起砍价
	 * @param initiator
	 */
	public void updateState(Initiator initiator) {
		initiatorMapper.updateState(initiator);

	}

	/**
	 * 帮我找车处理保存
	 * <p>TODO</p>
	 * @param findcar
	 * @author mjy
	 */
	public void helpFindCarManage(HelpFind findcar) {
		helpFindMapper.updateByPrimaryKeySelective(findcar);

	}
}
