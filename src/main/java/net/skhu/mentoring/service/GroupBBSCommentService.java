package net.skhu.mentoring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import net.skhu.mentoring.dto.Employee;
import net.skhu.mentoring.dto.GroupBBSComment;
import net.skhu.mentoring.dto.Professor;
import net.skhu.mentoring.dto.Profile;
import net.skhu.mentoring.dto.Student;
import net.skhu.mentoring.dto.User;
import net.skhu.mentoring.mapper.EmployeeMapper;
import net.skhu.mentoring.mapper.GroupBBSCommentMapper;
import net.skhu.mentoring.mapper.ProfessorMapper;
import net.skhu.mentoring.mapper.ProfileMapper;
import net.skhu.mentoring.mapper.StudentMapper;
import net.skhu.mentoring.mapper.UserMapper;

@Service
public class GroupBBSCommentService {
	@Autowired GroupBBSCommentMapper groupBBSCommentMapper;
	@Autowired StudentMapper studentMapper;
	@Autowired ProfessorMapper professorMapper;
	@Autowired EmployeeMapper employeeMapper;
	@Autowired ProfileMapper profileMapper;
	@Autowired UserMapper userMapper;
	public List<GroupBBSComment> findByPostId(int bbsPostId) {
		List<GroupBBSComment> comments=groupBBSCommentMapper.findByBBSId(bbsPostId);
		for(GroupBBSComment comment : comments) {
			setCommentUser(comment);
		}
		return comments;
	}
	public void setCommentUser(GroupBBSComment groupBBSComment) {
		User writeUser=userMapper.findOne(groupBBSComment.getUserId());
		Profile profile=profileMapper.findByUserId(writeUser.getId());
		if(profile!=null) groupBBSComment.setProfileId(profile.getId());
		else groupBBSComment.setProfileId(-1);
		if(writeUser.getUserType().equals("학생회장")) {
			Student student=studentMapper.findByUserId(writeUser.getId());
			groupBBSComment.setUserName(student.getName());
			groupBBSComment.setUserType(writeUser.getUserType());
		}
		else if(writeUser.getUserType().equals("교수")) {
			Professor professor=professorMapper.findByUserId(writeUser.getId());
			groupBBSComment.setUserName(professor.getName());
			groupBBSComment.setUserType(writeUser.getUserType());
		}
		else if(writeUser.getUserType().equals("직원")) {
			Employee employee=employeeMapper.findByUserId(writeUser.getId());
			groupBBSComment.setUserName(employee.getName());
			groupBBSComment.setUserType(writeUser.getUserType());
		}
		else if(writeUser.getUserType().equals("멘티")) {
			Student student=studentMapper.findByUserId(writeUser.getId());
			groupBBSComment.setUserName(student.getName());
			groupBBSComment.setUserType(writeUser.getUserType());
		}
		else if(writeUser.getUserType().equals("멘토")) {
			Student student=studentMapper.findByUserId(writeUser.getId());
			groupBBSComment.setUserName(student.getName());
			groupBBSComment.setUserType(writeUser.getUserType());
		}
	}
	public void insertComment(GroupBBSComment groupBBSComment) {
		Authentication authentication=SecurityContextHolder.getContext().getAuthentication();
		String userNumber=authentication.getName();
		if(studentMapper.findOne(userNumber)!=null) {
			Student student=studentMapper.findOne(userNumber);
			groupBBSComment.setUserId(student.getUserId());
			groupBBSComment.setUserType(userMapper.findOne(student.getUserId()).getUserType());
		}
		else if(professorMapper.findOne(userNumber)!=null) {
			Professor professor=professorMapper.findOne(userNumber);
			groupBBSComment.setUserId(professor.getUserId());
			groupBBSComment.setUserType(userMapper.findOne(professor.getUserId()).getUserType());
		}
		else if(employeeMapper.findOne(userNumber)!=null) {
			Employee employee=employeeMapper.findOne(userNumber);
			groupBBSComment.setUserId(employee.getUserId());
			groupBBSComment.setUserType(userMapper.findOne(employee.getUserId()).getUserType());
		}
		groupBBSCommentMapper.insertComment(groupBBSComment);
	}
	public void delete(int id) {
		groupBBSCommentMapper.deleteComment(id);
	}
	public void deleteByPostId(int bbsPostId) {
		groupBBSCommentMapper.deleteByPostId(bbsPostId);
	}
}
