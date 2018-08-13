package com.hooni0131.ax.menu.dao;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import com.hooni0131.ax.dto.MenuDTO;

@Resource
public interface MenuDao {

	public List<MenuDTO> list(HashMap<String, Object> params) throws Exception;

	public List<String> getParentMenuList(HashMap<String, Object> params) throws Exception;
}