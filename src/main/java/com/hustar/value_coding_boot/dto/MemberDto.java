package com.hustar.value_coding_boot.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class MemberDto {
	private String me_id;
	private String me_password;
	private String me_nickname;
	private String me_regDate;
	private String me_devLang;
	
	
	public String getMe_id() {
		return me_id;
	}
	public void setMe_id(String me_id) {
		this.me_id = me_id;
	}
	public String getMe_password() {
		return me_password;
	}
	public void setMe_password(String me_password) {
		this.me_password = me_password;
	}
	public String getMe_nickname() {
		return me_nickname;
	}
	public void setMe_nickname(String me_nickname) {
		this.me_nickname = me_nickname;
	}

	public String getMe_regDate() {
		return me_regDate;
	}
	public void setMe_regDate(String me_regDate) {
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
		return "MemberVO [me_id=" + me_id + ", me_password=" + me_password + ", me_nickname=" + me_nickname + ", me_regDate="
				+ me_regDate + ", me_devLang=" + me_devLang + "]";
	}

}
