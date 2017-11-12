package net.skhu.mentoring.dto;
import java.sql.Date;

import lombok.Data;
@Data
public class Schedule {
	int id;
	String context;
	Date startDate;
	Date endDate;
	int manageId;
	String manageName;
}
