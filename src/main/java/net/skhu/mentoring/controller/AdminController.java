package net.skhu.mentoring.controller;


import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import net.skhu.mentoring.dto.Admin;
import net.skhu.mentoring.dto.Employee;
import net.skhu.mentoring.dto.NoticeBBSPost;
import net.skhu.mentoring.dto.Professor;
import net.skhu.mentoring.dto.Student;
import net.skhu.mentoring.dto.User;
import net.skhu.mentoring.dto.Mento;
import net.skhu.mentoring.mapper.AdminMapper;
import net.skhu.mentoring.mapper.DepartmentMapper;
import net.skhu.mentoring.mapper.EmployeeMapper;
import net.skhu.mentoring.mapper.ProfessorMapper;
import net.skhu.mentoring.mapper.StudentMapper;
import net.skhu.mentoring.mapper.UserMapper;
import net.skhu.mentoring.mapper.MentoMapper;
import net.skhu.mentoring.service.NoticeBBSCommentService;
import net.skhu.mentoring.service.NoticeBBSFileService;
import net.skhu.mentoring.service.NoticeBBSService;
import net.skhu.mentoring.dto.Schedule;
import net.skhu.mentoring.mapper.ScheduleMapper;
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
	
	@RequestMapping("list")
	public String index(Model model) {
		List<Student> students = studentMapper.findAll();
        model.addAttribute("students", students);
		List<Professor> professor = professorMapper.findAll();
		 model.addAttribute("professor", professor);
        List<Employee> employee = employeeMapper.findAll();
        model.addAttribute("employee", employee);

        List<User> user =userMapper.findList();
        model.addAttribute("user", user);

		return "userManage/userManage";
	}


	@RequestMapping(value="edit", method=RequestMethod.GET)
    public String edit(Model model, @RequestParam("id") int id) {
        User user = userMapper.findEdit(id);
        List<User> userType =userMapper.findUserType();
        model.addAttribute("user", user);
        model.addAttribute("userType", userType);
        return "userManage/edit";
    }

    @RequestMapping(value="edit", method=RequestMethod.POST)
    public String edit(Model model, User user) {

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

        return "redirect:list";
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
		model.addAttribute("schedule1", schedule1);
		model.addAttribute("schedule2", schedule2);
		return "schedule/candidate_boolean";
	}
    
	@RequestMapping(value="schedule",method=RequestMethod.POST)
	public String schedule(Model model,@RequestParam("startDate1") Date startDate1,@RequestParam("endDate1") Date endDate1,@RequestParam("startDate2") Date startDate2,@RequestParam("endDate2") Date endDate2) {
		
		Schedule schedule1=scheduleMapper.findById(1);
		Schedule schedule2=scheduleMapper.findById(2);
		Authentication authentication=SecurityContextHolder.getContext().getAuthentication();
		String manageId=authentication.getName();
		if(studentMapper.findOne(manageId)!=null) {
			Student student=studentMapper.findOne(manageId);
			Admin admin=adminMapper.findByUserId(student.getUserId());
			schedule1.setManageId(admin.getId());
			schedule2.setManageId(admin.getId());
		}
		else if(professorMapper.findOne(manageId)!=null) {
			Professor professor=professorMapper.findOne(manageId);
			Admin admin=adminMapper.findByUserId(professor.getUserId());
			schedule1.setManageId(admin.getId());
			schedule2.setManageId(admin.getId());
		}
		else if(employeeMapper.findOne(manageId)!=null) {
			Employee employee=employeeMapper.findOne(manageId);
			Admin admin=adminMapper.findByUserId(employee.getUserId());
			schedule1.setManageId(admin.getId());
			schedule2.setManageId(admin.getId());
		}
		scheduleMapper.update(startDate1, endDate1, schedule1.getId(), schedule1.getManageId());
		scheduleMapper.update(startDate2, endDate2, schedule2.getId(), schedule2.getManageId());
		return "redirect:schedule";
	}

	@RequestMapping(value="survey",method=RequestMethod.GET)
	public String survey(Model model) {
		Schedule schedule4= scheduleMapper.findById(4);
		schedule4.setManageName(scheduleService.findManageNameByManageId(schedule4.getId()));
		
		model.addAttribute("schedule4", schedule4);
		return "survey/manage";
	}
	
	@RequestMapping(value="survey",method=RequestMethod.POST)
	public String survey(Model model,@RequestParam("startDate4") Date startDate4,@RequestParam("endDate4") Date endDate4) {
		
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
		return "redirect:survey";
	}
	
	
	@RequestMapping(value="mento_open", method=RequestMethod.GET)
	public String mento_open(Model model) {
		List<Mento> mentos = mentoMapper.findWithStudent();
		model.addAttribute("mentos", mentos);
		return "mentoring/mento_open";
	}
}


