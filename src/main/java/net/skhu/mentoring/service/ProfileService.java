package net.skhu.mentoring.service;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import net.skhu.mentoring.dto.Profile;
import net.skhu.mentoring.mapper.ProfileMapper;
@Service
public class ProfileService {
	@Autowired ProfileMapper profileMapper;
	public Profile findOne(int id) {
		return profileMapper.findOne(id);
	}
	public Profile findByUserId(int userId) {
		return profileMapper.findByUserId(userId);
	}
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	public void insertPhoto(MultipartFile uploadFile, int userId) throws IOException{
		if(uploadFile.getSize()<0) return;
		String fileName=Paths.get(uploadFile.getOriginalFilename()).getFileName().toString();
		Profile profile=new Profile();
		profile.setFileName(fileName);
		profile.setFileSize((int)uploadFile.getSize());
		profile.setFileTime(new Date());
		profile.setUserId(userId);
		profile.setData(uploadFile.getBytes());
		profileMapper.insert(profile);
	}
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	public void updatePhoto(MultipartFile uploadFile, int userId) throws IOException{
		if(uploadFile.getSize() <= 0 ) return;
		String fileName=Paths.get(uploadFile.getOriginalFilename()).getFileName().toString();
		Profile profile=new Profile();
		profile.setFileName(fileName);
		profile.setFileSize((int)uploadFile.getSize());
		profile.setFileTime(new Date());
		profile.setUserId(userId);
		profile.setData(uploadFile.getBytes());
		profileMapper.update(profile);
	}
	public void delete(int id) {
		profileMapper.delete(id);
	}
}
