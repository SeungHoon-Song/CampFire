package com.campfire.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.campfire.domain.UserVO;
import com.campfire.mapper.UserMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class UserMapperTests {
	@Setter(onMethod_ = @Autowired)
	private UserMapper mapper;
	
	@Test
	public void testInsert() {
		UserVO user = new UserVO();
		user.setUserEmail("test@test.com");
		user.setUserId("tester");
		user.setUserPw("testerPw");
		
		log.info(mapper.insert(user));
	}
	
	
}