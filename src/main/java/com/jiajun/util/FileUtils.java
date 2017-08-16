package com.jiajun.util;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

/**
 * @desc 文件工具类
 * @author JIAJUN
 * @date 2017年7月27日下午8:53:54
 */
public class FileUtils {
	
	/**
	 * 文件名称, 时间戳加上三位随机数
	 * @return
	 */
	@Deprecated
	public static String getFileName() {
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
		String fileName = format.format(new Date());
		Random random = new Random();
		for(int i=0; i<3; i++) {
			fileName+=random.nextInt(10);
		}
		return fileName;
	}
	
	@Deprecated
	public static  File getDestFile(String filePath) {
		File f = new File(filePath);
		if(!f.exists()) {
			f.getParentFile().mkdirs();
			try {
				f.createNewFile();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return f;
	}
	
	
	/**
	 * 文件名称, 时间戳加上三位随机数
	 * @return
	 */
	public static String createFileName() {
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
		String fileName = format.format(new Date());
		Random random = new Random();
		for(int i=0; i<3; i++) {
			fileName+=random.nextInt(10);
		}
		return fileName;
	}
	
	
	public static  File createDestFile(String filePath) {
		File f = new File(filePath);
		if(!f.exists()) {
			f.getParentFile().mkdirs();
			try {
				f.createNewFile();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return f;
	}
	
}


