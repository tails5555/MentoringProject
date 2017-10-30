package net.skhu.mentoring.dto;
import java.sql.Date;
public class Schedule {
	int id;
	String context;
	Date startDate;
	Date endDate;
	int manageId;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public int getManageId() {
		return manageId;
	}
	public void setManageId(int manageId) {
		this.manageId = manageId;
	}
}
