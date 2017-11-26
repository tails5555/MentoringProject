package net.skhu.mentoring.service;

import java.io.IOException;
import java.nio.file.Paths;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import net.skhu.mentoring.dto.GroupBBSFile;
import net.skhu.mentoring.mapper.GroupBBSFileMapper;

@Service
public class GroupBBSFileService {
	@Autowired GroupBBSFileMapper groupBBSFileMapper;
	public List<GroupBBSFile> findByPostId(int bbsPostId){
		return groupBBSFileMapper.findByPostId(bbsPostId);
	}
	public GroupBBSFile findOne(int id) {
		return groupBBSFileMapper.findOne(id);
	}
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	public void upload(MultipartFile[] uploadFiles, int bbsPostId) throws IOException{
		for(MultipartFile uploadFile : uploadFiles) {
			if(uploadFile.getSize() <= 0) continue;
			String fileName=Paths.get(uploadFile.getOriginalFilename()).getFileName().toString();
			GroupBBSFile groupBBSFile=new GroupBBSFile();
			groupBBSFile.setFileName(fileName);
			groupBBSFile.setFileSize((int)uploadFile.getSize());
			groupBBSFile.setFileTime(new Date());
			groupBBSFile.setData(uploadFile.getBytes());
			groupBBSFile.setBbsPostId(bbsPostId);
			groupBBSFileMapper.insert(groupBBSFile);
		}
	}
	public void delete(int id) {
		groupBBSFileMapper.delete(id);
	}
	public void deleteByPostId(int bbsPostId) {
		groupBBSFileMapper.deleteByPostId(bbsPostId);
	}
}
