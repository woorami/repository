package com.hooni0131.ax.order.dao.Impl;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.google.common.collect.Lists;
import com.hooni0131.ax.order.controller.OrderListController;
import com.hooni0131.ax.order.dao.OrderDao;
import com.hooni0131.ax.order.dto.OrderDTO;

@Repository
public class OrderDaoImpl implements OrderDao {
	
	@Inject
	SqlSession session;

	private static final Logger logger = LoggerFactory.getLogger(OrderListController.class);
	
	@Override
	public List<OrderDTO> list(HashMap<String, Object> params) throws Exception{
		
		return  session.selectList("mapper.ordermanage.orderList", params);
	
	}
	
	
	@Override
	public OrderDTO detail(HashMap<String, Object> params) throws Exception {
		logger.info(" params:"+ params);
		return session.selectOne("mapper.ordermanage.orderDetail", params);
	}
}
