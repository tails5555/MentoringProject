package net.skhu.mentoring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import net.skhu.mentoring.mapper.MentoMapper;
import net.skhu.mentoring.mapper.TimeTableMapper;
import net.skhu.mentoring.mapper.StudentMapper;
import net.skhu.mentoring.mapper.UserMapper;
import net.skhu.mentoring.dto.Mento;
@Controller
public class MentoringController {
	
	@Autowired MentoMapper mentoMapper;
	@Autowired TimeTableMapper timeTableMapper;
	@Autowired UserMapper userMapper;
	@Autowired StudentMapper studentMapper;
	@RequestMapping(value="user/mento_apli" ,method=RequestMethod.GET)
	public String mento_apli(Model model) {
		Authentication authentication=SecurityContextHolder.getContext().getAuthentication();
		String studentNumber=authentication.getName();
		Mento newMento=new Mento();
		newMento.setUserId(studentMapper.findOne(studentNumber).getUserId());
		model.addAttribute("mento", newMento);
		model.addAttribute("mentos", mentoMapper.findAll());
		model.addAttribute("timetable", timeTableMapper.findOne(studentNumber));
		return "mentoring/mento_apli";
	}
	
	@RequestMapping(value="user/mento_apli",method=RequestMethod.POST)
	public String mento_apli(Model model,Mento mento) {
		mentoMapper.insert(mento);
		return "mentoring/mento_apli";
	}
}
