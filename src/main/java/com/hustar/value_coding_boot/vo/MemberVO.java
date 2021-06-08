package com.hustar.value_coding_boot.vo;

import java.util.Date;

public class MemberVO {
	
	private String me_id;
	private String me_pass;
	private String me_nickName;
	private Date me_regDate;
	private String me_devLang;
	


	public String getMe_id() {
		return me_id;
	}



	public void setMe_id(String me_id) {
		this.me_id = me_id;
	}



	public String getMe_pass() {
		return me_pass;
	}



	public void setMe_pass(String me_pass) {
		this.me_pass = me_pass;
	}



	public String getMe_nickName() {
		return me_nickName;
	}



	public void setMe_nickName(String me_nickName) {
		this.me_nickName = me_nickName;
	}
	

	
	public Date getMe_regDate() {
		return me_regDate;
	}



	public void setMe_regDate(Date me_regDate) {
		this.me_regDate = me_regDate;
	}



	public String getMe_devLang() {
		return me_devLang;
	}



	public void setMe_devLang(String me_devLang) {
		this.me_devLang = me_devLang;
	}



	@Override
	public String toString() {
		return "MemberVO [me_id=" + me_id + ", me_pass=" + me_pass + ", me_nickName=" + me_nickName + ", me_regDate="
				+ me_regDate + ", me_devLang=" + me_devLang + "]";
	}
	
}