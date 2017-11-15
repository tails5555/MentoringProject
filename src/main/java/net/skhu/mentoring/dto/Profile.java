package net.skhu.mentoring.dto;
import java.util.Date;

import lombok.Data;
@Data
public class Profile {
	int id;
	String fileName;
	String fileSize;
	Date fileTime;
	byte[] data;
	int userId;
}
