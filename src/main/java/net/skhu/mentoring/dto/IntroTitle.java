package net.skhu.mentoring.dto;
import java.util.List;

import lombok.Data;
@Data
public class IntroTitle {
	int id;
	String title;
	int manageId;
	List<IntroDetail> details;
	String adminName;
}
