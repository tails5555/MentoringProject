package net.skhu.mentoring.controller;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import net.skhu.mentoring.dto.IntroDetail;
import net.skhu.mentoring.dto.IntroTitle;
import net.skhu.mentoring.mapper.IntroDetailMapper;
import net.skhu.mentoring.mapper.IntroTitleMapper;

@Controller
@RequestMapping("intro")
public class IntroController {
	@Autowired IntroTitleMapper introTitleMapper;
	@Autowired IntroDetailMapper introDetailMapper;
	@RequestMapping("intro")
	public String introView(Model model) {
		List<IntroTitle> titles=introTitleMapper.findAll();
		for (IntroTitle title : titles) {
            List<IntroDetail> details = introDetailMapper.findAllWithTitle(title.getId());
            title.setDetails(details);
        }
        model.addAttribute("titles", titles);
		return "intro/intro";
	}
}
