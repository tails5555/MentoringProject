package net.skhu.mentoring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import net.skhu.mentoring.dto.Mento;
@Mapper
public interface MentoMapper {
	List<Mento> findAll();
	Mento findOne(int id);
	List<Mento> findByStudentNumber(String studentNumber);
	Mento findByUserId(@Param("userId") int userId);
	Mento findLastMento();
	void insert(Mento mento);
	void update(Mento mento);
	List<Mento> findWithStudent();
	void delete(int id);
}
