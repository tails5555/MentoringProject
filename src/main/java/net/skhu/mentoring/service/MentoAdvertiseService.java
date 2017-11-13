package net.skhu.mentoring.service;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import net.skhu.mentoring.dto.MentoAdvertise;
import net.skhu.mentoring.mapper.MentoAdvertiseMapper;
@Service
public class MentoAdvertiseService {
	@Autowired MentoAdvertiseMapper mentoAdvertiseMapper;
	public MentoAdvertise findByMentoId(int mentoId){
		return mentoAdvertiseMapper.findByMentoId(mentoId);
	}
	public MentoAdvertise findOne(int id) {
		return mentoAdvertiseMapper.findOne(id);
	}
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	public void upload(MultipartFile[] uploadFiles, int mentoId) throws IOException{
		for(MultipartFile uploadFile : uploadFiles) {
			if(uploadFile.getSize()<=0) continue;
			String fileName=Paths.get(uploadFile.getOriginalFilename()).getFileName().toString();
			MentoAdvertise mentoAdvertise=new MentoAdvertise();
			mentoAdvertise.setFileName(fileName);
			mentoAdvertise.setFileSize((int)uploadFile.getSize());
			mentoAdvertise.setFileTime(new Date());
			mentoAdvertise.setData(uploadFile.getBytes());
			mentoAdvertise.setMentoId(mentoId);
			mentoAdvertiseMapper.insert(mentoAdvertise);
		}
	}
	public void delete(int id) throws Exception{
		mentoAdvertiseMapper.delete(id);
	}
	public void deleteByMentoId(int mentoId) throws Exception{
		mentoAdvertiseMapper.deleteByMentoId(mentoId);
	}
}
