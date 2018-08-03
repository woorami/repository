package com.hooni0131.ax.user.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.hooni0131.ax.user.dao.UserDao;
import com.hooni0131.ax.user.dto.UserDTO;
import com.hooni0131.ax.user.service.UserService;

@Repository
public class UserServiceImpl implements UserService {

	@Inject
	UserDao userDao;
	
	@Override
	public List<UserDTO> userList() throws Exception {
		
		return userDao.selectList();
	}
}
