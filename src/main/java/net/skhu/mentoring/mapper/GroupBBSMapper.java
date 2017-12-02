package net.skhu.mentoring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import net.skhu.mentoring.dto.GroupBBS;
@Mapper
public interface GroupBBSMapper {
	List<GroupBBS> findAll();
	GroupBBS findOne(int id);
	GroupBBS findByMentoId(@Param("mentoId") int mentoId);
	GroupBBS findByGroupId(@Param("groupId") int groupId);
	void openChange(@Param("id") int id, @Param("opened") Boolean opened);
	void insert(GroupBBS groupBBS);
	void delete(@Param("mentoId") int mentoId);
}
