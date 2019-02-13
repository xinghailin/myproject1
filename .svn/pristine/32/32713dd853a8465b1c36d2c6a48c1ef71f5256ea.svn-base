package com.yyq.car.portal.ms.web.util.smschuanglan;

import java.util.List;

/**
 * @author tianyh 
 * @Description:上行明细响应实体类
 */
public class PullResult {
	/**
	 * 场景名   ID
	 */
	private String uid;
	/**
	 * 消息ID
	 */
	private String msgId;
	/**
	 * 状态更新时间
	 */
	private String reportTime;
	/**
	 * 253平台收到运营商回复状态报告的时间
	 */
	private String notifyTime;
	
	
	/**
	 * 接收短信的手机号码
	 */
	private String mobile;
	/**
	 * 状态（详细参考状态报告状态码）
	 */
	private String status;
	/**
	 * 状态说明
	 */
	private String statusDesc;
	/**
	 * 拉取个数
	 */
	private String count;
	public String getMsgId() {
		return msgId;
	}
	public void setMsgId(String msgId) {
		this.msgId = msgId;
	}
	public String getReportTime() {
		return reportTime;
	}
	public void setReportTime(String reportTime) {
		this.reportTime = reportTime;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getStatusDesc() {
		return statusDesc;
	}
	public void setStatusDesc(String statusDesc) {
		this.statusDesc = statusDesc;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	public PullResult(String msgId, String reportTime, String mobile, String status, String statusDesc, String count) {
		super();
		this.msgId = msgId;
		this.reportTime = reportTime;
		this.mobile = mobile;
		this.status = status;
		this.statusDesc = statusDesc;
		this.count = count;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getNotifyTime() {
		return notifyTime;
	}
	public void setNotifyTime(String notifyTime) {
		this.notifyTime = notifyTime;
	}
	public PullResult(String uid, String msgId, String reportTime, String notifyTime, String mobile, String status,
			String statusDesc, String count) {
		super();
		this.uid = uid;
		this.msgId = msgId;
		this.reportTime = reportTime;
		this.notifyTime = notifyTime;
		this.mobile = mobile;
		this.status = status;
		this.statusDesc = statusDesc;
		this.count = count;
	}
	public PullResult() {
		super();
		// TODO Auto-generated constructor stub
	}
	
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", uid=").append(uid);
        sb.append(", msgId=").append(msgId);
        sb.append(", reportTime=").append(reportTime);
        sb.append(", notifyTime=").append(notifyTime);
        sb.append(", mobile=").append(mobile);
        sb.append(", status=").append(status);
        sb.append(", statusDesc=").append(statusDesc);
        sb.append(", count=").append(count);
        sb.append("]");
        return sb.toString();
    }

	
}
