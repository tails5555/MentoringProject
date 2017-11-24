package net.skhu.mentoring.mapper;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import net.skhu.mentoring.dto.GroupBBSPost;
import net.skhu.mentoring.model.GroupBBSPagination;
import net.skhu.mentoring.model.Option;
@Mapper
public interface GroupBBSPostMapper {
	List<GroupBBSPost> findByGroupId(GroupBBSPagination groupBBSPagination);
	int count(GroupBBSPagination pagination);
	List<GroupBBSPost> findByUserId(int userId);
	GroupBBSPost findTopByGdOrderByDesc(@Param("gd") int gd);
	GroupBBSPost findOne(int id);
	GroupBBSPost findLastPost();
	void updateView(int id);
	void insertPost(GroupBBSPost groupBBSPost);
	void updatePost(@Param("title") String title, @Param("context") String context, @Param("id") int id);
	void delete(int id);
	void deleteByUserId(@Param("userId") int userId);
	Option[] searchBy= {new Option(0, "검색 선택"), new Option(1, "제목"), new Option(2, "본문"), new Option(3, "제목+본문"), new Option(4, "작성자")};
}
