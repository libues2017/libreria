package fia.ues.sv.libues.modelo;

import java.io.Serializable;

public enum UserProfileType implements Serializable{
    USUARIO("USUARIO"),
    DBA("DBA"),
    ADMINISTRADOR("ADMINISTRADOR"),
    BODEGUERO("BODEGUERO"),
    VENDEDOR("VENDEDOR"),
    DIRECTOR("DIRECTOR");
     
    String userProfileType;
     
    private UserProfileType(String userProfileType){
        this.userProfileType = userProfileType;
    }
     
    public String getUserProfileType(){
        return userProfileType;
    }
     
}
