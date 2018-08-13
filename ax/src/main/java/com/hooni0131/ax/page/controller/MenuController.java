package com.hooni0131.ax.page.controller;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.common.collect.Lists;
import com.hooni0131.ax.constants.ConstantsController;
import com.hooni0131.ax.dto.MenuDTO;
import com.hooni0131.ax.menu.service.MenuService;

@Controller
public class MenuController {

	@Inject
	private MenuService menuService;
	
	private static final Logger logger = LoggerFactory.getLogger(MenuController.class);
	
	
	@RequestMapping( value= {"/menu/menuList", "/menuList"}, method = { RequestMethod.POST, RequestMethod.GET})
	public String menuList(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		List<MenuDTO> list = Lists.newArrayList();
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		list = menuService.list(params);
		
		model.addAttribute("list", list);		
		
		return ConstantsController.MENU_LIST;
		
	}
	
	// JSON 형태로 리턴 하기( jackson-mapper-asl.jar 필요)
	@RequestMapping( value = {"/menu/parentMenuList", "parentMenuList"}, method = { RequestMethod.POST, RequestMethod.GET} )
	public void parentMenuList(HttpServletRequest request, HttpServletResponse response) {
	
		
		List<String> list = Lists.newArrayList();
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		list = menuService.getParentMenuList(params);
		logger.debug(" =-======= list:"+ list.size());
		ObjectMapper mapper = new ObjectMapper();
		
		
		try {
			
			String str = mapper.writeValueAsString(list);
			response.setCharacterEncoding("UTF-8");
			response.getWriter().println(str);;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
		}
		
	
	}

}