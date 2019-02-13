/*******************************************************************************
 * Project   : car-ms
 * Class Name: com.yyq.car.portal.ms.web.command.ApplypaySaveCmd
 * Created By: wangzh 
 * Created on: 2017年12月14日 下午5:01:25
 * Copyright © 2013-2014 YYQ All rights reserved.
 ******************************************************************************/
package com.yyq.car.portal.ms.web.command;

import java.math.BigDecimal;

import org.springframework.web.multipart.MultipartFile;


/**
 * <P>合同保存cmd</P>
 * @author wangzh
 */
public class ContractSaveCmd {

	private String newadd;// 新增标示

	private String currpage;// 当前页

	private Integer id;

	private Integer buyid;

	private Integer subbuyid;

	private String code;// 合同编号

	private MultipartFile texturl;// 合同文件

	private MultipartFile purfile;// 采购文件

	private String _texturl;

	private String text1url;

	private Integer stamp;

	private String sname;// 供应方名称

	private String sadd;// 供应方地址

	private String sidtype;// 证件类型

	private String sno;// 证件编号

	private String sphone;// 联系方式

	private String pname;// 采购方名称

	private String padd;// 采购方地址

	private String pidtype;// 证件类型

	private String pno;// 证件号

	private String pphone;// 联系方式

	private String brand;// 品牌

	private String model;// 型号

	private String version;// 版别

	private String displacement;// 排量

	private String outcolor;// 外饰颜色

	private String incolor;// 内饰颜色

	private String trim;// 改装

	private String price;// 车价

	private Integer num;// 数量

	private String remark;// 备注

	private String cmsn1;// 佣金

	private String cmsn2;

	private String cmsn3;

	private String cmsn4;

	private String cmsn5;

	private String other1;// 其他费用

	private String other2;

	private String other3;

	private String other4;

	private String other5;

	private String apponitadd;// 约定入库地址

	private String appointtime;// 约定入库时间

	private String insurance;// 保险费

	private String transprice;// 运费

	private String transname;// 运输方名称

	private String paytype;// 付款类型

	private String selfbuy;// 1自采2代采

	private String status;

	private String trim1;// 改装1

	private String trim2;

	private String trim3;

	private String trim4;

	private String trim5;

	private String trim6;

	private String trim7;

	private String trim8;

	private String trim9;

	private String trim10;

	private String trim11;

	private String trim12;

	private String trimprice;// 加装费总和

	private BigDecimal t1price;// 加装费1
	private BigDecimal t2price;
	private BigDecimal t3price;
	private BigDecimal t4price;

	private BigDecimal t5price;// 加装费5
	private BigDecimal t6price;
	private BigDecimal t7price;
	private BigDecimal t8price;

	private BigDecimal t9price;// 加装费5
	private BigDecimal t10price;
	private BigDecimal t11price;
	private BigDecimal t12price;

	private BigDecimal issuingprice;// 开证价

	private String rejectreason1;

	private String rejectreason2;

	private String rejectreason3;

	private String downpay;// 定金

	private String finalpay;// 尾款

	private String autotprice;// 自动计算出的全款

	private Integer apaylock;

	private String totalprice;// 用户填写的全款

	private String nopass;// 1 代表不通过 解锁子计划车辆

	private String config;// 配置

	private String othercost;// 4s杂费

	private String expensetax;// 消费税

	private String activepurchaser;// 主动采购方
	private String mallcode;// 商城合同编号

	private BigDecimal preinsuranceprice;// 预估保险费
	private BigDecimal predrayageprice;// 预估短驳费
	private BigDecimal prelicenseprice;// 预估执照费
	private BigDecimal preoilprice;// 预估燃油费

	public String getMallcode() {
		return mallcode;
	}

	public void setMallcode(String mallcode) {
		this.mallcode = mallcode;
	}

	public String getTrim9() {
		return trim9;
	}

	public void setTrim9(String trim9) {
		this.trim9 = trim9;
	}

	public String getTrim10() {
		return trim10;
	}

	public void setTrim10(String trim10) {
		this.trim10 = trim10;
	}

	public String getTrim11() {
		return trim11;
	}

	public void setTrim11(String trim11) {
		this.trim11 = trim11;
	}

	public String getTrim12() {
		return trim12;
	}

	public void setTrim12(String trim12) {
		this.trim12 = trim12;
	}

	public BigDecimal getT9price() {
		return t9price;
	}

	public void setT9price(BigDecimal t9price) {
		this.t9price = t9price;
	}

