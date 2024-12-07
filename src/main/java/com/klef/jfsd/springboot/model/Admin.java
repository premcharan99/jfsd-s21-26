package com.klef.jfsd.springboot.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="admin_table")
public class Admin 
{
   @Id
   @GeneratedValue(strategy = GenerationType.IDENTITY)
   @Column(name="admin_id")
   private int id;
   
   @Column(name="admin_username", nullable=false, unique = true, length = 50)
   private String username;
   
   @Column(name="admin_password", nullable=false, length = 50)
   private String password;

   // Getters and Setters
   public int getId() {
      return id;
   }
   
   public void setId(int id) {
      this.id = id;
   }
   
   public String getUsername() {
      return username;
   }
   
   public void setUsername(String username) {
      this.username = username;
   }
   
   public String getPassword() {
      return password;
   }
   
   public void setPassword(String password) {
      this.password = password;
   }
}
