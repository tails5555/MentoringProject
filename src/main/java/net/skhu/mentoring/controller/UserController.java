package net.skhu.mentoring.controller;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import net.skhu.mentoring.dto.Department;
import net.skhu.mentoring.dto.Employee;
import net.skhu.mentoring.dto.Professor;
import net.skhu.mentoring.dto.Student;
import net.skhu.mentoring.dto.User;
import net.skhu.mentoring.dto.TimeTable;

import net.skhu.mentoring.mapper.ScheduleMapper;
import net.skhu.mentoring.service.NoticeBBSService;
import net.skhu.mentoring.utils.Encryption;
import net.skhu.mentoring.mapper.StudentMapper;
import net.skhu.mentoring.mapper.UserMapper;
import net.skhu.mentoring.mapper.DepartmentMapper;
import net.skhu.mentoring.mapper.EmployeeMapper;
import net.skhu.mentoring.mapper.ProfessorMapper;
import net.skhu.mentoring.mapper.TimeTableMapper;


@Controller
public class UserController {
	@Autowired ScheduleMapper scheduleMapper;
	@Autowired NoticeBBSService noticeBBSService;
	@Autowired UserMapper userMapper;
	@Autowired DepartmentMapper departmentMapper;
	@Autowired StudentMapper studentMapper;
	@Autowired ProfessorMapper professorMapper;
	@Autowired EmployeeMapper employeeMapper;
	@Autowired TimeTableMapper timetableMapper;
	
	
	@RequestMapping("user/index")
	public String index(Model model) {
		model.addAttribute("schedules", scheduleMapper.findAll());
		model.addAttribute("notices", noticeBBSService.getBBSList(1).subList(0, 5));
		return "user/index";
	}
	
