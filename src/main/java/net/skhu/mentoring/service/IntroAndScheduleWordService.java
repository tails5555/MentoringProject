package net.skhu.mentoring.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.poi.xwpf.usermodel.ParagraphAlignment;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;
import org.apache.poi.xwpf.usermodel.XWPFRun;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.skhu.mentoring.dto.IntroDetail;
import net.skhu.mentoring.dto.IntroTitle;
import net.skhu.mentoring.dto.Schedule;
import net.skhu.mentoring.mapper.IntroDetailMapper;
import net.skhu.mentoring.mapper.IntroTitleMapper;
import net.skhu.mentoring.mapper.ScheduleMapper;

@Service
public class IntroAndScheduleWordService {
	@Autowired IntroTitleMapper introTitleMapper;
	@Autowired IntroDetailMapper introDetailMapper;
	@Autowired ScheduleMapper scheduleMapper;
	
	public XWPFDocument getWordFile() {
		XWPFDocument newDocument=new XWPFDocument();
		XWPFParagraph titleParagraph=newDocument.createParagraph();
		titleParagraph.setAlignment(ParagraphAlignment.CENTER);
		titleParagraph.setSpacingAfterLines(1);
		XWPFRun currentRun=titleParagraph.createRun();
		currentRun.setBold(true);
		currentRun.setFontFamily("맑은 고딕");
		currentRun.setFontSize(20);
		currentRun.setText("SKHU Mentoring 사업 소개와 일정 안내");
		
		SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
		XWPFParagraph dateParagraph=newDocument.createParagraph();
		dateParagraph.setAlignment(ParagraphAlignment.RIGHT);
		dateParagraph.setSpacingAfterLines(1);
		XWPFRun dateRun=dateParagraph.createRun();
		dateRun.setFontFamily("맑은 고딕");
		dateRun.setFontSize(12);
		dateRun.setText(String.format("다운로드 날짜 : %s", dateFormat.format(new Date())));
		
		XWPFParagraph introTitleParagraph=newDocument.createParagraph();
		introTitleParagraph.setAlignment(ParagraphAlignment.CENTER);
		introTitleParagraph.setSpacingAfterLines(1);
		XWPFRun introTitleRun=introTitleParagraph.createRun();
		introTitleRun.setBold(true);
		introTitleRun.setFontFamily("맑은 고딕");
		introTitleRun.setFontSize(16);
		introTitleRun.setText("사업 소개문");
		
		List<IntroTitle> titles=introTitleMapper.findAll();
		for (IntroTitle title : titles) {
			XWPFParagraph introMainParagraph=newDocument.createParagraph();
			introMainParagraph.setAlignment(ParagraphAlignment.LEFT);
			introMainParagraph.setSpacingAfterLines(1);
			XWPFRun introMainRun=introMainParagraph.createRun();
			introMainRun.setBold(true);
			introMainRun.setFontFamily("맑은 고딕");
			introMainRun.setFontSize(12);
			introMainRun.setText(title.getTitle());
            List<IntroDetail> details = introDetailMapper.findAllWithTitle(title.getId());
            for(IntroDetail detail : details) {
            	XWPFParagraph introDetailParagraph=newDocument.createParagraph();
            	introDetailParagraph.setAlignment(ParagraphAlignment.LEFT);
            	introDetailParagraph.setSpacingAfterLines(1);
            	XWPFRun introDetailRun=introDetailParagraph.createRun();
            	introDetailRun.setFontFamily("맑은 고딕");
            	introDetailRun.setFontSize(10);
            	introDetailRun.setText(String.format("◆ %s", detail.getDetail()));
            }
        }
		
		XWPFParagraph scheduleTitleParagraph=newDocument.createParagraph();
		scheduleTitleParagraph.setAlignment(ParagraphAlignment.CENTER);
		scheduleTitleParagraph.setSpacingAfterLines(1);
		XWPFRun scheduleTitleRun=scheduleTitleParagraph.createRun();
		scheduleTitleRun.setBold(true);
		scheduleTitleRun.setFontFamily("맑은 고딕");
		scheduleTitleRun.setFontSize(16);
		scheduleTitleRun.setText("일정 안내");
		
		List<Schedule> allSchedule=scheduleMapper.findAll();
		for(Schedule s : allSchedule) {
			XWPFParagraph scheduleMainParagraph=newDocument.createParagraph();
			scheduleMainParagraph.setAlignment(ParagraphAlignment.CENTER);
			scheduleMainParagraph.setSpacingAfterLines(1);
			XWPFRun scheduleMainRun=scheduleMainParagraph.createRun();
			scheduleMainRun.setBold(true);
			scheduleMainRun.setFontFamily("맑은 고딕");
			scheduleMainRun.setFontSize(12);
			scheduleMainRun.setText(s.getContext());
			
			XWPFParagraph scheduleDateParagraph=newDocument.createParagraph();
			scheduleDateParagraph.setAlignment(ParagraphAlignment.CENTER);
			scheduleDateParagraph.setSpacingAfterLines(1);
			XWPFRun scheduleDateRun=scheduleDateParagraph.createRun();
			scheduleDateRun.setFontFamily("맑은 고딕");
			scheduleDateRun.setFontSize(10);
			scheduleDateRun.setText(String.format("%s 일부터  %s 일까지.", dateFormat.format(s.getStartDate()), dateFormat.format(s.getEndDate())));
		}
		
		XWPFParagraph scheduleContextParagraph=newDocument.createParagraph();
		scheduleContextParagraph.setAlignment(ParagraphAlignment.LEFT);
		scheduleContextParagraph.setSpacingAfterLines(1);
		XWPFRun scheduleContextRun=scheduleContextParagraph.createRun();
		scheduleContextRun.setBold(true);
		scheduleContextRun.setFontFamily("맑은 고딕");
		scheduleContextRun.setFontSize(10);
		scheduleContextRun.addBreak();
		scheduleContextRun.setText("- 기본적으로 12회 멘토링을 하는데 누적 24시간 이수해야 합니다.");
		scheduleContextRun.addBreak();
		scheduleContextRun.setText("- 여건이 안 된다면 횟수는 제한 없이 24시간 이수해도 상관 없습니다.");
		scheduleContextRun.addBreak();
		scheduleContextRun.setText("- 멘토링 인원은 5명이 기본이지만, 최소 3명부터 최대 10명까지 가능합니다.");
		scheduleContextRun.addBreak();
		scheduleContextRun.setText("- 멘토링 이수 시간이 24시간 초과되면 우수 멘토링 대상에서 제외되오니 일정 조정을 최대한 맞추시길 바라겠습니다.");
		scheduleContextRun.addBreak();
		scheduleContextRun.setText("- 사업 안내문과 일정은 학기 별로 바뀔 수 있으니 참고하시길 바랍니다.");
		return newDocument;
	}
}
