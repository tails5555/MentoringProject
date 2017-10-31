package net.skhu.mentoring.dto;
import lombok.Data;
@Data
public class Student {
	String studentNumber;
	String phoneNumber;
	String name;
	String address;
	String email;
	int grade;
	int departmentId;
	int multiDepartmentId;
	int userId;
}
