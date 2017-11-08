package net.skhu.mentoring.mapper;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import net.skhu.mentoring.dto.IntroDetail;
@Mapper
public interface IntroDetailMapper {
	List<IntroDetail> findAllWithTitle(int titleId);
	IntroDetail findOne(int id);
	void insert(IntroDetail introDetail);
	void update(IntroDetail introDetail);
	void delete(int id);
	void deleteByTitleId(@Param("titleId") int titleId);
}
