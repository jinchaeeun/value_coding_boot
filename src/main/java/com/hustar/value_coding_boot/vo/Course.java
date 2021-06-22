package com.hustar.value_coding_boot.vo;

public class Course {

	private int noti_id;
	private String noti_message;
	private String noti_datetime;
	private String noti_alert_id;
	private int noti_po_num;

	public int getNoti_po_num() {
		return noti_po_num;
	}

	public void setNoti_po_num(int noti_po_num) {
		this.noti_po_num = noti_po_num;
	}

	public String getNoti_alert_id() {
		return noti_alert_id;
	}

	public void setNoti_alert_id(String noti_alert_id) {
		this.noti_alert_id = noti_alert_id;
	}

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
}
