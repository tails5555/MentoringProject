package net.skhu.mentoring.service;


import java.awt.Color;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.imageio.ImageIO;

import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.ClientAnchor;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Picture;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFColor;
import org.apache.poi.xssf.usermodel.XSSFDrawing;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.skhu.mentoring.dto.ClassPhoto;
import net.skhu.mentoring.dto.Mento;
import net.skhu.mentoring.dto.Report;
import net.skhu.mentoring.dto.Student;
import net.skhu.mentoring.mapper.ClassPhotoMapper;
import net.skhu.mentoring.mapper.MentoMapper;
import net.skhu.mentoring.mapper.ReportMapper;
import net.skhu.mentoring.mapper.StudentMapper;

@Service
public class ReportExcelService {
	@Autowired MentoMapper mentoMapper;
	@Autowired ReportMapper reportMapper;
	@Autowired StudentMapper studentMapper;
	@Autowired ClassPhotoMapper classPhotoMapper;

	private static void createCell(Row row, int column, String valueString, XSSFCellStyle cellStyle, short height) {
        Cell cell = row.createCell(column);
        cell.setCellValue(valueString);
        cell.setCellStyle(cellStyle);
        if(height>0) {
        	row.setHeight(height);
        }
	}
	public XSSFWorkbook getReportMultiWorkbook(int mentoId) throws IOException{
		List<Report> reportList=reportMapper.findByMentoIdASC(mentoId);
		SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat timeFormat=new SimpleDateFormat("a hh:mm");
        XSSFColor titleColor=new XSSFColor(new Color(152,251,152));
		XSSFColor myColor=new XSSFColor(new Color(135,206,250));
		XSSFColor borderColor=new XSSFColor(Color.BLACK);
		XSSFWorkbook workbook=new XSSFWorkbook();
		XSSFCellStyle titleStyle=workbook.createCellStyle();
		XSSFFont font=workbook.createFont();
		font.setFontName("맑은 고딕");
		font.setFontHeightInPoints((short)20);
		titleStyle.setFont(font);
		titleStyle.setAlignment(HorizontalAlignment.CENTER);
		titleStyle.setVerticalAlignment(VerticalAlignment.CENTER);
		titleStyle.setTopBorderColor(borderColor);
		titleStyle.setBorderTop(BorderStyle.THIN);
		titleStyle.setBottomBorderColor(borderColor);
		titleStyle.setBorderBottom(BorderStyle.THIN);
		titleStyle.setLeftBorderColor(borderColor);
		titleStyle.setBorderLeft(BorderStyle.THIN);
		titleStyle.setRightBorderColor(borderColor);
		titleStyle.setBorderRight(BorderStyle.THIN);
		titleStyle.setFillForegroundColor(titleColor);
		titleStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

		XSSFCellStyle entityStyle=workbook.createCellStyle();
		XSSFFont entityFont=workbook.createFont();
		entityFont.setFontName("맑은 고딕");
		entityFont.setFontHeightInPoints((short)11);
		entityStyle.setFont(entityFont);
		entityStyle.setAlignment(HorizontalAlignment.CENTER);
		entityStyle.setTopBorderColor(borderColor);
		entityStyle.setBorderTop(BorderStyle.THIN);
		entityStyle.setBottomBorderColor(borderColor);
		entityStyle.setBorderBottom(BorderStyle.THIN);
		entityStyle.setLeftBorderColor(borderColor);
		entityStyle.setBorderLeft(BorderStyle.THIN);
		entityStyle.setRightBorderColor(borderColor);
		entityStyle.setBorderRight(BorderStyle.THIN);
		entityStyle.setFillForegroundColor(myColor);
		entityStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

		XSSFCellStyle attributeStyle=workbook.createCellStyle();
		XSSFFont attributeFont=workbook.createFont();
		attributeFont.setFontName("맑은 고딕");
		attributeFont.setFontHeightInPoints((short)10);
		attributeStyle.setFont(attributeFont);
		attributeStyle.setAlignment(HorizontalAlignment.CENTER);
		attributeStyle.setVerticalAlignment(VerticalAlignment.TOP);
		attributeStyle.setTopBorderColor(borderColor);
		attributeStyle.setBorderTop(BorderStyle.THIN);
		attributeStyle.setBottomBorderColor(borderColor);
		attributeStyle.setBorderBottom(BorderStyle.THIN);
		attributeStyle.setLeftBorderColor(borderColor);
		attributeStyle.setBorderLeft(BorderStyle.THIN);
		attributeStyle.setRightBorderColor(borderColor);
		attributeStyle.setBorderRight(BorderStyle.THIN);
		attributeStyle.setWrapText(true);
		for(int k=0;k<reportList.size();k++) {
			Report report=reportList.get(k);
			Mento mento=mentoMapper.findOne(report.getMentoId());
			Student student=studentMapper.findByUserId(mento.getUserId());
			ClassPhoto classPhoto=classPhotoMapper.findByReportId(report.getId());
			report.setMentoName(student.getName());
			report.setTeamName(mento.getTeamName());
			report.setMentoSubject(mento.getSubject());
			XSSFSheet sheet=workbook.createSheet(String.format("%d%02d%02d_보고서", report.getClassDate().getYear()+1900, report.getClassDate().getMonth()+1, report.getClassDate().getDate()));

			workbook.getSheetAt(k).setColumnWidth(0, 3452);
			workbook.getSheetAt(k).setColumnWidth(1, 6213);
			workbook.getSheetAt(k).setColumnWidth(2, 3452);
			workbook.getSheetAt(k).setColumnWidth(3, 6213);

			Row row=sheet.createRow(0);
			createCell(row, 0, "멘토링 보고서", titleStyle, (short)480);
			createCell(row, 1, "", titleStyle, (short) 0);
			createCell(row, 2, "", titleStyle, (short) 0);
			createCell(row, 3, "", titleStyle, (short) 0);
			workbook.getSheetAt(k).addMergedRegion(new CellRangeAddress(0, 0, 0, 3));

			row = sheet.createRow(1);
			createCell(row, 0, "멘토 이름", entityStyle, (short)360);
			createCell(row, 1, report.getMentoName(), attributeStyle, (short) 0);
			createCell(row, 2, "제출 일자", entityStyle, (short)0);
			createCell(row, 3, dateFormat.format(report.getPresentDate()), attributeStyle, (short) 0);

			row = sheet.createRow(2);
			createCell(row, 0, "팀 이름", entityStyle, (short)360);
			createCell(row, 1, report.getTeamName(), attributeStyle, (short) 0);
			createCell(row, 2, "진행 장소", entityStyle, (short)0);
			createCell(row, 3, report.getClassPlace(), attributeStyle, (short) 0);

			row = sheet.createRow(3);
			createCell(row, 0, "멘토링 주제", entityStyle, (short)360);
			createCell(row, 1, report.getMentoSubject(), attributeStyle, (short) 0);
			createCell(row, 2, "수업 방식", entityStyle, (short)0);
			createCell(row, 3, report.getClassType(), attributeStyle, (short) 0);

			row = sheet.createRow(4);
			createCell(row, 0, "진행 일자", entityStyle, (short)360);
			createCell(row, 1, report.getClassDate().toString(), attributeStyle, (short) 0);
			createCell(row, 2, "진행 시간", entityStyle, (short)0);
			createCell(row, 3, String.format("%s ~ %s", timeFormat.format(report.getStartTime()), timeFormat.format(report.getEndTime())), attributeStyle, (short) 0);

			row = sheet.createRow(5);
			createCell(row, 0, "결석 인원", entityStyle, (short)360);
			createCell(row, 1, report.getAbsentPerson(), attributeStyle, (short) 0);
			createCell(row, 2, "", attributeStyle, (short) 0);
			createCell(row, 3, "", attributeStyle, (short) 0);
			workbook.getSheetAt(k).addMergedRegion(new CellRangeAddress(5, 5, 1, 3));

			row = sheet.createRow(6);
			createCell(row, 0, "결석 사유", entityStyle, (short)360);
			createCell(row, 1, "", entityStyle, (short) 0);
			createCell(row, 2, "", entityStyle, (short) 0);
			createCell(row, 3, "", entityStyle, (short) 0);
			workbook.getSheetAt(k).addMergedRegion(new CellRangeAddress(6, 6, 0, 3));

			row = sheet.createRow(7);
			createCell(row, 0, report.getAbsentContext(), attributeStyle, (short) 1080);
			createCell(row, 1, "", attributeStyle, (short) 0);
			createCell(row, 2, "", attributeStyle, (short) 0);
			createCell(row, 3, "", attributeStyle, (short) 0);
			workbook.getSheetAt(k).addMergedRegion(new CellRangeAddress(7, 7, 0, 3));

			row = sheet.createRow(8);
			createCell(row, 0, "수업 주제", entityStyle, (short) 360);
			createCell(row, 1, report.getClassSubject(), attributeStyle, (short) 0);
			createCell(row, 2, "", attributeStyle, (short) 0);
			createCell(row, 3, "", attributeStyle, (short) 0);
			workbook.getSheetAt(k).addMergedRegion(new CellRangeAddress(8, 8, 1, 3));

			row = sheet.createRow(9);
			createCell(row, 0, "수업 목표", entityStyle, (short) 360);
			createCell(row, 1, report.getClassTarget(), attributeStyle, (short) 0);
			createCell(row, 2, "", attributeStyle, (short) 0);
			createCell(row, 3, "", attributeStyle, (short) 0);
			workbook.getSheetAt(k).addMergedRegion(new CellRangeAddress(9, 9, 1, 3));

			row = sheet.createRow(10);
			createCell(row, 0, "수업 진행 내용과 소감", entityStyle, (short) 360);
			createCell(row, 1, "", entityStyle, (short) 0);
			createCell(row, 2, "", entityStyle, (short) 0);
			createCell(row, 3, "", entityStyle, (short) 0);
			workbook.getSheetAt(k).addMergedRegion(new CellRangeAddress(10, 10, 0, 3));

			row = sheet.createRow(11);
			createCell(row, 0, report.getClassImplass(), attributeStyle, (short) 2160);
			createCell(row, 1, "", attributeStyle, (short) 0);
			createCell(row, 2, "", attributeStyle, (short) 0);
			createCell(row, 3, "", attributeStyle, (short) 0);
			workbook.getSheetAt(k).addMergedRegion(new CellRangeAddress(11, 11, 0, 3));

			row = sheet.createRow(12);
			createCell(row, 0, "멘토링 인증 사진", entityStyle, (short) 360);
			createCell(row, 1, "", entityStyle, (short) 0);
			createCell(row, 2, "", entityStyle, (short) 0);
			createCell(row, 3, "", entityStyle, (short) 0);
			workbook.getSheetAt(k).addMergedRegion(new CellRangeAddress(12, 12, 0, 3));

			InputStream inputImage=new ByteArrayInputStream(classPhoto.getData());
			BufferedImage uploadImage=ImageIO.read(inputImage);
	        int infix=classPhoto.getFileName().lastIndexOf('.');
	        String ext = classPhoto.getFileName().substring( infix + 1 );
	        ByteArrayOutputStream baos = new ByteArrayOutputStream();
	        if(!ext.equals("png")){
	        	ImageIO.write(uploadImage, "png", baos);
	        }else {
	        	baos.write(classPhoto.getData());
	        }
			byte[] bytes=baos.toByteArray();
			int pictureIdx = workbook.addPicture(bytes, Workbook.PICTURE_TYPE_PNG);
			inputImage.close();
			double imageHeight=756*uploadImage.getHeight()/uploadImage.getWidth()/29;

			for(short a=13;a<13+(short)imageHeight;a++) {
				row = sheet.createRow(a);
			    createCell(row, 0, "", attributeStyle, (short) 354);
				createCell(row, 1, "", attributeStyle, (short) 0);
				createCell(row, 2, "", attributeStyle, (short) 0);
				createCell(row, 3, "", attributeStyle, (short) 0);
			}
			CreationHelper helper = workbook.getCreationHelper();
			XSSFDrawing drawing = sheet.createDrawingPatriarch();
		    ClientAnchor anchor = helper.createClientAnchor();
		    anchor.setRow1(13);
		    anchor.setCol1(0);
		    anchor.setRow2(13+(short)imageHeight);
		    anchor.setCol2(4);
		    final Picture pict=drawing.createPicture(anchor, pictureIdx);
			workbook.getSheetAt(k).addMergedRegion(new CellRangeAddress(13, 13+(short)imageHeight-1, 0, 3));
			pict.resize(1);
		}
		return workbook;
	}
	public XSSFWorkbook getReportSingleWorkbook(int id) throws IOException {
		Report report=reportMapper.findOne(id);
		Mento mento=mentoMapper.findOne(report.getMentoId());
		Student student=studentMapper.findByUserId(mento.getUserId());
		ClassPhoto classPhoto=classPhotoMapper.findByReportId(id);
		report.setMentoName(student.getName());
		report.setTeamName(mento.getTeamName());
		report.setMentoSubject(mento.getSubject());

		SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat timeFormat=new SimpleDateFormat("a hh:mm");

		XSSFWorkbook workbook=new XSSFWorkbook();
		XSSFSheet sheet=workbook.createSheet(String.format("%d%02d%02d_보고서", report.getClassDate().getYear()+1900, report.getClassDate().getMonth()+1, report.getClassDate().getDate()));

		workbook.getSheetAt(0).setColumnWidth(0, 3452);
		workbook.getSheetAt(0).setColumnWidth(1, 6213);
		workbook.getSheetAt(0).setColumnWidth(2, 3452);
		workbook.getSheetAt(0).setColumnWidth(3, 6213);

		XSSFColor titleColor=new XSSFColor(new Color(152,251,152));
		XSSFColor myColor=new XSSFColor(new Color(135,206,250));
		XSSFColor borderColor=new XSSFColor(Color.BLACK);

		XSSFCellStyle titleStyle=workbook.createCellStyle();
		XSSFFont font=workbook.createFont();
		font.setFontName("맑은 고딕");
		font.setFontHeightInPoints((short)20);
		titleStyle.setFont(font);
		titleStyle.setAlignment(HorizontalAlignment.CENTER);
		titleStyle.setVerticalAlignment(VerticalAlignment.CENTER);
		titleStyle.setTopBorderColor(borderColor);
		titleStyle.setBorderTop(BorderStyle.THIN);
		titleStyle.setBottomBorderColor(borderColor);
		titleStyle.setBorderBottom(BorderStyle.THIN);
		titleStyle.setLeftBorderColor(borderColor);
		titleStyle.setBorderLeft(BorderStyle.THIN);
		titleStyle.setRightBorderColor(borderColor);
		titleStyle.setBorderRight(BorderStyle.THIN);
		titleStyle.setFillForegroundColor(titleColor);
		titleStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

		XSSFCellStyle entityStyle=workbook.createCellStyle();
		XSSFFont entityFont=workbook.createFont();
		entityFont.setFontName("맑은 고딕");
		entityFont.setFontHeightInPoints((short)11);
		entityStyle.setFont(entityFont);
		entityStyle.setAlignment(HorizontalAlignment.CENTER);
		entityStyle.setTopBorderColor(borderColor);
		entityStyle.setBorderTop(BorderStyle.THIN);
		entityStyle.setBottomBorderColor(borderColor);
		entityStyle.setBorderBottom(BorderStyle.THIN);
		entityStyle.setLeftBorderColor(borderColor);
		entityStyle.setBorderLeft(BorderStyle.THIN);
		entityStyle.setRightBorderColor(borderColor);
		entityStyle.setBorderRight(BorderStyle.THIN);
		entityStyle.setFillForegroundColor(myColor);
		entityStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

		XSSFCellStyle attributeStyle=workbook.createCellStyle();
		XSSFFont attributeFont=workbook.createFont();
		attributeFont.setFontName("맑은 고딕");
		attributeFont.setFontHeightInPoints((short)10);
		attributeStyle.setFont(attributeFont);
		attributeStyle.setAlignment(HorizontalAlignment.CENTER);
		attributeStyle.setVerticalAlignment(VerticalAlignment.TOP);
		attributeStyle.setTopBorderColor(borderColor);
		attributeStyle.setBorderTop(BorderStyle.THIN);
		attributeStyle.setBottomBorderColor(borderColor);
		attributeStyle.setBorderBottom(BorderStyle.THIN);
		attributeStyle.setLeftBorderColor(borderColor);
		attributeStyle.setBorderLeft(BorderStyle.THIN);
		attributeStyle.setRightBorderColor(borderColor);
		attributeStyle.setBorderRight(BorderStyle.THIN);
		attributeStyle.setWrapText(true);

		Row row=sheet.createRow(0);
		createCell(row, 0, "멘토링 보고서", titleStyle, (short)480);
		createCell(row, 1, "", titleStyle, (short) 0);
		createCell(row, 2, "", titleStyle, (short) 0);
		createCell(row, 3, "", titleStyle, (short) 0);
		workbook.getSheetAt(0).addMergedRegion(new CellRangeAddress(0, 0, 0, 3));

		row = sheet.createRow(1);
		createCell(row, 0, "멘토 이름", entityStyle, (short)360);
		createCell(row, 1, report.getMentoName(), attributeStyle, (short) 0);
		createCell(row, 2, "제출 일자", entityStyle, (short)0);
		createCell(row, 3, dateFormat.format(report.getPresentDate()), attributeStyle, (short) 0);

		row = sheet.createRow(2);
		createCell(row, 0, "팀 이름", entityStyle, (short)360);
		createCell(row, 1, report.getTeamName(), attributeStyle, (short) 0);
		createCell(row, 2, "진행 장소", entityStyle, (short)0);
		createCell(row, 3, report.getClassPlace(), attributeStyle, (short) 0);

		row = sheet.createRow(3);
		createCell(row, 0, "멘토링 주제", entityStyle, (short)360);
		createCell(row, 1, report.getMentoSubject(), attributeStyle, (short) 0);
		createCell(row, 2, "수업 방식", entityStyle, (short)0);
		createCell(row, 3, report.getClassType(), attributeStyle, (short) 0);

		row = sheet.createRow(4);
		createCell(row, 0, "진행 일자", entityStyle, (short)360);
		createCell(row, 1, report.getClassDate().toString(), attributeStyle, (short) 0);
		createCell(row, 2, "진행 시간", entityStyle, (short)0);
		createCell(row, 3, String.format("%s ~ %s", timeFormat.format(report.getStartTime()), timeFormat.format(report.getEndTime())), attributeStyle, (short) 0);

		row = sheet.createRow(5);
		createCell(row, 0, "결석 인원", entityStyle, (short)360);
		createCell(row, 1, report.getAbsentPerson(), attributeStyle, (short) 0);
		createCell(row, 2, "", attributeStyle, (short) 0);
		createCell(row, 3, "", attributeStyle, (short) 0);
		workbook.getSheetAt(0).addMergedRegion(new CellRangeAddress(5, 5, 1, 3));

		row = sheet.createRow(6);
		createCell(row, 0, "결석 사유", entityStyle, (short)360);
		createCell(row, 1, "", entityStyle, (short) 0);
		createCell(row, 2, "", entityStyle, (short) 0);
		createCell(row, 3, "", entityStyle, (short) 0);
		workbook.getSheetAt(0).addMergedRegion(new CellRangeAddress(6, 6, 0, 3));

		row = sheet.createRow(7);
		createCell(row, 0, report.getAbsentContext(), attributeStyle, (short) 1080);
		createCell(row, 1, "", attributeStyle, (short) 0);
		createCell(row, 2, "", attributeStyle, (short) 0);
		createCell(row, 3, "", attributeStyle, (short) 0);
		workbook.getSheetAt(0).addMergedRegion(new CellRangeAddress(7, 7, 0, 3));

		row = sheet.createRow(8);
		createCell(row, 0, "수업 주제", entityStyle, (short) 360);
		createCell(row, 1, report.getClassSubject(), attributeStyle, (short) 0);
		createCell(row, 2, "", attributeStyle, (short) 0);
		createCell(row, 3, "", attributeStyle, (short) 0);
		workbook.getSheetAt(0).addMergedRegion(new CellRangeAddress(8, 8, 1, 3));

		row = sheet.createRow(9);
		createCell(row, 0, "수업 목표", entityStyle, (short) 360);
		createCell(row, 1, report.getClassTarget(), attributeStyle, (short) 0);
		createCell(row, 2, "", attributeStyle, (short) 0);
		createCell(row, 3, "", attributeStyle, (short) 0);
		workbook.getSheetAt(0).addMergedRegion(new CellRangeAddress(9, 9, 1, 3));

		row = sheet.createRow(10);
		createCell(row, 0, "수업 진행 내용과 소감", entityStyle, (short) 360);
		createCell(row, 1, "", entityStyle, (short) 0);
		createCell(row, 2, "", entityStyle, (short) 0);
		createCell(row, 3, "", entityStyle, (short) 0);
		workbook.getSheetAt(0).addMergedRegion(new CellRangeAddress(10, 10, 0, 3));

		row = sheet.createRow(11);
		createCell(row, 0, report.getClassImplass(), attributeStyle, (short) 2160);
		createCell(row, 1, "", attributeStyle, (short) 0);
		createCell(row, 2, "", attributeStyle, (short) 0);
		createCell(row, 3, "", attributeStyle, (short) 0);
		workbook.getSheetAt(0).addMergedRegion(new CellRangeAddress(11, 11, 0, 3));

		row = sheet.createRow(12);
		createCell(row, 0, "멘토링 인증 사진", entityStyle, (short) 360);
		createCell(row, 1, "", entityStyle, (short) 0);
		createCell(row, 2, "", entityStyle, (short) 0);
		createCell(row, 3, "", entityStyle, (short) 0);
		workbook.getSheetAt(0).addMergedRegion(new CellRangeAddress(12, 12, 0, 3));


		InputStream inputImage=new ByteArrayInputStream(classPhoto.getData());
		BufferedImage uploadImage=ImageIO.read(inputImage);
        int infix=classPhoto.getFileName().lastIndexOf('.');
        String ext = classPhoto.getFileName().substring( infix + 1 );
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        if(!ext.equals("png")){
        	ImageIO.write(uploadImage, "png", baos);
        }else {
        	baos.write(classPhoto.getData());
        }
		byte[] bytes=baos.toByteArray();
		int pictureIdx = workbook.addPicture(bytes, Workbook.PICTURE_TYPE_PNG);
		inputImage.close();
		double imageHeight=756*uploadImage.getHeight()/uploadImage.getWidth()/29;

		for(short k=13;k<13+(short)imageHeight;k++) {
			row = sheet.createRow(k);
		    createCell(row, 0, "", attributeStyle, (short) 354);
			createCell(row, 1, "", attributeStyle, (short) 0);
			createCell(row, 2, "", attributeStyle, (short) 0);
			createCell(row, 3, "", attributeStyle, (short) 0);
		}
		CreationHelper helper = workbook.getCreationHelper();
		XSSFDrawing drawing = sheet.createDrawingPatriarch();
	    ClientAnchor anchor = helper.createClientAnchor();
	    anchor.setRow1(13);
	    anchor.setCol1(0);
	    anchor.setRow2(13+(short)imageHeight);
	    anchor.setCol2(4);
	    final Picture pict=drawing.createPicture(anchor, pictureIdx);
		workbook.getSheetAt(0).addMergedRegion(new CellRangeAddress(13, 13+(short)imageHeight-1, 0, 3));
		pict.resize(1);
		return workbook;
	}
}

