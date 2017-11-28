package net.skhu.mentoring.dto;

import lombok.Data;

@Data
public class MentoringGroup {
	int id;
	int mentoId;
	int allowManagerId;

	String teamName;
	String subject;
	String name;
	int count;
	Boolean included;
	Boolean mentoConfirm;
}
