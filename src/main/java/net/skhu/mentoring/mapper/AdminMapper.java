package net.skhu.mentoring.mapper;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import net.skhu.mentoring.dto.Admin;

@Mapper
public interface AdminMapper {
	Admin findOne(int id);
	List<Admin> findAll();
	Admin findByUserId(@Param("userId") int userId);
}
