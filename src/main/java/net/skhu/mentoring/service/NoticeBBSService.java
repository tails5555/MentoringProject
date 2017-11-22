package net.skhu.mentoring.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import net.skhu.mentoring.dto.Employee;
import net.skhu.mentoring.dto.NoticeBBS;
import net.skhu.mentoring.dto.NoticeBBSPost;
import net.skhu.mentoring.dto.Professor;
import net.skhu.mentoring.dto.Profile;
import net.skhu.mentoring.dto.Student;
import net.skhu.mentoring.dto.User;
import net.skhu.mentoring.mapper.EmployeeMapper;
import net.skhu.mentoring.mapper.NoticeBBSCommentMapper;
import net.skhu.mentoring.mapper.NoticeBBSMapper;
import net.skhu.mentoring.mapper.NoticeBBSPostMapper;
import net.skhu.mentoring.mapper.ProfessorMapper;
import net.skhu.mentoring.mapper.ProfileMapper;
import net.skhu.mentoring.mapper.StudentMapper;
import net.skhu.mentoring.mapper.UserMapper;
import net.skhu.mentoring.model.NoticeBBSPostModel;
import net.skhu.mentoring.model.Option;
import net.skhu.mentoring.model.Pagination;
@Service
public class NoticeBBSService {
	@Autowired NoticeBBSPostMapper noticeBBSPostMapper;
	@Autowired NoticeBBSCommentMapper noticeBBSCommentMapper;
	@Autowired NoticeBBSMapper noticeBBSMapper;
	@Autowired UserMapper userMapper;
	@Autowired ProfileMapper profileMapper;
	@Autowired ProfessorMapper professorMapper;
	@Autowired EmployeeMapper employeeMapper;
	@Autowired StudentMapper studentMapper;
	public Option[] getSearchOptions() {
		return noticeBBSPostMapper.searchBy;
	}
	public List<NoticeBBSPost> findFiveNoticePost(){
		List<NoticeBBSPost> notices=noticeBBSPostMapper.findFiveNoticePost();
		for(NoticeBBSPost list : notices) {
			setUser(list);
		}
		return notices;
	}
	public List<NoticeBBSPost> getBBSList(Pagination pagination){
		List<NoticeBBSPost> notices=noticeBBSPostMapper.findByPartyBBSId(pagination);
		for(NoticeBBSPost list : notices) {
			setUser(list);
			list.setCommentCount(noticeBBSCommentMapper.countByBBSPostId(list.getId()));
		}
		pagination.setRecordCount(noticeBBSPostMapper.count(pagination));
		return notices;
	}
	public NoticeBBS getBBSTitle(int id) {
		return noticeBBSMapper.findOne(id);
	}
	public NoticeBBSPost views(int id) {
		NoticeBBSPost result=noticeBBSPostMapper.findById(id);
		noticeBBSPostMapper.updateView(id);
		setUser(result);
		return result;
	}
	public List<NoticeBBSPost> findByUserId(int userId){
		return noticeBBSPostMapper.findByUserId(userId);
	}
	public void setUser(NoticeBBSPost noticeBBSPost) {
		User writeUser=userMapper.findOne(noticeBBSPost.getUserId());
		Profile profile=profileMapper.findByUserId(writeUser.getId());
		if(profile!=null) noticeBBSPost.setProfileId(profile.getId());
		else noticeBBSPost.setProfileId(-1);
		if(writeUser.getUserType().equals("학생회장")) {
			Student student=studentMapper.findByUserId(writeUser.getId());
			noticeBBSPost.setUserName(student.getName());
			noticeBBSPost.setUserEmail(student.getEmail());
		}
		else if(writeUser.getUserType().equals("교수")) {
			Professor professor=professorMapper.findByUserId(writeUser.getId());
			noticeBBSPost.setUserName(professor.getName());
			noticeBBSPost.setUserEmail(professor.getEmail());
		}
		else if(writeUser.getUserType().equals("직원")) {
			Employee employee=employeeMapper.findByUserId(writeUser.getId());
			noticeBBSPost.setUserName(employee.getName());
			noticeBBSPost.setUserEmail(employee.getEmail());
		}
		else if(writeUser.getUserType().equals("멘티")) {
			Student student=studentMapper.findByUserId(writeUser.getId());
			noticeBBSPost.setUserName(student.getName());
			noticeBBSPost.setUserEmail(student.getEmail());
		}
		else if(writeUser.getUserType().equals("멘토")) {
			Student student=studentMapper.findByUserId(writeUser.getId());
			noticeBBSPost.setUserName(student.getName());
			noticeBBSPost.setUserEmail(student.getEmail());
		}
	}
	public void insertPost(int boardId, NoticeBBSPostModel noticeBBSPostModel) {
		NoticeBBSPost newPost=new NoticeBBSPost();
		Authentication authentication=SecurityContextHolder.getContext().getAuthentication();
		String userNumber=authentication.getName();
		if(studentMapper.findOne(userNumber)!=null) {
			Student student=studentMapper.findOne(userNumber);
			newPost.setUserId(student.getUserId());
			newPost.setUserName(student.getName());
			newPost.setUserEmail(student.getEmail());
		}
		else if(professorMapper.findOne(userNumber)!=null) {
			Professor professor=professorMapper.findOne(userNumber);
			newPost.setUserId(professor.getUserId());
			newPost.setUserName(professor.getName());
			newPost.setUserEmail(professor.getEmail());
		}
		else if(employeeMapper.findOne(userNumber)!=null) {
			Employee employee=employeeMapper.findOne(userNumber);
			newPost.setUserId(employee.getUserId());
			newPost.setUserName(employee.getName());
			newPost.setUserEmail(employee.getEmail());
		}
		newPost.setViews(1);
		newPost.setPartyBBSId(boardId);
		newPost.setTitle(noticeBBSPostModel.getTitle());
		newPost.setContext(noticeBBSPostModel.getContext());
		noticeBBSPostMapper.insertPost(newPost);
	}
	public void updatePost(NoticeBBSPostModel noticeBBSPostModel) {
		noticeBBSPostMapper.updatePost(noticeBBSPostModel.getTitle(), noticeBBSPostModel.getContext(), noticeBBSPostModel.getId());
	}
	public NoticeBBSPostModel getModel(int id) {
		NoticeBBSPostModel newPost=new NoticeBBSPostModel();
		NoticeBBSPost beforePost=noticeBBSPostMapper.findById(id);
		newPost.setId(beforePost.getId());
		newPost.setTitle(beforePost.getTitle());
		newPost.setContext(beforePost.getContext());
		return newPost;
	}
	public void deletePost(int postId) {
		noticeBBSPostMapper.delete(postId);
	}
	public void deleteByUserId(int userId) {
		noticeBBSPostMapper.deleteByUserId(userId);
	}
}
