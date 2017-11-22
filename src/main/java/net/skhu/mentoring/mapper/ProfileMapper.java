package net.skhu.mentoring.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import net.skhu.mentoring.dto.Profile;

@Mapper
public interface ProfileMapper {
	Profile findOne(int id);
	Profile findByUserId(@Param("userId") int userId);
	void insert(Profile profile);
	void update(Profile profile);
}
