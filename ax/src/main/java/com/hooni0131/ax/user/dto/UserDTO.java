package com.hooni0131.ax.user.dto;

public class UserDTO {

	
	private String p_uid;

	private String p_name;

	private String createdts;
	
	public String getP_uid() {
		return p_uid;
	}

	public void setP_uid(String p_uid) {
		this.p_uid = p_uid;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	
	
	public String getCreatedts() {
		return createdts;
	}

	public void setCreatedts(String createdts) {
		this.createdts = createdts;
	}

	@Override
	public String toString() {
		return "UserDTO [ uid:"+ p_uid +", name:"+ p_name +", createdts:"+ createdts +"]";
	}
	
}
