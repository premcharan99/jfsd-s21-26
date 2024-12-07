package com.klef.jfsd.springboot.service;

import java.util.List;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Student;

public interface AdminService {

  public List<Student> viewallbyadmin();
  public Admin checkAdminLogin(String username, String password);
  public String deleteStudent(int studentId);
  public Student displayStudentById(int studentId);
  public long countStudents();
  public String updateStudentStatus(String status, int studentId);
}
