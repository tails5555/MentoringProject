package net.skhu.mentoring.dto;
import lombok.Data;
@Data
public class Report {
	int id;
	int mentoId;
	String mentoName;
	String teamName;
	String mentoSubject;
	String classSubject;
	String classTarget;
	String classType;
	String classPlace;
	java.sql.Date classDate;
	java.util.Date presentDate;
	java.util.Date startTime;
	java.util.Date endTime;
	String absentPerson;
	String absentContext;
	String classImplass;
	Boolean confirm;
	String comment;
	int confirmManagerId;
	String confirmManagerName;
}
