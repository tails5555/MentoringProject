package net.skhu.mentoring.mapper;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.mentoring.dto.User;
@Mapper
public interface UserMapper {
	List<User> findWithPerson();
	User findOne(int id);
}
