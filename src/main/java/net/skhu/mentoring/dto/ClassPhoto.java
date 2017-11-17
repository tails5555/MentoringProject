package net.skhu.mentoring.dto;
import java.util.Date;

import lombok.Data;
@Data
public class ClassPhoto {
	int id;
	String fileName;
	int fileSize;
	Date fileTime;
	byte[] data;
	int reportId;
}
