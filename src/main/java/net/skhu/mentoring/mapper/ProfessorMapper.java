package net.skhu.mentoring.mapper;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.mentoring.dto.Employee;
import net.skhu.mentoring.dto.Professor;
import net.skhu.mentoring.dto.UserList;

@Mapper
public interface ProfessorMapper {
	Professor findOne(String profId);
	Professor findByUserId(int userId);
	List<Professor> findAll();
	List<UserList> findList();
	void deleteByUserId(int userId);
	void insert(Professor professor);
	void update(Professor professor);
}
