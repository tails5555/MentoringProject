package net.skhu.mentoring.mapper;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.mentoring.dto.NoticeBBSComment;
@Mapper
public interface NoticeBBSCommentMapper {
	List<NoticeBBSComment> findByBBSId(int bbsId);
	void insertComment(NoticeBBSComment noticeBBSComment);
	void deleteComment(int id);
}
