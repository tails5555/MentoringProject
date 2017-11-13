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
	List<User> findAll();
	User findByIdList(int id);
	User findOne(int id);
	User findLastUser();
	int findLast();
	void insert(User user);
	User findEdit(int id);
	List<User> findUserType();
	void update(User user);
	void delete(int id);
	User findByUserType(int id);
	

}
