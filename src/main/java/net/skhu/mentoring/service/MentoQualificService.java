package net.skhu.mentoring.service;

import java.io.IOException;
import java.nio.file.Paths;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import net.skhu.mentoring.dto.MentoQualific;
import net.skhu.mentoring.mapper.MentoQualificMapper;
@Service
public class MentoQualificService {
	@Autowired MentoQualificMapper mentoQualificMapper;
	public MentoQualific findByMentoId(int mentoId){
		return mentoQualificMapper.findByMentoId(mentoId);
	}
	public MentoQualific findOne(int id) {
		return mentoQualificMapper.findOne(id);
	}
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	public void upload(MultipartFile[] uploadFiles, int mentoId) throws IOException{
		for(MultipartFile uploadFile : uploadFiles) {
			if(uploadFile.getSize()<=0) continue;
			String fileName=Paths.get(uploadFile.getOriginalFilename()).getFileName().toString();
			MentoQualific mentoQualific=new MentoQualific();
			mentoQualific.setFileName(fileName);
			mentoQualific.setFileSize((int)uploadFile.getSize());
			mentoQualific.setFileTime(new Date());
			mentoQualific.setData(uploadFile.getBytes());
			mentoQualific.setMentoId(mentoId);
			mentoQualificMapper.insert(mentoQualific);
		}
	}
	public void delete(int id) throws Exception{
		mentoQualificMapper.delete(id);
	}
	public void deleteByMentoId(int mentoId) throws Exception{
		mentoQualificMapper.deleteByMentoId(mentoId);
	}
}
