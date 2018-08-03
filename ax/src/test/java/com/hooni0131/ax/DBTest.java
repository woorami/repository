package com.hooni0131.ax;

import static org.junit.Assert.fail;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.springframework.context.annotation.Configuration;

import com.google.common.collect.Lists;

@Configuration(value = "file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class DBTest {

	@Inject
	private SqlSession sqlSession;
	
	@Test
	public void test() {
		
		List<String> userList = Lists.newArrayList();		
		
		System.out.println(" sqlSession:"+ sqlSession);
		userList = sqlSession.selectList("user.userList");
		
		for(String result: userList) {
			System.out.println(" result:"+ result);
		}
		fail("Not yet implemented");
	}

}
