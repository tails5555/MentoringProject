package net.skhu.mentoring.mapper;
import java.sql.Date;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import net.skhu.mentoring.dto.Schedule;
@Mapper
public interface ScheduleMapper {
	List<Schedule> findAll();
	Schedule findById(int id);
	void update(@Param("startDate") Date startDate,@Param("endDate") Date endDate,@Param("id") int id , @Param("manageId")int manageId);
}
