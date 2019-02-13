/*******************************************************************************
 * Project   : decorate-portal-ms
 * Class Name: com.yyq.decorate.portal.ms.web.command.AccountQueryCmd
 * Created By: wangzh 
 * Created on: 2015年8月19日 下午1:49:53
 * Copyright © 2013-2014 YYQ All rights reserved.
 ******************************************************************************/
package com.yyq.car.portal.ms.web.command;

/**
 * <P>账户查询command</P>
 * @author wangzh
 */
public class AccountQueryCmd extends Pager {

	private String mobile;// 手机号码
	private String name;// 名称
	private String type;// 身份类型
	private String contact;// 联系方式
	private String yp;// 是否黄页会员
	private String mType;// b端或c端会员

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getYp() {
		return yp;
	}

	public void setYp(String yp) {
		this.yp = yp;
	}

	public String getmType() {
		return mType;
	}

	public void setmType(String mType) {
		this.mType = mType;
	}

}
