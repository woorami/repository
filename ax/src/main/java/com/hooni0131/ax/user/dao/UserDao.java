package com.hooni0131.ax.user.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.hooni0131.ax.user.dto.UserDTO;

@Repository
public interface UserDao {

	public List<UserDTO> selectList();
}
