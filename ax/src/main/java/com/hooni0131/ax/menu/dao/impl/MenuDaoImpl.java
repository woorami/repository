package com.hooni0131.ax.menu.dao.impl;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hooni0131.ax.dto.MenuDTO;
import com.hooni0131.ax.menu.dao.MenuDao;

@Repository
public class MenuDaoImpl implements MenuDao {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<MenuDTO> list(HashMap<String, Object> params) throws Exception {
		return sqlSession.selectList("mapper.menumanage.menuList", params);
	}
	
	@Override
	public List<String> getParentMenuList(HashMap<String, Object> params ) throws Exception {
		return sqlSession.selectList("mapper.menumanage.parentMenuList", params);
	}
}
