package net.skhu.mentoring.controller;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import net.skhu.mentoring.dto.GroupBBSComment;
import net.skhu.mentoring.dto.GroupBBSPost;
import net.skhu.mentoring.model.GroupBBSPagination;
import net.skhu.mentoring.model.GroupBBSPostModel;
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
		model.addAttribute("write", groupBBSPostService.isWrite(groupBBSPagination.getGd()));
		model.addAttribute("opened", groupBBSPostService.accessConfirm(groupBBSPagination.getGd()));
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
	@RequestMapping(value="user/groupBBS/edit", method=RequestMethod.GET)
	public String edit(Model model, @RequestParam("id") int id, GroupBBSPagination groupBBSPagination) {
		model.addAttribute("newPost", groupBBSPostService.getGroupPostModel(id));
		model.addAttribute("mento", groupBBSService.findOne(groupBBSPagination.getGd()));
		model.addAttribute("files", groupBBSFileService.findByPostId(id));
		return "groupBBS/edit";
	}
	@RequestMapping(value="user/groupBBS/edit", method=RequestMethod.POST)
	public String edit(Model model, @RequestParam("id") int id, @RequestParam("fileUpload") MultipartFile[] uploadFiles, GroupBBSPagination groupBBSPagination, GroupBBSPostModel groupBBSPostModel) throws IOException{
		groupBBSPostService.updatePost(groupBBSPostModel);
		if(uploadFiles.length!=0) {
			groupBBSFileService.upload(uploadFiles, id);
		}
		return "redirect:view?id="+id+"&"+groupBBSPagination.getQueryString();
	}
	@RequestMapping(value="user/groupBBS/create", method=RequestMethod.GET)
	public String create(Model model, GroupBBSPagination groupBBSPagination) {
		model.addAttribute("mento", groupBBSService.findOne(groupBBSPagination.getGd()));
		model.addAttribute("newPost", new GroupBBSPostModel());
		return "groupBBS/edit";
	}
	@RequestMapping(value="user/groupBBS/create", method=RequestMethod.POST)
	public String create(Model model, GroupBBSPagination groupBBSPagination, @RequestParam("fileUpload") MultipartFile[] uploadFiles, GroupBBSPostModel groupBBSPostModel) throws IOException{
		groupBBSPostService.insertPost(groupBBSPostModel, groupBBSPagination.getGd());
		GroupBBSPost last=groupBBSPostService.findLastPost();
		if(uploadFiles.length!=0) {
			groupBBSFileService.upload(uploadFiles, last.getId());
		}
		return "redirect:list?"+groupBBSPagination.getQueryString();
	}
	@RequestMapping("user/groupBBS/postDelete")
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	public String delete(Model model, @RequestParam("id") int id, GroupBBSPagination groupBBSPagination) {
		groupBBSPostService.deletePost(id);
		groupBBSFileService.deleteByPostId(id);
		groupBBSCommentService.deleteByPostId(id);
		return "redirect:list?gd="+groupBBSPagination.getGd()+"&pg=1";
	}
}
