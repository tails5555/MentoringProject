package net.skhu.mentoring.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import net.skhu.mentoring.dto.ClassPhoto;
import net.skhu.mentoring.service.ClassPhotoService;
@Controller
public class ClassPhotoController {
	@Autowired ClassPhotoService classPhotoService;
	@RequestMapping("user/image/mentoring/{id}")
	public void profileView(HttpServletRequest req, HttpServletResponse res, @PathVariable("id") int id) throws IOException{
		res.setContentType("image/jpeg");
		ClassPhoto classPhoto=classPhotoService.findByReportId(id);
		byte[] imageFile=classPhoto.getData();
		InputStream in1=new ByteArrayInputStream(imageFile);
		IOUtils.copy(in1, res.getOutputStream());
	}
}
