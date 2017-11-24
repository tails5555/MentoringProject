package net.skhu.mentoring.dto;

import java.util.Date;

import lombok.Data;
@Data
public class GroupBBSComment {
	int id;
	int userId;
	String userName;
	String userType;
	String context;
	int bbsPostId;
	int profileId;
	Date uploadTime;
}
