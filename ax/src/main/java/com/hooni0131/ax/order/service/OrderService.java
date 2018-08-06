package com.hooni0131.ax.order.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import com.hooni0131.ax.order.dto.OrderDTO;

@Resource
public interface OrderService {

	public List<OrderDTO> list(HashMap<String, Object> params) throws Exception;
}
