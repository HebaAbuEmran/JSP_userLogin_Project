/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import dao.DaoImp;
import model.User;

/**
 *
 * @author habuomran
 */
public class Validation {
   private DaoImp d ;
    
    public Validation (){
        d = new DaoImp();
    }  
    
    public boolean authenticate(String passWord , String userName){        
        User u =d.getclinet(userName);
        return passWord.equals(String.valueOf(u.getPassWord())) && userName.equals(u.getUserName());
    }
    public String authorizate (String userName){
        User u =d.getclinet(userName);
        
        if(u.getRole().equals("admin")){
            return "admin";
        }  
        return "client";
        
    }  
    
    
    
}
