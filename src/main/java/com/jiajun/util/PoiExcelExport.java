package com.jiajun.util;

import java.io.IOException;
import java.io.OutputStream;
import java.lang.reflect.Method;
import java.net.URLEncoder;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFColor;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 * 
 * poi excel 导出工具类
 * 
 * @author tvu
 */
public class PoiExcelExport {

	private static final String default_datePattern = "yyyy/MM/dd HH:mm:ss";
	private static final String default_decimalPattern = ".00";
	private static final String default_sheetName = "sheet1";
	private static final int default_ColumnWidth = 20*256;
	
	private SimpleDateFormat dateFormat = new SimpleDateFormat(default_datePattern);
	private DecimalFormat decimalFormat = new DecimalFormat(default_decimalPattern);;
	private String sheetName = default_sheetName;

	private String subject; //table的表头
	private String[] titleCols; //table的字段名
	private String number; //带编号
	private String[] fields; //对象属性
	private List<?> list; //对象集合
	
	private int startRow = 0;
 	private int startCol = 0;
	
	private Map<String, Integer> customColWidth =  new  HashMap<>(); //自定义表字段宽度
	private XSSFWorkbook workbook = null;

	/**
	 * 必须条件
	 * @param titleCols
	 * @param fields
	 * @param list
	 * @throws Exception
	 */
	public PoiExcelExport(String[] titleCols, String[] fields, List<?> list) throws Exception {
		if (ArrayUtils.isEmpty(titleCols) && ArrayUtils.isEmpty(fields) && titleCols.length != fields.length) {
			throw new Exception("Parameter exception");
		}
		this.workbook = new XSSFWorkbook();
		this.titleCols = titleCols;
		this.fields = fields;
		this.list = list;
	}

