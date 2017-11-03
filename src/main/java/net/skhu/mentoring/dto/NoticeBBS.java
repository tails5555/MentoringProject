package net.skhu.mentoring.dto;
import lombok.Data;
import java.util.List;
@Data
public class NoticeBBS {
	int id;
	String bbsName;
	boolean isAvailableWrite;
	int managerId;
	List<NoticeBBSPost> postList;
}
