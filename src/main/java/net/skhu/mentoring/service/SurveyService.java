package net.skhu.mentoring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.skhu.mentoring.dto.Survey;
import net.skhu.mentoring.mapper.SurveyMapper;
@Service
public class SurveyService {
	@Autowired SurveyMapper surveyMapper;
	public List<Survey> findAll(){
		return surveyMapper.findAll();
	}
	public Survey findOne(int id) {
		return surveyMapper.findOne(id);
	}
	public void update(Survey survey) {
		surveyMapper.update(survey);
	}
}
