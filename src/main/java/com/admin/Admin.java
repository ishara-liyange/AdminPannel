package com.admin;

public class Admin {
    private int a_id;
    private String a_name;
    private String a_nic;
    private String a_phone;
    private String a_email;
    private String a_username;
    private String a_password;

    // Constructor
    public Admin(int a_id, String a_name,  String a_nic, String a_phone,String a_email, String a_username, String a_password) {
        this.a_id = a_id;
        this.a_name = a_name;
        this.a_nic = a_nic;
        this.a_phone = a_phone;
        this.a_email = a_email;
        this.a_username = a_username;
        this.a_password = a_password;
    }

    // Getters
    public int getA_id() { 
    	return a_id; }
    
    public String getA_name() { 
    	return a_name; }
      
    public String getA_nic() { 
    	return a_nic; }
    
    public String getA_phone() { 
    	return a_phone; }
 
    public String getA_email() { 
    	return a_email; }
    
    public String getA_username() { 
    	return a_username; }
    
    public String getA_password() { 
    	return a_password; }
}
