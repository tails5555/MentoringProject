package net.skhu.mentoring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import net.skhu.mentoring.service.GroupBBSService;

@Controller
public class GroupBBSController {
	@Autowired GroupBBSService groupBBSService;
	@RequestMapping("user/groupBBS")
	public String groupBBS(Model model) {
		model.addAttribute("mentos", groupBBSService.findGroupList());
		return "groupBBS/mentoList";
	}
}
