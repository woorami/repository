package com.hooni0131.ax.user.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.hooni0131.ax.user.dto.UserDTO;

@Repository
public interface UserDao {

	/**
	 * 회원 목록
	 * @return
	 * @throws Exception
	 */
	public List<UserDTO> selectList() throws Exception;
	
	/**
	 * 회웜 목록을 XML로 생성하기
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public List<HashMap<String, Object>> selectListXml(HashMap<String, Object> params) throws Exception;
}
