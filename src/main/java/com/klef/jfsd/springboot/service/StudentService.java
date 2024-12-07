package com.klef.jfsd.springboot.service;

import com.klef.jfsd.springboot.model.Student;

public interface StudentService
{
  public String registerStudent(Student student);
  public Student checkStudentLogin(String email, String pwd);
  public Student displayStudentByID(int studentId);
  public String updateStudentProfile(Student student);
}
