package net.skhu.mentoring.mapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import net.skhu.mentoring.dto.ClassPhoto;

@Mapper
public interface ClassPhotoMapper {
	ClassPhoto findOne(int id);
	ClassPhoto findByReportId(@Param("reportId") int reportId);
	void insert(ClassPhoto classPhoto);
}
