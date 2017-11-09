package net.skhu.mentoring.mapper;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import net.skhu.mentoring.dto.MentoQualific;
@Mapper
public interface MentoQualificMapper {
	void insert(MentoQualific mentoQualific);
	MentoQualific findOne(int id);
	List<MentoQualific> findByMentoId(@Param("mentoId") int mentoId);
	void delete(int id);
	void deleteByMentoId(@Param("mentoId") int mentoId);
}
