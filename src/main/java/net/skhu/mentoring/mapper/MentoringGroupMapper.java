package net.skhu.mentoring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import net.skhu.mentoring.dto.MentoringGroup;

@Mapper
public interface MentoringGroupMapper {
	void insert(MentoringGroup mentoringGroup);
	MentoringGroup findByMentoId(@Param("mentoId") int mentoId);
	void delete(@Param("mentoId") int mentoId);
	MentoringGroup findOne(@Param("id") int id);
	void infoUpdate(@Param("id") int id, @Param("infoOpen") Boolean infoOpen);
	List<MentoringGroup> findwithMentoWithStudent();


}
