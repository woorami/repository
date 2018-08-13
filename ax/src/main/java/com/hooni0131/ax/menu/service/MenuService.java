package com.hooni0131.ax.menu.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import com.hooni0131.ax.dto.MenuDTO;

@Resource
public interface MenuService {

	public List<MenuDTO> list(HashMap<String, Object> params);
	
	public List<String> getParentMenuList(HashMap<String, Object> params);
}
