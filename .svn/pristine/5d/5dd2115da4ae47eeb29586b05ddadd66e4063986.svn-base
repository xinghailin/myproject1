package com.yyq.car.portal.ms.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yyq.car.portal.common.dto.ContractDto;
import com.yyq.car.portal.common.mapper.cif.contractMapper;
import com.yyq.car.portal.common.mapper.product.StoreMapper;
import com.yyq.car.portal.common.model.product.Store;


/**
 * 合同查询
 * <P>TODO</P>
 * @author mjy
 */

@Service
public class ContractDetailsService {
	@Autowired
	private contractMapper ContractMapper;
	@Autowired
	private StoreMapper storeMapper;

	public List<ContractDto> contractQuery(ContractDto record) {

		return ContractMapper.contractQuery(record);
	}

	public int contractQueryDetails(ContractDto record) {

		return ContractMapper.contractQueryNum(record);
	}

	public ContractDto contractQueryDeta(ContractDto record) {

		return ContractMapper.contractQueryDetails(record);

	}
	/**
	 * 查询仓库
	 * @param id
	 * @return
	 */
	public Store queryStore(int id){
		return storeMapper.selectByPrimaryKey(id);
	}
}
