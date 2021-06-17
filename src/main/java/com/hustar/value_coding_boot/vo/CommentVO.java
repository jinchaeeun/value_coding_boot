package com.hustar.value_coding_boot.vo;

import java.util.Date;

import lombok.Data;

@Data
public class CommentVO {
	private int co_idx; // 댓글번호
	private int co_post_num; // 게시판번호
	private String co_user_id; // 작성자id
	private String co_comments; // 댓글
	private Date co_datetime; // 작성일자
	
	
	public int getCo_idx() {
		return co_idx;
	}
	public void setCo_idx(int co_idx) {
		this.co_idx = co_idx;
	}
	public int getCo_post_num() {
		return co_post_num;
	}
	public void setCo_post_num(int co_post_num) {
		this.co_post_num = co_post_num;
	}
	public String getCo_user_id() {
		return co_user_id;
	}
	public void setCo_user_id(String co_user_id) {
		this.co_user_id = co_user_id;
	}
	public String getCo_comments() {
		return co_comments;
	}
	public void setCo_comments(String co_comments) {
		this.co_comments = co_comments;
	}
	public Date getCo_datetime() {
		return co_datetime;
	}
	public void setCo_datetime(Date co_datetime) {
		this.co_datetime = co_datetime;
	}
	
}
