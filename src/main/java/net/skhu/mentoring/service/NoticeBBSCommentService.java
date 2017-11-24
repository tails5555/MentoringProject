package net.skhu.mentoring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import net.skhu.mentoring.dto.Employee;
import net.skhu.mentoring.dto.NoticeBBSComment;
import net.skhu.mentoring.dto.Professor;
import net.skhu.mentoring.dto.Profile;
import net.skhu.mentoring.dto.Student;
import net.skhu.mentoring.dto.User;
import net.skhu.mentoring.mapper.EmployeeMapper;
import net.skhu.mentoring.mapper.NoticeBBSCommentMapper;
import net.skhu.mentoring.mapper.ProfessorMapper;
import net.skhu.mentoring.mapper.ProfileMapper;
import net.skhu.mentoring.mapper.StudentMapper;
import net.skhu.mentoring.mapper.UserMapper;
@Service
public class NoticeBBSCommentService {
	@Autowired NoticeBBSCommentMapper noticeBBSCommentMapper;
	@Autowired UserMapper userMapper;
	@Autowired ProfessorMapper professorMapper;
	@Autowired EmployeeMapper employeeMapper;
	@Autowired StudentMapper studentMapper;
	@Autowired ProfileMapper profileMapper;
	public List<NoticeBBSComment> findByBBSId(int id){
		List<NoticeBBSComment> commentList=noticeBBSCommentMapper.findByBBSId(id);
		for(NoticeBBSComment n : commentList) {
			setCommentUser(n);
		}
		return commentList;
	}
	public void setCommentUser(NoticeBBSComment noticeBBSComment) {
		User writeUser=userMapper.findOne(noticeBBSComment.getUserId());
		Profile profile=profileMapper.findByUserId(writeUser.getId());
		if(profile!=null) noticeBBSComment.setProfileId(profile.getId());
		else noticeBBSComment.setProfileId(-1);
		if(writeUser.getUserType().equals("학생회장")) {
			Student student=studentMapper.findByUserId(writeUser.getId());
			noticeBBSComment.setUserName(student.getName());
			noticeBBSComment.setUserType(writeUser.getUserType());
		}
		else if(writeUser.getUserType().equals("교수")) {
			Professor professor=professorMapper.findByUserId(writeUser.getId());
			noticeBBSComment.setUserName(professor.getName());
			noticeBBSComment.setUserType(writeUser.getUserType());
		}
		else if(writeUser.getUserType().equals("직원")) {
			Employee employee=employeeMapper.findByUserId(writeUser.getId());
			noticeBBSComment.setUserName(employee.getName());
			noticeBBSComment.setUserType(writeUser.getUserType());
		}
		else if(writeUser.getUserType().equals("멘티")) {
			Student student=studentMapper.findByUserId(writeUser.getId());
			noticeBBSComment.setUserName(student.getName());
			noticeBBSComment.setUserType(writeUser.getUserType());
		}
		else if(writeUser.getUserType().equals("멘토")) {
			Student student=studentMapper.findByUserId(writeUser.getId());
			noticeBBSComment.setUserName(student.getName());
			noticeBBSComment.setUserType(writeUser.getUserType());
		}
	}
	public void insertComment(NoticeBBSComment newComment) {
		Authentication authentication=SecurityContextHolder.getContext().getAuthentication();
		String userNumber=authentication.getName();
		if(studentMapper.findOne(userNumber)!=null) {
			Student student=studentMapper.findOne(userNumber);
			newComment.setUserId(student.getUserId());
			newComment.setUserType(userMapper.findOne(student.getUserId()).getUserType());
		}
		else if(professorMapper.findOne(userNumber)!=null) {
			Professor professor=professorMapper.findOne(userNumber);
			newComment.setUserId(professor.getUserId());
			newComment.setUserType(userMapper.findOne(professor.getUserId()).getUserType());
		}
		else if(employeeMapper.findOne(userNumber)!=null) {
			Employee employee=employeeMapper.findOne(userNumber);
			newComment.setUserId(employee.getUserId());
			newComment.setUserType(userMapper.findOne(employee.getUserId()).getUserType());
		}
		noticeBBSCommentMapper.insertComment(newComment);
	}
	public void deleteComment(int cmdId) {
		noticeBBSCommentMapper.deleteComment(cmdId);
	}
	public void deleteByPostId(int postId) {
		noticeBBSCommentMapper.deleteByPostId(postId);
	}
	public void deleteByUserId(int userId) {
		noticeBBSCommentMapper.deleteByUserId(userId);
	}
}
