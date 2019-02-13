/*******************************************************************************
 * Project   : portal-ms
 * Class Name: com.yyq.portal.ms.web.constant.Constants
 * Created By: mjy 
 * Created on: 2014年11月22日 下午3:55:32
 * Copyright © 2013-2014 YYQ All rights reserved.
 ******************************************************************************/
package com.yyq.car.portal.ms.web.constant;

/**
 * <P>运营管理WEB层常量</P>
 * @author mjy
 */
public interface WebConstants {

	public String MESSAGE_KEY = "message";

	public String STATUS_KEY = "status";

	public String STATUS_VALUE_SUCCESS = "1";

	public String STATUS_VALUE_FAILED = "0";
	/**
	 * 多个失败的情况
	 */
	public String STATUS_VALUE_FAILED2 = "-1";

	public static final String startUserId = "startUserId";

	public String FILE_PREFIX = "03102610";// cjzj字母表顺序

	public String CANADACGD_PREFIX = "canadacgd";// 加拿大采购单

	public String MIDDLEEASTCGD_PREFIX = "middleEastcgd";// 中东采购单

	public String CANADACGD_PREFIXn = "Canadacgd";// 加拿大采购单

	public String MIDDLEEASTCGD_PREFIXn = "MiddleEastcgd";// 中东采购单

	public String CANADA_contract_PREFIX = "CanadaContract";// 加拿大合同

	public String MIDDLEEAST_contract_PREFIX = "MiddleEastContract";// 中东合同

	public String jnd = "海外业务(overseasBusiness)";
	public String sell = "销售业务(salesBusiness)";

	public String wholesale = "车辆批发";

	public String carSource = "零采车源渠道";
	public String carInStoreAudit = "车辆入库";
	public String carAccessory = "随车附件流转";
	public String mall = "商城";

}
