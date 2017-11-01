package net.skhu.mentoring.dto;

import lombok.Data;
@Data
public class NoticeBBSPost {
	int id;
	String title;
	String context;
    String writeDate;
    int views;
    int userId;
    int partyBBSId;
    String userName;
}
