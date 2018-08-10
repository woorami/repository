package com.hooni0131.ax.order.controller;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.common.collect.Lists;
import com.hooni0131.ax.constants.ConstantsController;
import com.hooni0131.ax.order.dto.OrderDTO;
import com.hooni0131.ax.order.service.OrderService;
import com.hooni0131.ax.util.XmlUtils;

@Controller
public class OrderListController {

	@Inject
	private OrderService orderService;
	
	private static final Logger logger = LoggerFactory.getLogger(OrderListController.class);
	
	@RequestMapping( value = {"/order/orderList", "/orderList"} , method = {RequestMethod.POST , RequestMethod.GET})
	public String orderList(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		List<OrderDTO> list = Lists.newArrayList();
		
		try {
		
			list = orderService.list(params);
			model.addAttribute("orderList", list);
			
		} catch (Exception e) {
			logger.error("error:"+ e.getMessage());
			e.printStackTrace();
		}
		
		
		return ConstantsController.ORDER_LIST;		
	}
	
	@RequestMapping( value = {"/order/orderDetail", "/orderDetail"}, method = {RequestMethod.GET, RequestMethod.POST})
	public String orderDetail(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		OrderDTO detail = new OrderDTO();
		String pk = "";
		
		try {
		
			pk = request.getParameter("seq") == null ? "" : request.getParameter("seq");
			params.put("pk",  pk);
			
			logger.info(" >>>>>>>>>>>>>>>>>>>> request:"+ request.getParameter("seq"));
			logger.info(" >>>>>>>>>>>>>>>>>>>> pk:"+ pk);
			logger.info(" >>>>>>>>>>>>>>>>>>>> params:"+ params);
			
			detail = orderService.detail(params);
			model.addAttribute("detail", detail);
			
		} catch (Exception e) {
			logger.error("error:"+ e.getMessage());
			e.printStackTrace();
		}
		
		return ConstantsController.ORDER_DETAIL;
	
	}
}