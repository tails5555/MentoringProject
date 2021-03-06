package net.skhu.mentoring.controller;


import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.sql.Date;
import java.text.SimpleDateFormat;
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

import net.skhu.mentoring.dto.Admin;
import net.skhu.mentoring.dto.Employee;
import net.skhu.mentoring.dto.MentiList;
import net.skhu.mentoring.dto.Mento;
import net.skhu.mentoring.dto.MentoAdvertise;
import net.skhu.mentoring.dto.MentoQualific;
import net.skhu.mentoring.dto.MentoringGroup;
import net.skhu.mentoring.dto.NoticeBBSPost;
import net.skhu.mentoring.dto.Professor;
import net.skhu.mentoring.dto.Profile;
import net.skhu.mentoring.dto.Schedule;
import net.skhu.mentoring.dto.Student;
import net.skhu.mentoring.dto.Survey;
import net.skhu.mentoring.dto.User;
import net.skhu.mentoring.mapper.AdminMapper;
import net.skhu.mentoring.mapper.DepartmentMapper;
import net.skhu.mentoring.mapper.EmployeeMapper;
import net.skhu.mentoring.mapper.MentiListMapper;
import net.skhu.mentoring.mapper.MentoAdvertiseMapper;
import net.skhu.mentoring.mapper.MentoMapper;
import net.skhu.mentoring.mapper.MentoQualificMapper;
import net.skhu.mentoring.mapper.MentoringGroupMapper;
import net.skhu.mentoring.mapper.ProfessorMapper;
import net.skhu.mentoring.mapper.ScheduleMapper;
import net.skhu.mentoring.mapper.StudentMapper;
import net.skhu.mentoring.mapper.SurveyMapper;
import net.skhu.mentoring.mapper.UserMapper;
import net.skhu.mentoring.model.UserPagination;
import net.skhu.mentoring.service.AdminService;
import net.skhu.mentoring.service.GroupBBSService;
import net.skhu.mentoring.service.MentoAdvertiseService;
import net.skhu.mentoring.service.MentoQualificService;
import net.skhu.mentoring.service.MentoringPopupService;
import net.skhu.mentoring.service.NoticeBBSCommentService;
import net.skhu.mentoring.service.NoticeBBSFileService;
import net.skhu.mentoring.service.NoticeBBSService;
import net.skhu.mentoring.service.PrimaryExcelUploadService;
import net.skhu.mentoring.service.ProfileService;
import net.skhu.mentoring.service.ScheduleService;
@RequestMapping("/user")
@Controller
public class AdminController {

	@Autowired UserMapper userMapper;
	@Autowired DepartmentMapper departmentMapper;
	@Autowired StudentMapper studentMapper;
	@Autowired ProfessorMapper professorMapper;
	@Autowired EmployeeMapper employeeMapper;
	@Autowired AdminMapper adminMapper;
	@Autowired NoticeBBSService noticeBBSService;
	@Autowired NoticeBBSFileService noticeBBSFileService;
	@Autowired NoticeBBSCommentService noticeBBSCommentService;
	@Autowired ScheduleMapper scheduleMapper;
	@Autowired ScheduleService scheduleService;
	@Autowired MentoMapper mentoMapper;
	@Autowired MentoAdvertiseMapper mentoAdvertiseMapper;
	@Autowired MentoQualificMapper mentoQualificMapper;
	@Autowired SurveyMapper surveyMapper;
	@Autowired MentiListMapper mentiListMapper;
	@Autowired MentoAdvertiseService mentoAdvertiseService;
	@Autowired MentoQualificService mentoQualificService;
	@Autowired MentoringGroupMapper mentoringGroupMapper;
	@Autowired ProfileService profileService;
	@Autowired AdminService adminService;
	@Autowired MentoringPopupService mentoringPopupService;
	@Autowired GroupBBSService groupBBSService;
	@Autowired PrimaryExcelUploadService primaryExcelUploadService;
	@RequestMapping("list")
	public String index(Model model, UserPagination userPagination) {

        model.addAttribute("user", adminService.findAll(userPagination));
        model.addAttribute("searchBy", adminService.getSearchByOptions());
        model.addAttribute("orderBy", adminService.getOrderByOptions());
		return "userManage/userManage";
	}


