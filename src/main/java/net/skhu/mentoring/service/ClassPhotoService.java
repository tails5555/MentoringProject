package net.skhu.mentoring.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.skhu.mentoring.dto.ClassPhoto;
import net.skhu.mentoring.mapper.ClassPhotoMapper;
@Service
public class ClassPhotoService {
	@Autowired ClassPhotoMapper classPhotoMapper;
	public ClassPhoto findOne(int id) {
		return classPhotoMapper.findOne(id);
	}
	public ClassPhoto findByReportId(int reportId) {
		return classPhotoMapper.findByReportId(reportId);
	}
}
