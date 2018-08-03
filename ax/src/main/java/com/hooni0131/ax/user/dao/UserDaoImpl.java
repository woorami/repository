package com.hooni0131.ax.user.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hooni0131.ax.user.dto.UserDTO;

@Repository // DAO관련 애노테이션
public class UserDaoImpl implements UserDao {

	@Inject
	SqlSession session;
	
	@Override
	public List<UserDTO> selectList() {
		
		return session.selectList("usermanager.userList");
		
	}
}
