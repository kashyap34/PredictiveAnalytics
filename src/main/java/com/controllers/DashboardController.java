package com.controllers;

import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.beans.PatientData;
import com.beans.PatientStatistics;
import com.dao.MysqlDao;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.utils.MongoUtils;
import com.utils.RUtils;

@Controller
public class DashboardController {
	
	private MysqlDao dao = new MysqlDao();
	private static RUtils rUtils = new RUtils();
	private static Logger logger = LoggerFactory.getLogger(DashboardController.class);
	private ObjectMapper mapper = new ObjectMapper();
	private MongoUtils mongoUtils;
	
	public DashboardController() throws UnknownHostException {
		mongoUtils = new MongoUtils();
	}
	
	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public String returnDashboardView(ModelMap model) {
		System.out.println("JRI Path is: " + System.getProperty("java.library.path"));
		Map<String, Double> avgCasesMap = dao.getAverageCasesWorldWide();
		
		if(avgCasesMap != null) {
			logger.info("Returning average cases to the model");
			model.addAttribute("avgCasesMap", avgCasesMap);
		}
		else {
			logger.error("Error in retrieving the health trends");
			model.addAttribute("error", "Error in retreiving the health trends");
		}
		return "Dashboard";
	}
	
	@RequestMapping(value = "/dashboard/country/{disease}", method = RequestMethod.GET)
	public @ResponseBody String getCountryListForDisease(@PathVariable String disease, ModelMap model) {
		try {
			logger.info("Retrieving the country list data for: " + disease);
			List<String> countryList = dao.getCountryListForDisease(disease);
			if(countryList != null) {
				System.out.println("{\"countryList\": "+ mapper.writeValueAsString(countryList) + "}");
				return "{\"countryList\": " + mapper.writeValueAsString(countryList) + "}";
			}
			else {
				logger.error("No suitable records found. Returning error to the caller");
				return "{\"error\": \"Error in retrieving the health trends for disease: " + disease + "\"";
			}
		} catch (Exception e) {
			logger.error("Error in generating the response");
			e.printStackTrace();
			return "";
		}
	}
	
	@RequestMapping(value = "/dashboard/country", method = RequestMethod.GET, params = {"disease","country"})
	public @ResponseBody String getCountryCasesForDisease(@RequestParam("disease") String disease, @RequestParam("country") String country) {
		try {
			logger.info("Retrieving the country wise cases data for: " + disease);
			Map<Integer, Integer> yearVsCasesMap = dao.getCasesYearWiseForCountry(country, disease);
			if(yearVsCasesMap != null) {
				//ArrayList<Double> predictedInstances = rUtils.predictInstance(yearVsCasesMap);
				ArrayList<Double> predictedInstances = rUtils.predictInstanceUsingTimeSeries(yearVsCasesMap);
				System.out.println("{\"cases\":" + mapper.writeValueAsString(yearVsCasesMap) + ", \"predictions\":" + mapper.writeValueAsString(predictedInstances) +"}");
				return "{\"cases\":" + mapper.writeValueAsString(yearVsCasesMap) + ", \"predictions\":" + mapper.writeValueAsString(predictedInstances) +"}";
			}
			else {
				logger.error("No suitable records found. Returning error to the caller");
				return "{\"error\": \"Error in retrieving the health trends for disease: " + disease + "\"";
			}
		} catch (Exception e) {
			logger.error("Error in generating the response");
			e.printStackTrace();
			return "";
		}
	}
	
	@RequestMapping(value = "/dashboard/patient", method = RequestMethod.GET)
	public String returnPatientView(ModelMap model) {
		logger.info("Generating the view for patient");
		
		List<PatientData> patientList = mongoUtils.retreiveAllPatients();
		if(patientList != null)
			model.addAttribute("patientList", patientList);
		else
			model.addAttribute("error", "Error in retreiving patient data");
		
		return "PatientDashboard";
	}
	
	@RequestMapping(value = "/dashboard/patient", method = RequestMethod.GET, params = "medical_record_no")
	public @ResponseBody String retreivePatientDetails(@RequestParam("medical_record_no") String mrno, ModelMap model) {
		logger.info("Retreiving the details of patient with medical record no: " + mrno);
		PatientStatistics patientStats = mongoUtils.retrieveStatisticsForPatient(mrno);
		
		try {
			System.out.println(mapper.writeValueAsString(patientStats));
			return mapper.writeValueAsString(patientStats);
		} catch (JsonProcessingException e) {
			logger.error("Error in generating the statistics for the given user");
			e.printStackTrace();
			return "{\"error\": \"Error in generating the statistics for the selected user\"}";
		}
		
	}
}
