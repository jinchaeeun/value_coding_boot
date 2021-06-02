package com.hustar.value_coding_boot.vo;

import java.util.Date;

public class MemberVO {
	
	private String userId;
	private String userPass;
	private String userNickName;
	private Date regDate;
	private String devLang;
	

	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPass() {
		return userPass;
	}
	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}
	public String getuserNickName() {
		return userNickName;
	}
	public void setuserNickName(String userNickName) {
		this.userNickName = userNickName;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	public String getDevLang() {
		return devLang;
	}
	public void setDevLang(String devLang) {
		this.devLang = devLang;
	}
	@Override
	public String toString() {
		return "MemberVO [userId=" + userId + ", userPass=" + userPass + ", userNickName=" + userNickName + ", regDate="
				+ regDate + ", devLang=" + devLang + "]";
	}
	
}