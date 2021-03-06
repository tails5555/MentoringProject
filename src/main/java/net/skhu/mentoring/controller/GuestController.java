package net.skhu.mentoring.controller;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import net.skhu.mentoring.dto.Employee;
import net.skhu.mentoring.dto.Professor;
import net.skhu.mentoring.dto.Student;
import net.skhu.mentoring.dto.User;
import net.skhu.mentoring.mapper.DepartmentMapper;
import net.skhu.mentoring.mapper.EmployeeMapper;
import net.skhu.mentoring.mapper.ProfessorMapper;
import net.skhu.mentoring.mapper.ScheduleMapper;
import net.skhu.mentoring.mapper.StudentMapper;
import net.skhu.mentoring.mapper.TimeTableMapper;
import net.skhu.mentoring.mapper.UserMapper;
import net.skhu.mentoring.service.GuestService;
import net.skhu.mentoring.service.NoticeBBSService;
import net.skhu.mentoring.service.ProfileService;
import net.skhu.mentoring.utils.Encryption;

@Controller
@RequestMapping("/")
public class GuestController {


	@Autowired ScheduleMapper scheduleMapper;
	@Autowired NoticeBBSService noticeBBSService;
	@Autowired UserMapper userMapper;
	@Autowired DepartmentMapper departmentMapper;
	@Autowired StudentMapper studentMapper;
	@Autowired ProfessorMapper professorMapper;
	@Autowired EmployeeMapper employeeMapper;
	@Autowired TimeTableMapper timetableMapper;
	@Autowired ProfileService profileService;
	@Autowired GuestService guestService;


	@RequestMapping(value={"/","guest/index"})
	public String index(Model model) {
		model.addAttribute("schedules", scheduleMapper.findAll());
		model.addAttribute("notices", noticeBBSService.findFiveNoticePost());
		return "guest/index";
	}

	@RequestMapping("guest/login")
	public String login() {
		return "guest/login";
	}


	@RequestMapping(value="guest/searchPassword", method=RequestMethod.GET)
    public String searchPassword(Model model, @RequestParam("correct") boolean correct) {
		User user =new User();
		model.addAttribute("user", user);
        return "guest/searchPassword";
    }

    @RequestMapping(value="guest/searchPassword", method=RequestMethod.POST)
    public String searchPassword(Model model, User user ) throws IOException  {

    	System.out.println(user.getEmail());
    	System.out.println(user.getNumber());
    	boolean isCorrect=false;
    	if(studentMapper.findOne(user.getNumber()) !=null) {

			Student student=studentMapper.findOne(user.getNumber());

			System.out.println(student.getEmail());
			System.out.println(user.getEmail());
			System.out.println(student.getPhoneNumber());
			int i= student.getPhoneNumber().length();
			System.out.println(i);
			String s = "a" + student.getPhoneNumber().substring(i-4, i);

			if(student.getEmail().equals(user.getEmail())) {
	    		System.out.println(s);
	    		isCorrect=true;
	    		guestService.sendEamil(student.getEmail());

			}



		}

		else if(professorMapper.findOne(user.getNumber())!=null) {
			Professor professor=professorMapper.findOne(user.getNumber());


			int i= professor.getPhoneNumber().length();
			System.out.println(i);
			String s = "a" + professor.getPhoneNumber().substring(i-4, i);

			if(professor.getEmail().equals(user.getEmail())) {
	    		System.out.println(s);
	    		isCorrect=true;
	    		guestService.sendEamil(professor.getEmail());

			}

		}

		else if(employeeMapper.findOne(user.getNumber())!=null) {
			Employee employee=employeeMapper.findOne(user.getNumber());


			int i= employee.getPhoneNumber().length();
			System.out.println(i);
			String s = "a" + employee.getPhoneNumber().substring(i-4, i);

			if(employee.getEmail().equals(user.getEmail())) {
	    		System.out.println(s);
	    		guestService.sendEamil(employee.getEmail());
	    		isCorrect=true;
			}

		}


        if(isCorrect) {
        	return "redirect:searchPassword2?correct=true";
        }
        else {
        	return "redirect:searchPassword?correct=false";
        }
    }


	@RequestMapping(value="guest/searchPassword2", method=RequestMethod.GET)
    public String searchPassword2(Model model, @RequestParam("correct") boolean correct) {
		User user =new User();
		model.addAttribute("user", user);


        return "guest/searchPassword2";
    }

    @RequestMapping(value="guest/searchPassword2", method=RequestMethod.POST)
    public String searchPassword2(Model model, User user ) {

    	System.out.println(user.getNumber());
    	System.out.println(user.getNumber2());

    	if(guestService.check(user.getNumber2())){


		    	if(studentMapper.findOne(user.getNumber()) !=null) {

					Student student=studentMapper.findOne(user.getNumber());

					System.out.println(student.getEmail());

					System.out.println(student.getPhoneNumber());
					int i= student.getPhoneNumber().length();
					System.out.println(i);
					String s = "a" + student.getPhoneNumber().substring(i-4, i);

			    		System.out.println(s);

			    		User user1 =userMapper.findOne(student.getUserId());
			    		user1.setPassword(Encryption.encrypt(s, Encryption.MD5));

			    		userMapper.updatePassword(user1);


				}

				else if(professorMapper.findOne(user.getNumber())!=null) {
					Professor professor=professorMapper.findOne(user.getNumber());


					int i= professor.getPhoneNumber().length();
					System.out.println(i);
					String s = "a" + professor.getPhoneNumber().substring(i-4, i);


			    		System.out.println(s);

			    		User user1 =userMapper.findOne(professor.getUserId());
			    		user1.setPassword(Encryption.encrypt(s, Encryption.MD5));
			    		userMapper.updatePassword(user1);

				}

				else if(employeeMapper.findOne(user.getNumber())!=null) {
					Employee employee=employeeMapper.findOne(user.getNumber());


					int i= employee.getPhoneNumber().length();
					System.out.println(i);
					String s = "a" + employee.getPhoneNumber().substring(i-4, i);

			    		System.out.println(s);

			    		User user1 =userMapper.findOne(employee.getUserId());
			    		user1.setPassword(Encryption.encrypt(s, Encryption.MD5));
			    		userMapper.updatePassword(user1);

				}
		    	return "redirect:index?passwordChange=true";
    	}
    	else {
    		return "redirect:searchPassword2?correct=false";
    	}



    }

}
