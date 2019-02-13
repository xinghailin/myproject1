package com.yyq.car.portal.ms.app.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yyq.car.portal.common.mapper.cif.contractMapper;
import com.yyq.car.portal.common.model.cif.contract;


@Service
public class VideosService {

	@Autowired
	private contractMapper ContractMapper;

	public void videosUpload(contract con) {
		ContractMapper.updateByPrimaryKey(con);
	}

	public contract fidbuyId(Integer id) {

		return ContractMapper.selectByPrimaryKey(id);

	}
}
