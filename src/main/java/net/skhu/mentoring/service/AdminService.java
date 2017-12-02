package net.skhu.mentoring.service;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.skhu.mentoring.dto.User;
import net.skhu.mentoring.mapper.AdminMapper;
import net.skhu.mentoring.mapper.DepartmentMapper;
import net.skhu.mentoring.mapper.EmployeeMapper;
import net.skhu.mentoring.mapper.ProfessorMapper;
import net.skhu.mentoring.mapper.StudentMapper;
import net.skhu.mentoring.mapper.UserMapper;
import net.skhu.mentoring.model.Option;
import net.skhu.mentoring.model.UserPagination;

@Service
public class AdminService {

	@Autowired UserMapper userMapper;
	@Autowired DepartmentMapper departmentMapper;
	@Autowired StudentMapper studentMapper;
	@Autowired ProfessorMapper professorMapper;
	@Autowired EmployeeMapper employeeMapper;
	@Autowired AdminMapper adminMapper;

    public List<User> findAll(UserPagination userPagination) {
        int count = userMapper.count(userPagination);
        userPagination.setRecordCount(count);
        return userMapper.findAllList(userPagination);
    }


    public Option[] getSearchByOptions() {
        return userMapper.searchBy;
    }

    public Option[] getOrderByOptions() {
    	return userMapper.orderBy;
    }



}
