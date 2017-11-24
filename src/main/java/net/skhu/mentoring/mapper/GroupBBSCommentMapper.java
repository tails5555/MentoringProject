package net.skhu.mentoring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import net.skhu.mentoring.dto.GroupBBSComment;
@Mapper
public interface GroupBBSCommentMapper {
	List<GroupBBSComment> findByBBSId(int bbsId);
	int countByBBSPostId(@Param("bbsPostId") int bbsPostId);
	void insertComment(GroupBBSComment noticeBBSComment);
	void deleteComment(int id);
	void deleteByPostId(@Param("bbsPostId") int bbsPostId);
	void deleteByUserId(@Param("userId") int userId);
}
