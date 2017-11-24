package net.skhu.mentoring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
