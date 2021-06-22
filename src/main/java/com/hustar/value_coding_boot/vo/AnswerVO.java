package com.hustar.value_coding_boot.vo;

import java.util.Date;

public class AnswerVO {
	private int ans_num;  // 답글 번호
	private int ans_po_num;  // 게시글 번호
	private String ans_boardname;  // 답글이 달린 게시판
	private String ans_contents;  // 답글 내용
	private Date ans_datetime;  // 답글 작성일
	private Date ans_updatetime;  // 답글 수정일
	private String ans_writer;  // 답글 작성자
	private String ans_writer_Id;  // 답글 작성자 ID
	private int ans_hots;  // 답글 좋아요 수
	private String ans_deleteYn;  // 답글 삭제여부
	
	private int ans_group_num;  // 답글 묶음
	private int ans_group_order;  // 답글 순서
	private int ans_depth;  // 답글 깊이

	/* BoardVO 조인하기 위해서 */
	private int po_num; // 게시글 번호
	private String po_boardname; // 게시판 카테고리
	private String po_title; // 게시글 제목
	private int po_ans_cnt; // 답변수
	
	
	public int getAns_group_num() {
		return ans_group_num;
	}

	public void setAns_group_num(int ans_group_num) {
		this.ans_group_num = ans_group_num;
	}

	public int getAns_group_order() {
		return ans_group_order;
	}

	public void setAns_group_order(int ans_group_order) {
		this.ans_group_order = ans_group_order;
	}

	public int getAns_depth() {
		return ans_depth;
	}

	public void setAns_depth(int ans_depth) {
		this.ans_depth = ans_depth;
	}
	
	public int getAns_num() {
		return ans_num;
	}

	public void setAns_num(int ans_num) {
		this.ans_num = ans_num;
	}

	public int getAns_po_num() {
		return ans_po_num;
	}

	public void setAns_po_num(int ans_po_num) {
		this.ans_po_num = ans_po_num;
	}

	public String getAns_boardname() {
		return ans_boardname;
	}

	public void setAns_boardname(String ans_boardname) {
		this.ans_boardname = ans_boardname;
	}

	public String getAns_contents() {
		return ans_contents;
	}

	public void setAns_contents(String ans_contents) {
		this.ans_contents = ans_contents;
	}

	public Date getAns_datetime() {
		return ans_datetime;
	}

	public void setAns_datetime(Date ans_datetime) {
		this.ans_datetime = ans_datetime;
	}

	public Date getAns_updatetime() {
		return ans_updatetime;
	}

	public void setAns_updatetime(Date ans_updatetime) {
		this.ans_updatetime = ans_updatetime;
	}

	public String getAns_writer() {
		return ans_writer;
	}

	public void setAns_writer(String ans_writer) {
		this.ans_writer = ans_writer;
	}

	public String getAns_writer_Id() {
		return ans_writer_Id;
	}

	public void setAns_writer_Id(String ans_writer_Id) {
		this.ans_writer_Id = ans_writer_Id;
	}

	public int getAns_hots() {
		return ans_hots;
	}

	public void setAns_hots(int ans_hots) {
		this.ans_hots = ans_hots;
	}

	public String getAns_deleteYn() {
		return ans_deleteYn;
	}

	public void setAns_deleteYn(String ans_deleteYn) {
		this.ans_deleteYn = ans_deleteYn;
	}
	
	/* BoardVO */

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

	public int getPo_ans_cnt() {
		return po_ans_cnt;
	}

	public void setPo_ans_cnt(int po_ans_cnt) {
		this.po_ans_cnt = po_ans_cnt;
	}
	
	
	
}
