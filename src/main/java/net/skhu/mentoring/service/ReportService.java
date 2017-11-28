package net.skhu.mentoring.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import net.skhu.mentoring.dto.Admin;
import net.skhu.mentoring.dto.Employee;
import net.skhu.mentoring.dto.Mento;
import net.skhu.mentoring.dto.Professor;
import net.skhu.mentoring.dto.Report;
import net.skhu.mentoring.dto.Student;
import net.skhu.mentoring.dto.User;
import net.skhu.mentoring.mapper.AdminMapper;
import net.skhu.mentoring.mapper.EmployeeMapper;
import net.skhu.mentoring.mapper.MentoMapper;
import net.skhu.mentoring.mapper.ProfessorMapper;
import net.skhu.mentoring.mapper.ReportMapper;
import net.skhu.mentoring.mapper.StudentMapper;
import net.skhu.mentoring.mapper.UserMapper;
import net.skhu.mentoring.model.Option;
import net.skhu.mentoring.model.ReportModel;
@Service
public class ReportService {
	@Autowired ReportMapper reportMapper;
	@Autowired MentoMapper mentoMapper;
	@Autowired StudentMapper studentMapper;
	@Autowired ProfessorMapper professorMapper;
	@Autowired EmployeeMapper employeeMapper;
	@Autowired AdminMapper adminMapper;
	@Autowired UserMapper userMapper;
	@Autowired ReportPopupService reportPopupService;
	public Report findOne(int id) {
		Report report=reportMapper.findOne(id);
		Mento mento=mentoMapper.findOne(report.getMentoId());
		Student student=studentMapper.findByUserId(mento.getUserId());
		report.setMentoName(student.getName());
		report.setTeamName(mento.getTeamName());
		report.setMentoSubject(mento.getSubject());
		Admin admin=adminMapper.findOne(report.getConfirmManagerId());
		if(admin!=null) {
			User adminUser=userMapper.findOne(admin.getUserId());
			if(studentMapper.findByUserId(adminUser.getId())!=null) {
				Student stdChair=studentMapper.findByUserId(adminUser.getId());
				report.setConfirmManagerName(stdChair.getName());
			}
			else if(professorMapper.findByUserId(adminUser.getId())!=null) {
				Professor professor=professorMapper.findByUserId(adminUser.getId());
				report.setConfirmManagerName(professor.getName());
			}
			else if(employeeMapper.findByUserId(adminUser.getId())!=null) {
				Employee employee=employeeMapper.findByUserId(adminUser.getId());
				report.setConfirmManagerName(employee.getName());
			}
		}else report.setConfirmManagerName("");
		return report;
	}
	public List<Report> findByMentoId(int mentoId) {
		return reportMapper.findByMentoId(mentoId);
	}
	public List<Report> mentoReportList(Mento mento){
		List<Report> reportList=reportMapper.findByMentoId(mento.getId());
		for(Report r : reportList) {
			Admin admin=adminMapper.findOne(r.getConfirmManagerId());
			if(admin!=null) {
				Student student=studentMapper.findByUserId(admin.getUserId());
				Professor professor=professorMapper.findByUserId(admin.getUserId());
				Employee employee=employeeMapper.findByUserId(admin.getUserId());
				if(professor!=null) {
					r.setConfirmManagerName(professor.getName()+" 교수");
				}
				if(employee!=null) {
					r.setConfirmManagerName(employee.getName()+" 직원");
				}
				if(student!=null) {
					r.setConfirmManagerName(student.getName()+" 회장");
				}
			}
		}
		return reportList;
	}
	public double getMentoringTime(int mentoId) {
		long time=0;
		for(Report r : reportMapper.findByMentoId(mentoId)) {
			if(r.getConfirm()) {
				time+=r.getEndTime().getTime()-r.getStartTime().getTime();
			}
		}
		double result=(double)time/3600000;
		System.out.println(result);
		return result;
	}
	public void insert(ReportModel reportModel) {
		Authentication authentication=SecurityContextHolder.getContext().getAuthentication();
		String userNumber;
		Mento mento;
		Report report=new Report();
		String teamName="";
		double time=0;
		if(authentication!=null) {
			userNumber=authentication.getName();
			if(studentMapper.findOne(userNumber)!=null) {
				Student student=studentMapper.findOne(userNumber);
				if(mentoMapper.findByUserId(student.getUserId())!=null) {
					mento=mentoMapper.findByUserId(student.getUserId());
					teamName=mento.getTeamName();
					report.setMentoId(mento.getId());
					time=getMentoringTime(mento.getId());
				}
			}
		}
		java.sql.Date classDay=reportModel.getClassDate();
		java.util.Date sTime=new java.util.Date();
		sTime.setYear(classDay.getYear());
		sTime.setMonth(classDay.getMonth());
		sTime.setDate(classDay.getDate());
		sTime.setHours(reportModel.getStart1());
		sTime.setMinutes(reportModel.getStart2());
		sTime.setSeconds(0);
		java.util.Date eTime=new java.util.Date();
		eTime.setYear(classDay.getYear());
		eTime.setMonth(classDay.getMonth());
		eTime.setDate(classDay.getDate());
		eTime.setHours(reportModel.getEnd1());
		eTime.setMinutes(reportModel.getEnd2());
		eTime.setSeconds(0);
		report.setClassPlace(reportModel.getClassPlace());
		report.setClassImplass(reportModel.getClassImplass());
		report.setClassDate(reportModel.getClassDate());
		report.setClassSubject(reportModel.getClassSubject());
		report.setClassTarget(reportModel.getClassTarget());
		if(reportModel.getClassType()>0) {
			if(time<24) {
				report.setClassType(reportMapper.availableType[reportModel.getClassType()].getLabel());
			}
			else {
				report.setClassType("컨퍼런스 참석");
			}
		}
		report.setStartTime(sTime);
		report.setEndTime(eTime);
		report.setAbsentContext(reportModel.getAbsentContext());
		report.setAbsentPerson(reportModel.getAbsentPerson());
		report.setPresentDate(new java.util.Date());
		reportMapper.insert(report);
		String context=String.format("%s 팀 - 보고서 등록하였습니다. 수업 날짜 : %s", teamName, report.getClassDate().toString());
		System.out.println(context);
		reportPopupService.popupInsert(context, report.getPresentDate(), 1);
	}
	public void updateReport(ReportModel reportModel) {
		Authentication authentication=SecurityContextHolder.getContext().getAuthentication();
		String userNumber;
		Mento mento = null;
		Report report=new Report();
		String teamName="";
		double time=0;
		if(authentication!=null) {
			userNumber=authentication.getName();
			if(studentMapper.findOne(userNumber)!=null) {
				Student student=studentMapper.findOne(userNumber);
				if(mentoMapper.findByUserId(student.getUserId())!=null) {
					mento=mentoMapper.findByUserId(student.getUserId());
					teamName=mento.getTeamName();
					report.setMentoId(mento.getId());
					time=getMentoringTime(mento.getId());
				}
			}
		}
		java.sql.Date classDay=reportModel.getClassDate();
		java.util.Date sTime=new java.util.Date();
		sTime.setYear(classDay.getYear());
		sTime.setMonth(classDay.getMonth());
		sTime.setDate(classDay.getDate());
		sTime.setHours(reportModel.getStart1());
		sTime.setMinutes(reportModel.getStart2());
		sTime.setSeconds(0);
		java.util.Date eTime=new java.util.Date();
		eTime.setYear(classDay.getYear());
		eTime.setMonth(classDay.getMonth());
		eTime.setDate(classDay.getDate());
		eTime.setHours(reportModel.getEnd1());
		eTime.setMinutes(reportModel.getEnd2());
		eTime.setSeconds(0);
		report.setClassPlace(reportModel.getClassPlace());
		report.setClassImplass(reportModel.getClassImplass());
		report.setClassDate(reportModel.getClassDate());
		report.setClassSubject(reportModel.getClassSubject());
		report.setClassTarget(reportModel.getClassTarget());
		report.setClassType(reportMapper.availableType[reportModel.getClassType()].getLabel());
		report.setStartTime(sTime);
		report.setEndTime(eTime);
		report.setAbsentContext(reportModel.getAbsentContext());
		report.setAbsentPerson(reportModel.getAbsentPerson());
		report.setId(reportModel.getId());
		String context=String.format("%s 팀 - 보고서 수정하였습니다. 수업 날짜 : %s", mento.getTeamName(), report.getClassDate().toString());
		System.out.println(context);
		reportPopupService.popupInsert(context, new java.util.Date(), 2);
		reportMapper.update(report);
	}
	public int confirmedReportCount(int id) {
		return reportMapper.checkConfirmCount(id);
	}
	public ReportModel getEditModel(int id) {
		ReportModel reportModel=new ReportModel();
		Report report=reportMapper.findOne(id);
		reportModel.setMentoId(report.getMentoId());
		reportModel.setClassPlace(report.getClassPlace());
		reportModel.setClassImplass(report.getClassImplass());
		reportModel.setClassDate(report.getClassDate());
		reportModel.setClassSubject(report.getClassSubject());
		reportModel.setClassTarget(report.getClassTarget());
		for(Option o : reportMapper.availableType) {
			if(report.getClassType().equals(o.getLabel())) {
				reportModel.setClassType(o.getValue());
			}
		}
		reportModel.setStart1(report.getStartTime().getHours());
		reportModel.setStart2(report.getStartTime().getMinutes());
		reportModel.setEnd1(report.getEndTime().getHours());
		reportModel.setEnd2(report.getEndTime().getMinutes());
		reportModel.setAbsentContext(report.getAbsentContext());
		reportModel.setAbsentPerson(report.getAbsentPerson());
		return reportModel;
	}
	public void updateComment(Report report) {
		Authentication authentication=SecurityContextHolder.getContext().getAuthentication();
		String userNumber=authentication.getName();
		String userName="";
		if(studentMapper.findOne(userNumber)!=null) {
			Student student=studentMapper.findOne(userNumber);
			userName=student.getName();
			Admin admin=adminMapper.findByUserId(student.getUserId());
			report.setConfirmManagerId(admin.getId());
		}
		else if(professorMapper.findOne(userNumber)!=null) {
			Professor professor=professorMapper.findOne(userNumber);
			userName=professor.getName();
			Admin admin=adminMapper.findByUserId(professor.getUserId());
			report.setConfirmManagerId(admin.getId());
		}
		else if(employeeMapper.findOne(userNumber)!=null) {
			Employee employee=employeeMapper.findOne(userNumber);
			userName=employee.getName();
			Admin admin=adminMapper.findByUserId(employee.getUserId());
			report.setConfirmManagerId(admin.getId());
		}
		Mento mento=mentoMapper.findOne(report.getMentoId());
		reportMapper.updateComment(report.getId(), report.getComment(), report.getConfirmManagerId());
		String context=String.format("%s 팀의 %s 수업 보고서에 %s님이 코멘트를 추가하였습니다.\n코멘트 내용 : %s", mento.getTeamName(), report.getClassDate().toString(), userName, report.getComment());
		System.out.println(context);
		reportPopupService.popupInsert(context, new java.util.Date(), 4);
	}
	public void checkConfirm(int id) {
		Report report=reportMapper.findOne(id);
		Mento mento=mentoMapper.findOne(report.getMentoId());
		Admin admin=null;
		Authentication authentication=SecurityContextHolder.getContext().getAuthentication();
		String userNumber=authentication.getName();
		String userName="";
		if(studentMapper.findOne(userNumber)!=null) {
			Student student=studentMapper.findOne(userNumber);
			userName=student.getName();
			admin=adminMapper.findByUserId(student.getUserId());
		}
		else if(professorMapper.findOne(userNumber)!=null) {
			Professor professor=professorMapper.findOne(userNumber);
			userName=professor.getName();
			admin=adminMapper.findByUserId(professor.getUserId());
		}
		else if(employeeMapper.findOne(userNumber)!=null) {
			Employee employee=employeeMapper.findOne(userNumber);
			userName=employee.getName();
			admin=adminMapper.findByUserId(employee.getUserId());
		}
		reportMapper.checkConfirm(id, admin.getId());
		String context=String.format("%s 팀의 %s 수업 보고서에 %s님이 확인 완료하였습니다.", mento.getTeamName(), report.getClassDate().toString(), userName);
		System.out.println(context);
		reportPopupService.popupInsert(context, new java.util.Date(), 3);
	}
	public Report findLastReport() {
		return reportMapper.findLastReport();
	}
	public List<Report> findByMentoIdASC(int mentoId){
		return reportMapper.findByMentoIdASC(mentoId);
	}
	public Option[] getAvailableType() {
		return reportMapper.availableType;
	}
	public void delete(int id) {

		Report report=reportMapper.findOne(id);
		Mento mento=mentoMapper.findOne(report.getMentoId());
		Authentication authentication=SecurityContextHolder.getContext().getAuthentication();
		String userNumber=authentication.getName();
		String userName="";
		if(studentMapper.findOne(userNumber)!=null) {
			Student student=studentMapper.findOne(userNumber);
			userName=student.getName();
		}
		else if(professorMapper.findOne(userNumber)!=null) {
			Professor professor=professorMapper.findOne(userNumber);
			userName=professor.getName();
		}
		else if(employeeMapper.findOne(userNumber)!=null) {
			Employee employee=employeeMapper.findOne(userNumber);
			userName=employee.getName();
		}
		reportMapper.delete(id);
		String context=String.format("%s 팀의 %s 수업 보고서를 %s님이 삭제했습니다.", mento.getTeamName(), report.getClassDate().toString(), userName);
		System.out.println(context);
		reportPopupService.popupInsert(context, new java.util.Date(), 5);
	}
}