	@RequestMapping(value="user/Edit", method=RequestMethod.GET)
	public String myPage(Model model) {
		Authentication authentication=SecurityContextHolder.getContext().getAuthentication();
		String userNumber=authentication.getName();
		
		if(studentMapper.findOne(userNumber) !=null) {
			Student student=studentMapper.findOne(userNumber);
			User my = userMapper.findEdit(student.getUserId());
			TimeTable timetable = timetableMapper.findOne(userNumber);
			String s=my.getPhoneNumber();
			my.setPhone1((String)s.subSequence(0, 3));
			my.setPhone2((String)s.subSequence(3, 7));
			my.setPhone3((String)s.subSequence(7, 11));
			
			System.out.println(my.getPassword());
			my.setPassword(Encryption.encrypt(my.getPassword(), Encryption.MD5));
			
			model.addAttribute("my", my);
			model.addAttribute("timetable",timetable);
			System.out.println(timetable.getTue4());
			System.out.println(timetable.getMon5());
		}
		
		else if(professorMapper.findOne(userNumber)!=null) {
			Professor professor=professorMapper.findOne(userNumber);
			User my = userMapper.findEdit(professor.getUserId());
			
			String s=my.getPhoneNumber();
			my.setPhone1((String)s.subSequence(0, 3));
			my.setPhone2((String)s.subSequence(3, 7));
			my.setPhone3((String)s.subSequence(7, 11));
			model.addAttribute("my", my);
		}
		
		else if(employeeMapper.findOne(userNumber)!=null) {
			Employee employee=employeeMapper.findOne(userNumber);
			User my = userMapper.findEdit(employee.getUserId());

			String s=my.getPhoneNumber();
			my.setPhone1((String)s.subSequence(0, 3));
			my.setPhone2((String)s.subSequence(3, 7));
			my.setPhone3((String)s.subSequence(7, 11));
			model.addAttribute("my", my);
		}
		
		
		User user = new User();
		model.addAttribute("user", user);
        List<Department> departments = departmentMapper.findAll();    
	        List<User> userType =userMapper.findUserType();
	        model.addAttribute("userType", userType);
	        model.addAttribute("departments", departments);
	        
		return "user/myPage";
	}
	
	
	@RequestMapping(value="user/Edit", method=RequestMethod.POST)	
	public String myPage(Model model, User user) {
				
		String phone=user.getPhone1()+""+user.getPhone2()+""+user.getPhone3();
    	System.out.println(phone);
    	String type="null";
    	int id= 0; 
    	
    	
    	if(employeeMapper.findOne(user.getNumber())!=null) {
			type="직원";			
			Employee employee=employeeMapper.findOne(user.getNumber());
			id=employee.getUserId();
		}
		
		else if(professorMapper.findOne(user.getNumber())!=null) {
			type="교수";	
			Professor professor=professorMapper.findOne(user.getNumber());
			id=professor.getUserId();
		}
    	
		else if(studentMapper.findOne(user.getNumber())!=null) {
			type="학생";	
			Student student=studentMapper.findOne(user.getNumber());
			id=student.getUserId();
		}
    
    	
    	
    	
    	if(type.equals("직원")) {
    		
    		System.out.println(type);
    		Employee employee = new Employee();
    		 employee.setEmpId(user.getNumber());
           	 employee.setPhoneNumber(phone);
           	 employee.setName(user.getUserName());
           	 employee.setAddress(user.getAddress());
           	 employee.setEmail(user.getEmail());
           	 employee.setOfficeId(user.getDepartmentId());
           	 employee.setUserId(id);
           	 
           	 employeeMapper.update(employee);
         

       	}
       	else if(type.equals("교수")) {
       		
       		System.out.println(type);
       		Professor professor = new Professor();
	       	 professor.setProfId(user.getNumber());
	       	 professor.setPhoneNumber(phone);
	       	 professor.setName(user.getUserName());
	       	 professor.setAddress(user.getAddress());
	       	 professor.setEmail(user.getEmail());
	       	 professor.setOfficeId(user.getDepartmentId());
	       	 professor.setUserId(id);
	       	 
	       	 professorMapper.update(professor);
	       	 
       	}

       	else if(type.equals("학생")){
       		
       		System.out.println(type);
       		Student student = new Student();
       		TimeTable timetable = new TimeTable();
       		
       		student.setStudentNumber(user.getNumber());
       		student.setPhoneNumber(phone);
       		student.setName(user.getUserName());
       		student.setAddress(user.getAddress());
       		student.setEmail(user.getEmail());
       		student.setDepartmentId(user.getDepartmentId());
       		student.setUserId(id);
       		
       		studentMapper.update(student);
       		
       		timetable.setStudentId(student.getStudentNumber());
       		
       		timetable.setMon1(user.getMon1());
       		timetable.setMon2(user.getMon2());
       		timetable.setMon3(user.getMon3());
       		timetable.setMon4(user.getMon4());
       		timetable.setMon5(user.getMon5());
       		timetable.setMon6(user.getMon6());
       		timetable.setMon7(user.getMon7());
       		timetable.setMon8(user.getMon8());
       		
       	
       		timetable.setTue1(user.getTue1());
       		timetable.setTue2(user.getTue2());
       		timetable.setTue3(user.getTue3());
       		timetable.setTue4(user.getTue4());
       		timetable.setTue5(user.getTue5());
       		timetable.setTue6(user.getTue6());
       		timetable.setTue7(user.getTue7());
       		timetable.setTue8(user.getTue8());
       	
       		
     		timetable.setWed1(user.getWed1());
       		timetable.setWed2(user.getWed2());
       		timetable.setWed3(user.getWed3());
       		timetable.setWed4(user.getWed4());
       		timetable.setWed5(user.getWed5());
       		timetable.setWed6(user.getWed6());
       		timetable.setWed7(user.getWed7());
       		timetable.setWed8(user.getWed8());
       		
       		timetable.setThu1(user.getThu1());
       		timetable.setThu2(user.getThu2());
       		timetable.setThu3(user.getThu3());
       		timetable.setThu4(user.getThu4());
       		timetable.setThu5(user.getThu5());
       		timetable.setThu6(user.getThu6());
       		timetable.setThu7(user.getThu7());
       		timetable.setThu8(user.getThu8());
       		
       		timetable.setFri1(user.getFri1());
       		timetable.setFri2(user.getFri2());
       		timetable.setFri3(user.getFri3());
       		timetable.setFri4(user.getFri4());
       		timetable.setFri5(user.getFri5());
       		timetable.setFri6(user.getFri6());
       		timetable.setFri7(user.getFri7());
       		timetable.setFri8(user.getFri8());
       		
       		System.out.println(user.getWed1());
       		
       		System.out.println(timetable.getMon1());
       		System.out.println(timetable.getWed1());
       		
       		timetableMapper.update(timetable);
       		
       		
       		
       		
       	}    	
    	

	        
		return "redirect:/user/index";
	}
	
}
