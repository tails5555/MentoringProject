package net.skhu.mentoring.mapper;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import net.skhu.mentoring.dto.NoticeBBSPost;
import net.skhu.mentoring.model.Option;
import net.skhu.mentoring.model.Pagination;
@Mapper
public interface NoticeBBSPostMapper {
	List<NoticeBBSPost> findByPartyBBSId(Pagination pagination);
 	int count(Pagination pagination);
	List<NoticeBBSPost> findFiveNoticePost();
	List<NoticeBBSPost> findByUserId(int userId);
	NoticeBBSPost findTopByBdOrderByIdDesc(@Param("bd") int bd);
	NoticeBBSPost findById(int id);
	NoticeBBSPost findLastPost();
	void updateView(int id);
	void insertPost(NoticeBBSPost noticeBBSPost);
	void updatePost(@Param("title") String title, @Param("context") String context, @Param("id") int id);
	void delete(int id);
	void deleteByUserId(@Param("userId") int userId);
	Option[] searchBy= {new Option(0, "검색 선택"), new Option(1, "제목"), new Option(2, "본문"), new Option(3, "제목+본문"), new Option(4, "작성자")};
}
