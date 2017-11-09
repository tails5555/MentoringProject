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

import net.skhu.mentoring.dto.NoticeBBSFile;
import net.skhu.mentoring.mapper.NoticeBBSFileMapper;
@Service
public class NoticeBBSFileService {
	@Autowired NoticeBBSFileMapper noticeBBSFileMapper;
	public List<NoticeBBSFile> findByPostId(int bbsPostId){
		return noticeBBSFileMapper.findByPostId(bbsPostId);
	}
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	public void upload(MultipartFile[] uploadFiles, int bbsPostId) throws IOException{
		for(MultipartFile uploadFile : uploadFiles) {
			if(uploadFile.getSize() <= 0) continue;
			String fileName=Paths.get(uploadFile.getOriginalFilename()).getFileName().toString();
			NoticeBBSFile noticeBBSFile=new NoticeBBSFile();
			noticeBBSFile.setFileName(fileName);
			noticeBBSFile.setFileSize((int)uploadFile.getSize());
			noticeBBSFile.setFileTime(new Date());
			noticeBBSFile.setData(uploadFile.getBytes());
			noticeBBSFile.setBbsPostId(bbsPostId);
			noticeBBSFileMapper.insert(noticeBBSFile);
		}
	}
	public void delete(int id) throws Exception{
		noticeBBSFileMapper.delete(id);
	}
	public void deleteByPostId(int postId) throws Exception{
		noticeBBSFileMapper.deleteByPostId(postId);
	}
}
