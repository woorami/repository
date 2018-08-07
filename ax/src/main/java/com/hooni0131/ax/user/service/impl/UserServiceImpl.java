package com.hooni0131.ax.user.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.google.common.collect.Lists;
import com.hooni0131.ax.user.dao.UserDao;
import com.hooni0131.ax.user.dto.UserDTO;
import com.hooni0131.ax.user.service.UserService;

@Repository
public class UserServiceImpl implements UserService {

	@Inject
	UserDao userDao;
	
	/**
	 * 회원 목록
	 */
	@Override
	public List<UserDTO> userList() throws Exception {
		
		return userDao.selectList();
	}
	
	/**
	 * 회원 정보를 XML로 생성하기
	 */
	@Override
	public List<HashMap<String, Object>> userListXml(HashMap<String, Object> params) {
		
		List<HashMap<String, Object>> list = Lists.newArrayList();
		try {
			
			list = userDao.selectListXml(params);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
		
	}
}
