package net.skhu.mentoring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.mentoring.dto.GroupBBS;
@Mapper
public interface GroupBBSMapper {
	List<GroupBBS> findAll();
	GroupBBS findOne(int id);
}
