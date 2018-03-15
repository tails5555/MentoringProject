package net.skhu.mentoring.service;

import java.awt.Color;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.util.List;

import org.apache.poi.EncryptedDocumentException;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.xssf.extractor.XSSFExcelExtractor;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFColor;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.skhu.mentoring.dto.Department;
import net.skhu.mentoring.dto.Student;
import net.skhu.mentoring.dto.User;
import net.skhu.mentoring.mapper.DepartmentMapper;
import net.skhu.mentoring.mapper.StudentMapper;
import net.skhu.mentoring.mapper.UserMapper;
import net.skhu.mentoring.utils.Encryption;

@Service
public class PrimaryExcelUploadService {
	@Autowired UserMapper userMapper;
	@Autowired DepartmentMapper departmentMapper;
	@Autowired StudentMapper studentMapper;
	public void excelUpload(InputStream is) throws EncryptedDocumentException, InvalidFormatException, IOException {
		XSSFWorkbook workbook=new XSSFWorkbook(is);
		XSSFExcelExtractor extractor=new XSSFExcelExtractor(workbook);
		extractor.setFormulasNotResults(false);
		extractor.setIncludeSheetNames(false);
		Sheet sheet=workbook.getSheetAt(0);
		int rowCount=sheet.getPhysicalNumberOfRows();
		for(int k=1;k<rowCount;k++) {
			Row row=sheet.getRow(k);
			if(row.getCell(0)==null) break;
			Student student=new Student();
			User user=new User();
			user.setUserType("멘티");
			Cell cell=row.getCell(0);
			BigDecimal stdNum=new BigDecimal(cell.getNumericCellValue());
			if(studentMapper.findOne(stdNum.toString()) != null) continue;
			else {
				student.setStudentNumber(stdNum.toString());
			}
			cell=row.getCell(1);
			student.setPhoneNumber(cell.getRichStringCellValue().toString());
			user.setPassword(Encryption.encrypt(String.format("a%s", cell.getRichStringCellValue().toString().substring(9, 13)), Encryption.MD5));

			cell=row.getCell(2);
			student.setName(cell.getRichStringCellValue().toString());

			cell=row.getCell(3);
			student.setAddress(cell.getRichStringCellValue().toString());

			cell=row.getCell(4);
			student.setEmail(cell.getRichStringCellValue().toString());

			cell=row.getCell(5);
			BigDecimal depNum=new BigDecimal(cell.getNumericCellValue());
			student.setDepartmentId(depNum.toString());

			userMapper.insert(user);

			student.setUserId(userMapper.findLastUser().getId());
			studentMapper.insert(student);
		}
	}
	public XSSFWorkbook getSampleExcel() {
		XSSFColor myColor=new XSSFColor(new Color(135,206,250));
		XSSFColor borderColor=new XSSFColor(Color.BLACK);
		XSSFWorkbook workbook=new XSSFWorkbook();

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

		XSSFSheet sheet1=workbook.createSheet("학생_등록_목록");
		XSSFSheet sheet2=workbook.createSheet("학과_번호_일람");

		workbook.getSheet("학생_등록_목록").setColumnWidth(0, 256*10);
		workbook.getSheet("학생_등록_목록").setColumnWidth(1, 256*16);
		workbook.getSheet("학생_등록_목록").setColumnWidth(2, 256*8);
		workbook.getSheet("학생_등록_목록").setColumnWidth(3, 256*60);
		workbook.getSheet("학생_등록_목록").setColumnWidth(4, 256*60);
		workbook.getSheet("학생_등록_목록").setColumnWidth(5, 256*7);

		workbook.getSheet("학과_번호_일람").setColumnWidth(0, 256*15);
		workbook.getSheet("학과_번호_일람").setColumnWidth(1, 256*60);

		Row row=sheet1.createRow(0);
		Cell cell = row.createCell(0);
		cell.setCellStyle(entityStyle);
		cell.setCellValue("학번");

		cell = row.createCell(1);
		cell.setCellStyle(entityStyle);
		cell.setCellValue("전화번호");

		cell = row.createCell(2);
		cell.setCellStyle(entityStyle);
		cell.setCellValue("이름");

		cell = row.createCell(3);
		cell.setCellStyle(entityStyle);
		cell.setCellValue("주소");

		cell = row.createCell(4);
		cell.setCellStyle(entityStyle);
		cell.setCellValue("E-Mail");

		cell = row.createCell(5);
		cell.setCellStyle(entityStyle);
		cell.setCellValue("학과코드");

		for(int k=1;k<=10;k++) {
			row=sheet1.createRow(k);
			cell = row.createCell(0);
			cell.setCellStyle(attributeStyle);
			cell = row.createCell(1);
			cell.setCellStyle(attributeStyle);
			cell = row.createCell(2);
			cell.setCellStyle(attributeStyle);
			cell = row.createCell(3);
			cell.setCellStyle(attributeStyle);
			cell = row.createCell(4);
			cell.setCellStyle(attributeStyle);
			cell = row.createCell(5);
			cell.setCellStyle(attributeStyle);
		}

		row = sheet2.createRow(0);
		cell = row.createCell(0);
		cell.setCellStyle(entityStyle);
		cell.setCellValue("학과코드");

		cell = row.createCell(1);
		cell.setCellStyle(entityStyle);
		cell.setCellValue("학과이름");

		List<Department> departmentList=departmentMapper.findAll();
		for(int k=1;k<1+departmentList.size();k++) {
			row = sheet2.createRow(k);
			cell = row.createCell(0);
			cell.setCellStyle(attributeStyle);
			cell.setCellValue(departmentList.get(k-1).getDeptId());

			cell = row.createCell(1);
			cell.setCellStyle(attributeStyle);
			cell.setCellValue(departmentList.get(k-1).getName());
		}

		return workbook;
	}
}
