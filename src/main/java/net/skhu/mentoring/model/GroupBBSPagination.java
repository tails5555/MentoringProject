package net.skhu.mentoring.model;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import lombok.Data;
@Data
public class GroupBBSPagination {
	int gd;
	int pg=1;
	int sz=7;
	int sb;
	String st;
	int recordCount;
	public String getQueryString() {
		String url=null;
		try {
			String temp=(st==null) ? "" : URLEncoder.encode(st, "UTF-8");
			url=String.format("gd=%d&pg=%d&sz=%d&sb=%d&st=%s", gd, pg, sz, sb, temp);
		}catch(UnsupportedEncodingException e) {}
		return url;
	}
}
