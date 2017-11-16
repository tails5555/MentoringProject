package net.skhu.mentoring.controller;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import net.skhu.mentoring.dto.Employee;
import net.skhu.mentoring.dto.NoticeBBSComment;
import net.skhu.mentoring.dto.NoticeBBSFile;
import net.skhu.mentoring.dto.NoticeBBSPost;
import net.skhu.mentoring.dto.Professor;
import net.skhu.mentoring.dto.Profile;
import net.skhu.mentoring.dto.Student;
import net.skhu.mentoring.mapper.EmployeeMapper;
import net.skhu.mentoring.mapper.NoticeBBSFileMapper;
import net.skhu.mentoring.mapper.NoticeBBSPostMapper;
import net.skhu.mentoring.mapper.ProfessorMapper;
import net.skhu.mentoring.mapper.ProfileMapper;
import net.skhu.mentoring.mapper.StudentMapper;
import net.skhu.mentoring.mapper.UserMapper;
import net.skhu.mentoring.model.NoticeBBSPostModel;
import net.skhu.mentoring.service.NoticeBBSCommentService;
import net.skhu.mentoring.service.NoticeBBSFileService;
import net.skhu.mentoring.service.NoticeBBSService;
@Controller
public class NoticeBBSController {
	@Autowired NoticeBBSPostMapper noticeBBSPostMapper;
	@Autowired NoticeBBSService noticeBBSService;
	@Autowired NoticeBBSCommentService noticeBBSCommentService;
	@Autowired NoticeBBSFileService noticeBBSFileService;
	@Autowired NoticeBBSFileMapper noticeBBSFileMapper;
	@Autowired UserMapper userMapper;
	@Autowired ProfileMapper profileMapper;
	@Autowired ProfessorMapper professorMapper;
	@Autowired EmployeeMapper employeeMapper;
	@Autowired StudentMapper studentMapper;
	@RequestMapping({"guest/notice/list", "user/notice/list"})
	public String noticeList(Model model, @RequestParam("bd") int bd) {
		model.addAttribute("noticeBBS", noticeBBSService.getBBSTitle(bd));
		model.addAttribute("postList", noticeBBSService.getBBSList(bd));
		return "notice/list";
	}
	@RequestMapping(value={"guest/notice/view", "user/notice/view"}, method=RequestMethod.GET)
	public String noticeView(Model model, @RequestParam("bd") int bd, @RequestParam("id") int id) {
		NoticeBBSPost noticePost=noticeBBSService.views(id);
		Authentication authentication=SecurityContextHolder.getContext().getAuthentication();
		String userNumber;
		if(authentication!=null) {
			userNumber=authentication.getName();
			if(studentMapper.findOne(userNumber)!=null) {
				Student student=studentMapper.findOne(userNumber);
				if(profileMapper.findByUserId(student.getUserId())!=null) {
					Profile profile=profileMapper.findByUserId(student.getUserId());
					noticePost.setCurrentUserProfileId(profile.getId());
				}else noticePost.setCurrentUserProfileId(-1);
			}
			else if(professorMapper.findOne(userNumber)!=null) {
				Professor professor=professorMapper.findOne(userNumber);
				if(profileMapper.findByUserId(professor.getUserId())!=null) {
					Profile profile=profileMapper.findByUserId(professor.getUserId());
					noticePost.setCurrentUserProfileId(profile.getId());
				}else noticePost.setCurrentUserProfileId(-1);
			}
			else if(employeeMapper.findOne(userNumber)!=null) {
				Employee employee=employeeMapper.findOne(userNumber);
				if(profileMapper.findByUserId(employee.getUserId())!=null) {
					Profile profile=profileMapper.findByUserId(employee.getUserId());
					noticePost.setCurrentUserProfileId(profile.getId());
				}else noticePost.setCurrentUserProfileId(-1);
			}
		}
		NoticeBBSComment newComment=new NoticeBBSComment();
		model.addAttribute("noticeBBS", noticeBBSService.getBBSTitle(bd));
		model.addAttribute("noticePost", noticePost);
		model.addAttribute("noticeFile", noticeBBSFileService.findByPostId(id));
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
	@RequestMapping("user/notice/commentDelete")
	public String commentDelete(Model model, @RequestParam("bd") int bd, @RequestParam("id") int id, @RequestParam("cmdId") int cmdId) {
		noticeBBSCommentService.deleteComment(cmdId);
		return "redirect:view?bd="+bd+"&id="+id;
	}
	@RequestMapping(value="user/notice/create", method=RequestMethod.GET)
	public String insertNoticePost(Model model, @RequestParam("bd") int bd) {
		model.addAttribute("noticeBBS", noticeBBSService.getBBSTitle(bd));
		model.addAttribute("newPost", new NoticeBBSPostModel());
		return "notice/edit";
	}
	@RequestMapping(value="user/notice/create", method=RequestMethod.POST)
	public String insertNoticePost(Model model, @RequestParam("fileUpload") MultipartFile[] uploadFiles, @RequestParam("bd") int bd, NoticeBBSPostModel noticeBBSPostModel) throws IOException{
		noticeBBSService.insertPost(bd, noticeBBSPostModel);
		NoticeBBSPost lastList=noticeBBSPostMapper.findLastPost();
		if(uploadFiles.length!=0)
			noticeBBSFileService.upload(uploadFiles, lastList.getId());
		return "redirect:list?bd="+bd;
	}
	@RequestMapping(value="user/notice/edit", method=RequestMethod.GET)
	public String updateNoticePost(Model model, @RequestParam("bd") int bd, @RequestParam("id") int id) {
		model.addAttribute("noticeBBS", noticeBBSService.getBBSTitle(bd));
		model.addAttribute("newPost", noticeBBSService.getModel(id));
		model.addAttribute("uploadFile", noticeBBSFileService.findByPostId(id));
		return "notice/edit";
	}
	@RequestMapping(value="user/notice/edit", method=RequestMethod.POST)
	public String updateNoticePost(Model model, @RequestParam("fileUpload") MultipartFile[] uploadFiles, @RequestParam("bd") int bd, @RequestParam("id") int id, NoticeBBSPostModel noticeBBSPostModel) throws IOException {
		noticeBBSService.updatePost(noticeBBSPostModel);
		if(uploadFiles.length!=0)
			noticeBBSFileService.upload(uploadFiles, id);
		return "redirect:view?bd="+bd+"&id="+id;
	}
	@RequestMapping("user/notice/fileDelete")
	public String deleteFile(Model model, @RequestParam("bd") int bd, @RequestParam("id") int id, @RequestParam("fId") int fId) throws Exception{
		noticeBBSFileService.delete(fId);
		return "redirect:view?bd="+bd+"&id="+id;
	}
	@RequestMapping("user/notice/fileAllDelete")
	public String deleteAllFile(Model model, @RequestParam("bd") int bd, @RequestParam("id") int id) throws Exception{
		noticeBBSFileService.deleteByPostId(id);
		return "redirect:view?bd="+bd+"&id="+id;
	}
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@RequestMapping("user/notice/postDelete")
	public String deletePost(Model model, @RequestParam("bd") int bd, @RequestParam("id") int id) throws Exception{
		noticeBBSFileService.deleteByPostId(id);
		noticeBBSCommentService.deleteByPostId(id);
		noticeBBSService.deletePost(id);
		return "redirect:list?bd="+bd;
	}
	@RequestMapping({"guest/notice/download", "user/notice/download"})
	public void download(@RequestParam("id") int id, HttpServletResponse response) throws Exception{
		NoticeBBSFile noticeBBSFile=noticeBBSFileMapper.findOne(id);
		if(noticeBBSFile == null) return;
		String fileName=URLEncoder.encode(noticeBBSFile.getFileName(), "UTF-8");
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment;filename="+fileName+";");
		try(BufferedOutputStream output=new BufferedOutputStream(response.getOutputStream())){
			output.write(noticeBBSFile.getData());
		}
	}
}
