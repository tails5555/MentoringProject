package net.skhu.mentoring.mapper;
import org.apache.ibatis.annotations.Mapper;

import net.skhu.mentoring.dto.Employee;
@Mapper
public interface EmployeeMapper {
	Employee findOne(String empId);
}
