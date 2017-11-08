package net.skhu.mentoring.controller;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import net.skhu.mentoring.dto.IntroDetail;
import net.skhu.mentoring.dto.IntroTitle;
import net.skhu.mentoring.mapper.ScheduleMapper;
import net.skhu.mentoring.service.IntroService;
@Controller
public class IntroController {
	@Autowired IntroService introService;
	@Autowired ScheduleMapper scheduleMapper;
	@RequestMapping({"guest/intro", "user/intro"})
	public String introView(Model model) {
		List<IntroTitle> titles=introService.findAllTitleWithDetails();
        model.addAttribute("titles", titles);
        model.addAttribute("schedules", scheduleMapper.findAll());
		return "intro/intro";
	}
	@RequestMapping(value="user/intro/titleList", method=RequestMethod.GET)
	public String titleList(Model model) {
		model.addAttribute("titles", introService.findAllTitles());
		model.addAttribute("newTitle", new IntroTitle());
		return "intro/list";
	}
	@RequestMapping(value="user/intro/titleList", method=RequestMethod.POST)
	public String titleList(Model model, IntroTitle newTitle) {
		introService.insertTitle(newTitle);
		return "redirect:titleList";
	}
	@RequestMapping(value="user/intro/detailList", method=RequestMethod.GET)
	public String detailList(Model model, @RequestParam("id") int id) {
		model.addAttribute("details", introService.findAllIntroDetails(id));
		model.addAttribute("title", introService.findOneIntroTitle(id));
		return "intro/detailList";
	}
	@RequestMapping(value="user/intro/detailList", method=RequestMethod.POST)
	public String detailList(Model model, @RequestParam("id") int id, IntroTitle introTitle) {
		introService.updateTitle(introTitle);
		return "redirect:detailList?id="+id;
	}
	@RequestMapping(value="user/intro/detailCreate", method=RequestMethod.GET)
	public String detailAdd(Model model, @RequestParam("id") int id) {
		model.addAttribute("title", introService.findOneIntroTitle(id));
		IntroDetail introDetail=new IntroDetail();
		model.addAttribute("detail", introDetail);
		return "intro/detailEdit";
	}
	@RequestMapping(value="user/intro/detailCreate", method=RequestMethod.POST)
	public String detailAdd(Model model, @RequestParam("id") int id, IntroDetail introDetail) {
		introService.insertDetail(id, introDetail);
		return "redirect:detailList?id="+id;
	}
	@RequestMapping(value="user/intro/detailUpdate", method=RequestMethod.GET)
	public String detailUpdate(Model model, @RequestParam("id") int id, @RequestParam("dId") int dId) {
		IntroDetail beforeDetail=introService.findOneIntroDetail(dId);
		model.addAttribute("title", introService.findOneIntroTitle(id));
		model.addAttribute("detail", beforeDetail);
		return "intro/detailEdit";
	}
	@RequestMapping(value="user/intro/detailUpdate", method=RequestMethod.POST)
	public String detailUpdate(Model model, @RequestParam("id") int id, @RequestParam("dId") int dId, IntroDetail beforeDetail) {
		beforeDetail.setId(dId);
		introService.updateDetail(beforeDetail);
		return "redirect:detailList?id="+id;
	}
	@RequestMapping("user/intro/detailDelete")
	public String detailDelete(Model model, @RequestParam("id") int id, @RequestParam("dId") int dId) {
		introService.deleteDetail(dId);
		return "redirect:detailList?id="+id;
	}
	@RequestMapping("user/intro/titleDelete")
	public String titleDelete(Model model, @RequestParam("id") int id) {
		introService.deleteTitle(id);
		return "redirect:titleList";
	}

}
