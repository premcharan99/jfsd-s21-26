package com.klef.jfsd.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.repository.StudentRepository;

@Service
public class StudentServiceImpl implements StudentService 
{
  @Autowired
  private StudentRepository studentRepository;

  @Override
  public String registerStudent(Student student) 
  {
    studentRepository.save(student);
    return "Student Registered Successfully";
  }

  @Override
  public Student checkStudentLogin(String email, String pwd) 
  {
    return studentRepository.checkStudentLogin(email, pwd);
  }

  @Override
  public Student displayStudentByID(int studentId) 
  {
    return studentRepository.findById(studentId).orElse(null);
  }

  @Override
  public String updateStudentProfile(Student student) 
  {
    Student existingStudent = studentRepository.findById(student.getId()).orElse(null);
    if (existingStudent != null) 
    {
      existingStudent.setContact(student.getContact());
      existingStudent.setDateofbirth(student.getDateofbirth());
      existingStudent.setDepartment(student.getDepartment());
      existingStudent.setGender(student.getGender());
      existingStudent.setLocation(student.getLocation());
      existingStudent.setName(student.getName());
      existingStudent.setPassword(student.getPassword());
      
      studentRepository.save(existingStudent);
      return "Student Profile Updated Successfully";
    }
    return "Student Not Found";
  }
}
