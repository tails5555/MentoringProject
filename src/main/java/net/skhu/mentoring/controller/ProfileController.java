package net.skhu.mentoring.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import net.skhu.mentoring.dto.Profile;
import net.skhu.mentoring.service.ProfileService;
@Controller
public class ProfileController {
	@Autowired ProfileService profileService;
	@RequestMapping({"user/image/profile/{id}", "guest/image/profile/{id}"})
	public void profileView(HttpServletRequest req, HttpServletResponse res, @PathVariable("id") int id) throws IOException{
		res.setContentType("image/jpeg");
		Profile profile=profileService.findOne(id);
		byte[] imageFile=profile.getData();
		InputStream in1=new ByteArrayInputStream(imageFile);
		IOUtils.copy(in1, res.getOutputStream());
	}
	@RequestMapping("user/reset")
	public String reset(Model model, @RequestParam("id") int id) {
		profileService.delete(id);
		return "redirect:Edit.do";
	}
}
