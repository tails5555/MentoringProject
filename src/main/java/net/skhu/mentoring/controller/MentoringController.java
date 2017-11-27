package net.skhu.mentoring.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import net.skhu.mentoring.dto.MentiList;
import net.skhu.mentoring.dto.Mento;
import net.skhu.mentoring.dto.MentoringGroup;
import net.skhu.mentoring.dto.Student;
import net.skhu.mentoring.dto.TimeTable;
import net.skhu.mentoring.mapper.MentiListMapper;
import net.skhu.mentoring.mapper.MentoMapper;
import net.skhu.mentoring.mapper.MentoringGroupMapper;
import net.skhu.mentoring.mapper.StudentMapper;
import net.skhu.mentoring.mapper.TimeTableMapper;
import net.skhu.mentoring.mapper.UserMapper;
import net.skhu.mentoring.service.MentoAdvertiseService;
import net.skhu.mentoring.service.MentoQualificService;
import net.skhu.mentoring.service.ProfileService;
@Controller
public class MentoringController {

	@Autowired MentoMapper mentoMapper;
	@Autowired TimeTableMapper timeTableMapper;
	@Autowired UserMapper userMapper;
	@Autowired StudentMapper studentMapper;
	@Autowired MentoringGroupMapper mentoringGroupMapper;
	@Autowired MentoAdvertiseService mentoAdvertiseService;
	@Autowired MentoQualificService mentoQualificService;
	@Autowired ProfileService profileService;

	@Autowired MentiListMapper mentiListMapper;

	@RequestMapping(value="user/mento_apli" ,method=RequestMethod.GET)
	public String mento_apli(Model model) {
		Authentication authentication=SecurityContextHolder.getContext().getAuthentication();
		String studentNumber=authentication.getName();
		Mento newMento=new Mento();
		model.addAttribute("mento", newMento);
		List<Mento> mentoList=mentoMapper.findByStudentNumber(studentNumber);
		for(Mento m : mentoList) {
			if(mentoringGroupMapper.findByMentoId(m.getId())!=null) {
				m.setPermited(true);
			}else m.setPermited(false);
		}
		model.addAttribute("mentos", mentoList);
		model.addAttribute("timetable", timeTableMapper.findOne(studentNumber));
		return "mentoring/mento_apli";
	}

	@RequestMapping(value="user/mento_apli",method=RequestMethod.POST)
	public String mento_apli(Model model, Mento mento, @RequestParam("advertiseUpload") MultipartFile[] advFile, @RequestParam("qualificUpload") MultipartFile[] quaFile) throws IOException {
		Authentication authentication=SecurityContextHolder.getContext().getAuthentication();
		String studentNumber=authentication.getName();
		mento.setUserId(studentMapper.findOne(studentNumber).getUserId());
		mento.setApplicationDate(new Date());
		mentoMapper.insert(mento);
		Mento newMento=mentoMapper.findLastMento();
		System.out.println(newMento.getId());
		if(advFile.length!=0) {
			mentoAdvertiseService.upload(advFile, newMento.getId());
		}
		if(quaFile.length!=0) {
			mentoQualificService.upload(quaFile, newMento.getId());
		}
		return "redirect:mento_apli";
	}

    @RequestMapping(value="user/mento_timetable")
    public String mento_timetable(@RequestParam("timetableView") String timetableView, Model model) {



    	System.out.println(timetableView);

    	Authentication authentication=SecurityContextHolder.getContext().getAuthentication();
		String studentNumber=authentication.getName();
		Student mento= studentMapper.findOne(studentNumber);
		Mento mento1 = mentoMapper.findByUserId(mento.getUserId());

		MentoringGroup mg = mentoringGroupMapper.findByMentoId(mento1.getId());

		System.out.println(mg.getId());

		List<MentiList> mt = mentiListMapper.findByTimetable(mg.getId());
		if(timetableView.equals("")) {
			timetableView=mento.getName();
		}
    	Student student=studentMapper.findOneByName(timetableView);
    	TimeTable timetable=null;
    	timetable = timeTableMapper.findOne(student.getStudentNumber());
    	model.addAttribute("timetable",timetable);
    	model.addAttribute("student",student);
    	model.addAttribute("mento",mento);
    	model.addAttribute("mt",mt);

        return "mentoring/mento_timetable";
    }


