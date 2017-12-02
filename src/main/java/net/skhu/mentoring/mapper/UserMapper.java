package net.skhu.mentoring.mapper;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.mentoring.dto.User;
import net.skhu.mentoring.model.Option;
import net.skhu.mentoring.model.UserPagination;
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

	List<User> findAllList(UserPagination userPagination);
	int count(UserPagination userPagination);

    Option[] searchBy = { new Option(0, "검색 없음"), new Option(1, "이름"),
            new Option(2, "학번(교번,직번)"), new Option(3, "회원 유형")  };
    Option[] orderBy = { new Option(0, "가입 순서"), new Option(1, "이름 순"), new Option(2, "이름 역순"), new Option(3, "학번(교번, 직번) 순"), new Option(4, "학번(교번, 직번) 역순"), new Option(5, "회원 유형 순"), new Option(6, "회원 유형 역순")};

}
