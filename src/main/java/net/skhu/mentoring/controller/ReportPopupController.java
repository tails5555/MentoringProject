package net.skhu.mentoring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import net.skhu.mentoring.dto.ReportPopup;
import net.skhu.mentoring.service.ReportPopupService;

@Controller
public class ReportPopupController {
	@Autowired ReportPopupService reportPopupService;
	@RequestMapping({"user/report/popup", "guest/report/popup"})
	public String reportPopup(Model model, @RequestParam("type") int type) {
		List<ReportPopup> list;
		switch(type) {
		case 1 :
			list=reportPopupService.findByType(1);
			break;
		case 2 :
			list=reportPopupService.findByType(2);
			break;
		case 3 :
			list=reportPopupService.findByType(3);
			break;
		case 4 :
			list=reportPopupService.findByType(4);
			break;
		case 5 :
			list=reportPopupService.findByType(5);
			break;
		default :
			list=reportPopupService.findAll();
			break;
		}
		model.addAttribute("reportPopups", list);
		return "ajax/report_message";
	}
}
