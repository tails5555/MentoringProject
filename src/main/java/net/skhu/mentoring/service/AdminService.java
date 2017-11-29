package net.skhu.mentoring.service;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import net.skhu.mentoring.model.Option;
import net.skhu.mentoring.model.Pagination;

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
import net.skhu.mentoring.mapper.AdminMapper;

@Service
public class AdminService {
	
	@Autowired UserMapper userMapper;
	@Autowired DepartmentMapper departmentMapper;
	@Autowired StudentMapper studentMapper;
	@Autowired ProfessorMapper professorMapper;
	@Autowired EmployeeMapper employeeMapper;
	@Autowired AdminMapper adminMapper;
	
    public List<User> findAll(Pagination pagination) {
        int count = userMapper.count(pagination);
        pagination.setRecordCount(count);
        return userMapper.findAllList(pagination);
    }

	
	
	

	
}
