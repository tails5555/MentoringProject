package net.skhu.mentoring.controller;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import net.skhu.mentoring.dto.Employee;
import net.skhu.mentoring.dto.NoticeBBSPost;
import net.skhu.mentoring.dto.Professor;
import net.skhu.mentoring.dto.Student;
import net.skhu.mentoring.dto.User;
import net.skhu.mentoring.mapper.EmployeeMapper;
import net.skhu.mentoring.mapper.NoticeBBSPostMapper;
import net.skhu.mentoring.mapper.ProfessorMapper;
import net.skhu.mentoring.mapper.ScheduleMapper;
import net.skhu.mentoring.mapper.StudentMapper;
import net.skhu.mentoring.mapper.UserMapper;
@Controller
public class GuestController {
	@Autowired ScheduleMapper scheduleMapper;
	@Autowired NoticeBBSPostMapper noticeBBSPostMapper;
	@Autowired UserMapper userMapper;
	@Autowired StudentMapper studentMapper;
	@Autowired EmployeeMapper employeeMapper;
	@Autowired ProfessorMapper professorMapper;
	@RequestMapping("/")
	public String index(Model model) {
		model.addAttribute("schedules", scheduleMapper.findAll());
		List<NoticeBBSPost> notices=noticeBBSPostMapper.findByPartyBBSId(1);
		for(NoticeBBSPost list : notices) {
			User writeUser=userMapper.findOne(list.getUserId());
			if(writeUser.getUserType().equals("학생회장")) {
				Student student=studentMapper.findByUserId(writeUser.getId());
				list.setUserName(student.getName());
			}
			else if(writeUser.getUserType().equals("교수")) {
				Professor professor=professorMapper.findByUserId(writeUser.getId());
				list.setUserName(professor.getName());
			}
			else if(writeUser.getUserType().equals("직원")) {
				Employee employee=employeeMapper.findByUserId(writeUser.getId());
				list.setUserName(employee.getName());
			}
		}
		model.addAttribute("notices", notices);
		return "guest/index";
	}
	@RequestMapping("guest/login")
	public String login() {
		return "guest/login";
	}
}
