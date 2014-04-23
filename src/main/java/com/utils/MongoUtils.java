package com.utils;

import java.io.File;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.apache.commons.io.FileUtils;
import org.bson.types.ObjectId;
import org.joda.time.DateTime;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.beans.FamilyCondition;
import com.beans.PatientData;
import com.beans.PatientOccupation;
import com.beans.PatientStatistics;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mongodb.BasicDBList;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import com.mongodb.WriteResult;
import com.mongodb.util.JSON;
import com.patient.Condition;
import com.patient.Encounter;
import com.patient.Patient;
import com.patient.Procedures;
import com.patient.Values;

public class MongoUtils {
	private final static Logger logger = LoggerFactory.getLogger(MongoUtils.class);
	private String fileName;
	private MongoClient mongoClient;
	private DB db;
	private DBCollection collection;
	private DBCursor cursor;
	private ObjectMapper mapper;
	private BasicDBObject basicDbObject;
	private String[] randomNames = {"Valeri Kinloch", "Lana Estelle", "Danilo Pal", "Rod Siegal", "Iesha Boze", "Dino Monier", "Concepcion Rochon", 
                     "Jamie Natale", "Martin Pullman", "Arlen Blahnik", "Ines Scull", "Shanell Medlin", "Teodora Hollier", "Annie Lamkin",
                     "Tijuana Marcellus", "Theo Pettey", "Luanna Haverty", "Aleta Vernon", "Christel Haris", "Ned Mertz", "Rusty Frisbie",
                     "Danita Blake", "Sueann Ashurst", "Dion Doman", "Blair Collinsworth", "Christena Swick", "Jesica Cazares", "Marcellus Trombetta",
                     "Hue Wyche", "Marcus Barros", "Scot Ralph", "Dallas Trombley", "Kathy Bundrick", "Meryl Bloomberg", "Tracy Renfroe", "Eula Briles",
                     "Arianna Chin", "Benny Zebrowski", "Iola Kopecky", "Nell Stamps", "Leroy Pauls", "Rossie Kropf", "Christie Perera", 
                     "Asa Neilsen", "Morris Motsinger", "Jonathan Shoulders", "Daphne Mcphearson", "Naomi Snowden", "Reva Wenger", "Reta Baines"};
	
	public MongoUtils() {
		try {
			mongoClient = new MongoClient("localhost", 27017);
			db = mongoClient.getDB("Patient");
			collection = db.getCollection("Patient");
			mapper = new ObjectMapper();
		} catch(UnknownHostException e) {
			logger.error("Error in connecting to Mongo instance");
			e.printStackTrace();
			System.exit(0);
		}
	}
	
	public MongoUtils(String fileName) throws UnknownHostException {
		this();
		this.fileName = fileName;
	}
	
	public String parseJSON() {
		try{
			String json = FileUtils.readFileToString(new File(fileName));
			
			
			DBObject dbObject = (DBObject)JSON.parse(json);
			/*ObjectId objectIDToSet = ObjectId.massageToObjectId(dbObject.get("medical_record_number"));
			if(ObjectId.isValid(objectIDToSet.toString())) {
				logger.info("Generating id for patient: " + objectIDToSet.toString());
				dbObject.put("_id", objectIDToSet);	
			}*/
			collection.insert(dbObject);
			ObjectId objectID = (ObjectId)dbObject.get("_id");
			
			if(objectID != null) {
				return objectID.toString();
			} 
			else {
				return "";
			}
			
			
		} catch(Exception e) {
			logger.error("Error in parsing the JSON schema");
			e.printStackTrace();
			return "";
		}
	}
	
	public List<PatientData> retreiveAllPatients() {
		try {
			cursor = collection.find();
			List<PatientData> patientList = new ArrayList<PatientData>();
			List<Condition> conditions;
			
			while(cursor.hasNext()) {
				List<String> diseaseList = new ArrayList<String>();
				Patient patient = mapper.readValue(cursor.next().toString(), Patient.class);
				PatientData patientData = new PatientData();
				
				patientData.setMedical_record_no(patient.getMedical_record_number());
				
				if(patient.getName() == null) {
					Random r = new Random();
					int randomIndex = r.nextInt(randomNames.length);
					String name = randomNames[randomIndex];
					patientData.setName(name);
				}
				else {
					patientData.setName(patient.getName());
				}
				
				long epoch = (long)patient.getBirthdate() * 1000;
				DateTime yearOfBirth = new DateTime(epoch);
				int age = DateTime.now().getYear() - yearOfBirth.getYear();
				patientData.setAge(age);
				
				patientData.setGender(patient.getGender());
				patientData.setEthnicity(patient.getEthnicity().getName());
				patientData.setRace(patient.getRace().getName());
				
				conditions = patient.getConditions();
				for(Condition condition : conditions) {
					String desc = condition.getDescription();
					int startIndex = desc.indexOf(":");
					int endIndex = desc.indexOf("(");
					diseaseList.add(desc.substring(startIndex + 1, endIndex));
				}
				patientData.setDisease(diseaseList);
				
				patientList.add(patientData);
				conditions.clear();
			}
			
			if(patientList.size() > 0) 
				return patientList;
			else
				return null;
			
		}catch(Exception e) {
			logger.error("Error in retrieving all the patients EHR");
			e.printStackTrace();
			return null;
		} finally {
			cursor.close();
		}
	}
	
