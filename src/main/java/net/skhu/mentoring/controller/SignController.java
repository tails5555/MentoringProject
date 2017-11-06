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
import net.skhu.mentoring.mapper.DepartmentMapper;
import net.skhu.mentoring.mapper.StudentMapper;

@RequestMapping("/guest")
@Controller
public class SignController {

	@Autowired UserMapper userMapper;
	@Autowired DepartmentMapper departmentMapper;
	@Autowired StudentMapper studentMapper;
	
	
    @RequestMapping(value="create", method=RequestMethod.GET)
	public String create(Model model ) {
		Student student = new Student();
		User user = new User();
		
        List<Department> departments = departmentMapper.findAll();
       
        model.addAttribute("student", student);
        model.addAttribute("user",user);
        model.addAttribute("departments", departments);
	
		return "sign/sign";
	}
    
	
    @RequestMapping(value="create", method=RequestMethod.POST)
    public String create(Model model, Student student) {
    	userMapper.insert(student.getPassword());
    	User user = userMapper.findLast();
    
        studentMapper.insert(student);
        return "redirect:index";
    }

}
