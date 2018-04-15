# 소프트웨어공학과 멘토링 시스템 (SKHU Mentoring System)
**성공회대 한솥밥 SM 멘토링을 위한 서비스**
1. 게시판을 통한 소통의 장 - 공지사항, 참여마당, 멘토링 게시판의 댓글, 파일 등록 등을 이용해서 멘토링에 대한 다양한 정보를 소통할 수 있도록 제공하였음.
2. 용지 절약을 위한 보고서 제공 - A4용지 절약을 위하여 웹 페이지 상에서 교수와 학생이 보고서를 서로 확인하여 자원 낭비를 최소한으로 줄일 수 있도록 Excel, Word 파일로 제공을 하였음.
3. 개성을 위한 프로필 제공 - 프로필 사진을 이용한 소셜 네트워크 서비스를 접목하여 멘토와 멘티들의 Identity를 확실하게 제공을 하였음.
4. 다양한 멘토링 구성원들의 경험 공유 - 멘토링 경험이 있는 학우들의 이야기와 노하우를 통해 차후에 멘토링을 진행할 때 더욱 즐거운 멘토링으로 도약할 수 있도록 제공하였음.

## Team Motivation
- 201332001 강인성([tails5555](https://github.com/tails5555)) - Back-End 구상 및 아이디어 추출
- 201332028 장승훈([wkdtndgns](https://github.com/wkdtndgns)) - Front-End 구상 및 Back-End 아이디어 제공
- 201332031 전현우([hyunwoo5906](https://github.com/hyunwoo5906)) - Front-End 담당 및 AWS 서버 등록

## Create Schedule
![motivation_schedule](/src/docs/img/motivation_schedule.jpg "motivation_schedule")

## RDBMS Sturcture
![motivation_rdbms_physical](/src/docs/img/motivation_rdbms_physical.png "motivation_rdbms_physical")

## Easy Looking Structure
![motivation_easy_structure](/src/docs/img/motivation_structure.png "motivation_easy_structure")

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

## Plus Schedule
멘토링 프로젝트에 대한 추가적 계획은 다음과 같습니다.

- RDBMS에 대한 접목을 `MyBatis`에서 `Hibernate JPA`로 교체할 예정.
- JSP 환경 이내에서 작업하는 범위에서 각 테이블 별 **단위 테스팅** 진행을 추가할 예정.
- Spring Boot에서 `Vue.js` or `ReactJS`를 가동할 수 있는 방안에 대해 구상하고 접목시킬 예정.
- AWS EC2, AWS S3, AWS RDS에 추후에 정리를 해서 배포를 하는 방법을 구상할 예정.

유지보수 기간에 **MentoringProject2 Repository를 추가**로 만들어서 저장을 하겠습니다.

## Awards
1. 데이터베이스 캡스톤 디자인 과목 **전원 A+**
2. 제 10 회 소프트웨어 경진대회 지정주제 **1등**