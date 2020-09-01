package com.vo;

import java.util.Date;

public class BoardVO {
	private int boardid;
	private String userid;
	private String title;
	private String boardcontents;
	private Date boarddate;
	private int boardcnt;
	
	public BoardVO() {
		super();
	}
	
	public BoardVO(int boardid, String userid, String title, String boardcontents, Date boarddate, int boardcnt) {
		super();
		this.boardid = boardid;
		this.userid = userid;
		this.title = title;
		this.boardcontents = boardcontents;
		this.boarddate = boarddate;
		this.boardcnt = boardcnt;
	}

	public BoardVO(String userid, String title, String boardcontents) {
		super();
		this.userid = userid;
		this.title = title;
		this.boardcontents = boardcontents;
	}

	public BoardVO(String title, String boardcontents) {
		super();
		this.title = title;
		this.boardcontents = boardcontents;
	}
	
	public int getBoardid() {
		return boardid;
	}

	public void setBoardid(int boardid) {
		this.boardid = boardid;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getBoardcontents() {
		return boardcontents;
	}

	public void setBoardcontents(String boardcontents) {
		this.boardcontents = boardcontents;
	}

	public Date getBoarddate() {
		return boarddate;
	}

	public void setBoarddate(Date boarddate) {
		this.boarddate = boarddate;
	}

	public int getBoardcnt() {
		return boardcnt;
	}

	public void setBoardcnt(int boardcnt) {
		this.boardcnt = boardcnt;
	}

	@Override
	public String toString() {
		return "BoardVO [boardid=" + boardid + ", userid=" + userid + ", title=" + title + ", boardcontents="
				+ boardcontents + ", boarddate=" + boarddate + ", boardcnt=" + boardcnt + "]";
	}

}
