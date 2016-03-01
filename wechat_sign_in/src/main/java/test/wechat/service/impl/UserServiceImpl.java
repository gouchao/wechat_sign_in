package test.wechat.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import test.wechat.dao.UserDao;
import test.wechat.model.User;
import test.wechat.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {
	@Resource
	private UserDao userDao;

	@Override
	public User getUserById(int userId) {
		return this.userDao.selectByPrimaryKey(userId);
	}


}
