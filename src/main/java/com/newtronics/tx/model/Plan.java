package com.newtronics.tx.model;

import java.util.Date;
import java.util.UUID;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Plan {
	@Id
	private String planId;

	@Column(name = "create_date")
	@Temporal(TemporalType.TIMESTAMP)
	private Date createDate;

	private String customer;

	private String notifyNo;

	private String versionNo;

	private String model;

	private String bomNo;

	private String softVersionNo;

	private String orderQuantity;

	private String manufactureType;

	private String memo;

	@ManyToOne
	@JoinColumn(name = "creator_name")
	private User creator;

	@ManyToOne
	@JoinColumn(name = "reviewer_name")
	private User reviewer;

	@Column(name = "review_date")
	@Temporal(TemporalType.TIMESTAMP)
	private Date reviewDate;

	@ManyToOne
	@JoinColumn(name = "approver_name")
	private User approver;
	
	@Column(name = "approve_date")
	@Temporal(TemporalType.TIMESTAMP)
	private Date approveDate;

	public Plan() {
		this.planId = UUID.randomUUID().toString();
		this.createDate = new Date();
	}

	public String getPlanId() {
		return planId;
	}

	public void setPlanId(String planId) {
		this.planId = planId;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getCustomer() {
		return customer;
	}

	public void setCustomer(String customer) {
		this.customer = customer;
	}

	public String getNotifyNo() {
		return notifyNo;
	}

	public void setNotifyNo(String notifyNo) {
		this.notifyNo = notifyNo;
	}

	public String getVersionNo() {
		return versionNo;
	}

	public void setVersionNo(String versionNo) {
		this.versionNo = versionNo;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getBomNo() {
		return bomNo;
	}

	public void setBomNo(String bomNo) {
		this.bomNo = bomNo;
	}

	public String getSoftVersionNo() {
		return softVersionNo;
	}

	public void setSoftVersionNo(String softVersionNo) {
		this.softVersionNo = softVersionNo;
	}

	public String getOrderQuantity() {
		return orderQuantity;
	}

	public void setOrderQuantity(String orderQuantity) {
		this.orderQuantity = orderQuantity;
	}

	public String getManufactureType() {
		return manufactureType;
	}

	public void setManufactureType(String manufactureType) {
		this.manufactureType = manufactureType;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public User getCreator() {
		return creator;
	}

	public void setCreator(User creator) {
		this.creator = creator;
	}

	public User getReviewer() {
		return reviewer;
	}

	public void setReviewer(User reviewer) {
		this.reviewer = reviewer;
	}

	public User getApprover() {
		return approver;
	}

	public void setApprover(User approver) {
		this.approver = approver;
	}
}
