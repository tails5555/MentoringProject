package net.skhu.mentoring.mapper;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import net.skhu.mentoring.dto.NoticeBBSFile;
@Mapper
public interface NoticeBBSFileMapper {
	NoticeBBSFile findOne(int id);
	List<NoticeBBSFile> findByPostId(@Param("bbsPostId") int bbsPostId);
	void insert(NoticeBBSFile noticeBBSPost);
	void delete(int id);
	void deleteByPostId(@Param("bbsPostId") int bbsPostId);
}
