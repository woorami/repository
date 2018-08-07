package com.hooni0131.ax.user.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import com.hooni0131.ax.user.dto.UserDTO;

@Resource
public interface UserService {

	/**
	 * 회원 목록
	 * @return
	 * @throws Exception
	 */
	public List<UserDTO> userList() throws Exception;
	
	/**
	 * 회원 목록을 XML로 생성하기
	 * @param params
	 * @return
	 */
	public List<HashMap<String, Object>> userListXml(HashMap<String, Object> params);
}
