package fia.ues.sv.libues.service;

import java.util.List;
import fia.ues.sv.libues.modelo.UserProfile;

public interface UserProfileService {

    UserProfile findById(int id);
    
    UserProfile findByType(String type);
     
    List<UserProfile> findAll();

}
