package net.skhu.mentoring.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.skhu.mentoring.dto.Employee;
import net.skhu.mentoring.dto.NoticeBBS;
import net.skhu.mentoring.dto.NoticeBBSPost;
import net.skhu.mentoring.dto.Professor;
import net.skhu.mentoring.dto.Student;
import net.skhu.mentoring.dto.User;
import net.skhu.mentoring.mapper.EmployeeMapper;
import net.skhu.mentoring.mapper.NoticeBBSMapper;
import net.skhu.mentoring.mapper.NoticeBBSPostMapper;
import net.skhu.mentoring.mapper.ProfessorMapper;
import net.skhu.mentoring.mapper.StudentMapper;
import net.skhu.mentoring.mapper.UserMapper;
@Service
public class NoticeBBSService {
	@Autowired NoticeBBSPostMapper noticeBBSPostMapper;
	@Autowired NoticeBBSMapper noticeBBSMapper;
	@Autowired UserMapper userMapper;
	@Autowired ProfessorMapper professorMapper;
	@Autowired EmployeeMapper employeeMapper;
	@Autowired StudentMapper studentMapper;
	public List<NoticeBBSPost> getBBSList(int id){
		List<NoticeBBSPost> notices=noticeBBSPostMapper.findByPartyBBSId(id);
		for(NoticeBBSPost list : notices) {
			User writeUser=userMapper.findOne(list.getUserId());
			if(writeUser.getUserType().equals("학생회장")) {
				Student student=studentMapper.findByUserId(writeUser.getId());
				list.setUserName(student.getName());
			}
			else if(writeUser.getUserType().equals("교수")) {
				Professor professor=professorMapper.findByUserId(writeUser.getId());
				list.setUserName(professor.getName());
			}
			else if(writeUser.getUserType().equals("직원")) {
				Employee employee=employeeMapper.findByUserId(writeUser.getId());
				list.setUserName(employee.getName());
			}
			else if(writeUser.getUserType().equals("멘티")) {
				Student student=studentMapper.findByUserId(writeUser.getId());
				list.setUserName(student.getName());
			}
			else if(writeUser.getUserType().equals("멘토")) {
				Student student=studentMapper.findByUserId(writeUser.getId());
				list.setUserName(student.getName());
			}
		}
		return notices;
	}
	public NoticeBBS getBBSTitle(int id) {
		return noticeBBSMapper.findOne(id);
	}
}
