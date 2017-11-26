package net.skhu.mentoring.model;
import lombok.Data;
@Data
public class ReportModel {
	int id;
	int mentoId;
	String classSubject;
	String classTarget;
	int classType;
	java.sql.Date classDate;
	int start1;
	int start2;
	int end1;
	int end2;
	String absentPerson;
	String absentContext;
	String classImplass;
	String classPlace;
}
