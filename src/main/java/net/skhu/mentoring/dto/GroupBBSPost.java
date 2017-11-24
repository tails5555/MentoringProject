package net.skhu.mentoring.dto;
import lombok.Data;
import java.util.Date;
@Data
public class GroupBBSPost {
	int id;
	String title;
	String context;
	Date writeDate;
	int views;
	int userId;
	int bbsId;
	int profileId;
	int currentUserProfileId;
	int commentCount;
	String userName;
	String userEmail;
}
