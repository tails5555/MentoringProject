package net.skhu.mentoring.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import net.skhu.mentoring.dto.Department;
import net.skhu.mentoring.dto.Student;
import net.skhu.mentoring.dto.TimeTable;
import net.skhu.mentoring.dto.User;
import net.skhu.mentoring.mapper.DepartmentMapper;
import net.skhu.mentoring.mapper.StudentMapper;
import net.skhu.mentoring.mapper.TimeTableMapper;
import net.skhu.mentoring.mapper.UserMapper;
import net.skhu.mentoring.service.ProfileService;
import net.skhu.mentoring.utils.Encryption;


@RequestMapping("/guest")
@Controller
public class SignController {

	@Autowired UserMapper userMapper;
	@Autowired DepartmentMapper departmentMapper;
	@Autowired StudentMapper studentMapper;
	@Autowired TimeTableMapper timetableMapper;
	@Autowired ProfileService profileService;

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
    public String create(Model model, User user, @RequestParam("uploadFile") MultipartFile uploadFile) throws IOException{


	    	String phone=user.getPhone1()+""+user.getPhone2()+""+user.getPhone3();
	    	System.out.println(phone);
	    	Student student =new Student();
	    	TimeTable timetable =new TimeTable();

	    	student.setStudentNumber(user.getStudentNumber());
	    	student.setName(user.getUserName());
	    	student.setAddress(user.getAddress());
	    	student.setEmail(user.getEmail());
	    	student.setDepartmentId(user.getDepartmentId());
	    	user.setPassword(Encryption.encrypt(user.getPassword(), Encryption.MD5));
	    	userMapper.insert(user);
	    	student.setUserId(user.getUserId());
	    	student.setPhoneNumber(phone);

	        studentMapper.insert(student);

	        timetable.setStudentId(student.getStudentNumber());

	        timetableMapper.insert(timetable);
	        if(uploadFile.getSize()>0) {
	        	profileService.insertPhoto(uploadFile, user.getUserId());
	        }
	        return "redirect:login";

    }

}
