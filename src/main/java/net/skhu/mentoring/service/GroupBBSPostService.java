package net.skhu.mentoring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import net.skhu.mentoring.dto.Employee;
import net.skhu.mentoring.dto.GroupBBSPost;
import net.skhu.mentoring.dto.Professor;
import net.skhu.mentoring.dto.Profile;
import net.skhu.mentoring.dto.Student;
import net.skhu.mentoring.dto.User;
import net.skhu.mentoring.mapper.EmployeeMapper;
import net.skhu.mentoring.mapper.GroupBBSCommentMapper;
import net.skhu.mentoring.mapper.GroupBBSPostMapper;
import net.skhu.mentoring.mapper.ProfessorMapper;
import net.skhu.mentoring.mapper.ProfileMapper;
import net.skhu.mentoring.mapper.StudentMapper;
import net.skhu.mentoring.mapper.UserMapper;
import net.skhu.mentoring.model.GroupBBSPagination;
import net.skhu.mentoring.model.GroupBBSPostModel;
import net.skhu.mentoring.model.Option;
@Service
public class GroupBBSPostService {
	@Autowired GroupBBSPostMapper groupBBSPostMapper;
	@Autowired GroupBBSCommentMapper groupBBSCommentMapper;
	@Autowired ProfessorMapper professorMapper;
	@Autowired EmployeeMapper employeeMapper;
	@Autowired StudentMapper studentMapper;
	@Autowired UserMapper userMapper;
	@Autowired ProfileMapper profileMapper;
	public Option[] getSearchOptions() {
		 return groupBBSPostMapper.searchBy;
	}
	public List<GroupBBSPost> getBBSList(GroupBBSPagination groupBBSPagination){
		List<GroupBBSPost> posts=groupBBSPostMapper.findByGroupId(groupBBSPagination);
		for(GroupBBSPost post : posts) {
			setUser(post);
			post.setCommentCount(groupBBSCommentMapper.countByBBSPostId(post.getId()));
		}
		groupBBSPagination.setRecordCount(groupBBSPostMapper.count(groupBBSPagination));
		return posts;
	}
	public GroupBBSPost findOne(int id) {
		GroupBBSPost post=groupBBSPostMapper.findOne(id);
		groupBBSPostMapper.updateView(id);
		setUser(post);
		Profile profile=profileMapper.findByUserId(post.getUserId());
		if(profile!=null) {
			post.setProfileId(profile.getId());
		}else post.setProfileId(-1);
		Authentication authentication=SecurityContextHolder.getContext().getAuthentication();
		String userNumber;
		if(authentication!=null) {
			userNumber=authentication.getName();
			if(studentMapper.findOne(userNumber)!=null) {
				Student student=studentMapper.findOne(userNumber);
				if(profileMapper.findByUserId(student.getUserId())!=null) {
					Profile currentUserProfile=profileMapper.findByUserId(student.getUserId());
					post.setCurrentUserProfileId(currentUserProfile.getId());
				}else post.setCurrentUserProfileId(-1);
			}
			else if(professorMapper.findOne(userNumber)!=null) {
				Professor professor=professorMapper.findOne(userNumber);
				if(profileMapper.findByUserId(professor.getUserId())!=null) {
					Profile currentUserProfile=profileMapper.findByUserId(professor.getUserId());
					post.setCurrentUserProfileId(currentUserProfile.getId());
				}else post.setCurrentUserProfileId(-1);
			}
			else if(employeeMapper.findOne(userNumber)!=null) {
				Employee employee=employeeMapper.findOne(userNumber);
				if(profileMapper.findByUserId(employee.getUserId())!=null) {
					Profile currentUserProfile=profileMapper.findByUserId(employee.getUserId());
					post.setCurrentUserProfileId(currentUserProfile.getId());
				}else post.setCurrentUserProfileId(-1);
			}
		}
		return post;
	}
	public void setUser(GroupBBSPost groupBBSPost) {
		User writeUser=userMapper.findOne(groupBBSPost.getUserId());
		Profile profile=profileMapper.findByUserId(writeUser.getId());
		if(profile!=null) groupBBSPost.setProfileId(profile.getId());
		else groupBBSPost.setProfileId(-1);
		if(writeUser.getUserType().equals("학생회장")) {
			Student student=studentMapper.findByUserId(writeUser.getId());
			groupBBSPost.setUserName(student.getName());
			groupBBSPost.setUserEmail(student.getEmail());
		}
		else if(writeUser.getUserType().equals("교수")) {
			Professor professor=professorMapper.findByUserId(writeUser.getId());
			groupBBSPost.setUserName(professor.getName());
			groupBBSPost.setUserEmail(professor.getEmail());
		}
		else if(writeUser.getUserType().equals("직원")) {
			Employee employee=employeeMapper.findByUserId(writeUser.getId());
			groupBBSPost.setUserName(employee.getName());
			groupBBSPost.setUserEmail(employee.getEmail());
		}
		else if(writeUser.getUserType().equals("멘티")) {
			Student student=studentMapper.findByUserId(writeUser.getId());
			groupBBSPost.setUserName(student.getName());
			groupBBSPost.setUserEmail(student.getEmail());
		}
		else if(writeUser.getUserType().equals("멘토")) {
			Student student=studentMapper.findByUserId(writeUser.getId());
			groupBBSPost.setUserName(student.getName());
			groupBBSPost.setUserEmail(student.getEmail());
		}
	}
	public GroupBBSPostModel getGroupPostModel(int id) {
		GroupBBSPostModel model=new GroupBBSPostModel();
		GroupBBSPost post=groupBBSPostMapper.findOne(id);
		model.setId(post.getId());
		model.setTitle(post.getTitle());
		model.setContext(post.getContext());
		return model;
	}
	public void updatePost(GroupBBSPostModel groupBBSPostModel) {
		groupBBSPostMapper.updatePost(groupBBSPostModel.getTitle(), groupBBSPostModel.getContext(), groupBBSPostModel.getId());
	}
	public void insertPost(GroupBBSPostModel groupBBSPostModel, int gd) {
		GroupBBSPost newPost=new GroupBBSPost();
		newPost.setBbsId(gd);
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
		newPost.setTitle(groupBBSPostModel.getTitle());
		newPost.setContext(groupBBSPostModel.getContext());
		groupBBSPostMapper.insertPost(newPost);
	}
	public GroupBBSPost findLastPost() {
		return groupBBSPostMapper.findLastPost();
	}
	public void deletePost(int id) {
		groupBBSPostMapper.delete(id);
	}
}
