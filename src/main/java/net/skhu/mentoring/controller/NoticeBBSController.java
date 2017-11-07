package net.skhu.mentoring.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import net.skhu.mentoring.dto.NoticeBBSComment;
import net.skhu.mentoring.service.NoticeBBSCommentService;
import net.skhu.mentoring.service.NoticeBBSService;
@Controller
public class NoticeBBSController {
	@Autowired NoticeBBSService noticeBBSService;
	@Autowired NoticeBBSCommentService noticeBBSCommentService;
	@RequestMapping({"guest/notice/list", "user/notice/list"})
	public String noticeList(Model model, @RequestParam("bd") int bd) {
		model.addAttribute("noticeBBS", noticeBBSService.getBBSTitle(bd));
		model.addAttribute("postList", noticeBBSService.getBBSList(bd));
		return "notice/list";
	}
	@RequestMapping(value={"guest/notice/view", "user/notice/view"}, method=RequestMethod.GET)
	public String noticeView(Model model, @RequestParam("bd") int bd, @RequestParam("id") int id) {
		NoticeBBSComment newComment=new NoticeBBSComment();
		model.addAttribute("noticeBBS", noticeBBSService.getBBSTitle(bd));
		model.addAttribute("noticePost", noticeBBSService.views(id));
		model.addAttribute("noticeComment", noticeBBSCommentService.findByBBSId(id));
		model.addAttribute("newComment", newComment);
		return "notice/view";
	}
	@RequestMapping(value={"guest/notice/view", "user/notice/view"}, method=RequestMethod.POST)
	public String noticeView(Model model, @RequestParam("bd") int bd, @RequestParam("id") int id, NoticeBBSComment newComment) {
		newComment.setBbsPostId(id);
		noticeBBSCommentService.insertComment(newComment);
		return "redirect:view?bd="+bd+"&id="+id;
	}
	@RequestMapping(value= "user/notice/commentDelete")
	public String commentDelete(Model model, @RequestParam("bd") int bd, @RequestParam("id") int id, @RequestParam("cmdId") int cmdId) {
		noticeBBSCommentService.deleteComment(cmdId);
		return "redirect:view?bd="+bd+"&id="+id;
	}

}
