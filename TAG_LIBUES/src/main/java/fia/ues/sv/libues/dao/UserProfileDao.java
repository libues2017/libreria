package fia.ues.sv.libues.dao;

import java.util.List;

import fia.ues.sv.libues.modelo.UserProfile;

public interface UserProfileDao {

	List<UserProfile> findAll();
	
	UserProfile findByType(String type);
	
	UserProfile findById(int id);
}
