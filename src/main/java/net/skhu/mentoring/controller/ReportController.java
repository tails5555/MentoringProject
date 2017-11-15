package net.skhu.mentoring.controller;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import net.skhu.mentoring.dto.Department;
import net.skhu.mentoring.dto.Mento;
import net.skhu.mentoring.dto.Student;
import net.skhu.mentoring.mapper.DepartmentMapper;
import net.skhu.mentoring.mapper.MentoMapper;
import net.skhu.mentoring.mapper.StudentMapper;
import net.skhu.mentoring.mapper.UserMapper;
import net.skhu.mentoring.service.ProfileService;
@Controller
public class ReportController {
	@Autowired MentoMapper mentoMapper;
	@Autowired ProfileService profileService;
	@Autowired UserMapper userMapper;
	@Autowired StudentMapper studentMapper;
	@Autowired DepartmentMapper departmentMapper;
	@RequestMapping("user/report/confirm")
	public String mentoList(Model model) {
		List<Mento> mentoList=mentoMapper.findAll();
		for(Mento m : mentoList){
			Student student=studentMapper.findByUserId(m.getUserId());
			m.setName(student.getName());
			Department d=departmentMapper.findOne(student.getDepartmentId());
			m.setDepartmentName(d.getName());
			if(profileService.findByUserId(m.getUserId())!=null) {
				m.setProfileId(profileService.findByUserId(m.getUserId()).getId());
			}
			else m.setProfileId(-1);
		}
		model.addAttribute("mentos", mentoList);
		return "report/mentoList";
	}

}
