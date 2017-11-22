package net.skhu.mentoring.model;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import lombok.Data;
@Data
public class Pagination {
	int bd;
	int pg=1;
	int sz=8;
	int sb;
	String st;
	int recordCount;
	public String getQueryString() {
		String url=null;
		try {
			String temp=(st==null) ? "" : URLEncoder.encode(st, "UTF-8");
			url=String.format("bd=%d&pg=%d&sz=%d&sb=%d&st=%s", bd, pg, sz, sb, st);
		}catch(UnsupportedEncodingException e) {}
		return url;
	}
}
