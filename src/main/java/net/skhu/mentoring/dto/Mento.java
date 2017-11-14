package net.skhu.mentoring.dto;

import java.util.Date;

import lombok.Data;
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
	int advId;
	String advFileName;
	int quaId;
	String quaFileName;
	int mentoGroupId;
}
