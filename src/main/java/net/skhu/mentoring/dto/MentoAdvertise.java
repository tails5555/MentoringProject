package net.skhu.mentoring.dto;

import java.util.Date;

import lombok.Data;
@Data
public class MentoAdvertise {
	int id;
	String fileName;
	int fileSize;
	Date fileTime;
	byte[] data;
	int mentoId;
}