	@RequestMapping(value="edit", method=RequestMethod.GET)
    public String edit(Model model, @RequestParam("id") int id, @RequestParam("order") String order, UserPagination userPagination) {
        User user = userMapper.findEdit(id);
        Profile userProfile=profileService.findByUserId(id);
        if(userProfile!=null) {
        	user.setProfileId(userProfile.getId());
        }else user.setProfileId(-1);
        List<User> userType =userMapper.findUserType();
        model.addAttribute("user", user);
        model.addAttribute("userType", userType);
        return "userManage/edit";
    }

    @RequestMapping(value="edit", method=RequestMethod.POST)
    public String edit(Model model, @RequestParam("id") int id, @RequestParam("order") String userType, User user, UserPagination userPagination) {

    	user.setUserType(userType);

    	System.out.println(user.getUserType());
    	System.out.println(user.getUserId());
    	Student student = studentMapper.findByUserId(user.getUserId());
    	Admin admin = new Admin();
    	admin.setUserId(user.getUserId());


       	if(user.getUserType().equals("직원")) {

       	 Employee employee = new Employee();

       	 employee.setEmpId(student.getStudentNumber());
       	 employee.setPhoneNumber(student.getPhoneNumber());
       	 employee.setName(student.getName());
       	 employee.setAddress(student.getAddress());
       	 employee.setEmail(student.getEmail());
       	 employee.setOfficeId(student.getDepartmentId());
       	employee.setOfficePhone(student.getPhoneNumber());
       	 employee.setUserId(student.getUserId());

       	System.out.println(employee.getUserId());
        employeeMapper.insert(employee);
       	studentMapper.deleteByUserId(employee.getUserId());
       	 adminMapper.insert(admin);
		 userMapper.update(user);


    	}
    	else if(user.getUserType().equals("교수")) {

    		 Professor professor = new Professor();

    		 professor.setProfId(student.getStudentNumber());
    		 professor.setPhoneNumber(student.getPhoneNumber());
    		 professor.setName(student.getName());
    		 professor.setAddress(student.getAddress());
    		 professor.setEmail(student.getEmail());
    		 professor.setOfficeId(student.getDepartmentId());
    		 professor.setOfficePhone(student.getPhoneNumber());
    		 professor.setUserId(student.getUserId());

           	System.out.println(professor.getUserId());
           	professorMapper.insert(professor);
        	studentMapper.deleteByUserId(professor.getUserId());

    		 adminMapper.insert(admin);
    		 userMapper.update(user);
    	}
    	else if(user.getUserType().equals("학생회장")) {
    		 adminMapper.insert(admin);
    		 userMapper.update(user);
    	}

    	else {


    		adminMapper.deleteByUserId(user.getUserId());
    		userMapper.update(user);
    	}

        return "redirect:list?id="+id+userPagination.getQueryString();
    }


    @RequestMapping("delete")
    public String delete(Model model, @RequestParam("id") int id) throws Exception {
    	User user=userMapper.findByUserType(id);
    	// 회원 삭제 이전에 게시글에 대해서 삭제를 해둘 필요가 있다. 게시물에는 댓글, 파일도 포함이 되어 있어서 일단 게시글 목록을 조회하고 파일들을 순차적으로 삭제하고, 게시글을 삭제를 하고, 최종적으로 댓글을 삭제한다.
    	System.out.println(user.getUserType());
    	List<NoticeBBSPost> postList=noticeBBSService.findByUserId(id); // 탈퇴한 회원들의 게시물을 삭제하기 위한 작업
    	for(NoticeBBSPost userPost : postList) { //  회원의 글 목록들을 불러와서 삭제하기
    		if(noticeBBSFileService.findByPostId(userPost.getId()).size()!=0) { // 파일이 포함되어 있는지 확인하고
    			noticeBBSFileService.deleteByPostId(userPost.getId()); // 삭제 작업 이루어지기
    		}
    		noticeBBSService.deletePost(userPost.getId()); // 삭제된 파일들부터 해서 삭제해 나가는 작업
    	}
    	noticeBBSCommentService.deleteByUserId(id); // 댓글은 사용자 번호를 이용해 손쉽게 삭제
    	if(user.getUserType()=="직원") {
    		adminMapper.deleteByUserId(id);
    		employeeMapper.deleteByUserId(id);
  	        userMapper.delete(id);

    	}
    	else if(user.getUserType()=="교수") {
    		 adminMapper.deleteByUserId(id);
    		  professorMapper.deleteByUserId(id);
    	        userMapper.delete(id);
    	}
    	else if(user.getUserType()=="학생회장") {
   		 adminMapper.deleteByUserId(id);
   		 studentMapper.deleteByUserId(id);
   	        userMapper.delete(id);
    	}

    	else {
	        studentMapper.deleteByUserId(id);
	        userMapper.delete(id);
    	}

        return "redirect:list";
    }

