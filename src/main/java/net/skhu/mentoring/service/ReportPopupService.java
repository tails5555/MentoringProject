package net.skhu.mentoring.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.skhu.mentoring.dto.ReportPopup;
import net.skhu.mentoring.mapper.ReportPopupMapper;
@Service
public class ReportPopupService {
	@Autowired ReportPopupMapper reportPopupMapper;
	public List<ReportPopup> findAll(){
		return reportPopupMapper.findAll();
	}
	public void popupInsert(String context, java.util.Date date, int popupType) {
		ReportPopup reportPopup=new ReportPopup();
		reportPopup.setContext(context);
		reportPopup.setUpdateDate(date);
		reportPopup.setPopupType(popupType);
		reportPopupMapper.insert(reportPopup);
	}
	public List<ReportPopup> findByType(int type){
		return reportPopupMapper.findByType(type);
	}
}
