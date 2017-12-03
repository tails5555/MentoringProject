package net.skhu.mentoring.mapper;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.mentoring.dto.Survey;

@Mapper
public interface SurveyMapper {
	List<Survey> findAll();
	Survey findOne(int id);
	void update(Survey survey);
}
