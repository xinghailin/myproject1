/*******************************************************************************
 * Project   : car-ms
 * Class Name: com.yyq.car.portal.ms.web.command.ApplypaySaveCmd
 * Created By: wangzh 
 * Created on: 2017年12月14日 下午5:01:25
 * Copyright © 2013-2014 YYQ All rights reserved.
 ******************************************************************************/
package com.yyq.car.portal.ms.web.command;

/**
 * <P>TODO</P>
 * @author wangzh
 */
public class ApplypaySaveCmd {

	private Integer id;

	private Integer subbuyid;

	private Integer num;

	private Integer tostoreid;

	private String appointtime;

	private String paytime;

	private String totalprice;

	private String rebate;

	private String othercost;

	private String latecost;

	private String salecost;

	private String insurance;

	private String expensetax;

	private String status;

	private String supplyname;

	private String config;

	private String outcolor;

	private String incolor;

	private String adjust;

	String cmsn1;
	String cmsn2;
	String cmsn3;
	String cmsn4;
	String cmsn5;
	String other1;
	String other2;
	String other3;
	String other4;
	String other5;
	String transcost;
	String transname;

	private String paytype;// 付款类型1全款2预定

	private String downpay;// 定金

	private String shouldfp;// 自动计算出的应付

	private String finalpay;// 尾款

	String contract;// 合同

	public String getShouldfp() {
		return shouldfp;
	}

	public void setShouldfp(String shouldfp) {
		this.shouldfp = shouldfp;
	}

	public String getContract() {
		return contract;
	}

	public void setContract(String contract) {
		this.contract = contract;
	}

	public String getPaytype() {
		return paytype;
	}

	public void setPaytype(String paytype) {
		this.paytype = paytype;
	}

	public String getDownpay() {
		return downpay;
	}

	public void setDownpay(String downpay) {
		this.downpay = downpay;
	}

	public String getFinalpay() {
		return finalpay;
	}

	public void setFinalpay(String finalpay) {
		this.finalpay = finalpay;
	}

	public String getCmsn1() {
		return cmsn1;
	}

	public void setCmsn1(String cmsn1) {
		this.cmsn1 = cmsn1;
	}

	public String getCmsn2() {
		return cmsn2;
	}

	public void setCmsn2(String cmsn2) {
		this.cmsn2 = cmsn2;
	}

	public String getCmsn3() {
		return cmsn3;
	}

	public void setCmsn3(String cmsn3) {
		this.cmsn3 = cmsn3;
	}

	public String getCmsn4() {
		return cmsn4;
	}

	public void setCmsn4(String cmsn4) {
		this.cmsn4 = cmsn4;
	}

	public String getCmsn5() {
		return cmsn5;
	}

	public void setCmsn5(String cmsn5) {
		this.cmsn5 = cmsn5;
	}

	public String getOther1() {
		return other1;
	}

	public void setOther1(String other1) {
		this.other1 = other1;
	}

	public String getOther2() {
		return other2;
	}

	public void setOther2(String other2) {
		this.other2 = other2;
	}

	public String getOther3() {
		return other3;
	}

	public void setOther3(String other3) {
		this.other3 = other3;
	}

	public String getOther4() {
		return other4;
	}

	public void setOther4(String other4) {
		this.other4 = other4;
	}

	public String getOther5() {
		return other5;
	}

	public void setOther5(String other5) {
		this.other5 = other5;
	}

	public String getTranscost() {
		return transcost;
	}

	public void setTranscost(String transcost) {
		this.transcost = transcost;
	}

	public String getTransname() {
		return transname;
	}

	public void setTransname(String transname) {
		this.transname = transname;
	}

	public String getConfig() {
		return config;
	}

	public void setConfig(String config) {
		this.config = config;
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

	public String getAdjust() {
		return adjust;
	}

	public void setAdjust(String adjust) {
		this.adjust = adjust;
	}

	public Integer getId() {
		return id;
	}

	public Integer getSubbuyid() {
		return subbuyid;
	}

	public Integer getNum() {
		return num;
	}

	public Integer getTostoreid() {
		return tostoreid;
	}

	public String getAppointtime() {
		return appointtime;
	}

	public String getPaytime() {
		return paytime;
	}

	public String getTotalprice() {
		return totalprice;
	}

	public String getRebate() {
		return rebate;
	}

	public String getOthercost() {
		return othercost;
	}

	public String getLatecost() {
		return latecost;
	}

	public String getSalecost() {
		return salecost;
	}

	public String getInsurance() {
		return insurance;
	}

	public String getExpensetax() {
		return expensetax;
	}

	public String getStatus() {
		return status;
	}

	public String getSupplyname() {
		return supplyname;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public void setSubbuyid(Integer subbuyid) {
		this.subbuyid = subbuyid;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

	public void setTostoreid(Integer tostoreid) {
		this.tostoreid = tostoreid;
	}

	public void setAppointtime(String appointtime) {
		this.appointtime = appointtime;
	}

	public void setPaytime(String paytime) {
		this.paytime = paytime;
	}

	public void setTotalprice(String totalprice) {
		this.totalprice = totalprice;
	}

	public void setRebate(String rebate) {
		this.rebate = rebate;
	}

	public void setOthercost(String othercost) {
		this.othercost = othercost;
	}

	public void setLatecost(String latecost) {
		this.latecost = latecost;
	}

	public void setSalecost(String salecost) {
		this.salecost = salecost;
	}

	public void setInsurance(String insurance) {
		this.insurance = insurance;
	}

	public void setExpensetax(String expensetax) {
		this.expensetax = expensetax;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public void setSupplyname(String supplyname) {
		this.supplyname = supplyname;
	}

}
