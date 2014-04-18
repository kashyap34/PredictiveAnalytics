package com.rules;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.commons.lang.StringUtils;
import org.joda.time.DateTime;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.beans.DiabetesQuestionnaire;
import com.beans.FamilyCondition;
import com.beans.PatientOccupation;
import com.dao.MysqlDao;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.patient.Condition;
import com.patient.Encounter;
import com.patient.Medication;
import com.patient.Patient;
import com.patient.Procedures;
import com.patient.Race;
import com.patient.Source_data_criterium;
import com.patient.Vital_sign;
import com.utils.RUtils;

public class Diabetes {
	
	private List<Encounter> encounterList;
	private List<Condition> conditionList;
	private List<Vital_sign> vitalSignsList;
	private List<FamilyCondition> familyHistoryList;
	private String gender;
	private List<Medication> medicationList;
	private PatientOccupation occupation;
	private List<Procedures> procedureList;
	private Race race;
	private List<Source_data_criterium> sourceDataList;
	private String description, diagnosis, labTest, medicationDesc, currentState;
	private int count = 0, labTestValue, patientAge;
	private boolean encounterCondition, encounterConditionCount, medicationCondition, diagnosisCondition, labTestCondition;
	private Map<Integer, Long> labTestEpochs = new LinkedHashMap<Integer,Long>();
	private MysqlDao dao = new MysqlDao();
	private RUtils rUtils = new RUtils(); 
	private static Logger logger = LoggerFactory.getLogger(Diabetes.class);
	private ObjectMapper mapper = new ObjectMapper();
	
	public String checkProbabilityOfDiabates(Patient patient) {
		long birthTimeEpoch = (long)patient.getBirthdate() * 1000;
		int sinceYear = new DateTime(birthTimeEpoch).getYear();
		patientAge = DateTime.now().getYear() - sinceYear;
		
		if(patientAge >= 17 && patientAge <= 74) {
			encounterList = patient.getEncounters();
			if(encounterList != null) {
				for(Encounter encounter : encounterList) {
					description = encounter.getDescription();
					if(StringUtils.containsIgnoreCase(description, "Encounter: Encounter acute inpatient or ED")) {
						encounterCondition = true;
						count ++;
						if(count >= 2) {
							encounterConditionCount = true;
						}
					}
				}
			
				conditionList = patient.getConditions();
				if (conditionList != null) {
					for (Condition condition : conditionList) {
						diagnosis = condition.getDescription();
						if (StringUtils.containsIgnoreCase(diagnosis, "Diagnosis, Active: Diabetes")) {
							diagnosisCondition = true;
						}
					}
				}

				medicationList = patient.getMedication();
				if (medicationList != null) {
					for (Medication medication : medicationList) {
						medicationDesc = medication.getDescription();

						if (StringUtils.containsIgnoreCase(medicationDesc, "Medication, Order: Medications indicative of Diabetes")
								|| StringUtils.containsIgnoreCase(medicationDesc, "Medication, Dispensed: Medications indicative of Diabetes")
								|| StringUtils.containsIgnoreCase(medicationDesc, "Medication, Active: Medications indicative of Diabetes")) {
							medicationCondition = true;
						}
					}
				}
				vitalSignsList = patient.getVital_signs();
				if (vitalSignsList != null) {
					for (Vital_sign vitalSign : vitalSignsList) {
						labTest = vitalSign.getDescription();

						if (StringUtils.containsIgnoreCase(labTest, "Laboratory Test, Result: HbA1c")) {
							System.out.println("Total Lab tests :" + vitalSign.getValues().size());
							labTestValue = Integer.parseInt(vitalSign.getValues().get(0).getScalar());
							labTestEpochs.put(labTestValue, (long)vitalSign.getEnd_time());
							long mostRecentEpoch = Collections.max(labTestEpochs.values());
							for(Entry<Integer, Long> entry : labTestEpochs.entrySet()) {
								if(entry.getValue() == mostRecentEpoch) {
									labTestValue = entry.getKey();
								}
							}
						}
					}
				}

			}
		}
		if(((encounterCondition || encounterConditionCount) || diagnosisCondition) || medicationCondition) {
			if (labTestValue > 9) {
				return "Critical";
			} else if (labTestValue <= 8) {
				return "Very High";
			} else if (labTestValue >= 6.5 && labTestValue < 8) {
				return "High";
			} else if (labTestValue >= 5.7
					&& labTestValue <= 6.4) {
				return "Moderate";
			} else if (labTestValue < 5.7) {
				return "Normal";
			}
			else {
				return "Low";
			}
		}
		else {
			return "Low";
		}
	}
	
