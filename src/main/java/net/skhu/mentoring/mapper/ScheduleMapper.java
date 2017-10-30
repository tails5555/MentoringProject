package net.skhu.mentoring.mapper;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.mentoring.dto.Schedule;
@Mapper
public interface ScheduleMapper {
	List<Schedule> findAll();
}
