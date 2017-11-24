package net.skhu.mentoring.dto;
import lombok.Data;
@Data
public class GroupBBS {
	int id;
	int groupId;
	int manageMentoId;
	int profileId;
	String mentoName;
	String departmentName;
	String teamName;
	String advertiseContext;
	Boolean opened;
}
