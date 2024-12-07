package com.klef.jfsd.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Teacher;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.repository.TeacherRepository;
import com.klef.jfsd.springboot.repository.StudentRepository;

@Service
public class TeacherServiceImpl implements TeacherService {
	
	@Autowired
	private StudentRepository studentRepository;
	
	@Autowired
	private TeacherRepository teacherRepository;
	
	@Override
	public List<Student> viewAllStudents() {
		return studentRepository.findAll();
	}

	@Override
	public Teacher checkTeacherLogin(String username, String password) {
		return teacherRepository.checkTeacherLogin(username, password); // Updated method name
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
