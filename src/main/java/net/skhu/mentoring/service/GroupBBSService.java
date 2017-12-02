package net.skhu.mentoring.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.skhu.mentoring.dto.Department;
import net.skhu.mentoring.dto.GroupBBS;
import net.skhu.mentoring.dto.Mento;
import net.skhu.mentoring.dto.Profile;
import net.skhu.mentoring.dto.Student;
import net.skhu.mentoring.mapper.DepartmentMapper;
import net.skhu.mentoring.mapper.GroupBBSMapper;
import net.skhu.mentoring.mapper.MentoMapper;
import net.skhu.mentoring.mapper.MentoringGroupMapper;
import net.skhu.mentoring.mapper.ProfileMapper;
import net.skhu.mentoring.mapper.StudentMapper;
@Service
public class GroupBBSService {
	@Autowired GroupBBSMapper groupBBSMapper;
	@Autowired MentoMapper mentoMapper;
	@Autowired MentoringGroupMapper mentoringGroupMapper;
	@Autowired StudentMapper studentMapper;
	@Autowired DepartmentMapper departmentMapper;
	@Autowired ProfileMapper profileMapper;
	public List<GroupBBS> findGroupList(){
		List<GroupBBS> list=groupBBSMapper.findAll();
		for(GroupBBS groupBBS : list) {
			Mento mento=mentoMapper.findOne(groupBBS.getManageMentoId());
			Student student=studentMapper.findByUserId(mento.getUserId());
			Department department=departmentMapper.findOne(student.getDepartmentId());
			Profile profile=profileMapper.findByUserId(student.getUserId());
			groupBBS.setMentoName(student.getName());
			groupBBS.setTeamName(mento.getTeamName());
			groupBBS.setDepartmentName(department.getName());
			groupBBS.setAdvertiseContext(mento.getAdvertiseContext());
			if(profile!=null) {
				groupBBS.setProfileId(profile.getId());
			}else groupBBS.setProfileId(-1);
		}
		return list;
	}
	public GroupBBS findOne(int id) {
		GroupBBS bbs=groupBBSMapper.findOne(id);
		Mento mento=mentoMapper.findOne(bbs.getManageMentoId());
		Student student=studentMapper.findByUserId(mento.getUserId());
		bbs.setMentoName(student.getName());
		bbs.setTeamName(mento.getTeamName());
		return bbs;
	}
	public GroupBBS findByMentoId(int mentoId) {
		return groupBBSMapper.findByMentoId(mentoId);
	}
	public GroupBBS findByGroupId(int groupId) {
		return groupBBSMapper.findByGroupId(groupId);
	}
	public void openChange(int id, Boolean opened) {
		groupBBSMapper.openChange(id, opened);
	}
}
