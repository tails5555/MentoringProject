package net.skhu.mentoring.mapper;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;
import net.skhu.mentoring.dto.Student;
@Mapper
public interface StudentMapper {
	Student findOne(String studentNumber);
	Student findByUserId(int userId);
	   List<Student> findAll();
	    void insert(Student student);

}
