/*******************************************************************************
 * Project   : portal-ms
 * Class Name: com.yyq.portal.ms.web.command.ShortMessageQueryCommand
 * Created By: Jonathan 
 * Created on: 2014-8-7 下午4:04:56
 * Copyright © 2008-2014 NATIE All rights reserved.
 ******************************************************************************/
package com.yyq.car.portal.ms.web.command;

/**
 * <P>TODO</P>
 * @author Jonathan
 */
public class SmsQueryCmd extends Pager {

	private String mobile;
	
	private int senderAccount;
	
	private int receiverAccount;
	
	private String sendDate;//起始时间
	
	private String endTime;//发送时间的截止时间
	
	private Integer status;


	/**
	 * @return the mobile
	 */
	public String getMobile() {
		return mobile;
	}

	/**
	 * @param mobile the mobile to set
	 */
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	/**
	 * @return the senderAccount
	 */
	public int getSenderAccount() {
		return senderAccount;
	}

	/**
	 * @param senderAccount the senderAccount to set
	 */
	public void setSenderAccount(int senderAccount) {
		this.senderAccount = senderAccount;
	}

	/**
	 * @return the receiverAccount
	 */
	public int getReceiverAccount() {
		return receiverAccount;
	}

	/**
	 * @param receiverAccount the receiverAccount to set
	 */
	public void setReceiverAccount(int receiverAccount) {
		this.receiverAccount = receiverAccount;
	}

	/**
	 * @return the sendDate
	 */
	public String getSendDate() {
		return sendDate;
	}

	/**
	 * @param sendDate the sendDate to set
	 */
	public void setSendDate(String sendDate) {
		this.sendDate = sendDate;
	}

	/**
	 * @return the status
	 */
	public Integer getStatus() {
		return status;
	}

	/**
	 * @param status the status to set
	 */
	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	
	
	
}
