package net.skhu.mentoring.mapper;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.mentoring.dto.Student;
import net.skhu.mentoring.dto.UserList;

@Mapper
public interface StudentMapper {
	Student findOne(String studentNumber);
	Student findOneByName(String name);
	Student findByUserId(int userId);
    List<Student> findAll();
    void insert(Student student);
    List<UserList> findList();
    void deleteByUserId(int userId);
    void update(Student student);
    Student findTime(String studentNumber);

}
