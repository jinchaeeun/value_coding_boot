package com.hustar.value_coding_boot.vo;

import java.util.Date;

public class BoardFileVO {
	private int fi_num;
	private int po_num;
	private String fi_ori_filename;
	private String fi_filepath;
	private long fi_filesize;
	private Date fi_datetime;
	private Date fi_updatetime;
	private String fi_deleteYn;

	public int getFi_num() {
		return fi_num;
	}

	public void setFi_num(int fi_num) {
		this.fi_num = fi_num;
	}

	public int getPo_num() {
		return po_num;
	}

	public void setPo_num(int po_num) {
		this.po_num = po_num;
	}

	public String getFi_ori_filename() {
		return fi_ori_filename;
	}

	public void setFi_ori_filename(String fi_ori_filename) {
		this.fi_ori_filename = fi_ori_filename;
	}

	public String getFi_filepath() {
		return fi_filepath;
	}

	public void setFi_filepath(String fi_filepath) {
		this.fi_filepath = fi_filepath;
	}

	public long getFi_filesize() {
		return fi_filesize;
	}

	public void setFi_filesize(long fi_filesize) {
		this.fi_filesize = fi_filesize;
	}

	public Date getFi_datetime() {
		return fi_datetime;
	}

	public void setFi_datetime(Date fi_datetime) {
		this.fi_datetime = fi_datetime;
	}

	public Date getFi_updatetime() {
		return fi_updatetime;
	}

	public void setFi_updatetime(Date fi_updatetime) {
		this.fi_updatetime = fi_updatetime;
	}

	public String getFi_deleteYn() {
		return fi_deleteYn;
	}

	public void setFi_deleteYn(String fi_deleteYn) {
		this.fi_deleteYn = fi_deleteYn;
	}
}
