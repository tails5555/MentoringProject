package net.skhu.mentoring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import net.skhu.mentoring.dto.GroupBBSFile;
@Mapper
public interface GroupBBSFileMapper {
	GroupBBSFile findOne(int id);
	List<GroupBBSFile> findByPostId(@Param("bbsPostId") int bbsPostId);
	void insert(GroupBBSFile groupBBSPost);
	void delete(int id);
	void deleteByPostId(@Param("bbsPostId") int bbsPostId);
}
