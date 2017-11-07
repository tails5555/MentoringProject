package net.skhu.mentoring.mapper;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.mentoring.dto.Employee;
import net.skhu.mentoring.dto.Professor;
@Mapper
public interface EmployeeMapper {
	Employee findOne(String empId);
	Employee findByUserId(int userId);
	List<Employee> findAll();
}
