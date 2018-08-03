package com.hooni0131.ax.user.dao;

import java.util.List;

import com.hooni0131.ax.user.dto.UserDTO;

public interface UserDao {

	public List<UserDTO> selectList();
}
