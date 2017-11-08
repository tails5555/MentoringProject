package net.skhu.mentoring.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import net.skhu.mentoring.dto.Admin;
import net.skhu.mentoring.dto.Employee;
import net.skhu.mentoring.dto.IntroDetail;
import net.skhu.mentoring.dto.IntroTitle;
import net.skhu.mentoring.dto.Professor;
import net.skhu.mentoring.dto.Student;
import net.skhu.mentoring.dto.User;
import net.skhu.mentoring.mapper.AdminMapper;
import net.skhu.mentoring.mapper.EmployeeMapper;
import net.skhu.mentoring.mapper.IntroDetailMapper;
import net.skhu.mentoring.mapper.IntroTitleMapper;
import net.skhu.mentoring.mapper.ProfessorMapper;
import net.skhu.mentoring.mapper.StudentMapper;
import net.skhu.mentoring.mapper.UserMapper;
@Service
public class IntroService {
	@Autowired IntroTitleMapper introTitleMapper;
	@Autowired IntroDetailMapper introDetailMapper;
	@Autowired AdminMapper adminMapper;
	@Autowired UserMapper userMapper;
	@Autowired StudentMapper studentMapper;
	@Autowired ProfessorMapper professorMapper;
	@Autowired EmployeeMapper employeeMapper;
	public List<IntroTitle> findAllTitleWithDetails(){
		List<IntroTitle> titles=introTitleMapper.findAll();
		for (IntroTitle title : titles) {
            List<IntroDetail> details = introDetailMapper.findAllWithTitle(title.getId());
            title.setDetails(details);
        }
		return titles;
	}
	public List<IntroTitle> findAllTitles(){
		List<IntroTitle> introTitle=introTitleMapper.findAll();
		for(IntroTitle title : introTitle) {
			int adminId=title.getManageId();
			Admin admin=adminMapper.findOne(adminId);
			User adminUser=userMapper.findOne(admin.getUserId());
			if(studentMapper.findByUserId(adminUser.getId())!=null) {
				Student student=studentMapper.findByUserId(adminUser.getId());
				title.setAdminName(student.getName());
			}
			else if(professorMapper.findByUserId(adminUser.getId())!=null) {
				Professor professor=professorMapper.findByUserId(adminUser.getId());
				title.setAdminName(professor.getName());
			}
			else if(employeeMapper.findByUserId(adminUser.getId())!=null) {
				Employee employee=employeeMapper.findByUserId(adminUser.getId());
				title.setAdminName(employee.getName());
			}
		}
		return introTitle;
	}
	public void insertTitle(IntroTitle introTitle){
		Authentication authentication=SecurityContextHolder.getContext().getAuthentication();
		String userNumber=authentication.getName();
		if(studentMapper.findOne(userNumber)!=null) {
			Student student=studentMapper.findOne(userNumber);
			Admin admin=adminMapper.findByUserId(student.getUserId());
			introTitle.setAdminName(student.getName());
			introTitle.setManageId(admin.getId());
		}
		else if(professorMapper.findOne(userNumber)!=null) {
			Professor professor=professorMapper.findOne(userNumber);
			Admin admin=adminMapper.findByUserId(professor.getUserId());
			introTitle.setAdminName(professor.getName());
			introTitle.setManageId(admin.getId());
		}
		else if(employeeMapper.findOne(userNumber)!=null) {
			Employee employee=employeeMapper.findOne(userNumber);
			Admin admin=adminMapper.findByUserId(employee.getUserId());
			introTitle.setAdminName(employee.getName());
			introTitle.setManageId(admin.getId());
		}
		introTitleMapper.insert(introTitle);
	}
	public void updateTitle(IntroTitle introTitle) {
		Authentication authentication=SecurityContextHolder.getContext().getAuthentication();
		String userNumber=authentication.getName();
		if(studentMapper.findOne(userNumber)!=null) {
			Student student=studentMapper.findOne(userNumber);
			Admin admin=adminMapper.findByUserId(student.getUserId());
			introTitle.setAdminName(student.getName());
			introTitle.setManageId(admin.getId());
		}
		else if(professorMapper.findOne(userNumber)!=null) {
			Professor professor=professorMapper.findOne(userNumber);
			Admin admin=adminMapper.findByUserId(professor.getUserId());
			introTitle.setAdminName(professor.getName());
			introTitle.setManageId(admin.getId());
		}
		else if(employeeMapper.findOne(userNumber)!=null) {
			Employee employee=employeeMapper.findOne(userNumber);
			Admin admin=adminMapper.findByUserId(employee.getUserId());
			introTitle.setAdminName(employee.getName());
			introTitle.setManageId(admin.getId());
		}
		introTitleMapper.update(introTitle);
	}
	public List<IntroDetail> findAllIntroDetails(int id){
		List<IntroDetail> introDetail=introDetailMapper.findAllWithTitle(id);
		for(IntroDetail detail : introDetail) {
			int adminId=detail.getManageId();
			Admin admin=adminMapper.findOne(adminId);
			User adminUser=userMapper.findOne(admin.getUserId());
			if(studentMapper.findByUserId(adminUser.getId())!=null) {
				Student student=studentMapper.findByUserId(adminUser.getId());
				detail.setAdminName(student.getName());
			}
			else if(professorMapper.findByUserId(adminUser.getId())!=null) {
				Professor professor=professorMapper.findByUserId(adminUser.getId());
				detail.setAdminName(professor.getName());
			}
			else if(employeeMapper.findByUserId(adminUser.getId())!=null) {
				Employee employee=employeeMapper.findByUserId(adminUser.getId());
				detail.setAdminName(employee.getName());
			}
		}
		return introDetail;
	}
	public IntroDetail findOneIntroDetail(int id) {
		return introDetailMapper.findOne(id);
	}
	public IntroTitle findOneIntroTitle(int id) {
		return introTitleMapper.findOne(id);
	}
	public void insertDetail(int titleId, IntroDetail introDetail) {
		Authentication authentication=SecurityContextHolder.getContext().getAuthentication();
		String userNumber=authentication.getName();
		if(studentMapper.findOne(userNumber)!=null) {
			Student student=studentMapper.findOne(userNumber);
			Admin admin=adminMapper.findByUserId(student.getUserId());
			introDetail.setManageId(admin.getId());
		}
		else if(professorMapper.findOne(userNumber)!=null) {
			Professor professor=professorMapper.findOne(userNumber);
			Admin admin=adminMapper.findByUserId(professor.getUserId());
			introDetail.setManageId(admin.getId());
		}
		else if(employeeMapper.findOne(userNumber)!=null) {
			Employee employee=employeeMapper.findOne(userNumber);
			Admin admin=adminMapper.findByUserId(employee.getUserId());
			introDetail.setManageId(admin.getId());
		}
		introDetail.setTitleId(titleId);
		introDetailMapper.insert(introDetail);
	}
	public void updateDetail(IntroDetail introDetail) {
		Authentication authentication=SecurityContextHolder.getContext().getAuthentication();
		String userNumber=authentication.getName();
		if(studentMapper.findOne(userNumber)!=null) {
			Student student=studentMapper.findOne(userNumber);
			Admin admin=adminMapper.findByUserId(student.getUserId());
			introDetail.setManageId(admin.getId());
		}
		else if(professorMapper.findOne(userNumber)!=null) {
			Professor professor=professorMapper.findOne(userNumber);
			Admin admin=adminMapper.findByUserId(professor.getUserId());
			introDetail.setManageId(admin.getId());
		}
		else if(employeeMapper.findOne(userNumber)!=null) {
			Employee employee=employeeMapper.findOne(userNumber);
			Admin admin=adminMapper.findByUserId(employee.getUserId());
			introDetail.setManageId(admin.getId());
		}
		introDetailMapper.update(introDetail);
	}
	public void deleteDetail(int id) {
		introDetailMapper.delete(id);
	}
	public void deleteTitle(int id) {
		introDetailMapper.deleteByTitleId(id);
		introTitleMapper.delete(id);
	}
}
