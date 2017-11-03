package net.skhu.mentoring.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import net.skhu.mentoring.service.NoticeBBSService;
@Controller
public class NoticeBBSController {
	@Autowired NoticeBBSService noticeBBSService;
	@RequestMapping({"guest/notice/list", "user/notice/list"})
	public String noticeList(Model model, @RequestParam("id") int id) {
		model.addAttribute("noticeBBS", noticeBBSService.getBBSTitle(id));
		model.addAttribute("postList", noticeBBSService.getBBSList(id));
		return "notice/list";
	}
}