	/*
	 * 日期模板
	 */
	public PoiExcelExport withDatePattern(String dateFormatPattern) {
		dateFormat = new SimpleDateFormat(dateFormatPattern);
		return this;
	}
	/*
	 * 小数格式化模板
	 */
	public PoiExcelExport withDecimalPattern(String decimalPattern) {
		this.decimalFormat = new DecimalFormat(decimalPattern);
		return this;
	}
	/*
	 * 指定列宽度
	 */
	public PoiExcelExport withColWith(String colName, int chartNum) {
		this.customColWidth.put(colName, chartNum*256);
		return this;
	}
	/*
	 * sheet名称
	 */
	public PoiExcelExport withSheetName(String sheetName) {
		this.sheetName = sheetName;
		return this;
	}
	/*
	 * 带表头
	 */
	public PoiExcelExport withSubject(String subject) {
		this.subject = subject;
		startRow+=1;
		return this;
	}
	/*
	 * 带编号
	 */
	public PoiExcelExport withNumber(String number) {
		this.number = number;
		this.startCol+=1;
		return this;
	}
	
	
	public void exportExcel(HttpServletResponse response, String fileName) {
		OutputStream out = null;
		try {
			out = response.getOutputStream();
			response.setContentType("application/x-msdownload");
			response.setHeader("Content-Disposition",
					"attachment; filename=" + URLEncoder.encode(fileName, "UTF-8") + ".xlsx");

			XSSFSheet sheet = workbook.createSheet(sheetName);
			
			int cols = startCol+titleCols.length;
			//具有表头
			if(StringUtils.isNotEmpty(subject)) {
				for (int c = 0; c < cols; c++) {
					setStyle(this.getCell(sheet, 0, c), 0);
				}
				CellRangeAddress cellRange = new CellRangeAddress(0, 0, 0, cols - 1);
				sheet.addMergedRegion(cellRange);
				XSSFCell heard = this.getCell(sheet, 0, 0);
				heard.setCellValue(subject);
			}
			
			//设置字段
			for (int c = 0; c < cols; c++) {
				if(c==0 && StringUtils.isNotEmpty(number)) {
					XSSFCell cell = getFieldCell(sheet, c, number);
					this.setStyle(cell, startRow);
					cell.setCellValue(number);
				} else {
					XSSFCell cell = getFieldCell(sheet, c, titleCols[c-startCol]);
					this.setStyle(cell, startRow);
					cell.setCellValue(titleCols[c-startCol]);
				}
			}

			if (CollectionUtils.isNotEmpty(list)) {
				//设置值
				for (int r = startRow+1,index=0; r <= startRow+list.size(); r++, index++) {
					Class<? extends Object> objClass;
					for (int c = 0; c < cols; c++) {
						XSSFCell cell = this.getCell(sheet, r, c);
						this.setStyle(cell, r);
						Object obj = list.get(index);
						if(c==0 && StringUtils.isNotEmpty(number)) {
							cell.setCellValue(index+1);
						} else {
							String fieldName = fields[c-startCol];
							objClass = obj.getClass();
							String methodName = "get" + Character.toUpperCase(fieldName.charAt(0)) + fieldName.substring(1);
							Method method = objClass.getDeclaredMethod(methodName);
							Object objValue = method.invoke(obj);
							Object value = "";
							if (objValue != null) {
								value = objValue;
							}
							String returnType = method.getReturnType().getName();
							returnType = returnType.substring(returnType.lastIndexOf(".") + 1);
							if ("float".equalsIgnoreCase(returnType)) {
								cell.setCellValue(decimalFormat.format((float) value));
							} else if ("double".equalsIgnoreCase(returnType)) {
								cell.setCellValue(decimalFormat.format((double) value));
							} else if ("Date".equalsIgnoreCase(returnType)) {
								cell.setCellValue(dateFormat.format(value));
							} else {
								cell.setCellValue(value.toString());
							}
						}
					}
				}
			}
			workbook.write(out);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (out != null) {
				try {
					out.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}


	/**
	 * 创建cell, 设置宽度
	 * @param sheet
	 * @param rowIndex
	 * @param col
	 * @param fieldName
	 * @return
	 */
	private XSSFCell getFieldCell(XSSFSheet sheet, int colIndex, String colName) {
		XSSFRow row = sheet.getRow(startRow);
		if(row == null) {
			row = sheet.createRow(startRow);
		}
		XSSFCell cell = row.getCell(colIndex);
		if(cell == null) {
			cell = row.createCell(colIndex);
			if (customColWidth.containsKey(colName)) {
				sheet.setColumnWidth(colIndex, customColWidth.get(colName));
			} else if(StringUtils.isNotEmpty(number) && number.equals(colName)) {
				sheet.setColumnWidth(colIndex, default_ColumnWidth/2);
			}else {
				sheet.setColumnWidth(colIndex, default_ColumnWidth);
			}
		}
		return cell;
	}
	
	private XSSFCell getCell(XSSFSheet sheet, int rowIndex, int colIndex) {
		XSSFRow row = sheet.getRow(rowIndex);
		if (row == null) {
			row = sheet.createRow(rowIndex);
		}
		XSSFCell cell = row.getCell(colIndex);
		if (cell == null) {
			cell = row.createCell(colIndex);
		}
		return cell;
	}
	
	/**
	 * 设置样式
	 * @param cell
	 * @param row
	 */
	private void setStyle(XSSFCell cell, int row) {
		XSSFCellStyle cellStyle = workbook.createCellStyle();
		if(row<startRow) {
			XSSFFont font = workbook.createFont();
			font.setFontHeight(16);
			cellStyle.setBorderRight(BorderStyle.THIN);
			cellStyle.setBorderBottom(BorderStyle.THIN);
			cellStyle.setAlignment(HorizontalAlignment.CENTER);
			cellStyle.setFont(font);
		} else if(row==startRow) {
			cellStyle.setFillForegroundColor(new XSSFColor(new byte[] { (byte) 198, (byte) 224, (byte) 180 }));
			cellStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
			cellStyle.setBorderRight(BorderStyle.THIN);
			cellStyle.setBorderBottom(BorderStyle.MEDIUM);
			cellStyle.setAlignment(HorizontalAlignment.CENTER);
		} else {
			cellStyle.setBorderRight(BorderStyle.THIN);
			cellStyle.setBorderBottom(BorderStyle.THIN);
			cellStyle.setAlignment(HorizontalAlignment.LEFT);
		}
		cellStyle.setVerticalAlignment(VerticalAlignment.CENTER);
		cell.setCellStyle(cellStyle);
	}

}
