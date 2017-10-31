package net.skhu.mentoring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.skhu.mentoring.dto.Employee;
import net.skhu.mentoring.dto.Professor;
import net.skhu.mentoring.dto.Student;
import net.skhu.mentoring.dto.User;
import net.skhu.mentoring.mapper.EmployeeMapper;
import net.skhu.mentoring.mapper.ProfessorMapper;
import net.skhu.mentoring.mapper.StudentMapper;
import net.skhu.mentoring.mapper.UserMapper;
import net.skhu.mentoring.utils.Encryption;
@Service
public class UserService {
	@Autowired UserMapper userMapper;
	@Autowired StudentMapper studentMapper;
	@Autowired ProfessorMapper professorMapper;
	@Autowired EmployeeMapper employeeMapper;
	public User login(String loginId, String password) {
		if(studentMapper.findOne(loginId)!=null) {
			Student student=studentMapper.findOne(loginId);
			User studentUser=userMapper.findOne(student.getUserId());
			String pw=Encryption.encrypt(password, Encryption.MD5);
			if(studentUser.getPassword().equals(pw)==false) return null;
			return studentUser;
		}
		else if(professorMapper.findOne(loginId)!=null) {
			Professor professor=professorMapper.findOne(loginId);
			User professorUser=userMapper.findOne(professor.getUserId());
			String pw=Encryption.encrypt(password, Encryption.MD5);
			if(professorUser.getPassword().equals(pw)==false) return null;
			return professorUser;
		}
		else if(employeeMapper.findOne(loginId)!=null) {
			Employee employee=employeeMapper.findOne(loginId);
			User employeeUser=userMapper.findOne(employee.getUserId());
			String pw=Encryption.encrypt(password, Encryption.MD5);
			if(employeeUser.getPassword().equals(pw)==false) return null;
			return employeeUser;
		}
		else return null;
	}
}
