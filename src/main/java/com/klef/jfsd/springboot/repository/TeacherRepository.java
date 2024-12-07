package com.klef.jfsd.springboot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.Teacher;

import jakarta.transaction.Transactional;

@Repository
public interface TeacherRepository extends JpaRepository<Teacher, String> {
	
	@Query("SELECT t FROM Teacher t WHERE t.username = ?1 AND t.password = ?2")
	public Teacher checkTeacherLogin(String uname, String pwd);
	
	@Query("DELETE FROM Student s WHERE s.contact = ?1")
	@Modifying
	@Transactional
	public int deleteStudentByContact(String contact);

}
