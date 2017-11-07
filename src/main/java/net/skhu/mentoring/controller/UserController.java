package net.skhu.mentoring.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import net.skhu.mentoring.mapper.ScheduleMapper;
import net.skhu.mentoring.service.NoticeBBSService;

@Controller
public class UserController {
	@Autowired ScheduleMapper scheduleMapper;
	@Autowired NoticeBBSService noticeBBSService;
	@RequestMapping("user/index")
	public String index(Model model) {
		model.addAttribute("schedules", scheduleMapper.findAll());
		model.addAttribute("notices", noticeBBSService.getBBSList(1).subList(0, 5));
		return "user/index";
	}
}
