package net.skhu.mentoring.controller;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import net.skhu.mentoring.dto.MentoringPopup;
import net.skhu.mentoring.service.MentoringPopupService;

@Controller
public class MentoringPopupController {
	@Autowired MentoringPopupService mentoringPopupService;
	@RequestMapping("user/mentoringPopup")
	public String mentoringPopup(Model model, @RequestParam("type") int type) {
		List<MentoringPopup> list;
		switch(type) {
		case 1 :
			list=mentoringPopupService.findByPopupType(1);
			break;
		case 2 :
			list=mentoringPopupService.findByPopupType(2);
			break;
		case 3 :
			list=mentoringPopupService.findByPopupType(3);
			break;
		case 4 :
			list=mentoringPopupService.findByPopupType(4);
			break;
		case 5 :
			list=mentoringPopupService.findByPopupType(5);
			break;
		case 6 :
			list=mentoringPopupService.findByPopupType(6);
			break;
		case 7 :
			list=mentoringPopupService.findByPopupType(7);
			break;
		default :
			list=mentoringPopupService.findAll();
			break;
		}
		model.addAttribute("mentoringPopups", list);
		return "ajax/mentoring_message";
	}

}
