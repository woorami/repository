package com.hooni0131.ax.user.controller;

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
import com.hooni0131.ax.user.dto.UserDTO;
import com.hooni0131.ax.user.service.UserService;
import com.hooni0131.ax.util.XmlUtils;

@Controller
public class UserController {

	
	@Inject
	private UserService service;
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	/**
	 * 회원 목록
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/userList", method = RequestMethod.GET)
	public String userList(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		List<UserDTO> userList = Lists.newArrayList();
		
		try {
		
			userList = service.userList();
			logger.debug("userList:"+ userList.size());
			
			model.addAttribute("list", userList);
			
			/*JSONObject obj = new JSONObject();
			obj.put("list", userList);
			obj.put("result", "ok");
			
			response.setContentType("text/html);charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			out.print(obj);*/
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		return ConstantsController.USER_LIST;
	}
	
	/**
	 * 회원 목록을 XML로 생성하기
	 * @param request
	 * @param response
	 */
	@RequestMapping( value = {"/userListXml","/users/userListXml"}, method = {RequestMethod.GET, RequestMethod.POST})
	public void userListXml(HttpServletRequest request, HttpServletResponse response) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		XmlUtils.makeXmlFile(service.userListXml(params) , "MEMBER");
		
	}
	
	
}
