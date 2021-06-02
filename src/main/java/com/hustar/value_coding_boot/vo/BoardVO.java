package com.hustar.value_coding_boot.vo;

import java.time.LocalDateTime;

public class BoardVO {
	private int po_num; // 게시글 번호
	private String po_boardname; // 게시판 카테고리
	private String po_title; // 게시글 제목
	private String po_contents; // 게시글 내용
	private String po_file_path; // 첨부파일 경로
	private LocalDateTime po_datetime; // 작성일자
	private LocalDateTime po_updatetime; // 수정일자
	private String po_writer; // 작성자
	private int po_views; // 조회수
	private String po_noticeYn; // 공지 여부
	private String po_deleteYn; // 삭제 여부

	public int getPo_num() {
		return po_num;
	}

	public void setPo_num(int po_num) {
		this.po_num = po_num;
	}

	public String getPo_boardname() {
		return po_boardname;
	}

	public void setPo_boardname(String po_boardname) {
		this.po_boardname = po_boardname;
	}

	public String getPo_title() {
		return po_title;
	}

	public void setPo_title(String po_title) {
		this.po_title = po_title;
	}

	public String getPo_contents() {
		return po_contents;
	}

	public void setPo_contents(String po_contents) {
		this.po_contents = po_contents;
	}

	public String getPo_file_path() {
		return po_file_path;
	}

	public void setPo_file_path(String po_file_path) {
		this.po_file_path = po_file_path;
	}

	public LocalDateTime getPo_datetime() {
		return po_datetime;
	}

	public void setPo_datetime(LocalDateTime po_datetime) {
		this.po_datetime = po_datetime;
	}

	public LocalDateTime getPo_updatetime() {
		return po_updatetime;
	}

	public void setPo_updatetime(LocalDateTime po_updatetime) {
		this.po_updatetime = po_updatetime;
	}

	public String getPo_writer() {
		return po_writer;
	}

	public void setPo_writer(String po_writer) {
		this.po_writer = po_writer;
	}

	public int getPo_views() {
		return po_views;
	}

	public void setPo_views(int po_views) {
		this.po_views = po_views;
	}

	public String getPo_noticeYn() {
		return po_noticeYn;
	}

	public void setPo_noticeYn(String po_noticeYn) {
		this.po_noticeYn = po_noticeYn;
	}

	public String getPo_deleteYn() {
		return po_deleteYn;
	}

	public void setPo_deleteYn(String po_deleteYn) {
		this.po_deleteYn = po_deleteYn;
	}
	
	@Override
   public String toString() {
      return "";
   }

}
