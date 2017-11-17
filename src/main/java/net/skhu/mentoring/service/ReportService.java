package net.skhu.mentoring.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.skhu.mentoring.dto.Mento;
import net.skhu.mentoring.dto.Report;
import net.skhu.mentoring.dto.Student;
import net.skhu.mentoring.mapper.MentoMapper;
import net.skhu.mentoring.mapper.ReportMapper;
import net.skhu.mentoring.mapper.StudentMapper;
@Service
public class ReportService {
	@Autowired ReportMapper reportMapper;
	@Autowired MentoMapper mentoMapper;
	@Autowired StudentMapper studentMapper;
	public Report findOne(int id) {
		Report report=reportMapper.findOne(id);
		Mento mento=mentoMapper.findOne(report.getMentoId());
		Student student=studentMapper.findByUserId(mento.getUserId());
		report.setMentoName(student.getName());
		report.setTeamName(mento.getTeamName());
		report.setMentoSubject(mento.getSubject());
		return report;
	}
	public List<Report> findByMentoId(int mentoId) {
		return reportMapper.findByMentoId(mentoId);
	}
}
