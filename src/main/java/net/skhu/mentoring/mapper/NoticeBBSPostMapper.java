package net.skhu.mentoring.mapper;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.mentoring.dto.NoticeBBSPost;
@Mapper
public interface NoticeBBSPostMapper {
	List<NoticeBBSPost> findByPartyBBSId(int partyBBSId);
}
