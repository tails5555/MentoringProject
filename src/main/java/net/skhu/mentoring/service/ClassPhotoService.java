package net.skhu.mentoring.service;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import net.skhu.mentoring.dto.ClassPhoto;
import net.skhu.mentoring.mapper.ClassPhotoMapper;
@Service
public class ClassPhotoService {
	@Autowired ClassPhotoMapper classPhotoMapper;
	public ClassPhoto findOne(int id) {
		return classPhotoMapper.findOne(id);
	}
	public ClassPhoto findByReportId(int reportId) {
		return classPhotoMapper.findByReportId(reportId);
	}
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	public void upload(MultipartFile[] uploadFiles, int reportId) throws IOException{
		for(MultipartFile uploadFile : uploadFiles) {
			if(uploadFile.getSize() <= 0) continue;
			String fileName=Paths.get(uploadFile.getOriginalFilename()).getFileName().toString();
			ClassPhoto classPhoto=new ClassPhoto();
			classPhoto.setFileName(fileName);
			classPhoto.setFileSize((int)uploadFile.getSize());
			classPhoto.setFileTime(new Date());
			classPhoto.setReportId(reportId);
			classPhoto.setData(uploadFile.getBytes());
			classPhotoMapper.insert(classPhoto);
		}
	}
}
