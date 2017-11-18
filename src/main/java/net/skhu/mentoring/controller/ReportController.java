package net.skhu.mentoring.controller;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jxl.Workbook;
import jxl.format.Alignment;
import jxl.format.Border;
import jxl.format.BorderLineStyle;
import jxl.format.Colour;
import jxl.format.VerticalAlignment;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableImage;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import net.skhu.mentoring.dto.ClassPhoto;
import net.skhu.mentoring.dto.Department;
import net.skhu.mentoring.dto.Mento;
import net.skhu.mentoring.dto.Report;
import net.skhu.mentoring.dto.Student;
import net.skhu.mentoring.mapper.DepartmentMapper;
import net.skhu.mentoring.mapper.MentoMapper;
import net.skhu.mentoring.mapper.StudentMapper;
import net.skhu.mentoring.mapper.UserMapper;
import net.skhu.mentoring.model.ReportModel;
import net.skhu.mentoring.service.ClassPhotoService;
import net.skhu.mentoring.service.ProfileService;
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
		model.addAttribute("mento", mentoMapper.findOne(mento));
		model.addAttribute("reports", reportService.findByMentoId(mento));
		return "report/propose";
	}
	@RequestMapping(value="user/report/reportInfo", method=RequestMethod.GET)
	public String reportInfo(Model model, @RequestParam("mento") int mento, @RequestParam("id") int id) {
		model.addAttribute(mentoMapper.findOne(mento));
		model.addAttribute("report", reportService.findOne(id));
		return "report/reportInfo";
	}
	@RequestMapping(value="user/report/view", method=RequestMethod.GET)
	public String reportView(Model model, @RequestParam("id") int id) {
		Report report=reportService.findOne(id);
		model.addAttribute("report", report);
		ReportModel reportModel=reportService.getEditModel(id);
		model.addAttribute("editReport", reportModel);
		return "report/view";
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
		System.out.println(reportModel);
		return "report/reportList";
	}
	@RequestMapping(value="user/report/write", method=RequestMethod.POST)
	public String reportWrite(Model model, @RequestParam("classPhoto") MultipartFile[] uploadFiles, ReportModel reportModel) throws IOException {
		Report lastReport=reportService.findLastReport();
		if(uploadFiles.length!=0)
			classPhotoService.upload(uploadFiles, lastReport.getId());
		return "redirect:write";
	}
	@RequestMapping("user/report/download")
	public void download(@RequestParam("id") int id, HttpServletResponse response) throws Exception{
		Report report=reportService.findOne(id);
		if(report == null) return;
		Mento mento=mentoMapper.findOne(report.getMentoId());
		Student student=studentMapper.findByUserId(mento.getUserId());
		ClassPhoto classPhoto=classPhotoService.findByReportId(id);
		report.setMentoName(student.getName());
		report.setTeamName(mento.getTeamName());
		report.setMentoSubject(mento.getSubject());
		java.util.Date presentDate=report.getPresentDate();
		String fileName=URLEncoder.encode(String.format("%s_보고서파일_%d%02d%02d.xls", report.getTeamName(), presentDate.getYear()+1900, presentDate.getMonth()+1, presentDate.getDay()), "UTF-8");
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment;filename="+fileName+";");
		WritableWorkbook workbook = Workbook.createWorkbook(response.getOutputStream());
		WritableSheet sheet = null;
        Label label = null;
        try{
            workbook.createSheet("sheet1", 4);
            sheet = workbook.getSheet(0);
            workbook.getSheet(0).setColumnView(0, 15);
            workbook.getSheet(0).setColumnView(1, 27);
            workbook.getSheet(0).setColumnView(2, 15);
            workbook.getSheet(0).setColumnView(3, 27); // 초기에 열 크기들을 조정하는 작업
            workbook.getSheet(0).setRowView(1, 360);
            workbook.getSheet(0).setRowView(2, 360);
            workbook.getSheet(0).setRowView(3, 360);
            workbook.getSheet(0).setRowView(4, 360);
            workbook.getSheet(0).setRowView(5, 360);
            workbook.getSheet(0).setRowView(6, 360);
            workbook.getSheet(0).setRowView(7, 1080);
            workbook.getSheet(0).setRowView(8, 360);
            workbook.getSheet(0).setRowView(9, 360);
            workbook.getSheet(0).setRowView(10, 360);
            workbook.getSheet(0).setRowView(11, 2160);
            workbook.getSheet(0).setRowView(12, 360);
            WritableCellFormat titleFormat=new WritableCellFormat();
            titleFormat.setAlignment(Alignment.CENTRE); // 가운데 정렬
            titleFormat.setBorder(Border.ALL, BorderLineStyle.THIN); // 타이틀 셀에 테두리 그리는 작업
            WritableFont titleFont=new WritableFont(WritableFont.ARIAL, 20);
            titleFormat.setFont(titleFont);
            Label title=new Label(0, 0, "멘토링 보고서", titleFormat); // 추가할 셀
            sheet.mergeCells(0, 0, 3, 0);
            sheet.mergeCells(1, 5, 3, 5);
            sheet.mergeCells(0, 6, 3, 6);
            sheet.mergeCells(0, 7, 3, 7);
            sheet.mergeCells(1, 8, 3, 8);
            sheet.mergeCells(1, 9, 3, 9);
            sheet.mergeCells(0, 10, 3, 10);
            sheet.mergeCells(0, 11, 3, 11);
            sheet.mergeCells(0, 12, 3, 12);
            sheet.addCell(title); // 셀 추가하기
            WritableCellFormat entityFormat=new WritableCellFormat();
            entityFormat.setBorder(Border.ALL, BorderLineStyle.THIN);
            entityFormat.setAlignment(Alignment.CENTRE);
            entityFormat.setVerticalAlignment(VerticalAlignment.CENTRE);
            entityFormat.setBackground(Colour.SKY_BLUE);
            Label entity1=new Label(0, 1, "멘토 이름", entityFormat);
            sheet.addCell(entity1);
            Label entity2=new Label(2, 1, "제출 일자", entityFormat);
            sheet.addCell(entity2);
            Label entity3=new Label(0, 2, "팀 이름", entityFormat);
            sheet.addCell(entity3);
            Label entity4=new Label(2, 2, "진행 장소", entityFormat);
            sheet.addCell(entity4);
            Label entity5=new Label(0, 3, "멘토링 주제", entityFormat);
            sheet.addCell(entity5);
            Label entity6=new Label(2, 3, "수업 방식", entityFormat);
            sheet.addCell(entity6);
            Label entity7=new Label(0, 4, "진행 일자", entityFormat);
            sheet.addCell(entity7);
            Label entity8=new Label(2, 4, "수업 시간", entityFormat);
            sheet.addCell(entity8);
            Label entity9=new Label(0, 5, "결석 인원", entityFormat);
            sheet.addCell(entity9);
            Label entity10=new Label(0, 6, "결석 사유", entityFormat);
            sheet.addCell(entity10);
            Label entity11=new Label(0, 8, "수업 주제", entityFormat);
            sheet.addCell(entity11);
            Label entity12=new Label(0, 9, "수업 목표", entityFormat);
            sheet.addCell(entity12);
            Label entity13=new Label(0, 10, "수업 소감", entityFormat);
            sheet.addCell(entity13);
            Label entity14=new Label(0, 12, "인증샷", entityFormat);
            sheet.addCell(entity14);
            WritableCellFormat attributeFormat=new WritableCellFormat();
            attributeFormat.setBorder(Border.ALL, BorderLineStyle.THIN);
            attributeFormat.setAlignment(Alignment.CENTRE);
            attributeFormat.setVerticalAlignment(VerticalAlignment.CENTRE);
            attributeFormat.setWrap(true);
            SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
            SimpleDateFormat timeFormat=new SimpleDateFormat("a hh:mm");
            Label mentoName=new Label(1, 1, report.getMentoName(), attributeFormat);
            sheet.addCell(mentoName);
            Label pDate=new Label(3, 1, dateFormat.format(report.getPresentDate()), attributeFormat);
            sheet.addCell(pDate);
            Label teamName=new Label(1, 2, report.getTeamName(), attributeFormat);
            sheet.addCell(teamName);
            Label classPlace=new Label(3, 2, report.getClassPlace(), attributeFormat);
            sheet.addCell(classPlace);
            Label subject=new Label(1, 3, report.getMentoSubject(), attributeFormat);
            sheet.addCell(subject);
            Label classType=new Label(3, 3, report.getClassType(), attributeFormat);
            sheet.addCell(classType);
            Label classDate=new Label(1, 4, report.getClassDate().toString(), attributeFormat);
            sheet.addCell(classDate);
            Label classTime=new Label(3, 4, String.format("%s ~ %s", timeFormat.format(report.getStartTime()), timeFormat.format(report.getEndTime())), attributeFormat);
            sheet.addCell(classTime);
            Label absentPerson=new Label(1, 5, report.getAbsentPerson(), attributeFormat);
            sheet.addCell(absentPerson);
            Label absentContext=new Label(0, 7, report.getAbsentContext(), attributeFormat);
            sheet.addCell(absentContext);
            Label classSubject=new Label(1, 8, report.getClassSubject(), attributeFormat);
            sheet.addCell(classSubject);
            Label classTarget=new Label(1, 9, report.getClassTarget(), attributeFormat);
            sheet.addCell(classTarget);
            Label classImplass=new Label(0, 11, report.getClassImplass(), attributeFormat);
            sheet.addCell(classImplass);
            WritableCellFormat photoFormat=new WritableCellFormat();
            photoFormat.setBorder(Border.ALL, BorderLineStyle.THIN);
            InputStream inputImage=new ByteArrayInputStream(classPhoto.getData());
            BufferedImage uploadImage=ImageIO.read(inputImage);
            int infix=classPhoto.getFileName().lastIndexOf('.');
            String ext = classPhoto.getFileName().substring( infix + 1 );
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            if(!ext.equals("png")){
            	ImageIO.write(uploadImage, "png", baos);
            }else {
            	baos.write(classPhoto.getData());
            }
            double imageHeight=588*uploadImage.getHeight()/uploadImage.getWidth()/17;
            sheet.mergeCells(0, 13, 3, 12+(int)imageHeight);
            Label imageLabel=new Label(0, 13, "", photoFormat);
            sheet.addCell(imageLabel);
            baos.flush();
        	byte[] imageInByte = baos.toByteArray();
            WritableImage cPhoto=new WritableImage(0, 13, 4, imageHeight, imageInByte);
            sheet.addImage(cPhoto);
            workbook.write();
            workbook.close();
            inputImage.close();
            baos.close();
        }catch(Exception e){
            e.printStackTrace();
        }
	}
}
