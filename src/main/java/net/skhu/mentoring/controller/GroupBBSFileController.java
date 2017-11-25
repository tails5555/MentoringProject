package net.skhu.mentoring.controller;

import java.io.BufferedOutputStream;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import net.skhu.mentoring.dto.GroupBBSFile;
import net.skhu.mentoring.model.GroupBBSPagination;
import net.skhu.mentoring.service.GroupBBSFileService;
@Controller
public class GroupBBSFileController {
	@Autowired GroupBBSFileService groupBBSFileService;
	@RequestMapping("user/groupBBS/download")
	public void download(@RequestParam("id") int id, GroupBBSPagination groupBBSPagination, HttpServletResponse response) throws Exception{
		GroupBBSFile groupBBSFile=groupBBSFileService.findOne(id);
		if(groupBBSFile == null) return;
		String fileName=URLEncoder.encode(groupBBSFile.getFileName(), "UTF-8");
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment;filename="+fileName+";");
		try(BufferedOutputStream output=new BufferedOutputStream(response.getOutputStream())){
			output.write(groupBBSFile.getData());
		}
	}
	@RequestMapping("user/groupBBS/fileDelete")
	public String fileDelete(Model model, @RequestParam("id") int id, @RequestParam("fId") int fId, GroupBBSPagination groupBBSPagination) {
		groupBBSFileService.delete(fId);
		return "redirect:view?id="+id+"&"+groupBBSPagination.getQueryString();
	}
	@RequestMapping("user/groupBBS/fileAllDelete")
	public String fileAllDelete(Model model, @RequestParam("id") int id, GroupBBSPagination groupBBSPagination) {
		groupBBSFileService.deleteByPostId(id);
		return "redirect:view?id="+id+"&"+groupBBSPagination.getQueryString();
	}
}
