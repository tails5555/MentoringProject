package net.skhu.mentoring.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

import net.skhu.mentoring.dto.User;
import net.skhu.mentoring.dto.Department;
import net.skhu.mentoring.dto.Student;
import net.skhu.mentoring.dto.Professor; 
import net.skhu.mentoring.dto.Employee;
import net.skhu.mentoring.dto.UserList;

import net.skhu.mentoring.mapper.UserMapper;
import net.skhu.mentoring.utils.Encryption;
import net.skhu.mentoring.mapper.DepartmentMapper;
import net.skhu.mentoring.mapper.StudentMapper;
import net.skhu.mentoring.mapper.ProfessorMapper;
import net.skhu.mentoring.mapper.EmployeeMapper;

@RequestMapping("/user")
@Controller
public class AdminController {
	
	@Autowired UserMapper userMapper;
	@Autowired DepartmentMapper departmentMapper;
	@Autowired StudentMapper studentMapper;
	@Autowired ProfessorMapper professorMapper;
	@Autowired EmployeeMapper employeeMapper;
	
	@RequestMapping("list")
	public String index(Model model) {
		List<Student> students = studentMapper.findAll();
        model.addAttribute("students", students);
		List<Professor> professor = professorMapper.findAll();
		 model.addAttribute("professor", professor);
        List<Employee> employee = employeeMapper.findAll();
        model.addAttribute("employee", employee);
        
        List<User> user =userMapper.findList();
        model.addAttribute("user", user);
        
		return "userManage/userManage";
	}
}
