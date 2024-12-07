package com.klef.jfsd.springboot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.Student;

import jakarta.transaction.Transactional;

import java.util.List;

@Repository
public interface StudentRepository extends JpaRepository<Student, Integer> {

  @Query("select s from Student s where s.email = ?1 and s.password = ?2")
  public Student checkStudentLogin(String email, String pwd);
  
  @Query("update Student s set s.status = ?1 where s.id = ?2")
  @Modifying
  @Transactional // to enable auto-commit
  public int updateStudentStatus(String status, int id);
  
  // Using derived query methods
  public List<Student> findByDepartment(String department);
  public List<Student> findByDepartmentAndGender(String department, String gender);
  public List<Student> findByGender(String gender);
  static Student findByEmail(String email) {
	// TODO Auto-generated method stub
	return null;
}
}
