package com.hooni0131.ax.dto;

public class MenuDTO {

	private String pk;
	private String menuid;
	private String menuname;
	private String description;
	private String url;
	private String depth;
	private String displayYn;
	private String sortingIndex;
	private String createTime;
	private String modifyTime;
	private String parentmenuid;
		
	public String getParentmenuid() {
		return parentmenuid;
	}
	public void setParentmenuid(String parentmenuid) {
		this.parentmenuid = parentmenuid;
	}
	public String getPk() {
		return pk;
	}
	public void setPk(String pk) {
		this.pk = pk;
	}
	public String getMenuid() {
		return menuid;
	}
	public void setMenuid(String menuid) {
		this.menuid = menuid;
	}
	public String getMenuname() {
		return menuname;
	}
	public void setMenuname(String menuname) {
		this.menuname = menuname;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getDepth() {
		return depth;
	}
	public void setDepth(String depth) {
		this.depth = depth;
	}
	public String getDisplayYn() {
		return displayYn;
	}
	public void setDisplayYn(String displayYn) {
		this.displayYn = displayYn;
	}
	public String getSortingIndex() {
		return sortingIndex;
	}
	public void setSortingIndex(String sortingIndex) {
		this.sortingIndex = sortingIndex;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getModifyTime() {
		return modifyTime;
	}
	public void setModifyTime(String modifyTime) {
		this.modifyTime = modifyTime;
	}
	
	
	
}
