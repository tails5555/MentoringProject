package net.skhu.mentoring.mapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import net.skhu.mentoring.dto.MentoQualific;
@Mapper
public interface MentoQualificMapper {
	void insert(MentoQualific mentoQualific);
	MentoQualific findOne(int id);
	MentoQualific findByMentoId(@Param("mentoId") int mentoId);
	void delete(int id);
	void deleteByMentoId(@Param("mentoId") int mentoId);
}
