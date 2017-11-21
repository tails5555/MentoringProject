package net.skhu.mentoring.mapper;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import net.skhu.mentoring.dto.Report;

@Mapper
public interface ReportMapper {
	List<Report> findByMentoId(@Param("mentoId") int mentoId);
	Report findOne(int id);
	Report findLastReport();
	void insert(Report report);
	void updateComment(@Param("id") int id, @Param("comment") String comment, @Param("confirmManagerId") int confirmManagerId);
	void checkConfirm(@Param("id") int id, @Param("confirmManagerId") int confirmManagerId);
	void update(Report report);
}
