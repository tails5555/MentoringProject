package net.skhu.mentoring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import net.skhu.mentoring.dto.ReportPopup;
@Mapper
public interface ReportPopupMapper {
	List<ReportPopup> findAll();
	List<ReportPopup> findByType(@Param("type") int type);
	void insert(ReportPopup reportPopup);
}
