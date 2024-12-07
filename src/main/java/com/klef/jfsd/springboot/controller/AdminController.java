package com.klef.jfsd.springboot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.service.AdminService;

@Controller
public class AdminController 
{
  @Autowired
  private AdminService adminService;

  // Admin Login
  @GetMapping("adminlogin")
  public ModelAndView adminLogin() {
    ModelAndView mv = new ModelAndView("adminlogin");
    return mv;
  }

  @PostMapping("checkadminlogin")
  public ModelAndView checkAdminLogin(@RequestParam("ausername") String username, @RequestParam("apwd") String password) {
    ModelAndView mv = new ModelAndView();

    Admin admin = adminService.checkAdminLogin(username, password);

    if (admin != null) {
      mv.setViewName("adminhome");
    } else {
      mv.setViewName("adminlogin");
      mv.addObject("message", "Login Failed. Please check your credentials.");
    }
    return mv;
  }

  // Admin Home
  @GetMapping("/adminhome")
  public ModelAndView adminHome() {
    return new ModelAndView("adminhome");
  }
  
  @GetMapping("/addstudent")
  public ModelAndView addstudent() {
    return new ModelAndView("addstudent");
  }
  
  @GetMapping("viewallbyadmin")
  public ModelAndView viewallbyadmin()
  {
    ModelAndView mv = new ModelAndView();
    List<Student> studentList = adminService.viewallbyadmin();
    mv.setViewName("viewallstudents");
    mv.addObject("studentList", studentList);
       
    long count = adminService.countStudents();
    mv.addObject("count", count);
       
    return mv;
  }
    

  // Logout
  @GetMapping("logout")
  public ModelAndView logout() {
    return new ModelAndView("adminlogin");
  }
}
