/*******************************************************************************
 * Project   : car-ms
 * Class Name: com.yyq.car.portal.ms.common.BigDecimalExcelType
 * Created By: wangzh 
 * Created on: 2017年7月7日 下午3:41:25
 * Copyright © 2013-2014 YYQ All rights reserved.
 ******************************************************************************/
package com.yyq.car.portal.ms.common;

import java.math.BigDecimal;

import pw.agiledev.e2e.extension.ExcelType;


/**
 * <P>TODO</P>
 * @author wangzh
 */
public class BigDecimalExcelType extends ExcelType<BigDecimal> {

	/**
	 * <p>Method for constructor</p>
	 */
	public BigDecimalExcelType() {
		// TODO Auto-generated constructor stub
	}

	/*
	 * (non-Javadoc)
	 * @see pw.agiledev.e2e.extension.ExcelType#parseValue(java.lang.String)
	 * @author wangzh
	 */
	@Override
	public BigDecimal parseValue(String value) {
		// TODO Auto-generated method stub
		// return null;
		return new BigDecimal(value);
	}

}
