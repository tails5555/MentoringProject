package net.skhu.mentoring.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.skhu.mentoring.dto.MentoringPopup;
import net.skhu.mentoring.mapper.MentoringPopupMapper;
@Service
public class MentoringPopupService {
	@Autowired MentoringPopupMapper mentoringPopupMapper;
	public List<MentoringPopup> findAll(){
		return mentoringPopupMapper.findAll();
	}
	public List<MentoringPopup> findByPopupType(int popupType){
		return mentoringPopupMapper.findByType(popupType);
	}
	public void insert(String context, java.util.Date date, int popupType) {
		MentoringPopup mentoringPopup=new MentoringPopup();
		mentoringPopup.setContext(context);
		mentoringPopup.setPopupDate(date);
		mentoringPopup.setPopupType(popupType);
		mentoringPopupMapper.insert(mentoringPopup);
	}
}
