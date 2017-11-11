package net.skhu.mentoring.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import net.skhu.mentoring.dto.Admin;
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

@RequestMapping("/user")
@Controller
public class AdminController {
	
	@Autowired UserMapper userMapper;
	@Autowired DepartmentMapper departmentMapper;
	@Autowired StudentMapper studentMapper;
	@Autowired ProfessorMapper professorMapper;
	@Autowired EmployeeMapper employeeMapper;
	@Autowired AdminMapper adminMapper;
	
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
	

	@RequestMapping(value="edit", method=RequestMethod.GET)
    public String edit(Model model, @RequestParam("id") int id) {
        User user = userMapper.findEdit(id);
        List<User> userType =userMapper.findUserType();
        model.addAttribute("user", user);
        model.addAttribute("userType", userType);
        return "userManage/edit";
    }

    @RequestMapping(value="edit", method=RequestMethod.POST)
    public String edit(Model model, User user) {
    	
    	System.out.println(user.getUserId());
    	Student student = studentMapper.findByUserId(user.getUserId());    
    	Admin admin = new Admin();
    	admin.setUserId(user.getUserId());
    	
    	
       	if(user.getUserType().equals("직원")) {
       	  		
       	 Employee employee = new Employee();
       	 
       	 employee.setEmpId(student.getStudentNumber());
       	 employee.setPhoneNumber(student.getPhoneNumber());
       	 employee.setName(student.getName());
       	 employee.setAddress(student.getAddress());
       	 employee.setEmail(student.getEmail());
       	 employee.setOfficeId(student.getDepartmentId());
       	employee.setOfficePhone(student.getPhoneNumber());
       	 employee.setUserId(student.getUserId());
       	 
       	System.out.println(employee.getUserId());
        employeeMapper.insert(employee);
       	studentMapper.deleteByUserId(employee.getUserId());
       	 adminMapper.insert(admin);
		 userMapper.update(user);
		 
		 
    	}
    	else if(user.getUserType().equals("교수")) {
    		
    		 Professor professor = new Professor();
           	 
    		 professor.setProfId(student.getStudentNumber());
    		 professor.setPhoneNumber(student.getPhoneNumber());
    		 professor.setName(student.getName());
    		 professor.setAddress(student.getAddress());
    		 professor.setEmail(student.getEmail());
    		 professor.setOfficeId(student.getDepartmentId());
    		 professor.setOfficePhone(student.getPhoneNumber());
    		 professor.setUserId(student.getUserId());
           	 
           	System.out.println(professor.getUserId());
           	professorMapper.insert(professor);
        	studentMapper.deleteByUserId(professor.getUserId());
          	 
    		 adminMapper.insert(admin);
    		 userMapper.update(user);  
    	}
    	else if(user.getUserType().equals("학생회장")) {
    		 adminMapper.insert(admin);
    		 userMapper.update(user);
    	}
    	
    	else {

  
    		adminMapper.deleteByUserId(user.getUserId());
    		userMapper.update(user);
    	}
        
        return "redirect:list";
    }
    

    @RequestMapping("delete")
    public String delete(Model model, @RequestParam("id") int id) {
    	User user=userMapper.findByUserType(id);
    
    	System.out.println(user.getUserType());
    	
    	if(user.getUserType()=="직원") {
    		adminMapper.deleteByUserId(id);	
    		employeeMapper.deleteByUserId(id);
  	        userMapper.delete(id);
    	}
    	else if(user.getUserType()=="교수") {
    		 adminMapper.deleteByUserId(id);	
    		  professorMapper.deleteByUserId(id);
    	        userMapper.delete(id);
    	}
    	else if(user.getUserType()=="학생회장") {
   		 adminMapper.deleteByUserId(id);	
   		 studentMapper.deleteByUserId(id);
   	        userMapper.delete(id);
    	}
    	
    	else {
	        studentMapper.deleteByUserId(id);
	        userMapper.delete(id);
    	}
    	
        return "redirect:list";
    }


}


