package fia.ues.sv.libues.service;

import java.util.List;
import fia.ues.sv.libues.modelo.User;

public interface UserService {

	User findById(int id);
	
	User findBySSO(String sso);
	
	void saveUser(User user);
	
	void updateUser(User user);
	
	void deleteUserBySSO(String sso);
	
	List<User> findAllUsers();
	
	boolean isUserSSOUnique(Integer id, String sso);
}
