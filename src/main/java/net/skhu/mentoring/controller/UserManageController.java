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

import net.skhu.mentoring.mapper.UserMapper;
import net.skhu.mentoring.utils.Encryption;
import net.skhu.mentoring.mapper.DepartmentMapper;
import net.skhu.mentoring.mapper.StudentMapper;

@RequestMapping("/guest")
@Controller
public class UserManageController {
	
	@Autowired UserMapper userMapper;
	@Autowired DepartmentMapper departmentMapper;
	@Autowired StudentMapper studentMapper;

}