	public BigDecimal getT10price() {
		return t10price;
	}

	public void setT10price(BigDecimal t10price) {
		this.t10price = t10price;
	}

	public BigDecimal getT11price() {
		return t11price;
	}

	public void setT11price(BigDecimal t11price) {
		this.t11price = t11price;
	}

	public BigDecimal getT12price() {
		return t12price;
	}

	public void setT12price(BigDecimal t12price) {
		this.t12price = t12price;
	}

	public BigDecimal getPreinsuranceprice() {
		return preinsuranceprice;
	}

	public void setPreinsuranceprice(BigDecimal preinsuranceprice) {
		this.preinsuranceprice = preinsuranceprice;
	}

	public BigDecimal getPredrayageprice() {
		return predrayageprice;
	}

	public void setPredrayageprice(BigDecimal predrayageprice) {
		this.predrayageprice = predrayageprice;
	}

	public BigDecimal getPrelicenseprice() {
		return prelicenseprice;
	}

	public void setPrelicenseprice(BigDecimal prelicenseprice) {
		this.prelicenseprice = prelicenseprice;
	}

	public BigDecimal getPreoilprice() {
		return preoilprice;
	}

	public void setPreoilprice(BigDecimal preoilprice) {
		this.preoilprice = preoilprice;
	}

	public String getActivepurchaser() {
		return activepurchaser;
	}

	public void setActivepurchaser(String activepurchaser) {
		this.activepurchaser = activepurchaser;
	}

	public BigDecimal getIssuingprice() {
		return issuingprice;
	}

	public void setIssuingprice(BigDecimal issuingprice) {
		this.issuingprice = issuingprice;
	}

	public String getSelfbuy() {
		return selfbuy;
	}

	public void setSelfbuy(String selfbuy) {
		this.selfbuy = selfbuy;
	}

	public MultipartFile getPurfile() {
		return purfile;
	}

	public void setPurfile(MultipartFile purfile) {
		this.purfile = purfile;
	}

	public BigDecimal getT1price() {
		return t1price;
	}

	public void setT1price(BigDecimal t1price) {
		this.t1price = t1price;
	}

	public BigDecimal getT2price() {
		return t2price;
	}

	public void setT2price(BigDecimal t2price) {
		this.t2price = t2price;
	}

	public BigDecimal getT3price() {
		return t3price;
	}

	public void setT3price(BigDecimal t3price) {
		this.t3price = t3price;
	}

	public BigDecimal getT4price() {
		return t4price;
	}

	public void setT4price(BigDecimal t4price) {
		this.t4price = t4price;
	}

	public String getOthercost() {
		return othercost;
	}

	public void setOthercost(String othercost) {
		this.othercost = othercost;
	}

	public String getExpensetax() {
		return expensetax;
	}

	public void setExpensetax(String expensetax) {
		this.expensetax = expensetax;
	}

	public String getNewadd() {
		return newadd;
	}

	public void setNewadd(String newadd) {
		this.newadd = newadd;
	}

	public String getCurrpage() {
		return currpage;
	}

	public void setCurrpage(String currpage) {
		this.currpage = currpage;
	}

	public String getNopass() {
		return nopass;
	}

	public void setNopass(String nopass) {
		this.nopass = nopass;
	}

	public String getConfig() {
		return config;
	}

