package net.skhu.mentoring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import net.skhu.mentoring.model.GroupBBSPagination;
import net.skhu.mentoring.service.GroupBBSCommentService;

@Controller
public class GroupBBSCommentController {
	@Autowired GroupBBSCommentService groupBBSCommentService;
	@RequestMapping("user/groupBBS/commentDelete")
	public String commentDelete(Model model, @RequestParam("id") int id, @RequestParam("cmdId") int cmdId, GroupBBSPagination groupBBSPagination) {
		groupBBSCommentService.delete(cmdId);
		return "redirect:view?id="+id+"&"+groupBBSPagination.getQueryString();
	}
}
