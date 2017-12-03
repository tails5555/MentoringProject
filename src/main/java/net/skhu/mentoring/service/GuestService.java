package net.skhu.mentoring.service;
import java.util.List;
import java.util.Properties;
import java.util.*;
import javax.mail.Transport;
import javax.mail.*;
import javax.mail.Message;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.InternetAddress;
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
public class GuestService {
	@Autowired IntroTitleMapper introTitleMapper;
	@Autowired IntroDetailMapper introDetailMapper;
	@Autowired AdminMapper adminMapper;
	@Autowired UserMapper userMapper;
	@Autowired StudentMapper studentMapper;
	@Autowired ProfessorMapper professorMapper;
	@Autowired EmployeeMapper employeeMapper;
	

		public void sendEamil() {
			// 네이버일 경우 smtp.naver.com 을 입력합니다. // Google일 경우 smtp.gmail.com 을 입력합니다.
			String host = "smtp.naver.com"; 
			final String username = "11111"; //네이버 아이디를 입력해주세요. @nave.com은 입력하지 마시구요.
			final String password = "1111"; //네이버 이메일 비밀번호를 입력해주세요.
			int port=465; //포트번호 
			// 메일 내용
			
			String recipient = "wkdtndgns@naver.com";
			//받는 사람의 메일주소를 입력해주세요. 
			String subject = "메일테스트"; //메일 제목 입력해주세요.
			String body = username+"님으로 부터 메일을 받았습니다."; 
			//메일 내용 입력해주세요. 
			
			try {
			Properties props = System.getProperties(); 
			// 정보를 담기 위한 객체 생성 
			// SMTP 서버 정보 설정
			props.put("mail.smtp.host", host);
			props.put("mail.smtp.port", port); 
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.ssl.enable", "true");
			props.put("mail.smtp.ssl.trust", host); //Session 생성 
			Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator()
			{ String un=username; String pw=password; protected javax.mail.PasswordAuthentication getPasswordAuthentication() 
			{ return new javax.mail.PasswordAuthentication(un, pw); } }); session.setDebug(true); //for debug
			Message mimeMessage = new MimeMessage(session); //MimeMessage 생성 
			mimeMessage.setFrom(new InternetAddress("wkdtndgns@naver.com")); //발신자 셋팅 , 보내는 사람의 이메일주소를 한번 더 입력합니다.이때는 이메일 풀 주소를 다 작성해주세요. 
			mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); //수신자셋팅 //.TO 외에 .CC(참조) .BCC(숨은참조) 도 있음
			mimeMessage.setSubject(subject); //제목셋팅
			mimeMessage.setText(body); //내용셋팅 
			Transport.send(mimeMessage);
			//javax.mail.Transport.send() 이용
			}
			
			catch(MessagingException e) {
				e.printStackTrace();
			}

		}
}
