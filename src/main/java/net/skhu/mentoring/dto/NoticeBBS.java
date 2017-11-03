package net.skhu.mentoring.dto;
import java.util.List;

import lombok.Data;
@Data
public class NoticeBBS {
	int id;
	String bbsName;
	boolean writeable;
	int managerId;
	List<NoticeBBSPost> postList;
}
