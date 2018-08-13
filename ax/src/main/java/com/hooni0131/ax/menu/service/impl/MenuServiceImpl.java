package com.hooni0131.ax.menu.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.google.common.collect.Lists;
import com.hooni0131.ax.dto.MenuDTO;
import com.hooni0131.ax.menu.dao.MenuDao;
import com.hooni0131.ax.menu.service.MenuService;
import com.hooni0131.ax.order.controller.OrderListController;

@Repository
public class MenuServiceImpl implements MenuService {
	
	private static final Logger logger = LoggerFactory.getLogger(OrderListController.class);
	
	@Inject
	MenuDao menuDao;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<MenuDTO> list(HashMap<String, Object> params)  {
		
		List<MenuDTO> list = Lists.newArrayList();
		
		try {
		
			list = menuDao.list(params);
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return list;
	}
	
	@Override
	public List<String> getParentMenuList(HashMap<String, Object> params) {
		
		List<String> list = Lists.newArrayList();
		
		try {
			list = menuDao.getParentMenuList(params);
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		
		return list;
		
	}
	

}
