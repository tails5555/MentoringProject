package net.skhu.mentoring.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
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
import net.skhu.mentoring.service.MentoringPopupService;
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
	@Autowired MentoringPopupService mentoringPopupService;
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
		String name=studentMapper.findOne(studentNumber).getName();
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
		java.util.Date date=new java.util.Date();
		SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		StringBuilder n=new StringBuilder(name);
		n.setCharAt(1, '*');
		String context=String.format("%s 학생 멘토 신청을 하였습니다. 팀 이름 : %s, 날짜 : %s", new String(n), mento.getTeamName(), dt.format(date));
		mentoringPopupService.insert(context, date, 1);

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

		if(timetableView.equals("공강")) {

			int count=0;
			int[] mon = new int[8];
			int[] tue = new int[8];
			int[] wed = new int[8];
			int[] thu = new int[8];
			int[] fri = new int[8];

			for (MentiList m : mt) {

				Student student=studentMapper.findOneByName(m.getName());
		    	TimeTable timetable=null;
		    	timetable = timeTableMapper.findOne(student.getStudentNumber());

		    	if(timetable.getMon1()==true) {
		    		mon[0]+=1;
		    	}
		    	if(timetable.getMon2()==true) {
		    		mon[1]+=1;
		    	}if(timetable.getMon3()==true) {
		    		mon[2]+=1;
		    	}if(timetable.getMon4()==true) {
		    		mon[3]+=1;
		    	}if(timetable.getMon5()==true) {
		    		mon[4]+=1;
		    	}if(timetable.getMon6()==true) {
		    		mon[5]+=1;
		    	}if(timetable.getMon7()==true) {
		    		mon[6]+=1;
		    	}if(timetable.getMon8()==true) {
		    		mon[7]+=1;
		    	}

		    	if(timetable.getTue1()==true) {
		    		tue[0]+=1;  }
		    	if(timetable.getTue2()==true) {
		    		tue[1]+=1;  }
		    	if(timetable.getTue3()==true) {
		    		tue[2]+=1;  }
		    	if(timetable.getTue4()==true) {
		    		tue[3]+=1;  }
		    	if(timetable.getTue5()==true) {
		    		tue[4]+=1;  }
		    	if(timetable.getTue6()==true) {
		    		tue[5]+=1;  }
		    	if(timetable.getTue7()==true) {
		    		tue[6]+=1;  }
		    	if(timetable.getTue8()==true) {
		    		tue[7]+=1;  }

		    	if(timetable.getWed1()==true) {
		    		wed[0]+=1;  }
		    	if(timetable.getWed2()==true) {
		    		wed[1]+=1;  }
		    	if(timetable.getWed3()==true) {
		    		wed[2]+=1;  }
		    	if(timetable.getWed4()==true) {
		    		wed[3]+=1;  }
		    	if(timetable.getWed5()==true) {
		    		wed[4]+=1;  }
		    	if(timetable.getWed6()==true) {
		    		wed[5]+=1;  }
		    	if(timetable.getWed7()==true) {
		    		wed[6]+=1;  }
		    	if(timetable.getWed8()==true) {
		    		wed[7]+=1;  }

		    	if(timetable.getThu1()==true) {
		    		thu[0]+=1;  }
		    	if(timetable.getThu2()==true) {
		    		thu[1]+=1;  }
		    	if(timetable.getThu3()==true) {
		    		thu[2]+=1;  }
		    	if(timetable.getThu4()==true) {
		    		thu[3]+=1;  }
		    	if(timetable.getThu5()==true) {
		    		thu[4]+=1;  }
		    	if(timetable.getThu6()==true) {
		    		thu[5]+=1;  }
		    	if(timetable.getThu7()==true) {
		    		thu[6]+=1;  }
		    	if(timetable.getThu8()==true) {
		    		thu[7]+=1;  }

		    	if(timetable.getFri1()==true) {
		    		fri[0]+=1;  }
		    	if(timetable.getFri2()==true) {
		    		fri[1]+=1;  }
		    	if(timetable.getFri3()==true) {
		    		fri[2]+=1;  }
		    	if(timetable.getFri4()==true) {
		    		fri[3]+=1;  }
		    	if(timetable.getFri5()==true) {
		    		fri[4]+=1;  }
		    	if(timetable.getFri6()==true) {
		    		fri[5]+=1;  }
		    	if(timetable.getFri7()==true) {
		    		fri[6]+=1;  }
		    	if(timetable.getFri8()==true) {
		    		fri[7]+=1;  }

		    	count++;
			}

			TimeTable timetable=null;
	    	timetable = timeTableMapper.findOne(mento.getStudentNumber());

	     	if(timetable.getMon1()==true) {
	    		mon[0]+=1;
	    	}
	    	if(timetable.getMon2()==true) {
	    		mon[1]+=1;
	    	}if(timetable.getMon3()==true) {
	    		mon[2]+=1;
	    	}if(timetable.getMon4()==true) {
	    		mon[3]+=1;
	    	}if(timetable.getMon5()==true) {
	    		mon[4]+=1;
	    	}if(timetable.getMon6()==true) {
	    		mon[5]+=1;
	    	}if(timetable.getMon7()==true) {
	    		mon[6]+=1;
	    	}if(timetable.getMon8()==true) {
	    		mon[7]+=1;
	    	}

	    	if(timetable.getTue1()==true) {
	    		tue[0]+=1;  }
	    	if(timetable.getTue2()==true) {
	    		tue[1]+=1;  }
	    	if(timetable.getTue3()==true) {
	    		tue[2]+=1;  }
	    	if(timetable.getTue4()==true) {
	    		tue[3]+=1;  }
	    	if(timetable.getTue5()==true) {
	    		tue[4]+=1;  }
	    	if(timetable.getTue6()==true) {
	    		tue[5]+=1;  }
	    	if(timetable.getTue7()==true) {
	    		tue[6]+=1;  }
	    	if(timetable.getTue8()==true) {
	    		tue[7]+=1;  }

	    	if(timetable.getWed1()==true) {
	    		wed[0]+=1;  }
	    	if(timetable.getWed2()==true) {
	    		wed[1]+=1;  }
	    	if(timetable.getWed3()==true) {
	    		wed[2]+=1;  }
	    	if(timetable.getWed4()==true) {
	    		wed[3]+=1;  }
	    	if(timetable.getWed5()==true) {
	    		wed[4]+=1;  }
	    	if(timetable.getWed6()==true) {
	    		wed[5]+=1;  }
	    	if(timetable.getWed7()==true) {
	    		wed[6]+=1;  }
	    	if(timetable.getWed8()==true) {
	    		wed[7]+=1;  }

	    	if(timetable.getThu1()==true) {
	    		thu[0]+=1;  }
	    	if(timetable.getThu2()==true) {
	    		thu[1]+=1;  }
	    	if(timetable.getThu3()==true) {
	    		thu[2]+=1;  }
	    	if(timetable.getThu4()==true) {
	    		thu[3]+=1;  }
	    	if(timetable.getThu5()==true) {
	    		thu[4]+=1;  }
	    	if(timetable.getThu6()==true) {
	    		thu[5]+=1;  }
	    	if(timetable.getThu7()==true) {
	    		thu[6]+=1;  }
	    	if(timetable.getThu8()==true) {
	    		thu[7]+=1;  }

	    	if(timetable.getFri1()==true) {
	    		fri[0]+=1;  }
	    	if(timetable.getFri2()==true) {
	    		fri[1]+=1;  }
	    	if(timetable.getFri3()==true) {
	    		fri[2]+=1;  }
	    	if(timetable.getFri4()==true) {
	    		fri[3]+=1;  }
	    	if(timetable.getFri5()==true) {
	    		fri[4]+=1;  }
	    	if(timetable.getFri6()==true) {
	    		fri[5]+=1;  }
	    	if(timetable.getFri7()==true) {
	    		fri[6]+=1;  }
	    	if(timetable.getFri8()==true) {
	    		fri[7]+=1;  }


			Student student=new Student();
			student.setName("멘토링 그룹 공강");

	    	TimeTable mentoTime = new TimeTable();

	    	if(mon[0]==count+1) {
	    		mentoTime.setMon1(true);		}
	     	if(mon[1]==count+1) {
	    		mentoTime.setMon2(true);		}
	     	if(mon[2]==count+1) {
	    		mentoTime.setMon3(true);		}
	     	if(mon[3]==count+1) {
	    		mentoTime.setMon4(true);		}
	     	if(mon[4]==count+1) {
	    		mentoTime.setMon5(true);		}
	     	if(mon[5]==count+1) {
	    		mentoTime.setMon6(true);		}
	     	if(mon[6]==count+1) {
	    		mentoTime.setMon7(true);		}
	     	if(mon[7]==count+1) {
	    		mentoTime.setMon8(true);		}

	     	if(tue[0]==count+1) {
	    		mentoTime.setTue1(true);		}
	     	if(tue[1]==count+1) {
	    		mentoTime.setTue2(true);		}
	     	if(tue[2]==count+1) {
	    		mentoTime.setTue3(true);		}
	     	if(tue[3]==count+1) {
	    		mentoTime.setTue4(true);		}
	     	if(tue[4]==count+1) {
	    		mentoTime.setTue5(true);		}
	     	if(tue[5]==count+1) {
	    		mentoTime.setTue6(true);		}
	     	if(tue[6]==count+1) {
	    		mentoTime.setTue7(true);		}
	     	if(tue[7]==count+1) {
	    		mentoTime.setTue8(true);		}

	     	if(wed[0]==count+1) {
	    		mentoTime.setWed1(true);		}
	    	if(wed[1]==count+1) {
	    		mentoTime.setWed2(true);		}
	    	if(wed[2]==count+1) {
	    		mentoTime.setWed3(true);		}
	    	if(wed[3]==count+1) {
	    		mentoTime.setWed4(true);		}
	    	if(wed[4]==count+1) {
	    		mentoTime.setWed5(true);		}
	    	if(wed[5]==count+1) {
	    		mentoTime.setWed6(true);		}
	    	if(wed[6]==count+1) {
	    		mentoTime.setWed7(true);		}
	    	if(wed[7]==count+1) {
	    		mentoTime.setWed8(true);		}

	      	if(thu[0]==count+1) {
	    		mentoTime.setThu1(true);		}
	    	if(thu[1]==count+1) {
	    		mentoTime.setThu2(true);		}
	    	if(thu[2]==count+1) {
	    		mentoTime.setThu3(true);		}
	    	if(thu[3]==count+1) {
	    		mentoTime.setThu4(true);		}
	    	if(thu[4]==count+1) {
	    		mentoTime.setThu5(true);		}
	    	if(thu[5]==count+1) {
	    		mentoTime.setThu6(true);		}
	    	if(thu[6]==count+1) {
	    		mentoTime.setThu7(true);		}
	    	if(thu[7]==count+1) {
	    		mentoTime.setThu8(true);		}

	    	if(fri[0]==count+1) {
	    		mentoTime.setFri1(true);		}
	    	if(fri[1]==count+1) {
	    		mentoTime.setFri2(true);		}
	    	if(fri[2]==count+1) {
	    		mentoTime.setFri3(true);		}
	    	if(fri[3]==count+1) {
	    		mentoTime.setFri4(true);		}
	    	if(fri[4]==count+1) {
	    		mentoTime.setFri5(true);		}
	    	if(fri[5]==count+1) {
	    		mentoTime.setFri6(true);		}
	    	if(fri[6]==count+1) {
	    		mentoTime.setFri7(true);		}
	    	if(fri[7]==count+1) {
	    		mentoTime.setFri8(true);		}

	    	model.addAttribute("timetable",mentoTime);
	    	model.addAttribute("student",student);
		}

		else {
			Student student=studentMapper.findOneByName(timetableView);
	    	TimeTable timetable=null;
	    	timetable = timeTableMapper.findOne(student.getStudentNumber());

	    	model.addAttribute("timetable",timetable);
	    	model.addAttribute("student",student);
		}

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
		MentoringGroup mentoringGroup=mentoringGroupMapper.findOne(id);
		Mento mento=mentoMapper.findOne(mentoringGroup.getMentoId());
		Authentication authentication=SecurityContextHolder.getContext().getAuthentication();
		String studentNumber=authentication.getName();
		mentiList.setUserId(studentMapper.findOne(studentNumber).getUserId());
		mentiListMapper.insert(mentiList);
		String name=studentMapper.findOne(studentNumber).getName();
		StringBuilder n=new StringBuilder(name);
		n.setCharAt(1, '*');
		java.util.Date date=new java.util.Date();
		SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String context=String.format("%s 학생 멘티 신청을 하였습니다. 팀 이름 : %s, 날짜 : %s", new String(n), mento.getTeamName(), dt.format(date));
		mentoringPopupService.insert(context, date, 3);
		return "redirect:menti_apli";
	}
	@RequestMapping("user/menti_each_remove")
	public String menti_each_remove(Model model, @RequestParam("id") int id) {
		MentoringGroup mentoringGroup=mentoringGroupMapper.findOne(id);
		Mento mento=mentoMapper.findOne(mentoringGroup.getMentoId());
		Authentication authentication=SecurityContextHolder.getContext().getAuthentication();
		String studentNumber=authentication.getName();
		int userid=studentMapper.findOne(studentNumber).getUserId();
		mentiListMapper.deleteWithUserId(id, userid);
		String name=studentMapper.findOne(studentNumber).getName();
		StringBuilder n=new StringBuilder(name);
		n.setCharAt(1, '*');
		java.util.Date date=new java.util.Date();
		SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String context=String.format("%s 학생 멘티 취소를 하였습니다. 팀 이름 : %s, 날짜 : %s", new String(n), mento.getTeamName(), dt.format(date));
		mentoringPopupService.insert(context, date, 5);
		return "redirect:menti_apli";
	}
	@RequestMapping("user/menti_remove")
	public String menti_remove(Model model) {
		Authentication authentication=SecurityContextHolder.getContext().getAuthentication();
		String studentNumber=authentication.getName();
		int userid=studentMapper.findOne(studentNumber).getUserId();
		mentiListMapper.delete(userid);
		String name=studentMapper.findOne(studentNumber).getName();
		StringBuilder n=new StringBuilder(name);
		n.setCharAt(1, '*');
		java.util.Date date=new java.util.Date();
		SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String context=String.format("%s 학생 멘티 신청을 다시 진행합니다. 날짜 : %s", new String(n), dt.format(date));
		mentoringPopupService.insert(context, date, 6);
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
				if(!mentoringGroup.getInfoOpen()) {
					List<MentiList> menties = mentiListMapper.findwithStudents(mentoringGroup.getId());
					for(MentiList ml : menties) {
						String mentiNumber=ml.getStudentNumber();
						String name=ml.getName();
						String email=ml.getEmail();
						String[] split=email.split("@");
						String[] splitDomain=split[1].split("\\.");
						ml.setStudentNumber(mentiNumber.substring(0, 4)+"*****");
						StringBuilder temp=new StringBuilder();
						temp.append(name);
						temp.setCharAt(1, '*');
						ml.setName(new String(temp));
						String id=split[0].substring(0, split[0].length()/2)+"******";
						String domain=splitDomain[0].substring(0, splitDomain[0].length()/2)+"***";
						String net=(splitDomain.length>2) ? splitDomain[1]+"."+splitDomain[2] : splitDomain[1];
						ml.setEmail(id+"@"+domain+"."+net);
					}
					mento.setMenties(menties);
				}
				else {
					List<MentiList> menties = mentiListMapper.findwithStudents(mentoringGroup.getId());
					mento.setMenties(menties);
				}
			}
		}
		model.addAttribute("mentos", mentos);

		return "mentoring/mento_list";
	}

}
