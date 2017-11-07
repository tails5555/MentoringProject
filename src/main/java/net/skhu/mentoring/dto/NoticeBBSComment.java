package net.skhu.mentoring.dto;
import java.sql.Timestamp;

import lombok.Data;
@Data
public class NoticeBBSComment {
	int id;
	String context;
	int userId;
	String userName;
	String userType;
	int bbsPostId;
	Timestamp uploadTime;
}
