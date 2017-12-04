package net.skhu.mentoring.service;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.skhu.mentoring.mapper.AdminMapper;
import net.skhu.mentoring.mapper.EmployeeMapper;
import net.skhu.mentoring.mapper.IntroDetailMapper;
import net.skhu.mentoring.mapper.IntroTitleMapper;
import net.skhu.mentoring.mapper.ProfessorMapper;
import net.skhu.mentoring.mapper.StudentMapper;
import net.skhu.mentoring.mapper.UserMapper;
import net.skhu.mentoring.utils.Encryption;


@Service
public class GuestService {
	@Autowired IntroTitleMapper introTitleMapper;
	@Autowired IntroDetailMapper introDetailMapper;
	@Autowired AdminMapper adminMapper;
	@Autowired UserMapper userMapper;
	@Autowired StudentMapper studentMapper;
	@Autowired ProfessorMapper professorMapper;
	@Autowired EmployeeMapper employeeMapper;

	static String save =null;


		public void sendEamil(String email) throws IOException {
			// 네이버일 경우 smtp.naver.com 을 입력합니다. // Google일 경우 smtp.gmail.com 을 입력합니다.
			Properties mailAdmistrator=new Properties();
			String path = GuestService.class.getResource("").getPath();
			FileInputStream fis=new FileInputStream(path+"mailAdmistrator.properties");
			mailAdmistrator.load(fis);
			String host = mailAdmistrator.getProperty("host");
			final String username = mailAdmistrator.getProperty("username");
			final String password = mailAdmistrator.getProperty("password");
			int port= Integer.valueOf(mailAdmistrator.getProperty("port")); //포트번호
			// 메일 내용
			System.out.println(host+" "+username+" "+password+" "+port);
			save=getRamdomPassword(10);

			String recipient = email;
			//받는 사람의 메일주소를 입력해주세요.
			String subject = "인증 번호 발송 "; //메일 제목 입력해주세요.
			String body = "관리자로 부터 메일을 받았습니다. "
					+ "	     인증 번호는: "+ save;
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
			{ String un=username; String pw=password; @Override
			protected javax.mail.PasswordAuthentication getPasswordAuthentication()
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
			}finally {
				fis.close();
			}

		}

		public boolean check(String s) {


			String s1=Encryption.encrypt(save, Encryption.MD5);
			String s2=Encryption.encrypt(s, Encryption.MD5);
			if(s1.equals(s2)) {
				return true;

			}

			return false;


		}


		public static String getRamdomPassword(int len) {
			char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };
			int idx = 0; StringBuffer sb = new StringBuffer();
			System.out.println("charSet.length :::: "+charSet.length);
			for (int i = 0; i < len; i++) { idx = (int) (charSet.length * Math.random()); // 36 * 생성된 난수를 Int로 추출 (소숫점제거)
			System.out.println("idx :::: "+idx); sb.append(charSet[idx]); }
			return sb.toString(); }

		}







