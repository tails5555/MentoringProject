package net.skhu.mentoring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import net.skhu.mentoring.dto.Admin;
import net.skhu.mentoring.dto.Employee;
import net.skhu.mentoring.dto.Professor;
import net.skhu.mentoring.dto.Student;
import net.skhu.mentoring.dto.User;
import net.skhu.mentoring.dto.Schedule;
import net.skhu.mentoring.mapper.ScheduleMapper;
import net.skhu.mentoring.mapper.AdminMapper;
import net.skhu.mentoring.mapper.UserMapper;
import net.skhu.mentoring.mapper.StudentMapper;
import net.skhu.mentoring.mapper.ProfessorMapper;
import net.skhu.mentoring.mapper.EmployeeMapper;
@Service
public class ScheduleService {
	
	@Autowired StudentMapper studentMapper;
	@Autowired ProfessorMapper professorMapper;
	@Autowired EmployeeMapper employeeMapper;
	@Autowired UserMapper userMapper;
	@Autowired ScheduleMapper scheduleMapper;
	@Autowired AdminMapper adminMapper;
	public String findManageNameByManageId(int id) {	//getName을 통해 학번/교번/직원번호를  파라미터로 받는다
		Schedule schedule=scheduleMapper.findById(id);
		int adminId=schedule.getManageId();
		Admin admin=adminMapper.findOne(adminId);
		User adminUser=userMapper.findOne(admin.getUserId());
		if(studentMapper.findByUserId(adminUser.getId())!=null) {
			Student student=studentMapper.findByUserId(adminUser.getId());
			schedule.setManageName(student.getName());
		}
		else if(professorMapper.findByUserId(adminUser.getId())!=null) {
			Professor professor=professorMapper.findByUserId(adminUser.getId());
			schedule.setManageName(professor.getName());
		}
		else if(employeeMapper.findByUserId(adminUser.getId())!=null) {
			Employee employee=employeeMapper.findByUserId(adminUser.getId());
			schedule.setManageName(employee.getName());
		}
		return schedule.getManageName();
	}
}
