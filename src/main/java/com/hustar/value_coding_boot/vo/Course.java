package com.hustar.value_coding_boot.vo;

import java.util.Date;

public class Course {

	private int noti_id;
	private String noti_message;
	private String noti_datetime;
	private String noti_check;

	public int getNoti_id() {
		return noti_id;
	}

	public void setNoti_id(int noti_id) {
		this.noti_id = noti_id;
	}
	
	public String getNoti_message() {
		return noti_message;
	}

	public void setNoti_message(String noti_message) {
		this.noti_message = noti_message;
	}

	public String getNoti_datetime() {
		return noti_datetime;
	}

	public void setNoti_datetime(String noti_datetime) {
		this.noti_datetime = noti_datetime;
	}
	
	public String getNoti_check() {
		return noti_check;
	}

	public void setNoti_check(String noti_check) {
		this.noti_check = noti_check;
	}
}
