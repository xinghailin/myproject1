package com.yyq.car.portal.ms.app.service.common;

import java.util.List;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Service;

import com.yyq.car.portal.common.mapper.comm.MasterDataMapper;
import com.yyq.car.portal.common.model.comm.MasterData;
import com.yyq.car.portal.common.util.RowBoundsUtils;
import com.yyq.car.portal.common.web.initialization.InitializeDataProcessor;
import com.yyq.car.portal.ms.common.constant.ProjectInfo;


/**
 * <P>基础数据服务</P>
 * @author Jonathan
 */
@Service(ProjectInfo.NAMESPACE + "masterDataService")
public class MasterDataService extends com.yyq.car.portal.common.service.MasterDataService implements ApplicationContextAware {

	@Autowired
	private MasterDataMapper masterDataMapper;

	private ApplicationContext applicationContext;

	public int deleteByPrimaryKey(Integer id) {
		int ret = masterDataMapper.deleteByPrimaryKey(id);
		reflushMasterData();
		return ret;
	}

	public int insert(MasterData record) {
		int ret = masterDataMapper.insert(record);
		reflushMasterData();
		return ret;
	}

	public int insertSelective(MasterData record) {
		int ret = masterDataMapper.insertSelective(record);
		reflushMasterData();
		return ret;
	}

	@SuppressWarnings("unused")
	private void updateCache() {
		reflushMasterData();
	}

	public MasterData selectByPrimaryKey(Integer id) {
		return masterDataMapper.selectByPrimaryKey(id);
	}

	public int updateByPrimaryKeySelective(MasterData record) {
		int ret = masterDataMapper.updateByPrimaryKeySelective(record);
		reflushMasterData();
		return ret;
	}

	public int updateByPrimaryKey(MasterData record) {
		int ret = masterDataMapper.updateByPrimaryKey(record);
		reflushMasterData();
		return ret;

	}

	public List<MasterData> queryByCriteria(MasterData record, int start, int end) {
		return masterDataMapper.selectByCriteria(record, RowBoundsUtils.getRowBounds(start, end));
	}

	public List<MasterData> selectByCriteria(MasterData record) {
		return masterDataMapper.selectByCriteria(record);
	}

	public int countByCriteria(MasterData record) {
		return masterDataMapper.countByCriteria(record);
	}

	public void refreshcache() {
		Object object = this.applicationContext.getBean("initMasterData");
		if (object instanceof InitializeDataProcessor) {
			InitializeDataProcessor dataProcessor = (InitializeDataProcessor) object;
			dataProcessor.refreshcache();
		}
	}

	@Override
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		// TODO Auto-generated method stub
		this.applicationContext = applicationContext;
	}
}
