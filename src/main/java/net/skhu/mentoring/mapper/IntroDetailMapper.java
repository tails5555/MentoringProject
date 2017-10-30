package net.skhu.mentoring.mapper;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.mentoring.dto.IntroDetail;
@Mapper
public interface IntroDetailMapper {
	List<IntroDetail> findAllWithTitle(int titleId);
}
