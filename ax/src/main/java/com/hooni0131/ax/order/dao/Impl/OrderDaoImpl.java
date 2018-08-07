package com.hooni0131.ax.order.dao.Impl;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hooni0131.ax.order.dao.OrderDao;
import com.hooni0131.ax.order.dto.OrderDTO;

@Repository
public class OrderDaoImpl implements OrderDao {
	
	@Inject
	SqlSession session;

	@Override
	public List<OrderDTO> list(HashMap<String, Object> params) throws Exception{
		
		return session.selectList("mapper.ordermanage.orderList", params);
	}
	
}
