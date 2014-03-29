package com.utils;

import java.io.File;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.Map;

import org.rosuda.JRI.REXP;
import org.rosuda.JRI.Rengine;

import au.com.bytecode.opencsv.CSVReader;

public class RUtils {
	private static Rengine rEngine;
	
	public RUtils() {
		System.out.println("Invoking the R Engine");
		rEngine = new Rengine(new String[]{"--no-save"}, false, null);
	}
	
	public void trainRForCountryPrediction(Map<Integer, Integer> yearVsCasesMap) {
		try {
			rEngine.eval(String.format("year <- c(%s,%s,%s,%s,%s,%s)", 2006, 2007, 2008, 2009, 2010, 2011));
			rEngine.eval(String.format("cases <- c(%s,%s,%s,%s,%s,%s)", yearVsCasesMap.get("2006"), yearVsCasesMap.get("2007"), yearVsCasesMap.get("2008"),
					yearVsCasesMap.get("2009"), yearVsCasesMap.get("2010"), yearVsCasesMap.get("2011")));
			rEngine.eval("model <- lm(cases ~ year)");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Double> predictInstance(Map<Integer, Integer> yearVsCasesMap) {
		ArrayList<Double> predictedInstances = new ArrayList<Double>();
		
		try {
			int[] years = {2012, 2013, 2014, 2015, 2016, 2017, 2018};
			
			/*CSVReader reader = new CSVReader(new FileReader("/home/kashyap/CMPE295B/Maven Project/PopulationAnalytics/src/main/resources/WHOData/Diabetes_cases.csv"));
			String[] nextLine;
			boolean header = true;
			while((nextLine = reader.readNext()) != null) {
				if(header) {
					//do nothing
					header = false;
				}
				else {
					predictedInstances.add(Double.parseDouble(nextLine[1]));
				}
			}*/
			for (Integer cases: yearVsCasesMap.values()) {
				predictedInstances.add(Double.parseDouble(cases.toString()));
			}
			//trainRForCountryPrediction(yearVsCasesMap);
			rEngine.eval(String.format("year <- c(%s,%s,%s,%s,%s,%s)", 2006, 2007, 2008, 2009, 2010, 2011));
			System.out.println(String.format("year <- c(%s,%s,%s,%s,%s,%s)", 2006, 2007, 2008, 2009, 2010, 2011));
			rEngine.eval(String.format("cases <- c(%s,%s,%s,%s,%s,%s)", yearVsCasesMap.get(2006), yearVsCasesMap.get(2007), yearVsCasesMap.get(2008),
					yearVsCasesMap.get(2009), yearVsCasesMap.get(2010), yearVsCasesMap.get(2011)));
			System.out.println(String.format("cases <- c(%s,%s,%s,%s,%s,%s)", yearVsCasesMap.get(2006), yearVsCasesMap.get(2007), yearVsCasesMap.get(2008),
					yearVsCasesMap.get(2009), yearVsCasesMap.get(2010), yearVsCasesMap.get(2011)));
			rEngine.eval("model <- lm(cases ~ year)");
			for(int year : years) {
				if(yearVsCasesMap.containsKey(year)) {
					//do nothing
				}
				else {
					System.out.println("Predicting the data for year " + year);
					rEngine.eval(String.format("newData <- data.frame(year=%s)", year));
					REXP result = rEngine.eval("predict(model,newData)");
					if(result != null) {
						predictedInstances.add(result.asDouble());
					}
					else {
						System.out.println("Result is null");
					}
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return predictedInstances;
	}
	
	//For testing puposes only
	/*public static void main(String[] args) {
		RUtils rUtils = new RUtils();
		rUtils.predictInstance();
	}*/
}
