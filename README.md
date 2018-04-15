# 소프트웨어공학과 멘토링 시스템 (SKHU Mentoring System)
**성공회대 한솥밥 SM 멘토링을 위한 서비스**
1. 게시판을 통한 소통의 장 - 공지사항, 참여마당, 멘토링 게시판의 댓글, 파일 등록 등을 이용해서 멘토링에 대한 다양한 정보를 소통할 수 있도록 제공하였습니다.
2. 용지 절약을 위한 보고서 제공 - A4용지 절약을 위하여 웹 페이지 상에서 교수와 학생이 보고서를 서로 확인하여 자원 낭비를 최소한으로 줄일 수 있도록 Excel, Word 파일로 제공하였습니다.
3. 개성을 위한 프로필 제공 - 프로필 사진을 이용한 소셜 네트워크 서비스를 접목하여 멘토와 멘티들의 Identity를 확실하게 제공하였습니다.
4. 다양한 멘토링 구성원들의 경험 공유 - 멘토링 경험이 있는 학우들의 이야기와 노하우를 통해 차후에 멘토링을 진행할 때 더욱 즐거운 멘토링으로 도약할 수 있도록  제공하였습니다.

[배포된 클라이언트에 접속하기](http://13.125.242.214:8080/)

## Team Motivation
- 201332001 강인성([tails5555](https://github.com/tails5555)) - Back-End 구상 및 아이디어 추출
- 201332028 장승훈([wkdtndgns](https://github.com/wkdtndgns)) - Front-End 구상 및 Back-End 아이디어 제공
- 201332031 전현우([hyunwoo5906](https://github.com/hyunwoo5906)) - Front-End 담당 및 AWS 서버 등록

## Create Schedule
![motivation_schedule](/src/docs/img/motivation_schedule.jpg "motivation_schedule")

## RDBMS Sturcture
![motivation_rdbms_physical](/src/docs/img/motivation_rdbms_physical.png "motivation_rdbms_physical")

## Easy Looking Structure
![motivation_easy_structure](/src/docs/img/motivation_easy_structure.png "motivation_easy_structure")

## With User Structure
![motivation_structure](/src/docs/img/motivation_structure.png "motivation_structure")

## Libraries & Framework
`pom.xml` 를 기반으로 Maven Dependency를 구성하여 Update Maven은 필수입니다.

```
<dependencies>
	<!-- 1. Spring Boot Starter -->
	<dependency>
		<groupId>org.mybatis.spring.boot</groupId>
		<artifactId>mybatis-spring-boot-starter</artifactId>
		<version>1.3.0</version>
	</dependency>
	<!-- 2. Spring Boot Security -->
	<dependency>
		<groupId>org.springframework.boot</groupId>
		<artifactId>spring-boot-starter-security</artifactId>
	</dependency>
	<!-- 3. Spring Web MVC Starter -->
	<dependency>
		<groupId>org.springframework.boot</groupId>
		<artifactId>spring-boot-starter-web</artifactId>
	</dependency>
	<!-- 4. Lombok Project -->
	<dependency>
		<groupId>org.projectlombok</groupId>
		<artifactId>lombok</artifactId>
		<optional>true</optional>
	</dependency>
	<!-- 5. MySQL JDBC Connection -->
	<dependency>
		<groupId>mysql</groupId>
		<artifactId>mysql-connector-java</artifactId>
		<scope>runtime</scope>
	</dependency>
	<!-- 6. Tomcat Starter -->
	<dependency>
		<groupId>org.springframework.boot</groupId>
		<artifactId>spring-boot-starter-tomcat</artifactId>
		<scope>provided</scope>
	</dependency>
	<!-- 7. Spring Boot Test -->
	<dependency>
		<groupId>org.springframework.boot</groupId>
		<artifactId>spring-boot-starter-test</artifactId>
		<scope>test</scope>
	</dependency>
	<!-- 8. Spring Security Test -->
	<dependency>
		<groupId>org.springframework.security</groupId>
		<artifactId>spring-security-test</artifactId>
		<scope>test</scope>
	</dependency>
	<!-- 9. Spring Security Tag Libraries -->
	<dependency>
		<groupId>org.springframework.security</groupId>
		<artifactId>spring-security-taglibs</artifactId>
	</dependency>
	<!-- 10. JSP JSTL -->
		<dependency>
		<groupId>javax.servlet</groupId>
		<artifactId>jstl</artifactId>
	</dependency>
	<!-- 11. JavaX Mail -->
	<dependency> 
		<groupId>javax.mail</groupId> 
		<artifactId>mail</artifactId> 	
		<version>1.4.7</version> 
	</dependency>
	<!-- 12. Apache POI -->
	<dependency>
		<groupId>org.apache.poi</groupId> 
		<artifactId>poi-ooxml</artifactId>
		<version>3.17</version>
	</dependency>
</dependencies>
```

그리고 저희가 사용했던 기술은 아래와 같이 그림으로 표현했습니다.

![use_libraries](/src/docs/img/use_libraries.png "use_libraries")

- 빨간색 : 소스코드, 문서 등을 저장한 공간소와 배포 서버 안내.
- 파란색 : Front-End 영역.
- 초록색 : Back-End 영역.

## Plus Schedule
멘토링 프로젝트에 대한 추가적 계획은 다음과 같습니다.

- RDBMS에 대한 접목을 `MyBatis`에서 `Hibernate JPA`로 교체할 예정.
- JSP 환경 이내에서 작업하는 범위에서 각 테이블 별 **단위 테스팅** 진행을 추가할 예정.
- Spring Boot에서 `Vue.js` or `ReactJS`를 가동할 수 있는 방안에 대해 구상하고 접목시킬 예정.
- AWS EC2, AWS S3, AWS RDS에 추후에 정리를 해서 배포를 하는 방법을 구상할 예정.

유지보수 기간에 **MentoringProject2 Repository를 추가**로 만들어서 저장을 하겠습니다.

## Reference Documents
- [프로젝트 진행 일지와 업무 프로세스](https://github.com/tails5555/MentoringProject/blob/master/src/docs/document/Motivation%EC%A1%B0_%EC%97%85%EB%AC%B4_%ED%94%84%EB%A1%9C%EC%84%B8%EC%8A%A4_%EA%B5%AC%ED%98%84_%EC%9D%BC%EC%A7%80_%EC%A0%95%EB%A6%AC.xlsx)
- [경진대회 최종 발표 자료](https://github.com/tails5555/MentoringProject/blob/master/src/docs/document/Motivation%EC%A1%B0_%EC%B5%9C%EC%A2%85%EB%B0%9C%ED%91%9C.pdf)
- [SKHU Mentoring 사용 설명서](https://github.com/tails5555/MentoringProject/blob/master/src/docs/document/SKHUMentoring_%EC%82%AC%EC%9A%A9%EC%84%A4%EB%AA%85%EC%84%9C.pdf)
- [구현 동영상 링크(OneDrive에 고화질로 올려뒀음)](https://1drv.ms/f/s!AkTgE7v16N51gZpceSxXdR17pW_NnA)

## Awards
1. 데이터베이스 캡스톤 디자인 과목 **전원 A+**
2. 성공회대학교 제 10 회 소프트웨어 경진대회 지정주제 **1등**

## Thanks To
- 성공회대 소프트웨어공학과 **홍은지 교수님**
- 성공회대 소프트웨어공학과 **이승진 교수님**
- 멘토링 프로젝트를 같이 진행은 안 했지만 최종 점검에 도움을 준 **서종현 학우**