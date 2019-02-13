package com.yyq.car.portal.ms.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yyq.car.portal.common.dto.ContractDto;
import com.yyq.car.portal.common.model.product.Store;
import com.yyq.car.portal.ms.app.service.AssetRepositoryService;
import com.yyq.car.portal.ms.app.service.ContractDetailsService;
import com.yyq.car.portal.ms.web.constant.Url;
import com.yyq.car.portal.ms.web.constant.View;


@Controller
public class contractDetailsController {

	@Autowired
	private ContractDetailsService contractDetailsService;

	@Autowired
	private AssetRepositoryService assetRepositoryService;

	/**
	 * 到合同详情页
	 * @return
	 */
	@RequestMapping(value = Url.CONTRACT_QUERY, method = RequestMethod.GET)
	public String contractquery(ModelMap map, String currpage) {
		map.put("currpage", currpage);
		return View.CONTRACT_QUERY;
	}

	/**
	 * 合同详情列表
	 * @param record
	 * @param map
	 */
	@RequestMapping(value = Url.CONTRACT_SELLCAR, method = RequestMethod.POST)
	public void contractSellQuery(ContractDto record, ModelMap map) {
		int start = (record.getPageStart() - 1) * record.getPageSize();
		record.setPageStart(start);
		List<ContractDto> lst = contractDetailsService.contractQuery(record);
		int Num = contractDetailsService.contractQueryDetails(record);
		map.put("result", lst);
		map.put("total", Num);
	}

	/**
	 * 合同详情查看
	 * @param record
	 * @param map
	 * @return decoratePrice
	 */
	@RequestMapping(value = Url.CONTRACT_QUERY_DETAILS, method = RequestMethod.GET)
	public String contractQueryDetails(ContractDto record, ModelMap map, String currpage) {
		ContractDto contract = contractDetailsService.contractQueryDeta(record);
		map.put("contract", contract);//
		if (contract.getAddress() != null) {
			int i = Integer.parseInt(contract.getAddress());
			Store store = contractDetailsService.queryStore(i);
			map.put("store", store);
		}
		map.put("currpage", currpage);
		return View.CONTRACT_QUERY_DETAILS;

	}
}
