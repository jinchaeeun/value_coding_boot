package com.hustar.value_coding_boot.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class MemberDto {
	private String me_id;
	private String me_password;
	private String me_nickname;
	private String me_singup_type;
	
	
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
	public String getMe_singup_type() {
		return me_singup_type;
	}
	public void setMe_singup_type(String me_singup_type) {
		this.me_singup_type = me_singup_type;
	}

}
