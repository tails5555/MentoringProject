package net.skhu.mentoring.dto;

import lombok.Data;
import java.util.Date;
@Data
public class Mento {
	int id;
	String teamName;
	String advertiseContext;
	String subject;
	String qualificContext;
	int userId;
	String name;
	Date applicationDate;
	String email;
	String phoneNumber;
}
