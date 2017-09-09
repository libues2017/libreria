package fia.ues.sv.libues.dao;

import java.util.List;

import fia.ues.sv.libues.modelo.User;

public interface UserDao {

	User findById(int id);
    
    User findBySSO(String sso);
     
    void save(User user);
     
    void deleteBySSO(String sso);
     
    List<User> findAllUsers();
}