	public PatientStatistics retrieveStatisticsForPatient(String medical_record_no) {
		try {
			basicDbObject = new BasicDBObject("medical_record_number", medical_record_no);
			cursor = collection.find(basicDbObject);
			PatientStatistics patientStats = new PatientStatistics();
			List<Encounter> encounterList = new ArrayList<Encounter>();
			Map<Integer, Integer> yearVsEncounterMap = new LinkedHashMap<Integer, Integer>();
			List<Condition> conditionList = new ArrayList<Condition>();
			List<Procedures> procedureList = new ArrayList<Procedures>();
			List<String> tagList = new ArrayList<String>();
			List<Values> valueList = new ArrayList<Values>();
			List<FamilyCondition> familyHistory = new ArrayList<FamilyCondition>();
			PatientOccupation occupation;
			
			while(cursor.hasNext()) {
				Patient patient = mapper.readValue(cursor.next().toString(), Patient.class);
				
				long birthTimeEpoch = (long)patient.getBirthdate() * 1000;
				int sinceYear = new DateTime(birthTimeEpoch).getYear();
				patientStats.setSinceYear(sinceYear);
				
				encounterList = patient.getEncounters();
				for(Encounter encounter : encounterList) {
					long epoch = (long)encounter.getStart_time() * 1000;
					int yearOfEncounter = new DateTime(epoch).getYear();
					if(yearVsEncounterMap.containsKey(yearOfEncounter)) {
						yearVsEncounterMap.put(yearOfEncounter, yearVsEncounterMap.get(yearOfEncounter) + 1);
					} 
					else {
						yearVsEncounterMap.put(yearOfEncounter, 1);
					}
				}
				patientStats.setYearVsEncounterMap(yearVsEncounterMap);
				
				conditionList = patient.getConditions();
				for(Condition condition : conditionList) {
					String desc = condition.getDescription();
					int startIndex = desc.indexOf(":");
					int endIndex = desc.indexOf("(");
					tagList.add(desc.substring(startIndex + 1, endIndex));
				}
				
				procedureList = patient.getProcedures();
				if(procedureList != null) {
					for(Procedures procedure : procedureList) {
						String desc = procedure.getDescription();
						int startIndex = desc.indexOf(":");
						int endIndex = desc.indexOf("(");
						tagList.add(desc.substring(startIndex + 1, endIndex));
						
						valueList = procedure.getValues();
						if (valueList != null) {
							for (Values value : valueList) {
								if (value.getDescription() != null) {
									tagList.add(value.getDescription());
								}
							}
						}
					}
				}
				
				patientStats.setTagList(tagList);
				
				familyHistory = patient.getFamily_history();
				patientStats.setFamilyHistory(familyHistory);
				
				occupation = patient.getOccupation();
				patientStats.setTitle(occupation.getTitle());
			}
			return patientStats;
		} catch(Exception e) {
			logger.error("Error in retrieving statistics for patient with medical record no: " + medical_record_no);
			e.printStackTrace();
			return null;
		} finally {
			cursor.close();
		}
	}
	
	public String updateDocument(String key, Object value, String medical_record_number) {
		try {
			logger.info("Updating the document with value " + value.getClass() + " for patient with medical record number: " + medical_record_number);
			BasicDBObject setNewField = new BasicDBObject("$set", new BasicDBObject().append(key, value));
			WriteResult result = collection.update(new BasicDBObject().append("medical_record_number", medical_record_number), setNewField);
			
			if(result != null) 
				return "{\"success\": \"Patient's information updated successfully\"}";
			else
				return "{\"error\": \"Error in updating the information of the selected user\"}";
		} catch(Exception e) {
			logger.error("Error in updating the document");
			e.printStackTrace();
			return "{\"error\": \"Error in updating the information of the selected user\"}";
		}
	}
	
	public String updateDocument(String key, String value, String medical_record_number) {
		try {
			BasicDBObject setNewField;
			if(value.startsWith("[") && value.endsWith("]")) {
				//the string contains JSON List object
				BasicDBList valueObject = (BasicDBList)JSON.parse(value);
				setNewField = new BasicDBObject("$set", new BasicDBObject().append(key, valueObject));
			}
			else {
				BasicDBObject valueObject = (BasicDBObject)JSON.parse(value);
				setNewField = new BasicDBObject("$set", new BasicDBObject().append(key, valueObject));
			}
			
			WriteResult result = collection.update(new BasicDBObject().append("medical_record_number", medical_record_number), setNewField);
			
			if(result != null) 
				return "{\"success\": \"Patient's information updated successfully\"}";
			else
				return "{\"error\": \"Error in updating the information of the selected patient\"}";
		} catch(Exception e) {
			logger.error("Error in updating the document");
			e.printStackTrace();
			return "{\"error\": \"Error in updating the information of the selected patient\"}";
		}
	}
	
	public Patient retrievePatientInfo(String medical_record_number) {
		try {
			basicDbObject = new BasicDBObject("medical_record_number", medical_record_number);
			cursor = collection.find(basicDbObject);
			Patient patient = null;
			while(cursor.hasNext()) {
				patient = mapper.readValue(cursor.next().toString(), Patient.class);
			}
			
			return patient;
			
		} catch(Exception e) {
			logger.error("Error in retrieving patient informaton for medical record number: " + medical_record_number);
			e.printStackTrace();
			return null;
		}
	}
}