    @RequestMapping(value="schedule",method=RequestMethod.GET)
	public String schedule(Model model) {
		Schedule schedule1= scheduleMapper.findById(1);
		schedule1.setManageName(scheduleService.findManageNameByManageId(schedule1.getId()));
		Schedule schedule2= scheduleMapper.findById(2);
		Schedule schedule3=scheduleMapper.findById(3);
		model.addAttribute("schedule1", schedule1);
		model.addAttribute("schedule2", schedule2);
		model.addAttribute("schedule3", schedule3);
		return "schedule/candidate_boolean";
	}

	@RequestMapping(value="schedule",method=RequestMethod.POST)
	public String schedule(Model model,@RequestParam("startDate1") Date startDate1,@RequestParam("endDate1") Date endDate1,@RequestParam("startDate2") Date startDate2,@RequestParam("endDate2") Date endDate2, @RequestParam("startDate3") Date startDate3,@RequestParam("endDate3") Date endDate3) {

		Schedule schedule1=scheduleMapper.findById(1);
		Schedule schedule2=scheduleMapper.findById(2);
		Schedule schedule3=scheduleMapper.findById(3);
		Authentication authentication=SecurityContextHolder.getContext().getAuthentication();
		String manageId=authentication.getName();
		if(studentMapper.findOne(manageId)!=null) {
			Student student=studentMapper.findOne(manageId);
			Admin admin=adminMapper.findByUserId(student.getUserId());
			schedule1.setManageId(admin.getId());
			schedule2.setManageId(admin.getId());
			schedule3.setManageId(admin.getId());
		}
		else if(professorMapper.findOne(manageId)!=null) {
			Professor professor=professorMapper.findOne(manageId);
			Admin admin=adminMapper.findByUserId(professor.getUserId());
			schedule1.setManageId(admin.getId());
			schedule2.setManageId(admin.getId());
			schedule3.setManageId(admin.getId());
		}
		else if(employeeMapper.findOne(manageId)!=null) {
			Employee employee=employeeMapper.findOne(manageId);
			Admin admin=adminMapper.findByUserId(employee.getUserId());
			schedule1.setManageId(admin.getId());
			schedule2.setManageId(admin.getId());
			schedule3.setManageId(admin.getId());
		}
		scheduleMapper.update(startDate1, endDate1, schedule1.getId(), schedule1.getManageId());
		scheduleMapper.update(startDate2, endDate2, schedule2.getId(), schedule2.getManageId());
		scheduleMapper.update(startDate3, endDate3, schedule3.getId(), schedule3.getManageId());
		return "redirect:schedule";
	}

	@RequestMapping(value="survey",method=RequestMethod.GET)
	public String survey(Model model) {
		Schedule schedule4= scheduleMapper.findById(4);
		schedule4.setManageName(scheduleService.findManageNameByManageId(schedule4.getId()));
		Survey mento = surveyMapper.findOne(1);
		Survey menti= surveyMapper.findOne(2);
		model.addAttribute("schedule4", schedule4);
		model.addAttribute("mento", mento);
		model.addAttribute("menti",menti);
		return "survey/manage";
	}

	@RequestMapping(value="survey",method=RequestMethod.POST)
	public String survey(Model model,@RequestParam("startDate4") Date startDate4,@RequestParam("endDate4") Date endDate4, @RequestParam("mentoSite")String mentoSite,@RequestParam("mentiSite")String mentiSite) {

		Schedule schedule4=scheduleMapper.findById(4);
		Authentication authentication=SecurityContextHolder.getContext().getAuthentication();
		String manageId=authentication.getName();
		if(studentMapper.findOne(manageId)!=null) {
			Student student=studentMapper.findOne(manageId);
			Admin admin=adminMapper.findByUserId(student.getUserId());
			schedule4.setManageId(admin.getId());
		}
		else if(professorMapper.findOne(manageId)!=null) {
			Professor professor=professorMapper.findOne(manageId);
			Admin admin=adminMapper.findByUserId(professor.getUserId());
			schedule4.setManageId(admin.getId());
		}
		else if(employeeMapper.findOne(manageId)!=null) {
			Employee employee=employeeMapper.findOne(manageId);
			Admin admin=adminMapper.findByUserId(employee.getUserId());
			schedule4.setManageId(admin.getId());
		}
		scheduleMapper.update(startDate4, endDate4, schedule4.getId(), schedule4.getManageId());
		Survey mento = surveyMapper.findOne(1);
		mento.setSurveySite(mentoSite);
		mento.setManageId(schedule4.getManageId());
		surveyMapper.update(mento);
		Survey menti= surveyMapper.findOne(2);
		menti.setSurveySite(mentiSite);
		menti.setManageId(schedule4.getManageId());
		surveyMapper.update(menti);
		return "redirect:survey";
	}


