package com.guestbook.model;

public class PageDTO {
	private int startpage;
	private int blockpage;
	private int endpage;
	private int currentpage;
	private int totpage;
	public int getStartpage() {
		return startpage ;
	}
	public void setStartpage(int startpage) {
		this.startpage = startpage;
	}
	public int getBlockpage() {
		return blockpage;
	}
	public void setBlockpage(int blockpage) {
		this.blockpage = blockpage;
	}
	public int getEndpage() {
		return endpage;
	}
	public void setEndpage(int endpage) {
		this.endpage = endpage;
	}
	public int getCurrentpage() {
		return currentpage;
	}
	public void setCurrentpage(int currentpage) {
		this.currentpage = currentpage;
	}
	public int getTotpage() {
		return totpage;
	}
	public void setTotpage(int totpage) {
		this.totpage = totpage;
	}
	
	
}