	public void setConfig(String config) {
		this.config = config;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getBuyid() {
		return buyid;
	}

	public void setBuyid(Integer buyid) {
		this.buyid = buyid;
	}

	public Integer getSubbuyid() {
		return subbuyid;
	}

	public void setSubbuyid(Integer subbuyid) {
		this.subbuyid = subbuyid;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public MultipartFile getTexturl() {
		return texturl;
	}

	public void setTexturl(MultipartFile texturl) {
		this.texturl = texturl;
	}

	public String get_texturl() {
		return _texturl;
	}

	public void set_texturl(String _texturl) {
		this._texturl = _texturl;
	}

	public String getText1url() {
		return text1url;
	}

	public void setText1url(String text1url) {
		this.text1url = text1url;
	}

	public Integer getStamp() {
		return stamp;
	}

	public void setStamp(Integer stamp) {
		this.stamp = stamp;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public String getSadd() {
		return sadd;
	}

	public void setSadd(String sadd) {
		this.sadd = sadd;
	}

	public String getSidtype() {
		return sidtype;
	}

	public void setSidtype(String sidtype) {
		this.sidtype = sidtype;
	}

	public String getSno() {
		return sno;
	}

	public void setSno(String sno) {
		this.sno = sno;
	}

	public String getSphone() {
		return sphone;
	}

	public void setSphone(String sphone) {
		this.sphone = sphone;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getPadd() {
		return padd;
	}

	public void setPadd(String padd) {
		this.padd = padd;
	}

	public String getPidtype() {
		return pidtype;
	}

	public void setPidtype(String pidtype) {
		this.pidtype = pidtype;
	}

	public String getPno() {
		return pno;
	}

	public void setPno(String pno) {
		this.pno = pno;
	}

	public String getPphone() {
		return pphone;
	}

	public void setPphone(String pphone) {
		this.pphone = pphone;
	}

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

	public String getDisplacement() {
		return displacement;
	}

	public void setDisplacement(String displacement) {
		this.displacement = displacement;
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

	public String getTrim() {
		return trim;
	}

	public void setTrim(String trim) {
		this.trim = trim;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
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

	public String getApponitadd() {
		return apponitadd;
	}

	public void setApponitadd(String apponitadd) {
		this.apponitadd = apponitadd;
	}

	public String getAppointtime() {
		return appointtime;
	}

	public void setAppointtime(String appointtime) {
		this.appointtime = appointtime;
	}

	public String getInsurance() {
		return insurance;
	}

	public void setInsurance(String insurance) {
		this.insurance = insurance;
	}

	public String getTransprice() {
		return transprice;
	}

	public void setTransprice(String transprice) {
		this.transprice = transprice;
	}

	public String getTransname() {
		return transname;
	}

	public void setTransname(String transname) {
		this.transname = transname;
	}

	public String getPaytype() {
		return paytype;
	}

	public void setPaytype(String paytype) {
		this.paytype = paytype;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getTrim1() {
		return trim1;
	}

	public void setTrim1(String trim1) {
		this.trim1 = trim1;
	}

	public String getTrim2() {
		return trim2;
	}

	public void setTrim2(String trim2) {
		this.trim2 = trim2;
	}

	public String getTrim3() {
		return trim3;
	}

	public void setTrim3(String trim3) {
		this.trim3 = trim3;
	}

	public String getTrim4() {
		return trim4;
	}

	public void setTrim4(String trim4) {
		this.trim4 = trim4;
	}

	public String getTrim5() {
		return trim5;
	}

	public void setTrim5(String trim5) {
		this.trim5 = trim5;
	}

	public String getTrimprice() {
		return trimprice;
	}

	public void setTrimprice(String trimprice) {
		this.trimprice = trimprice;
	}

	public String getRejectreason1() {
		return rejectreason1;
	}

	public void setRejectreason1(String rejectreason1) {
		this.rejectreason1 = rejectreason1;
	}

	public String getRejectreason2() {
		return rejectreason2;
	}

	public void setRejectreason2(String rejectreason2) {
		this.rejectreason2 = rejectreason2;
	}

	public String getRejectreason3() {
		return rejectreason3;
	}

	public void setRejectreason3(String rejectreason3) {
		this.rejectreason3 = rejectreason3;
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

	public String getAutotprice() {
		return autotprice;
	}

	public void setAutotprice(String autotprice) {
		this.autotprice = autotprice;
	}

	public Integer getApaylock() {
		return apaylock;
	}

	public void setApaylock(Integer apaylock) {
		this.apaylock = apaylock;
	}

	public String getTotalprice() {
		return totalprice;
	}

	public void setTotalprice(String totalprice) {
		this.totalprice = totalprice;
	}

	public String getTrim6() {
		return trim6;
	}

	public void setTrim6(String trim6) {
		this.trim6 = trim6;
	}

	public String getTrim7() {
		return trim7;
	}

	public void setTrim7(String trim7) {
		this.trim7 = trim7;
	}

	public String getTrim8() {
		return trim8;
	}

	public void setTrim8(String trim8) {
		this.trim8 = trim8;
	}

	public BigDecimal getT5price() {
		return t5price;
	}

	public void setT5price(BigDecimal t5price) {
		this.t5price = t5price;
	}

	public BigDecimal getT6price() {
		return t6price;
	}

	public void setT6price(BigDecimal t6price) {
		this.t6price = t6price;
	}

	public BigDecimal getT7price() {
		return t7price;
	}

	public void setT7price(BigDecimal t7price) {
		this.t7price = t7price;
	}

	public BigDecimal getT8price() {
		return t8price;
	}

	public void setT8price(BigDecimal t8price) {
		this.t8price = t8price;
	}

}
