package net.skhu.mentoring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import net.skhu.mentoring.dto.TimeTable;
import net.skhu.mentoring.dto.User;

@Mapper
public interface TimeTableMapper {
	TimeTable findOne(String studentId);
	String findId(String studentId);
	void insert(TimeTable timeTalbe);
	void update(TimeTable timeTable);
	List<String> findStudentId();
	
}