	public Map<String, String> checkProbabilityFromFamilyHistory(Patient patient, DiabetesQuestionnaire dbQues) throws JsonProcessingException {
		currentState = checkProbabilityOfDiabates(patient);
		logger.info("Current diabetes state for selected patient is: " + currentState);
		familyHistoryList = patient.getFamily_history();
		int startAge, endAge;
		boolean riskOfDiabetes = false;
		if(dbQues.getQuestion1().equalsIgnoreCase("off") || dbQues.getQuestion2().equalsIgnoreCase("off") || 
				dbQues.getQuestion3().equalsIgnoreCase("off") || dbQues.getQuestion4().equalsIgnoreCase("off")) {
			logger.info("Based on patient's answers to the questionnaire, the risk of diabetes is high");
			riskOfDiabetes = true;
		}
		
		Map<String, String> familyDiseases = new LinkedHashMap<String, String>();
		for(FamilyCondition familyCondition : familyHistoryList) {
			if(StringUtils.containsIgnoreCase(familyCondition.getDisease(), "Diabetes") || riskOfDiabetes) {
				logger.info("Family history indicative of Diabetes");
				startAge = familyCondition.getStartAge();
				endAge = familyCondition.getEndAge();
				if(patientAge >= startAge && patientAge <= endAge) {
					logger.info("Patient in history range");
						switch (currentState) {
						case "Critical":
							familyDiseases.put("Diabetes", "Based on your family history and current medical conditions, the risk of diabetes in future is " + currentState
									+ ".\n\t- Your immediate family member had history of diabetes from " + startAge + " to " + endAge + ".");
							break;
						case "Very High":
							familyDiseases.put("Diabetes", "Based on your family history and current medical conditions, the risk of diabetes in future is " + currentState
									+ ". \n\t- Your immediate family member had history of diabetes from " + startAge + " to " + endAge + ".");
							break;
						case "High":
							familyDiseases.put("Diabetes", "Based on your family history and current medical conditions, the risk of diabetes in future is " + currentState
									+ ". \n\t- Your immediate family member had history of diabetes from " + startAge + " to " + endAge +".");
							break;
						case "Moderate":
							familyDiseases.put("Diabetes", "Based on your family history and current medical conditions, the risk of diabetes in future is " + currentState
									+ ". \n\t- Your immediate family member had history of diabetes from " + startAge + " to " + endAge + ".");
							break;
						case "Normal":
							familyDiseases.put("Diabetes", "Based on your family history and current medical conditions, the risk of diabetes in future is " + currentState
									+ ". \nWatch out for that extra sugar though.");
							break;
						case "Low":
							familyDiseases.put("Diabetes", "Based on your family history and current medical conditions, the risk of diabetes in future is " + currentState
									+ "\nGood Job ! Keep going.");
							break;
						default:
							return null;
						}
				}
				else {
					switch (currentState) {
					case "Critical":
						familyDiseases.put("Diabetes", "Based on your family history and current medical conditions, the risk of diabetes in future is " + currentState
								+ ".\n\t- Your immediate family member had history of diabetes from " + startAge + " to " + endAge + ".");
						break;
					case "Very High":
						familyDiseases.put("Diabetes", "Based on your family history and current medical conditions, the risk of diabetes in future is " + currentState
								+ ". \n\t- Your immediate family member had history of diabetes from " + startAge + " to " + endAge + ".");
						break;
					case "High":
						familyDiseases.put("Diabetes", "Based on your family history and current medical conditions, the risk of diabetes in future is " + currentState
								+ ". \n\t- Your immediate family member had history of diabetes from " + startAge + " to " + endAge +".");
						break;
					case "Moderate":
						familyDiseases.put("Diabetes", "Based on your family history and current medical conditions, the risk of diabetes in future is " + currentState
								+ ". \n\t- Your immediate family member had history of diabetes from " + startAge + " to " + endAge + ".");
						break;
					case "Normal":
						familyDiseases.put("Diabetes", "Based on your family history and current medical conditions, the risk of diabetes in future is " + currentState
								+ ". \nHowever, your immediate family memenber had history of diabetes from" + startAge + " to " + endAge + ". Hence, watch your "
								+ "sugar levels between " + startAge  + "& " + endAge);
						break;
					case "Low":
						familyDiseases.put("Diabetes", "Based on your family history and current medical conditions, the risk of diabetes in future is " + currentState
								+ "\nGood Job ! Keep going. Since, your immediate family member had history of diabetes from " + startAge + " to " + endAge + ", watch"
										+ " your sugar levels between " + startAge + "& " + endAge);
						break;
					default:
						logger.warn("Default case");
						return null;
					}
				}
			}
			else {
				int predictionYear = familyCondition.getStartAge() - patientAge;
				familyDiseases.put(familyCondition.getDisease(), "Your immediate relative had " + familyCondition.getDisease() + " starting "
						+ "at " + familyCondition.getStartAge() + " and ending at " + familyCondition.getEndAge() + ". So, there is a chance that"
						+ "you may have " + familyCondition.getDisease() + " in next "+ predictionYear + "-" + (predictionYear+2) + " years.");
			}
		}
		//System.out.println(mapper.writeValueAsString(familyDiseases));
		return familyDiseases;
	}
		
	
	public String predictDiabetes(Patient patient, DiabetesQuestionnaire dbQues) throws JsonProcessingException {
		StringBuilder responseBuilder = new StringBuilder();
		Map<String, String> familyDiseases = checkProbabilityFromFamilyHistory(patient, dbQues);
		if(familyDiseases != null) {
			responseBuilder.append((String)familyDiseases.get("Diabetes"));
		}
		else {
			responseBuilder.append("Family History not indicative of Diabetes");
		}
		Map<Integer, Integer> yearVsCasesMap = dao.getCasesYearWiseForCountry("United States of America", "Diabetes");
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
			if(predictedInstances.get(predictedInstances.size() - 1) > predictedInstances.get(0)) {
				//the number of cases are rising in next 5 years.
				PatientOccupation occupation = patient.getOccupation();
				String activityLevel = occupation.getActivityLevel();
				
				switch (currentState) {
				case "Critical":
					if(activityLevel == "Sedentary" || activityLevel == "Light") {
						responseBuilder.append("\n\t- The predicted number of Diabetes cases in United States of America is rising in the next"
								+ " 5 years. Also, based on your occupation, your activity level seems to be " + activityLevel
								+". Hence, the probability and risk of increase in diabetes is high for the next 5-7 years");
					} 
					else {
						responseBuilder.append("\n\t- The predicted number of Diabetes cases in United States of America is rising in the next"
								+ " 5 years. Also, based on your occupation, your activity level seems to be " + activityLevel
								+". Hence, the probability and risk of increase in diabetes is high for the next 5-7 years");
					}
					break;
				case "Very High":
					if(activityLevel == "Sedentary" || activityLevel == "Light") {
						responseBuilder.append("\n\t- The predicted number of Diabetes cases in United States of America is rising in the next"
								+ " 5 years. Also, based on your occupation, your activity level seems to be " + activityLevel
								+". Hence, the probability and risk of increase in diabetes is high for the next 4-6 years");
					}
					else {
						responseBuilder.append("\n\t- The predicted number of Diabetes cases in United States of America is rising in the next"
								+ " 5 years. Also, based on your occupation, your activity level seems to be " + activityLevel
								+". Hence, the probability and risk of increase in diabetes is high for the next 4-6 years");
					}
					break;
				case "High":
					if(activityLevel == "Sedentary" || activityLevel == "Light") {
						responseBuilder.append("\n\t- The predicted number of Diabetes cases in United States of America is rising in the next"
								+ " 5 years. Also, based on your occupation, your activity level seems to be " + activityLevel
								+". Hence, the probability and risk of increase in diabetes is high for the next 3-5 years");
					}
					else {
						responseBuilder.append("\n\t- The predicted number of Diabetes cases in United States of America is rising in the next"
								+ " 5 years. Also, based on your occupation, your activity level seems to be " + activityLevel
								+". Hence, the probability and risk of increase in diabetes is high for the next 3-5 years");
					}
					break;	
				case "Moderate":
					if(activityLevel == "Sedentary" || activityLevel == "Light") {
						responseBuilder.append("\n\t- The predicted number of Diabetes cases in United States of America is rising in the next"
								+ " 5 years. Also, based on your occupation, your activity level seems to be " + activityLevel
								+". Hence, there is a probability that you might be diagnosed for diabetes in the next 2 years");
					}
					else {
						responseBuilder.append("\n\t- Based on your occupation, your activity level seems to be " + activityLevel
								+ "The predicted number of Diabetes cases in United States of America is rising in the next"
								+ " 5 years. Also, since you are Pre-Diabetic now," 
								+" there is a probability that you might be diagnosed for diabetes in the next 2 years");
					}
					break;
				case "Normal":
					if(activityLevel == "Sedentary" || activityLevel == "Light") {
						responseBuilder.append("\n\t- The predicted number of Diabetes cases in United States of America is rising in the next"
								+ " 5 years. Also, based on your occupation, your activity level seems to be " + activityLevel
								+". So if you don't watch your sugar levels, there is a probability that you might be diagnosed for diabetes in the next 2 years");
					}
					else {
						responseBuilder.append("\n\t- Based on your occupation, your activity level seems to be " + activityLevel
								+". So if you watch your sugar levels and maintain that activity level, there is a very less probability that you might be diagnosed for diabetes in the next 2 years");
					}
					break;
				case "Zero":
					if(activityLevel == "Sedentary" || activityLevel == "Light") {
						responseBuilder.append("\n\t- The predicted number of Diabetes cases in United States of America is rising in the next"
								+ " 5 years. Also, based on your occupation, your activity level seems to be " + activityLevel
								+". So if you don't watch your sugar level, there is a probability that you might be diagnosed for Pre-diabetes in the next 2 years");
					}
					else {
						responseBuilder.append("\n\t- Based on your occupation, your activity level seems to be " + activityLevel
								+". So if you watch your sugar levels and maintain that activity level, there is a very less probability that you might be diagnosed for diabetes in the next 2 years");
					}
					break;
				default:
					System.out.println("Default case");
					break;
				}
			}
			else {
				//the number of cases are decreasing in the next 5 years
				PatientOccupation occupation = patient.getOccupation();
				String activityLevel = occupation.getActivityLevel();
				
				switch (currentState) {
				case "Critical":
					if(activityLevel == "Sedentary" || activityLevel == "Light") {
						responseBuilder.append("\n\t- The predicted number of Diabetes cases in United States of America are declining in the next"
								+ " 5 years. Also, based on your occupation, your activity level seems to be " + activityLevel
								+". Hence, the probability and risk of increase in diabetes is moderate for the next 5-7 years");
					} 
					else {
						responseBuilder.append("\n\t- The predicted number of Diabetes cases in United States of America are declining in the next"
								+ " 5 years. Also, based on your occupation, your activity level seems to be " + activityLevel
								+". Hence, the probability and risk of increase in diabetes is moderate for the next 5-7 years");
					}
					break;
				case "Very High":
					if(activityLevel == "Sedentary" || activityLevel == "Light") {
						responseBuilder.append("\n\t- The predicted number of Diabetes cases in United States of America are declining in the next"
								+ " 5 years. Also, based on your occupation, your activity level seems to be " + activityLevel
								+". Hence, the probability and risk of increase in diabetes is moderate for the next 4-6 years");
					}
					else {
						responseBuilder.append("\n\t- The predicted number of Diabetes cases in United States of America are declining in the next"
								+ " 5 years. Also, based on your occupation, your activity level seems to be " + activityLevel
								+". Hence, the probability and risk of increase in diabetes is moderate for the next 4-6 years");
					}
					break;
				case "High":
					if(activityLevel == "Sedentary" || activityLevel == "Light") {
						responseBuilder.append("\n\t- The predicted number of Diabetes cases in United States of America are declining in the next"
								+ " 5 years. Also, based on your occupation, your activity level seems to be " + activityLevel
								+". Hence, the probability and risk of increase in diabetes is moderate for the next 3-5 years");
					}
					else {
						responseBuilder.append("\n\t- The predicted number of Diabetes cases in United States of America are declining in the next"
								+ " 5 years. Also, based on your occupation, your activity level seems to be " + activityLevel
								+". Hence, the probability and risk of increase in diabetes is moderate for the next 3-5 years");
					}
					break;	
				case "Moderate":
					if(activityLevel == "Sedentary" || activityLevel == "Light") {
						responseBuilder.append("\n\t- The predicted number of Diabetes cases in United States of America are declining in the next"
								+ " 5 years. Also, based on your occupation, your activity level seems to be " + activityLevel
								+". Hence, there is a less probability that you might be diagnosed for diabetes in the next 2 years");
					}
					else {
						responseBuilder.append("\n\t- Based on your occupation, your activity level seems to be " + activityLevel
								+ "The predicted number of Diabetes cases in United States of America are declining in the next"
								+ " 5 years. Also, since you are Pre-Diabetic now," 
								+" there is a less probability that you might be diagnosed for diabetes in the next 2 years");
					}
					break;
				case "Normal":
					if(activityLevel == "Sedentary" || activityLevel == "Light") {
						responseBuilder.append("\n\t- The predicted number of Diabetes cases in United States of America are declining in the next"
								+ " 5 years. Also, based on your occupation, your activity level seems to be " + activityLevel
								+". So if you don't watch your sugar levels, there is a minor probability that you might be diagnosed for diabetes in the next 2 years");
					}
					else {
						responseBuilder.append("\n\t- Based on your occupation, your activity level seems to be " + activityLevel
								+". So if you watch your sugar levels and maintain that activity level, there is a very less probability that you might be diagnosed for diabetes in the next 2 years");
					}
					break;
				case "Zero":
					if(activityLevel == "Sedentary" || activityLevel == "Light") {
						responseBuilder.append("\n\t- The predicted number of Diabetes cases in United States of America are declining in the next"
								+ " 5 years. Also, based on your occupation, your activity level seems to be " + activityLevel
								+". So if you don't watch your sugar level, there is a minor probability that you might be diagnosed for Pre-diabetes in the next 2 years");
					}
					else {
						responseBuilder.append("\n\t- Based on your occupation, your activity level seems to be " + activityLevel
								+". So if you watch your sugar levels and maintain that activity level, there is a very less probability that you might be diagnosed for diabetes in the next 2 years");
					}
					break;
				default:
					System.out.println("Default case");
					break;
				}
			}
		}
		if(responseBuilder.length() > 10) {
			return responseBuilder.toString();
		}
		else {
			return "Too less information to predict Diabetes.";
		}
			
	}

}