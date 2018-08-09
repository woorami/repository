package com.hooni0131.ax;


import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.google.common.collect.Lists;
import com.hooni0131.ax.order.dto.OrderDTO;
import com.hooni0131.ax.user.dto.UserDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/*.xml"})
public class DBTest {

	private static final Logger logger = LoggerFactory.getLogger(DBTest.class);
	
	@Inject
	private SqlSession sqlSession;
	
	private String id = "";
	private String name = "";
	
	@Before
	public void setData() {
		if(logger.isInfoEnabled()) {
			logger.info("DATA SET");
		}

		this.id = "aaa";
		this.name = "�̸�";
	}
/*	@Test
	public void test() {
		
		List<UserDTO> userList = Lists.newArrayList();		
		
		logger.info(" sqlSession:"+ sqlSession);
		logger.info(" id:"+ this.id);
		logger.info(" name:"+ this.name);
		userList = sqlSession.selectList("mapper.usermanager.userList");
		logger.info(" userList.size();:"+ userList.size());
		
		for(UserDTO result: userList) {
			logger.info("id:"+ result.getP_uid());
		}

	}*/
	
	
	@Test
	public void orderList() {
		
		List<OrderDTO> orderList = Lists.newArrayList();
		
		orderList = sqlSession.selectList("mapper.ordermanage.orderList");
		
		for(OrderDTO result: orderList) {
			logger.info("seq:"+ result.getSeq());
		}
	}
	
	@After
	public void close() {
		logger.info(" TEST closed");
	}
}
