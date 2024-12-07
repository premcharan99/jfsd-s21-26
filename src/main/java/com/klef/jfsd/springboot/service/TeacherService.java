package com.klef.jfsd.springboot.service;

import java.util.List;

import com.klef.jfsd.springboot.model.Teacher;
import com.klef.jfsd.springboot.model.Student;

public interface TeacherService {

  public List<Student> viewAllStudents();
  public Teacher checkTeacherLogin(String username, String password);
  public String deleteStudent(int studentId);
  public Student displayStudentById(int studentId);
  public long countStudents();
  public String updateStudentStatus(String status, int studentId);
}
