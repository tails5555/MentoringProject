package net.skhu.mentoring.controller;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import net.skhu.mentoring.dto.Department;
import net.skhu.mentoring.dto.Mento;
import net.skhu.mentoring.dto.Report;
import net.skhu.mentoring.dto.Student;
import net.skhu.mentoring.mapper.DepartmentMapper;
import net.skhu.mentoring.mapper.MentoMapper;
import net.skhu.mentoring.mapper.MentoringGroupMapper;
import net.skhu.mentoring.mapper.StudentMapper;
import net.skhu.mentoring.mapper.UserMapper;
import net.skhu.mentoring.model.ReportModel;
import net.skhu.mentoring.service.ClassPhotoService;
import net.skhu.mentoring.service.ProfileService;
import net.skhu.mentoring.service.ReportExcelService;
import net.skhu.mentoring.service.ReportService;
@Controller
public class ReportController {
	@Autowired MentoMapper mentoMapper;
	@Autowired ProfileService profileService;
	@Autowired UserMapper userMapper;
	@Autowired StudentMapper studentMapper;
	@Autowired DepartmentMapper departmentMapper;
	@Autowired ReportService reportService;
	@Autowired ClassPhotoService classPhotoService;
	@Autowired ReportExcelService reportExcelService;
	@Autowired MentoringGroupMapper mentoringGroupMapper;
	@RequestMapping("user/report/confirm")
	public String mentoList(Model model) {
		List<Mento> mentoList=mentoMapper.findAll();
		for(Mento m : mentoList){
			Student student=studentMapper.findByUserId(m.getUserId());
			m.setName(student.getName());
			Department d=departmentMapper.findOne(student.getDepartmentId());
			m.setDepartmentName(d.getName());
			if(profileService.findByUserId(m.getUserId())!=null) {
				m.setProfileId(profileService.findByUserId(m.getUserId()).getId());
			}
			else m.setProfileId(-1);
		}
		model.addAttribute("mentos", mentoList);
		return "report/mentoList";
	}
	@RequestMapping("user/report/confirmReportList")
	public String confirmReportList(Model model, @RequestParam("mento") int mento) {
		model.addAttribute("mentoring", mentoringGroupMapper.findByMentoId(mento));
		model.addAttribute("mento", mentoMapper.findOne(mento));
		model.addAttribute("reports", reportService.findByMentoId(mento));
		model.addAttribute("confirmCount", reportService.confirmedReportCount(mento));
		return "report/propose";
	}
	@RequestMapping(value="user/report/reportInfo", method=RequestMethod.GET)
	public String reportInfo(Model model, @RequestParam("mento") int mento, @RequestParam("id") int id) {
		model.addAttribute(mentoMapper.findOne(mento));
		Report report=reportService.findOne(id);
		model.addAttribute("report", report);
		return "report/reportInfo";
	}
	@RequestMapping(value="user/report/reportInfo", method=RequestMethod.POST)
	public String reportInfo(Model model, @RequestParam("mento") int mento, @RequestParam("id") int id, Report report) {
		reportService.updateComment(report);
		return "redirect:reportInfo?mento="+mento+"&id="+id;
	}
	@RequestMapping("user/report/checking")
	public String checking(Model model, @RequestParam("mento") int mento, @RequestParam("id") int id) {
		reportService.checkConfirm(id);
		return "redirect:reportInfo?mento="+mento+"&id="+id;
	}
	@RequestMapping(value="user/report/view", method=RequestMethod.GET)
	public String reportView(Model model, @RequestParam("id") int id) {
		Report report=reportService.findOne(id);
		model.addAttribute("report", report);
		ReportModel reportModel=reportService.getEditModel(id);
		model.addAttribute("editReport", reportModel);
		model.addAttribute("classType", reportService.getAvailableType());
		return "report/view";
	}
	@RequestMapping(value="user/report/view", method=RequestMethod.POST)
	public String reportView(Model model, @RequestParam("classPhoto") MultipartFile[] uploadFiles, @RequestParam("id") int id, ReportModel reportModel) throws IOException {
		if(uploadFiles.length>0) {
			classPhotoService.updatePhoto(uploadFiles, id);
		}
		reportService.updateReport(reportModel);
		return "redirect:view?id="+id;
	}
	@RequestMapping(value="user/report/write", method=RequestMethod.GET)
	public String reportWrite(Model model) {
		Authentication authentication=SecurityContextHolder.getContext().getAuthentication();
		String userNumber;
		Mento mento;
		ReportModel reportModel=new ReportModel();
		if(authentication!=null) {
			userNumber=authentication.getName();
			if(studentMapper.findOne(userNumber)!=null) {
				Student student=studentMapper.findOne(userNumber);
				if(mentoMapper.findByUserId(student.getUserId())!=null) {
					mento=mentoMapper.findByUserId(student.getUserId());
					mento.setName(student.getName());
					reportModel.setMentoId(mento.getId());
					List<Report> reportList=reportService.mentoReportList(mento);
					double time=reportService.getMentoringTime(mento.getId());
					model.addAttribute("mento", mento);
					model.addAttribute("time", time);
					model.addAttribute("reports", reportList);
				}
			}
		}
		model.addAttribute("now", new java.util.Date());
		model.addAttribute("report", reportModel);
		model.addAttribute("classType", reportService.getAvailableType());
		System.out.println(reportModel);
		return "report/reportList";
	}
	@RequestMapping(value="user/report/write", method=RequestMethod.POST)
	public String reportWrite(Model model, @RequestParam("classPhoto") MultipartFile[] uploadFiles, ReportModel reportModel) throws IOException {
		reportService.insert(reportModel);
		Report lastReport=reportService.findLastReport();
		if(uploadFiles.length!=0)
			classPhotoService.upload(uploadFiles, lastReport.getId());
		return "redirect:write";
	}
	@RequestMapping("user/report/delete")
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	public String delete(Model model, @RequestParam("id") int id, @RequestParam("mento") int mento) {
		classPhotoService.deleteByReportId(id);
		reportService.delete(id);
		return "redirect:confirmReportList?mento="+mento;
	}
	@RequestMapping("user/report/download")
	public void download(@RequestParam("id") int id, HttpServletResponse response) throws Exception{
		Report report=reportService.findOne(id);
		if(report == null) return;
		Mento mento=mentoMapper.findOne(report.getMentoId());
		report.setTeamName(mento.getTeamName());
		java.util.Date presentDate=report.getPresentDate();
		XSSFWorkbook workbook=reportExcelService.getReportSingleWorkbook(id);
		String fileName=URLEncoder.encode(String.format("%s_보고서파일_%d%02d%02d.xlsx", report.getTeamName(), presentDate.getYear()+1900, presentDate.getMonth()+1, presentDate.getDate()), "UTF-8");
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment;filename="+fileName+";");
		try (BufferedOutputStream output = new BufferedOutputStream(response.getOutputStream())) {
			workbook.write(output);
		}
	}
	@RequestMapping("user/report/allDownload")
	public void allDownload(@RequestParam("id") int id, HttpServletResponse response) throws Exception{
		Mento mento=mentoMapper.findOne(id);
		if(mento==null) return;
		XSSFWorkbook workbook=reportExcelService.getReportMultiWorkbook(id);
		String fileName=URLEncoder.encode(String.format("%s_보고서목록.xlsx", mento.getTeamName(), "UTF-8"));
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment;filename="+fileName+";");
		try (BufferedOutputStream output = new BufferedOutputStream(response.getOutputStream())) {
			workbook.write(output);
		}
	}
}
