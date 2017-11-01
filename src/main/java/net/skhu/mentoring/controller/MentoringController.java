package net.skhu.mentoring.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class MentoringController {
	@RequestMapping("user/mentoApplication")
	public String mentoApplication() {
		return "mentoring/mentoApplication";
	}
}
