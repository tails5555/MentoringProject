package net.skhu.mentoring.controller;

import java.io.IOException;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import net.skhu.mentoring.dto.Mento;
import net.skhu.mentoring.mapper.MentoMapper;
import net.skhu.mentoring.mapper.StudentMapper;
import net.skhu.mentoring.mapper.TimeTableMapper;
import net.skhu.mentoring.mapper.UserMapper;
import net.skhu.mentoring.service.MentoAdvertiseService;
import net.skhu.mentoring.service.MentoQualificService;
@Controller
public class MentoringController {

	@Autowired MentoMapper mentoMapper;
	@Autowired TimeTableMapper timeTableMapper;
	@Autowired UserMapper userMapper;
	@Autowired StudentMapper studentMapper;
	@Autowired MentoAdvertiseService mentoAdvertiseService;
	@Autowired MentoQualificService mentoQualificService;
	@RequestMapping(value="user/mento_apli" ,method=RequestMethod.GET)
	public String mento_apli(Model model) {
		Authentication authentication=SecurityContextHolder.getContext().getAuthentication();
		String studentNumber=authentication.getName();
		Mento newMento=new Mento();
		model.addAttribute("mento", newMento);
		model.addAttribute("mentos", mentoMapper.findByStudentNumber(studentNumber));
		model.addAttribute("timetable", timeTableMapper.findOne(studentNumber));
		return "mentoring/mento_apli";
	}

	@RequestMapping(value="user/mento_apli",method=RequestMethod.POST)
	public String mento_apli(Model model, Mento mento, @RequestParam("advertiseUpload") MultipartFile[] advFile, @RequestParam("qualificUpload") MultipartFile[] quaFile) throws IOException {
		Authentication authentication=SecurityContextHolder.getContext().getAuthentication();
		String studentNumber=authentication.getName();
		mento.setUserId(studentMapper.findOne(studentNumber).getUserId());
		mento.setApplicationDate(new Date());
		mentoMapper.insert(mento);
		Mento newMento=mentoMapper.findLastMento();
		System.out.println(newMento.getId());
		if(advFile.length!=0) {
			mentoAdvertiseService.upload(advFile, newMento.getId());
		}
		if(quaFile.length!=0) {
			mentoQualificService.upload(quaFile, newMento.getId());
		}
		return "redirect:mento_apli";
	}
}
