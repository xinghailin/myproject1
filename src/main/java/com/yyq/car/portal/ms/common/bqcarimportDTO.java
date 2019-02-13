/*******************************************************************************
 * Project   : decorate-portal-ms
 * Class Name: com.yyq.decorate.portal.ms.common.product.HouseHoldImportDTO
 * Created By: LKD 
 * Created on: 2016年3月3日 上午9:47:06
 * Copyright © 2013-2014 saltedFish All rights reserved.
 ******************************************************************************/
package com.yyq.car.portal.ms.common;

import pw.agiledev.e2e.annotation.ExcelEntity;
import pw.agiledev.e2e.annotation.ExcelProperty;


/**
 * <P>车辆导入DTO</P>
 * @author wangzh
 */
@ExcelEntity
public class bqcarimportDTO {
	@ExcelProperty(value = "品牌", required = true)
	private String brand;
	@ExcelProperty(value = "型号", required = true)
	private String model;
	@ExcelProperty(value = "版别", required = true)
	private String version;
	@ExcelProperty(value = "车架号", required = true)
	private String vin;
	@ExcelProperty(value = "价格（元）", required = true, regexp = "^[+]?(([1-9]\\d*)|0)([.]\\d+)?$", regexpErrorMessage = "价格（元）必须为有效数字")
	private String price;
	@ExcelProperty(value = "折扣价（元）", required = true, regexp = "^[+]?(([1-9]\\d*)|0)([.]\\d+)?$", regexpErrorMessage = "折扣价（元）必须为有效数字")
	private String disprice;
	@ExcelProperty(value = "库融池", required = true)
	private String poolid;
	@ExcelProperty(value = "外观颜色")
	private String outcolor;
	@ExcelProperty(value = "内饰颜色")
	private String incolor;
	@ExcelProperty(value = "合格证", required = true, regexp = "^[1]$", regexpErrorMessage = "合格证必须为1")
	private String cert1;
	@ExcelProperty(value = "一致性证书", required = true, regexp = "^[1]$", regexpErrorMessage = "一致性证书必须为1")
	private String cert2;
	@ExcelProperty(value = "环保清单", required = true, regexp = "^[1]$", regexpErrorMessage = "环保清单必须为1")
	private String cert3;

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}

	public String getVin() {
		return vin;
	}

	public void setVin(String vin) {
		this.vin = vin;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getDisprice() {
		return disprice;
	}

	public void setDisprice(String disprice) {
		this.disprice = disprice;
	}

	public String getPoolid() {
		return poolid;
	}

	public void setPoolid(String poolid) {
		this.poolid = poolid;
	}

	public String getOutcolor() {
		return outcolor;
	}

	public void setOutcolor(String outcolor) {
		this.outcolor = outcolor;
	}

	public String getIncolor() {
		return incolor;
	}

	public void setIncolor(String incolor) {
		this.incolor = incolor;
	}

	public String getCert1() {
		return cert1;
	}

	public void setCert1(String cert1) {
		this.cert1 = cert1;
	}

	public String getCert2() {
		return cert2;
	}

	public void setCert2(String cert2) {
		this.cert2 = cert2;
	}

	public String getCert3() {
		return cert3;
	}

	public void setCert3(String cert3) {
		this.cert3 = cert3;
	}

}
