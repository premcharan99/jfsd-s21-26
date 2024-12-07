package com.klef.jfsd.springboot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.Teacher;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.service.TeacherService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class TeacherController 
{
  @Autowired
  private TeacherService teacherService;
  
  @GetMapping("teacherlogin")
  public ModelAndView teacherlogin()
  {
    ModelAndView mv = new ModelAndView();
    mv.setViewName("teacherlogin");
    return mv;
  }
     
  @GetMapping("viewallstudents")
  public ModelAndView viewallstudents()
  {
    ModelAndView mv = new ModelAndView();
    List<Student> studentList = teacherService.viewAllStudents();
    mv.setViewName("viewallstudents");
    mv.addObject("studentList", studentList);
       
    long count = teacherService.countStudents();
    mv.addObject("count", count);
       
    return mv;
  }
     
  @GetMapping("deletestudent")
  public ModelAndView deletestudent()
  {
    ModelAndView mv = new ModelAndView();
    List<Student> studentList = teacherService.viewAllStudents();
    mv.setViewName("deletestudent");
    mv.addObject("studentList", studentList);
    return mv;
  }
     
  @GetMapping("delete")
  public String deleteoperation(@RequestParam("id") int sid) {
    teacherService.deleteStudent(sid);
    return "redirect:/deletestudent";
  }
     
  @PostMapping("checkteacherlogin")
  public ModelAndView checkteacherlogin(HttpServletRequest request)
  {
    ModelAndView mv = new ModelAndView();
       
    String tuname = request.getParameter("tusername");
    String tpwd = request.getParameter("tpwd");
       
    Teacher teacher = teacherService.checkTeacherLogin(tuname, tpwd);
       
    if(teacher != null)
    {
      mv.setViewName("teacherhome");
    }
    else
    {
      mv.setViewName("teacherlogout");
      mv.addObject("message", "Login Failed");
    }
    return mv;
  }
     
  @GetMapping("/teacherhome")
  public ModelAndView teacherHome() {
      ModelAndView mv = new ModelAndView();
      List<Student> studentList = teacherService.viewAllStudents();
      mv.setViewName("teacherhome"); // Ensure the view name matches your JSP or HTML file
      mv.addObject("studentList", studentList);
      return mv;
  }

     
  @GetMapping("teacherlogout")
  public ModelAndView teacherlogout()
  {
    ModelAndView mv = new ModelAndView();
    mv.setViewName("teacherlogin");
    return mv;
  }
     
  @GetMapping("updatestudentstatus")
  public ModelAndView updatestudentstatus()
  {
    ModelAndView mv = new ModelAndView();
    List<Student> studentList = teacherService.viewAllStudents();
    mv.setViewName("updatestudentstatus");
    mv.addObject("studentList", studentList);
    return mv;
  }
     
  @GetMapping("updatestatus")
  public String updatestatus(@RequestParam("id") int sid, @RequestParam("status") String status)
  {
    teacherService.updateStudentStatus(status, sid);
    return "redirect:/updatestudentstatus";
  }
     
}
