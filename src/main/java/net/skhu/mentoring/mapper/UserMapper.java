package net.skhu.mentoring.mapper;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.mentoring.dto.User;
@Mapper
public interface UserMapper {
	List<User> findWithPerson();
	List<User> findListStudent();
	List<User> findListEmployee();
	List<User> findListProfessor();
	List<User> findList();
	User findOne(int id);
	int findLast();
	void insert(User user);
	
}
