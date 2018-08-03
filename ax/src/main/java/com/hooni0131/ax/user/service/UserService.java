package com.hooni0131.ax.user.service;

import java.util.List;

import javax.annotation.Resource;

import com.hooni0131.ax.user.dto.UserDTO;

@Resource
public interface UserService {

	public List<UserDTO> userList() throws Exception;
}
