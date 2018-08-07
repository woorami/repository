package com.hooni0131.ax.user.dao.impl;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hooni0131.ax.user.dao.UserDao;
import com.hooni0131.ax.user.dto.UserDTO;

@Repository // DAO관련 애노테이션
public class UserDaoImpl implements UserDao {

	@Inject
	SqlSession sqlSession;
	
	/**
	 * 회웜 목록
	 */
	@Override
	public List<UserDTO> selectList() {		
		return sqlSession.selectList("usermanager.userList");		
	}
	
	/**
	 * 회원 목록을 XML로 생성하기
	 */
	@Override
	public List<HashMap<String, Object>> selectListXml(HashMap<String, Object> params) throws Exception {
		
		return sqlSession.selectList("usermanager.userListXml", params);
	}
}
