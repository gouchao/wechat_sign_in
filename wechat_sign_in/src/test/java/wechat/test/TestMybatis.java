package wechat.test;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.alibaba.fastjson.JSON;

import test.wechat.model.User;
import test.wechat.service.UserService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:spring-mybatis.xml"})
public class TestMybatis {
	private static Logger logger = Logger.getLogger(TestMybatis.class);
	@Resource
	private UserService userService = null;
	//private ApplicationContext ac= null;
	
/*	public void before(){
		ac = new ClassPathXmlApplicationContext("applicationContext.xml");
		userService = (UserService) ac.getBean("userService");
	}*/
	
	@Test
	public void test(){
		 User user = userService.getUserById(1);
		 System.out.println(user.getUserName());
		 logger.info("值："+user.getUserName());
		 logger.info(JSON.toJSONString(user)); 
	}
	
}
