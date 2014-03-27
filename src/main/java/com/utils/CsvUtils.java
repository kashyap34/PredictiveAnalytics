package com.utils;

import java.io.FileReader;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.beans.Disease;
import com.dao.MysqlDao;

import au.com.bytecode.opencsv.CSVReader;

public class CsvUtils {
	private CSVReader reader;
	private String fileName;
	private final Logger logger  = LoggerFactory.getLogger(CsvUtils.class);
	private MysqlDao mysqlDao;
	
	public CsvUtils(String fileName) {
		this.fileName = fileName;
		mysqlDao = new MysqlDao();
	}
	
	public boolean parseCsv() {
		try {
			
			if(fileName.contains("data-text")) {
				reader = new CSVReader(new FileReader(fileName));
				String[] nextLine;
				boolean header = true;
				while((nextLine = reader.readNext()) != null) {
					if(header) {
						//do nothing
						header = false;
					}
					else {
						//prepare POJO to store in DB
						Disease disease = new Disease();
						disease.setIndicator(nextLine[0]);
						disease.setYear(Integer.parseInt(nextLine[2]));
						disease.setWho_region(nextLine[3]);
						if(nextLine[4].contains("income")) {
							if(nextLine[5].equalsIgnoreCase("Male") || nextLine[5].equalsIgnoreCase("Female") || nextLine[5].equalsIgnoreCase("Both Sexes")) {
								disease.setSex(nextLine[5]);
								disease.setNo_of_cases(Integer.parseInt(nextLine[6].replaceAll(" ", "")));
							}
							else {
								disease.setCountry(nextLine[5]);
								disease.setSex("Both Sexes");
								if(nextLine[6].isEmpty()) {
									disease.setNo_of_cases(0);
								}
								else {
									disease.setNo_of_cases(Integer.parseInt(nextLine[6].replaceAll(" ", "")));
								}
							}
						}
						else {
							disease.setCountry(nextLine[4]);
							if(nextLine[5].equalsIgnoreCase("Male") || nextLine[5].equalsIgnoreCase("Female") || nextLine[5].equalsIgnoreCase("Both Sexes")) {
								disease.setSex(nextLine[5]);
								disease.setNo_of_cases(Integer.parseInt(nextLine[6].replaceAll(" ", "")));
							}
							else {
								disease.setSex("Both Sexes");
								if(nextLine[5].isEmpty()) {
									disease.setNo_of_cases(0);
								}
								else {
									disease.setNo_of_cases(Integer.parseInt(nextLine[5].replaceAll(" ", "")));
								}
							}
						}
						//store in DB
						if(mysqlDao.createDisease(disease))
							continue;
						else
							return false;
					}
				}
				return true;
			}
			
		} catch(Exception e) {
			logger.error("Error in parsing the file");
			e.printStackTrace();
		}
		
		return false;
	}
}
