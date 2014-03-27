package com.utils;

import java.io.File;
import java.io.FileReader;
import java.util.ArrayList;

import org.rosuda.JRI.REXP;
import org.rosuda.JRI.Rengine;

import au.com.bytecode.opencsv.CSVReader;

public class RUtils {
	private Rengine rEngine;
	
	public RUtils() {
		System.out.println("Invoking the R Engine");
		rEngine = new Rengine(new String[]{"--no-save"}, false, null);
	}
	
	public void trainRForCountryPrediction() {
		try {
			File trainingData = new File("/home/kashyap/CMPE295B/Maven Project/PopulationAnalytics/src/main/resources/WHOData/Diabetes_cases.csv");
			rEngine.eval(String.format("trainingDataPath <- '%s'", trainingData.getAbsolutePath()));
			File rScript = new File("/home/kashyap/CMPE295B/Maven Project/PopulationAnalytics/src/main/resources/countryPrediction.R");
			rEngine.eval(String.format("source('%s')", rScript.getAbsolutePath()));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Double> predictInstance() {
		ArrayList<Double> predictedInstances = new ArrayList<Double>();
		
		try {
			int[] years = {2012, 2013, 2014, 2015, 2016, 2017, 2018};
			
			CSVReader reader = new CSVReader(new FileReader("/home/kashyap/CMPE295B/Maven Project/PopulationAnalytics/src/main/resources/WHOData/Diabetes_cases.csv"));
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
			}
			trainRForCountryPrediction();
			for(int year : years) {
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
