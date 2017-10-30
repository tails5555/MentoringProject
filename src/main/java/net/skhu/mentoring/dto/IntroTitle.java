package net.skhu.mentoring.dto;
import java.util.List;
public class IntroTitle {
	int id;
	String title;
	int manageId;
	List<IntroDetail> details;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getManageId() {
		return manageId;
	}
	public void setManageId(int manageId) {
		this.manageId = manageId;
	}
	public List<IntroDetail> getDetails() {
		return details;
	}
	public void setDetails(List<IntroDetail> details) {
		this.details = details;
	}
}
