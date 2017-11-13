package net.skhu.mentoring.mapper;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.mentoring.dto.MentoringGroup;

@Mapper
public interface MentoringGroupMapper {
	void insert(MentoringGroup mentoringGropu);
}