	@RequestMapping("user/menti_apli")
	public String menti_apli(Model model) {
		List<MentoringGroup> mentos = mentoringGroupMapper.findwithMentoWithStudent();
		Authentication authentication=SecurityContextHolder.getContext().getAuthentication();
		String studentNumber=authentication.getName();
		int userId=-1;
		int mentoId=-1;
		if(studentMapper.findOne(studentNumber)!=null) {
			userId=studentMapper.findOne(studentNumber).getUserId();
			if(mentoMapper.findByUserId(userId)!=null) {
				mentoId=mentoMapper.findByUserId(userId).getId();
			}
		}
		for(MentoringGroup m : mentos) {
			m.setCount(mentiListMapper.findCount(m.getId()));
			m.setIncluded(false);
			m.setMentoConfirm(false);
			if(m.getMentoId()==mentoId)
				m.setMentoConfirm(true);
			for(MentiList mentiList : mentiListMapper.findByGroupId(m.getId())) {
				if(userId==mentiList.getUserId()) {
					m.setIncluded(true);
					break;
				}
			}
		}
		model.addAttribute("mentos",mentos);
		return "mentoring/menti_apli";
	}

	@RequestMapping("user/menti_application")
	public String menti_application(Model model ,@RequestParam("id")int id) {
		MentiList mentiList = new MentiList();
		mentiList.setGroupId(id);
		Authentication authentication=SecurityContextHolder.getContext().getAuthentication();
		String studentNumber=authentication.getName();
		mentiList.setUserId(studentMapper.findOne(studentNumber).getUserId());
		mentiListMapper.insert(mentiList);
		return "redirect:menti_apli";
	}
	@RequestMapping("user/menti_each_remove")
	public String menti_each_remove(Model model, @RequestParam("id") int id) {
		Authentication authentication=SecurityContextHolder.getContext().getAuthentication();
		String studentNumber=authentication.getName();
		int userid=studentMapper.findOne(studentNumber).getUserId();
		mentiListMapper.deleteWithUserId(id, userid);
		return "redirect:menti_apli";
	}
	@RequestMapping("user/menti_remove")
	public String menti_remove(Model model) {
		Authentication authentication=SecurityContextHolder.getContext().getAuthentication();
		String studentNumber=authentication.getName();
		int userid=studentMapper.findOne(studentNumber).getUserId();
		mentiListMapper.delete(userid);
		return "redirect:menti_apli";
	}

	@RequestMapping(value="user/mento_list")
	public String mento_list(Model model) {
		List<Mento> mentos = mentoMapper.findWithStudent();

		for(Mento mento : mentos) {
			if(mentoAdvertiseService.findByMentoId(mento.getId())!=null) {
				mento.setAdvFileName(mentoAdvertiseService.findByMentoId(mento.getId()).getFileName());
				mento.setAdvId(mentoAdvertiseService.findByMentoId(mento.getId()).getId());
			}
			if(mentoQualificService.findByMentoId(mento.getId())!=null) {
				mento.setQuaFileName(mentoQualificService.findByMentoId(mento.getId()).getFileName());
				mento.setQuaId(mentoQualificService.findByMentoId(mento.getId()).getId());
			}
			if(mentoringGroupMapper.findByMentoId(mento.getId())!=null) {
				mento.setMentoGroupId(mentoringGroupMapper.findByMentoId(mento.getId()).getId());
			}else {
				mento.setMentoGroupId(-1);
			}
			if(profileService.findByUserId(mento.getUserId())!=null) {
				mento.setProfileId(profileService.findByUserId(mento.getUserId()).getId());
			}else mento.setProfileId(-1);
			String deptName=studentMapper.findByUserId(mento.getUserId()).getDepartmentName();
			mento.setDepartmentName(deptName);
			String studentNumber=studentMapper.findByUserId(mento.getUserId()).getStudentNumber();
			TimeTable timetable=timeTableMapper.findOne(studentNumber);
			mento.setTimeTable(timetable);
			System.out.println(mento.getId());
			MentoringGroup mentoringGroup = mentoringGroupMapper.findByMentoId(mento.getId());
			if(mentoringGroup!=null) {
				System.out.println(mentoringGroup);
				List<MentiList> menties = mentiListMapper.findwithStudents(mentoringGroup.getId());
				mento.setMenties(menties);
			}
		}
		model.addAttribute("mentos", mentos);

		return "mentoring/mento_list";
	}

}
