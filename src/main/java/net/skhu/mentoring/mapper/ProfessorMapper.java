package net.skhu.mentoring.mapper;
import org.apache.ibatis.annotations.Mapper;

import net.skhu.mentoring.dto.Professor;
@Mapper
public interface ProfessorMapper {
	Professor findOne(String profId);
}
