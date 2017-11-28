package net.skhu.mentoring.mapper;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import net.skhu.mentoring.dto.Report;
import net.skhu.mentoring.model.Option;
@Mapper
public interface ReportMapper {
	List<Report> findByMentoId(@Param("mentoId") int mentoId);
	List<Report> findByMentoIdASC(@Param("mentoId") int mentoId);
	Report findOne(int id);
	Report findLastReport();
	void insert(Report report);
	void updateComment(@Param("id") int id, @Param("comment") String comment, @Param("confirmManagerId") int confirmManagerId);
	void checkConfirm(@Param("id") int id, @Param("confirmManagerId") int confirmManagerId);
	void update(Report report);
	int checkConfirmCount(@Param("mentoId") int mentoId);
	void delete(int id);
	Option[] availableType= {new Option(0, "--수업 방식 선택--"), new Option(1, "오리엔테이션"), new Option(2, "강의/실습"), new Option(3, "토론/팀워크"), new Option(4, "프로젝트 진행 방식"), new Option(5, "시험기간 질문"), new Option(6, "컨퍼런스 참석"), new Option(7, "기타")};
}
