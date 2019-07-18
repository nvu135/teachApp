package service;

import model.User;

public class LoginService {

	public boolean isUserValid(User user) {
		if (user.getUserName().equals("admin") && user.getPassword().equals("admin"))
			return true;

		return false;
	}

}
