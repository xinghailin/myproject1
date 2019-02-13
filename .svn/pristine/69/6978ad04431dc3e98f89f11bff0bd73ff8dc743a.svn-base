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
public class CarsImportDTO {
	@ExcelProperty(value = "品牌", required = true)
	private String brand;
	@ExcelProperty(value = "型号")
	private String model;
	@ExcelProperty(value = "车架号", required = true)
	private String vin;
	@ExcelProperty(value = "发动机号")
	private String engineNum;
	@ExcelProperty(value = "长宽高")
	private String lenWidHei;
	@ExcelProperty(value = "排量")
	private String displacement;
	@ExcelProperty(value = "综合油耗")
	private String oilWear;
	@ExcelProperty(value = "排放")
	private String discharge;
	@ExcelProperty(value = "整体质量")
	private String weight;
	@ExcelProperty(value = "外观颜色")
	private String outlookColor;
	@ExcelProperty(value = "内饰颜色")
	private String innerColor;
	@ExcelProperty(value = "车身级别")
	private String level;
	@ExcelProperty(value = "变速箱")
	private String gearbox;
	@ExcelProperty(value = "能源类型", regexp = "^[123]$", regexpErrorMessage = "能源类型必须为1或2或3")
	private String energyType;
	@ExcelProperty(value = "出厂日期")
	private String leaveFactoryTime;
	@ExcelProperty(value = "采购价", regexp = "^[+]?(([1-9]\\d*)|0)([.]\\d+)?$", regexpErrorMessage = "采购价必须为有效数字")
	private String buyPrice;// 采购价
	@ExcelProperty(value = "最低销售价", regexp = "^[+]?(([1-9]\\d*)|0)([.]\\d+)?$", regexpErrorMessage = "最低销售价必须为有效数字")
	private String lowPrice;// 最低销售价
	@ExcelProperty(value = "仓库")
	private String address;// 仓库地址-关联仓库主键
	@ExcelProperty(value = "经销商名称")
	private String buyName;// 采购商名称
	@ExcelProperty(value = "加装")
	private String decorate;// 加装
	@ExcelProperty(value = "真实可售", regexp = "^[1-9]$", regexpErrorMessage = "真实可售必须为1到9的数字")
	private Integer realSale;// 真实可售

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

	public String getEngineNum() {
		return engineNum;
	}

	public void setEngineNum(String engineNum) {
		this.engineNum = engineNum;
	}

	public String getLenWidHei() {
		return lenWidHei;
	}

	public void setLenWidHei(String lenWidHei) {
		this.lenWidHei = lenWidHei;
	}

	public String getDisplacement() {
		return displacement;
	}

	public void setDisplacement(String displacement) {
		this.displacement = displacement;
	}

	public String getOilWear() {
		return oilWear;
	}

	public void setOilWear(String oilWear) {
		this.oilWear = oilWear;
	}

	public String getDischarge() {
		return discharge;
	}

	public void setDischarge(String discharge) {
		this.discharge = discharge;
	}

	public String getWeight() {
		return weight;
	}

	public void setWeight(String weight) {
		this.weight = weight;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public String getGearbox() {
		return gearbox;
	}

	public void setGearbox(String gearbox) {
		this.gearbox = gearbox;
	}

	public String getEnergyType() {
		return energyType;
	}

	public void setEnergyType(String energyType) {
		this.energyType = energyType;
	}

	public String getLeaveFactoryTime() {
		return leaveFactoryTime;
	}

	public void setLeaveFactoryTime(String leaveFactoryTime) {
		this.leaveFactoryTime = leaveFactoryTime;
	}

	public String getOutlookColor() {
		return outlookColor;
	}

	public void setOutlookColor(String outlookColor) {
		this.outlookColor = outlookColor;
	}

	public String getInnerColor() {
		return innerColor;
	}

	public void setInnerColor(String innerColor) {
		this.innerColor = innerColor;
	}

	public String getVin() {
		return vin;
	}

	public void setVin(String vin) {
		this.vin = vin;
	}

	public String getBuyPrice() {
		return buyPrice;
	}

	public void setBuyPrice(String buyPrice) {
		this.buyPrice = buyPrice;
	}

	public String getLowPrice() {
		return lowPrice;
	}

	public void setLowPrice(String lowPrice) {
		this.lowPrice = lowPrice;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getBuyName() {
		return buyName;
	}

	public void setBuyName(String buyName) {
		this.buyName = buyName;
	}

	public String getDecorate() {
		return decorate;
	}

	public void setDecorate(String decorate) {
		this.decorate = decorate;
	}

	public Integer getRealSale() {
		return realSale;
	}

	public void setRealSale(Integer realSale) {
		this.realSale = realSale;
	}
}
