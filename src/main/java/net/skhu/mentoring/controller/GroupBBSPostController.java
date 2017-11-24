package net.skhu.mentoring.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import net.skhu.mentoring.dto.GroupBBSComment;
import net.skhu.mentoring.model.GroupBBSPagination;
import net.skhu.mentoring.service.GroupBBSCommentService;
import net.skhu.mentoring.service.GroupBBSFileService;
import net.skhu.mentoring.service.GroupBBSPostService;
import net.skhu.mentoring.service.GroupBBSService;

@Controller
public class GroupBBSPostController {
	@Autowired GroupBBSPostService groupBBSPostService;
	@Autowired GroupBBSService groupBBSService;
	@Autowired GroupBBSCommentService groupBBSCommentService;
	@Autowired GroupBBSFileService groupBBSFileService;
	@RequestMapping("user/groupBBS/list")
	public String list(Model model, GroupBBSPagination groupBBSPagination) {
		model.addAttribute("postList", groupBBSPostService.getBBSList(groupBBSPagination));
		model.addAttribute("searchBy", groupBBSPostService.getSearchOptions());
		model.addAttribute("mento", groupBBSService.findOne(groupBBSPagination.getGd()));
		return "groupBBS/list";
	}
	@RequestMapping(value="user/groupBBS/view", method=RequestMethod.GET)
	public String view(Model model, @RequestParam("id") int id, GroupBBSPagination groupBBSPagination) {
		model.addAttribute("post", groupBBSPostService.findOne(id));
		model.addAttribute("mento", groupBBSService.findOne(groupBBSPagination.getGd()));
		model.addAttribute("comments", groupBBSCommentService.findByPostId(id));
		model.addAttribute("files", groupBBSFileService.findByPostId(id));
		model.addAttribute("newComment", new GroupBBSComment());
		return "groupBBS/view";
	}
	@RequestMapping(value="user/groupBBS/view", method=RequestMethod.POST)
	public String view(Model model, @RequestParam("id") int id, GroupBBSPagination groupBBSPagination, GroupBBSComment groupBBSComment) {
		groupBBSComment.setBbsPostId(id);
		groupBBSCommentService.insertComment(groupBBSComment);
		return "redirect:view?id="+id+"&"+groupBBSPagination.getQueryString();
	}
}
