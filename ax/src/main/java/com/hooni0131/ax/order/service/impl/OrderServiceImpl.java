package com.hooni0131.ax.order.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.hooni0131.ax.order.dao.OrderDao;
import com.hooni0131.ax.order.dto.OrderDTO;
import com.hooni0131.ax.order.service.OrderService;

@Repository
public class OrderServiceImpl implements OrderService {
	
	@Inject
	OrderDao orderDao;
	
	public List<OrderDTO> list(HashMap<String, Object> param) throws Exception {
		return orderDao.list(param); 
	}

}
