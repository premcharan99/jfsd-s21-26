package com.klef.jfsd.springboot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.service.StudentService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class StudentController
{
  @Autowired
  private StudentService studentService;
  
  @GetMapping("/")
  public ModelAndView home()
  {
    ModelAndView mv = new ModelAndView();
    mv.setViewName("home");
    return mv;
  }
  
  @GetMapping("studentreg")
  public ModelAndView studentreg()
  {
    ModelAndView mv = new ModelAndView();
    mv.setViewName("studentreg");
    return mv;
  }
  
  @GetMapping("studentlogin")
  public ModelAndView studentlogin()
  {
    ModelAndView mv = new ModelAndView();
    mv.setViewName("studentlogin");
    return mv;
  }
  
  @GetMapping("stdhome")
  public ModelAndView stdhome()
  {
    ModelAndView mv = new ModelAndView();
    mv.setViewName("stdhome");
    return mv;
  }
  
  @GetMapping("studentprofile")
  public ModelAndView studentprofile()
  {
    ModelAndView mv = new ModelAndView();
    mv.setViewName("studentprofile");
    return mv;
  }
  
  @GetMapping("stdcontactus")
  public ModelAndView studentcontactus()
  {
    ModelAndView mv = new ModelAndView();
    mv.setViewName("stdcontactus");
    return mv;
  }
  
  @PostMapping("insertstd")
  public ModelAndView insertstudent(HttpServletRequest request)
  {
    String name = request.getParameter("sname");
    String gender = request.getParameter("sgender");
    String dob = request.getParameter("sdob");
    String dept = request.getParameter("sdept");
    String location = request.getParameter("slocation");
    String email = request.getParameter("semail");
    String year = request.getParameter("syear");
    String password = request.getParameter("spwd");
    String contact = request.getParameter("scontact");
    String status = "Registered";
      
    Student student = new Student();
    student.setName(name);
    student.setGender(gender);
    student.setDepartment(dept);
    student.setDateofbirth(dob);
    student.setLocation(location);
    student.setEmail(email);
    student.setYear(year);
    student.setPassword(password);
    student.setContact(contact);
    student.setStatus(status);
        
    String msg = studentService.registerStudent(student);
        
    ModelAndView mv = new ModelAndView("regsuccess");
    mv.addObject("message", msg);
      
    return mv;
  }
  
  @PostMapping("checkstdlogin")
  public ModelAndView checkstudentlogin(HttpServletRequest request)
  {
    ModelAndView mv = new ModelAndView();
       
    String semail = request.getParameter("semail");
    String spwd = request.getParameter("spwd");
       
    Student student = studentService.checkStudentLogin(semail, spwd);
       
    if(student != null)
    {
      HttpSession session = request.getSession();
      session.setAttribute("student", student); // "student" is session variable
      mv.setViewName("stdhome");
    }
    else
    {
      mv.setViewName("studentlogin");
      mv.addObject("message", "Login Failed");
    } 
    return mv;
  }
  
  @GetMapping("studentlogout")
  public ModelAndView studentlogout(HttpServletRequest request)
  {
    HttpSession session = request.getSession();
    session.removeAttribute("student");
    ModelAndView mv = new ModelAndView();
    mv.setViewName("studentlogin");
    return mv;
  }
  
  @GetMapping("updatestudentprofile")
  public ModelAndView updatestudent()
  {
    ModelAndView mv = new ModelAndView();
    mv.setViewName("updatestudentprofile");
    return mv;
  }
  
  @GetMapping("uploadproject")
  public ModelAndView uploadproject()
  {
    ModelAndView mv = new ModelAndView();
    mv.setViewName("uploadproject");
    return mv;
  }

  @GetMapping("studentportfolio")
  public ModelAndView studentportfolio()
  {
    ModelAndView mv = new ModelAndView();
    mv.setViewName("studentportfolio");
    return mv;
  }
  
  @GetMapping("studentfeedback")
  public ModelAndView studentfeedback()
  {
    ModelAndView mv = new ModelAndView();
    mv.setViewName("studentfeedback");
    return mv;
  }
  @GetMapping("onlineplatforms")
  public ModelAndView onlineplatforms()
  {
    ModelAndView mv = new ModelAndView();
    mv.setViewName("onlineplatforms");
    return mv;
  }
  
  
  @PostMapping("updatestudentprofile")
  public ModelAndView updatestudentprofile(HttpServletRequest request)
  {
    ModelAndView mv = new ModelAndView();
    
    try
    {
      int id = Integer.parseInt(request.getParameter("sid"));
      String name = request.getParameter("sname");
      String gender = request.getParameter("sgender");
      String dob = request.getParameter("sdob");
      String dept = request.getParameter("sdept");
      String password = request.getParameter("spwd");
      String location = request.getParameter("slocation");
      String contact = request.getParameter("scontact");
     
      Student student = new Student();
      student.setId(id);
      student.setName(name);
      student.setGender(gender);
      student.setDepartment(dept);
      student.setDateofbirth(dob);
      student.setPassword(password);
      student.setLocation(location);
      student.setContact(contact);
       
      String msg = studentService.updateStudentProfile(student);
       
      Student updatedStudent = studentService.displayStudentByID(id);
       
      HttpSession session = request.getSession();
      session.setAttribute("student", updatedStudent); // "student" is session variable
      
      mv.setViewName("updatesuccess");
      mv.addObject("message", msg);
    }
    catch(Exception e)
    {
      mv.setViewName("updateerror");
      mv.addObject("message", e);
    }
    return mv;
  }
  
  @GetMapping("studentsessionexp")
  public ModelAndView studentsessionexp()
  {
    ModelAndView mv = new ModelAndView();
    mv.setViewName("studentsessionexpired");
    return mv;
  } 
}
