package com.air.board;

public class CometBean {

	private String id;
	private int board_num;
	private String content;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
	@Override
	public String toString() {
		return "CometBean [id=" + id + ", board_num=" + board_num + ", content=" + content + "]";
	}

	

}
