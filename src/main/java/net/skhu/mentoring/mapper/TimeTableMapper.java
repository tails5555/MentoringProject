package net.skhu.mentoring.mapper;

import org.apache.ibatis.annotations.Mapper;
import net.skhu.mentoring.dto.TimeTable;

@Mapper
public interface TimeTableMapper {
	TimeTable findOne(String studentId);
	void insert(TimeTable timeTalbe);
	void update(TimeTable timeTable);
	
}
