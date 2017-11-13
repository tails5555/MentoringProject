package net.skhu.mentoring.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import net.skhu.mentoring.dto.MentoringGroup;

@Mapper
public interface MentoringGroupMapper {
	void insert(MentoringGroup mentoringGroup);
	MentoringGroup findByMentoId(@Param("mentoId") int mentoId);
}
