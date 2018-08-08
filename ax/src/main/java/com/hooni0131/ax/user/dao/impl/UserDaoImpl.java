package com.hooni0131.ax.user.dao.impl;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hooni0131.ax.user.dao.UserDao;
import com.hooni0131.ax.user.dto.UserDTO;

@Repository // DAO愿��젴 �븷�끂�뀒�씠�뀡
public class UserDaoImpl implements UserDao {

	@Inject
	SqlSession sqlSession;
	
	/**
	 * �쉶�썫 紐⑸줉
	 */
	@Override
	public List<UserDTO> selectList() {		
		return sqlSession.selectList("mapper.usermanager.userList");		
	}
	
	/**
	 * �쉶�썝 紐⑸줉�쓣 XML濡� �깮�꽦�븯湲�
	 */
	@Override
	public List<HashMap<String, Object>> selectListXml(HashMap<String, Object> params) throws Exception {
		
		return sqlSession.selectList("mapper.usermanager.userListXml", params);
	}
}
