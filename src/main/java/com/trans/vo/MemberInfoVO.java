package com.trans.vo;

public class MemberInfoVO {

//	mi_num	int
//	mi_name	varchar(10)
//	mi_birth	char(8)
//	mi_email	varchar(100)
//	mi_id	varchar(30)
//	mi_password	varchar(30)
//	mi_lvl	char(1)
//	credate	char(8)
//	cretime	char(6)
//	moddate	char(8)
//	modtime	char(6)

	private int miNum;
	private String miName;
	private String miBirth;
	private String miEmail;
	private String miId;
	private String miPassword;
	private String miLvl;
	private String credate;
	private String cretime;
	private String moddate;
	private String modtime;

	public int getMiNum() {
		return miNum;
	}

	public void setMiNum(int miNum) {
		this.miNum = miNum;
	}

	public String getMiName() {
		return miName;
	}

	public void setMiName(String miName) {
		this.miName = miName;
	}

	public String getMiBirth() {
		return miBirth;
	}

	public void setMiBirth(String miBirth) {
		this.miBirth = miBirth;
	}

	public String getMiEmail() {
		return miEmail;
	}

	public void setMiEmail(String miEmail) {
		this.miEmail = miEmail;
	}

	public String getMiId() {
		return miId;
	}

	public void setMiId(String miId) {
		this.miId = miId;
	}

	public String getMiPassword() {
		return miPassword;
	}

	public void setMiPassword(String miPassword) {
		this.miPassword = miPassword;
	}

	public String getMiLvl() {
		return miLvl;
	}

	public void setMiLvl(String miLvl) {
		this.miLvl = miLvl;
	}

	public String getCredate() {
		return credate;
	}

	public void setCredate(String credate) {
		this.credate = credate;
	}

	public String getCretime() {
		return cretime;
	}

	public void setCretime(String cretime) {
		this.cretime = cretime;
	}

	public String getModdate() {
		return moddate;
	}

	public void setModdate(String moddate) {
		this.moddate = moddate;
	}

	public String getModtime() {
		return modtime;
	}

	public void setModtime(String modtime) {
		this.modtime = modtime;
	}

	@Override
	public String toString() {
		return "MemberInfoVO [miNum=" + miNum + ", miName=" + miName + ", miBirth=" + miBirth + ", miEmail=" + miEmail
				+ ", miId=" + miId + ", miPassword=" + miPassword + ", miLvl=" + miLvl + ", credate=" + credate
				+ ", cretime=" + cretime + ", moddate=" + moddate + ", modtime=" + modtime + "]";
	}

}
