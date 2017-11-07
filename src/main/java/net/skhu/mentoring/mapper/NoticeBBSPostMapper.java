package net.skhu.mentoring.mapper;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import net.skhu.mentoring.dto.NoticeBBSPost;
@Mapper
public interface NoticeBBSPostMapper {
	List<NoticeBBSPost> findByPartyBBSId(int partyBBSId);
	NoticeBBSPost findById(int id);
	void updateView(int id);
	void insertPost(NoticeBBSPost noticeBBSPost);
	void updatePost(@Param("title") String title, @Param("context") String context, @Param("id") int id);
}