	@RequestMapping(value="mento_open", method=RequestMethod.GET)
	public String mento_open(Model model) {
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
			System.out.println(mento.getId());
			MentoringGroup mentoringGroup = mentoringGroupMapper.findByMentoId(mento.getId());
			if(mentoringGroup!=null) {
				System.out.println(mentoringGroup);
				mento.setMentoGroupId(mentoringGroup.getId());
				List<MentiList> menties = mentiListMapper.findwithStudents(mentoringGroup.getId());
				mento.setMenties(menties);
			}
		}
		model.addAttribute("mentos", mentos);

		return "mentoring/mento_open";
	}
	@RequestMapping(value="mento_open/advDownload")
	public void advDownload(@RequestParam("id") int id, HttpServletResponse response) throws Exception{
		MentoAdvertise mentoAdvertise=mentoAdvertiseService.findOne(id);
		if(mentoAdvertise == null) return;
		String fileName=URLEncoder.encode(mentoAdvertise.getFileName(), "UTF-8");
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment;filename="+fileName+";");
		try(BufferedOutputStream output=new BufferedOutputStream(response.getOutputStream())){
			output.write(mentoAdvertise.getData());
		}
	}
	@RequestMapping(value="mento_open/quaDownload")
	public void quaDownload(@RequestParam("id") int id, HttpServletResponse response) throws Exception{
		MentoQualific mentoQualific=mentoQualificService.findOne(id);
		if(mentoQualific == null) return;
		String fileName=URLEncoder.encode(mentoQualific.getFileName(), "UTF-8");
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment;filename="+fileName+";");
		try(BufferedOutputStream output=new BufferedOutputStream(response.getOutputStream())){
			output.write(mentoQualific.getData());
		}
	}
	@RequestMapping(value="list/primaryUpload")
	public String primaryUpload(@RequestParam("csvFile") MultipartFile[] uploadFile) throws IOException{
		for(MultipartFile upload : uploadFile) {
	    	if(upload.getSize()<=0) continue;
	    	try {
	    		InputStream is = upload.getInputStream();
	    		primaryExcelUploadService.excelUpload(is);
    		}
    		catch(Exception e){
                e.printStackTrace();
    		}
    	}
		return "redirect:/user/list";
	}

	@RequestMapping(value="list/sampleDownload")
	public void sampleDownload(HttpServletResponse response) throws Exception{
		XSSFWorkbook workbook=primaryExcelUploadService.getSampleExcel();
		String fileName=URLEncoder.encode("신입생_추가_폼.xlsx", "UTF-8");
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment;filename="+fileName+";");
		try (BufferedOutputStream output = new BufferedOutputStream(response.getOutputStream())) {
			workbook.write(output);
		}
	}

	@RequestMapping(value="mento_open/insert")
	public String  insertMentoringGroup(Model model , @RequestParam("id") int mentoId) {
		int managerId=0;
		Authentication authentication=SecurityContextHolder.getContext().getAuthentication();
		String manageId=authentication.getName();
		String userName="";
		if(studentMapper.findOne(manageId)!=null) {
			Student student=studentMapper.findOne(manageId);
			Admin admin=adminMapper.findByUserId(student.getUserId());
			managerId=admin.getId();
			userName=student.getName()+" 학생회장";
		}
		else if(professorMapper.findOne(manageId)!=null) {
			Professor professor=professorMapper.findOne(manageId);
			Admin admin=adminMapper.findByUserId(professor.getUserId());
			managerId=admin.getId();
			userName=professor.getName()+" 교수";
		}
		else if(employeeMapper.findOne(manageId)!=null) {
			Employee employee=employeeMapper.findOne(manageId);
			Admin admin=adminMapper.findByUserId(employee.getUserId());
			managerId=admin.getId();
			userName=employee.getName()+" 직원";
		}
		Mento mento=mentoMapper.findOne(mentoId);
		User mentoUser=userMapper.findOne(mento.getUserId());
		if(!mentoUser.getUserType().equals("학생회장")) {
			mentoUser.setUserType("멘토");
			userMapper.update(mentoUser);
		}
		MentoringGroup mentoringGroup=new MentoringGroup();
		mentoringGroup.setMentoId(mentoId);
		mentoringGroup.setAllowManagerId(managerId);
		mentoringGroupMapper.insert(mentoringGroup);
		MentoringGroup temp=mentoringGroupMapper.findByMentoId(mentoId);
		groupBBSService.insert(temp.getId(), mentoId);
		java.util.Date date=new java.util.Date();
		SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String context=String.format("%s 팀 - 멘토링 신청 허가를 받았습니다. 확인자 : %s, 등록 날짜 : %s", mento.getTeamName(), userName, dt.format(date));
		mentoringPopupService.insert(context, date, 2);
		return"redirect:/user/mento_open";
	}
	@RequestMapping(value="mento_open/delete")
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	public String  deleteMentoringGroup(Model model , @RequestParam("id") int mentoId) {
		Mento mento=mentoMapper.findOne(mentoId);
		Authentication authentication=SecurityContextHolder.getContext().getAuthentication();
		String manageId=authentication.getName();
		String userName="";
		String phoneNumber="";
		if(studentMapper.findOne(manageId)!=null) {
			Student student=studentMapper.findOne(manageId);
			userName=student.getName()+" 학생회장";
			phoneNumber=student.getPhoneNumber();
		}
		else if(professorMapper.findOne(manageId)!=null) {
			Professor professor=professorMapper.findOne(manageId);
			userName=professor.getName()+" 교수";
			phoneNumber=professor.getPhoneNumber();
		}
		else if(employeeMapper.findOne(manageId)!=null) {
			Employee employee=employeeMapper.findOne(manageId);
			userName=employee.getName()+" 직원";
			phoneNumber=employee.getPhoneNumber();
		}
		String teamName=mento.getTeamName();
		User mentoUser=userMapper.findOne(mento.getUserId());
		if(!mentoUser.getUserType().equals("학생회장")) {
			mentoUser.setUserType("멘티");
			userMapper.update(mentoUser);
		}
		groupBBSService.delete(mentoId);
		mentoQualificMapper.deleteByMentoId(mentoId);
		mentoAdvertiseMapper.deleteByMentoId(mentoId);
		mentoringGroupMapper.delete(mentoId);
		mentoMapper.delete(mentoId);
		java.util.Date date=new java.util.Date();
		SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String context=String.format("%s 팀 - 멘토링 선정 탈락입니다. 자세한 연락은 %s(%s)에게 연락 바랍니다. %s", teamName, userName, phoneNumber, dt.format(date));
		mentoringPopupService.insert(context, date, 4);
		return"redirect:/user/mento_open";
	}

	@RequestMapping(value="mento_open/menti_remove")
	public String mentiRemove(Model model , @RequestParam("groupId") int groupId, @RequestParam("userId")int userId) {
		Authentication authentication=SecurityContextHolder.getContext().getAuthentication();
		String manageId=authentication.getName();
		String userName="";
		String phoneNumber="";
		if(studentMapper.findOne(manageId)!=null) {
			Student student=studentMapper.findOne(manageId);
			userName=student.getName()+" 학생회장";
			phoneNumber=student.getPhoneNumber();
		}
		else if(professorMapper.findOne(manageId)!=null) {
			Professor professor=professorMapper.findOne(manageId);
			userName=professor.getName()+" 교수";
			phoneNumber=professor.getPhoneNumber();
		}
		else if(employeeMapper.findOne(manageId)!=null) {
			Employee employee=employeeMapper.findOne(manageId);
			userName=employee.getName()+" 직원";
			phoneNumber=employee.getPhoneNumber();
		}
		Student student=studentMapper.findByUserId(userId);
		String name=student.getName();
		StringBuilder n=new StringBuilder(name);
		n.setCharAt(1, '*');
		MentoringGroup mentoringGroup=mentoringGroupMapper.findOne(groupId);
		Mento mento=mentoMapper.findOne(mentoringGroup.getMentoId());
		java.util.Date date=new java.util.Date();
		SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String context=String.format("%s 팀 - 멘티 %s님이 인원 조율로 인하여 멘티 선정이 안 되었습니다. 차후에 과정지도 시간을 통해서 다시 신청해주시길 바랍니다. 자세한 내용은 %s(%s)에게 연락 바랍니다. %s" , mento.getTeamName(), new String(n), userName, phoneNumber, dt.format(date));
		mentiListMapper.deleteWithUserId(groupId, userId);
		mentoringPopupService.insert(context, date, 7);
		return "redirect:/user/mento_open";
	}
}


