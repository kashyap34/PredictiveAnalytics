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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.beans.DiabetesQuestionnaire;
import com.beans.PatientData;
import com.beans.PatientOccupation;
import com.beans.PatientStatistics;
import com.dao.MysqlDao;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.patient.Patient;
import com.rules.Diabetes;
import com.utils.MongoUtils;
import com.utils.RUtils;

@Controller
@RequestMapping("dashboard")
@SessionAttributes({"userName", "userEmail"})
public class DashboardController {
	
	private MysqlDao dao = new MysqlDao();
	private static RUtils rUtils = new RUtils();
	private static Logger logger = LoggerFactory.getLogger(DashboardController.class);
	private ObjectMapper mapper = new ObjectMapper();
	private MongoUtils mongoUtils;
	
	public DashboardController() throws UnknownHostException {
		mongoUtils = new MongoUtils();
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
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
	
	@RequestMapping(value = "/country/{disease}", method = RequestMethod.GET)
	public @ResponseBody String getCountryListForDisease(@PathVariable String disease) {
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
	
	@RequestMapping(value = "/country", method = RequestMethod.GET, params = {"disease","country"})
	public @ResponseBody String getCountryCasesForDisease(@RequestParam("disease") String disease, @RequestParam("country") String country) {
		try {
			logger.info("Retrieving the country wise cases data for: " + disease);
			Map<Integer, Integer> yearVsCasesMap = dao.getCasesYearWiseForCountry(country, disease);
			if(yearVsCasesMap != null) {
				//ArrayList<Double> predictedInstances = rUtils.predictInstance(yearVsCasesMap);
				if(RUtils.rEngine == null) {
					new RUtils().init();
				}
				else {
					if(!RUtils.rEngine.isAlive()) {
						new RUtils().init();
					}
				}
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
	
	@RequestMapping(value = "/patient", method = RequestMethod.GET)
	public String returnPatientView(ModelMap model) {
		logger.info("Generating the view for patient");
		
		List<PatientData> patientList = mongoUtils.retreiveAllPatients();
		if(patientList != null)
			model.addAttribute("patientList", patientList);
		else
			model.addAttribute("error", "Error in retreiving patient data");
		
		return "PatientDashboard";
	}
	
	@RequestMapping(value = "/patient", method = RequestMethod.GET, params = "medical_record_no")
	public @ResponseBody String retreivePatientDetails(@RequestParam("medical_record_no") String mrno) {
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
	
	@RequestMapping(value = "/patient/occupationsList", method = RequestMethod.GET)
	public @ResponseBody String retrieveAllOccupations() {
		try {
			List<String> occupationsList = dao.retrieveAllOccupations();
			System.out.println(mapper.writeValueAsString(occupationsList));
			if(occupationsList != null) 
				return "{\"occupationsList\": " + mapper.writeValueAsString(occupationsList) + "}";
			else 
				return "{\"error\": \"Error in retrieving Occupations list\"}";
		} catch(Exception e) {
			logger.error("Error in retrieving all occupations list");
			e.printStackTrace();
			return "{\"error\": \"Error in retrieving Occupations list\"}";
		}
	}
	
	@RequestMapping(value = "/patient/diseaseList", method = RequestMethod.GET)
	public @ResponseBody String retrieveAllDisease() {
		try {
			List<String> diseaseList = dao.retrieveDiseaseList();
			System.out.println(mapper.writeValueAsString(diseaseList));
			if(diseaseList != null) 
				return "{\"diseaseList\": " + mapper.writeValueAsString(diseaseList) + "}";
			else 
				return "{\"error\": \"Error in retrieving Disease list\"}";
		} catch(Exception e) {
			logger.error("Error in retrieving all occupations list");
			e.printStackTrace();
			return "{\"error\": \"Error in retrieving Occupations list\"}";
		}
	}
	
	@RequestMapping(value = "/patient/update", method = RequestMethod.POST , params = "medical_record_no")
	public @ResponseBody String retrievePatientsFamilyHistory(@RequestBody PatientStatistics patientStats, 
															@RequestParam("medical_record_no") String mrno) {
		try {
			logger.info("Updating the information of the patient with medical record no: " + mrno);
			String result = "";
			System.out.println(mapper.writeValueAsString(patientStats));
			if(patientStats.getFamilyHistory() != null) {
				System.out.println(mapper.writeValueAsString(patientStats.getFamilyHistory()));
				result = mongoUtils.updateDocument("family_history", mapper.writeValueAsString(patientStats.getFamilyHistory()), mrno);
			}
			else
				logger.warn("Family history empty");
			
			if(patientStats.getTitle() != null) {
				String title = patientStats.getTitle();
				String occupation = dao.retrieveOccupationDetailsForAJob(title);
				//System.out.println(mapper.writeValueAsString(occupation));
				//occupation.setTitle(title);
				result = mongoUtils.updateDocument("occupation", occupation, mrno);
			}
			return result;
			
		} catch(Exception e) {
			logger.error("Error in updating the family history for the user with medical record no: " + mrno);
			e.printStackTrace();
			return "{\"error\": \"Error in updating the family history for the selected user\"}";
		}
	}
	
	@RequestMapping(value = "/patient/diabetes/predict", method = RequestMethod.GET, params = {"medical_record_no","q1","q2","q3","q4"})
	public @ResponseBody String predictDiabetesForPatient(@RequestParam("medical_record_no") String medical_record_no,
														  @RequestParam("q1") String question1,
														  @RequestParam("q2") String question2,
														  @RequestParam("q3") String question3,
														  @RequestParam("q4") String question4) {
		try {
			DiabetesQuestionnaire dbQues = new DiabetesQuestionnaire();
			dbQues.setQuestion1(question1);
			dbQues.setQuestion2(question2);
			dbQues.setQuestion3(question3);
			dbQues.setQuestion4(question4);
			
			Patient patient = mongoUtils.retrievePatientInfo(medical_record_no);
			String prediction;
			if(patient != null) {
				prediction = new Diabetes().predictDiabetes(patient, dbQues);
				logger.info("Generating response: {\"diabetes_prediction\": " + mapper.writeValueAsString(prediction) + "}");
				return "{\"diabetes_prediction\": " + mapper.writeValueAsString(prediction) + "}";
			}
			else {
				return "{\"error\": \"Error in predicting diabetes for the selected user\"}";
			}
			
		} catch(Exception e) {
			logger.error("Error in predicting diabtes for patient with medical record number: " + medical_record_no );
			e.printStackTrace();
			return "{\"error\": \"Error in predicting diabetes for the selected user\"}";
		}
		
	}
}
