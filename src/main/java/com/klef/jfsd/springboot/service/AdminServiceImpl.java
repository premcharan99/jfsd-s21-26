package com.klef.jfsd.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.repository.AdminRepository;
import com.klef.jfsd.springboot.repository.StudentRepository;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private StudentRepository studentRepository;

    @Autowired
    private AdminRepository adminRepository;

    @Override
    public List<Student> viewallbyadmin() {
        return studentRepository.findAll();
    }

    @Override
    public Admin checkAdminLogin(String username, String password) {
        return adminRepository.checkAdminLogin(username, password);
    }

    @Override
    public String deleteStudent(int studentId) {
        studentRepository.deleteById(studentId);
        return "Student deleted successfully";
    }

    @Override
    public Student displayStudentById(int studentId) {
        return studentRepository.findById(studentId).orElse(null);
    }

    @Override
    public long countStudents() {
        return studentRepository.count();
    }

    @Override
    public String updateStudentStatus(String status, int studentId) {
        studentRepository.updateStudentStatus(status, studentId);
        return "Student status updated successfully";
    }
}
