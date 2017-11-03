package net.skhu.mentoring.mapper;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.mentoring.dto.NoticeBBS;
@Mapper
public interface NoticeBBSMapper {
	List<NoticeBBS> findAll();
	NoticeBBS findOne(int id);
}
