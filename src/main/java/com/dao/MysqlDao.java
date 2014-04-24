package com.dao;

import java.io.FileInputStream;
import java.net.UnknownHostException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.beans.CountryData;
import com.beans.Disease;
import com.beans.PatientOccupation;
import com.beans.UserInfo;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.utils.MongoUtils;

public class MysqlDao {
	
	private Properties props = new Properties();
	private Logger logger = LoggerFactory.getLogger(MysqlDao.class);
	private FileInputStream fis ;
	private Connection conn;
	private ResultSet rs;
	private PreparedStatement pstmt;
	private String query;
	private ObjectMapper mapper = new ObjectMapper();
	private MongoUtils mongoUtils = new MongoUtils();
	
	public MysqlDao() {
		try{
			fis = new FileInputStream("/home/kashyap/Documents/CmpE295B/MavenProject/PopulationAnalytics/src/main/resources/mysql.properties");
			props.load(fis);
			
			Class.forName(props.getProperty("driver"));
			conn = DriverManager.getConnection(props.getProperty("url"), props);
			
		} catch(Exception e) {
			logger.error("Error in reading the properties file");
			e.printStackTrace();
		}
	}
	
	public boolean storeUserInfo(UserInfo user) {
		try{
			query = "Insert into User.UserInfo values(?,?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, user.getFname());
			pstmt.setString(2, user.getLname());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getEmail());
			pstmt.setInt(5, user.getContact());
			pstmt.setString(6, user.getStreet());
			pstmt.setString(7, user.getAptOrSuite());
			pstmt.setInt(8, user.getZip());
			pstmt.setString(9, user.getCity());
			pstmt.setString(10, user.getState());
			
			int status = pstmt.executeUpdate();
			
			if(status != 0) {
				return true;
			}
		} catch(SQLException e) {
			logger.error("Error in storing the user information");
			e.printStackTrace();
		}
		return false;
	}
	
	public String checkCredentials(String email, String password) {
		try{
			query = "Select fname from User.UserInfo where email = ? and password = ?";
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			
			rs = pstmt.executeQuery();
			
			String fname = "";
			if(rs.next()) {
				fname = rs.getString("fname");
				logger.info("Found user " + fname + " matching the credentials");
			}
			
			return fname;
			
		} catch(SQLException e) {
			logger.error("Error in checking the credentials of the user");
			e.printStackTrace();
		}
		
		return "";
	}
	
	public UserInfo retrieveUserDetails(String email) {
		try {
			query = "Select * from User.UserInfo where email = ?";
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				UserInfo user = new UserInfo();
				user.setFname(rs.getString("fname"));
				user.setLname(rs.getString("lname"));
				user.setPassword(rs.getString("password"));
				user.setEmail(rs.getString("email"));
				user.setContact(rs.getInt("contact"));
				user.setStreet(rs.getString("street"));
				user.setAptOrSuite(rs.getString("aptOrsuite"));
				user.setZip(rs.getInt("zipcode"));
				user.setCity(rs.getString("city"));
				user.setState(rs.getString("state"));
				
				return user;
				
			} else {
				return null;
			}
			
		} catch(SQLException e) {
			logger.error("Error in retrieving the user details");
			e.printStackTrace();
			return null;
		}
	}
	
	public boolean createDisease(Disease disease) {
		try {
			query = "Insert into WHO.Disease(indicator, year, who_region, country, sex, no_of_cases) values(?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, disease.getIndicator());
			pstmt.setInt(2, disease.getYear());
			pstmt.setString(3, disease.getWho_region());
			pstmt.setString(4, disease.getCountry());
			pstmt.setString(5, disease.getSex());
			pstmt.setInt(6, disease.getNo_of_cases());
			
			int rowsAffected = pstmt.executeUpdate();
			if(rowsAffected > 0)
				return true;
			else
				return false;
			
		} catch(SQLException e) {
			logger.error("Error in inserting disease data");
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean updateUserDetails(UserInfo user) {
		try{
			query = "Update User.UserInfo set fname = ?, lname = ?, password = ?, contact = ?, street = ?, aptOrsuite = ?, zipcode = ?, city = ?, state = ? where email = ?";
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, user.getFname());
			pstmt.setString(2, user.getLname());
			pstmt.setString(3, user.getPassword());
			pstmt.setInt(4, user.getContact());
			pstmt.setString(5, user.getStreet());
			pstmt.setString(6, user.getAptOrSuite());
			pstmt.setInt(7, user.getZip());
			pstmt.setString(8, user.getCity());
			pstmt.setString(9, user.getState());
			pstmt.setString(10, user.getEmail());
			
			int rowsAffected = pstmt.executeUpdate();
			if(rowsAffected > 0)
				return true;
			else
				return false;
		} catch(SQLException e) {
			logger.error("Error in updating user details");
			e.printStackTrace();
			return false;
		}
	}
	
	public String updateAndGetVoteCount(String fieldToUpdate) {
		try {
			query = "Update User.Poll set " + fieldToUpdate + " = " + fieldToUpdate + " + 1";
			pstmt = conn.prepareStatement(query);
			
			int rowsAffected = pstmt.executeUpdate();
			if(rowsAffected > 0)
				return getVoteCount();
			else
				return "";
		} catch(SQLException e) {
			logger.error("Error in updating the vote count");
			e.printStackTrace();
			return "";
		}
	}
	
	private String getVoteCount() {
		try {
			query = "Select * from User.Poll";
			pstmt = conn.prepareStatement(query);
			
			rs = pstmt.executeQuery();
			StringBuffer sb = new StringBuffer();
			if(rs.next()) {
				sb.append("{\"Diabetes\":"+ rs.getInt("Diabetes") + ",");
				sb.append("\"Obesity\":"+ rs.getInt("Obesity") + ",");
				sb.append("\"Flu\":" + rs.getInt("Flu") + ",");
				sb.append("\"Heart_Problems\":" + rs.getInt("Heart_Problems") + ",");
				sb.append("\"Malaria\":"+ rs.getInt("Malaria") + ",");
				sb.append("\"Smoking_Habits\":" + rs.getInt("Smoking_Habits") + "}");
				return sb.toString();
			}
			else
				return "";
		} catch(SQLException e) {
			logger.error("Error in retrieving the vote count");
			e.printStackTrace();
			return "";
		}
	}
	
	public Map<String, Double> getAverageCasesForCountry(String country) {
		try {
			String[] diseases = {"Diabetes", "Cholera", "Malaria", "Tuberculosis"};
			query = "Select AVG(WHO.Disease.no_of_cases) as avg_cases from WHO.Disease where indicator like ? AND country = ? AND year > 2005";
			pstmt = conn.prepareStatement(query);
			Map<String, Double> avgCasesMap = new HashMap<String, Double>();
			
			for(String disease : diseases) {
				pstmt.setString(1, "%" + disease + "%");
				pstmt.setString(2, country);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					avgCasesMap.put(disease, rs.getDouble("avg_cases"));
				}
			}
			if(avgCasesMap.size() > 0)
				return avgCasesMap;
			else
				return null;
			
		} catch(SQLException e) {
			logger.error("Error in getting the average cases for the country: " + country);
			e.printStackTrace();
			return null;
		}
	}
	
	public Map<String, Double> getAverageCasesWorldWide() {
		try {
			logger.info("Retrieving average cases world wide");
			String[] diseases = {"Diabetes", "Cholera", "Malaria", "Tuberculosis"};
			query = "Select AVG(WHO.Disease.no_of_cases) as avg_cases from WHO.Disease where indicator like ? AND year > 2005";
			pstmt = conn.prepareStatement(query);
			Map<String, Double> avgCasesMap = new HashMap<String, Double>();
			
			for(String disease : diseases) {
				pstmt.setString(1, "%" + disease + "%");
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					avgCasesMap.put(disease, rs.getDouble("avg_cases"));
				}
			}
			if(avgCasesMap.size() > 0)
				return avgCasesMap;
			else
				return null;
			
		} catch(SQLException e) {
			logger.error("Error in getting the average cases world wide");
			e.printStackTrace();
			return null;
		}
	}
	
	public List<String> getCountryListForDisease(String disease) {
		try {
			logger.info("Retrieving the list of countries for: " + disease);
			query = "Select distinct country from WHO.Disease where indicator like ?";
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, "%" + disease + "%");
			rs = pstmt.executeQuery();
			List<String> countryList = new ArrayList<String>();
			
			while(rs.next()) {
				countryList.add(rs.getString("country"));
			}
			
			if(countryList.size() > 0)
				return countryList;
			else
				return null;
			
		} catch(SQLException e) {
			logger.error("Error in retrieving the country list for the disease: " + disease);
			e.printStackTrace();
			return null;
		}
	}
	
	public Map<Integer, Integer> getCasesYearWiseForCountry(String country, String disease) {
		try {
			query = "Select year, no_of_cases from WHO.Disease where indicator like ? AND country = ? AND year > 2005";
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, "%" + disease + "%");
			pstmt.setString(2, country);
			
			rs = pstmt.executeQuery();
			Map<Integer, Integer> yearVsCasesMap = new LinkedHashMap<Integer, Integer>();
			
			while(rs.next()) {
				yearVsCasesMap.put(rs.getInt("year"), rs.getInt("no_of_cases"));
			}
			
			if(yearVsCasesMap.size() > 0)
				return yearVsCasesMap;
			else
				return null;
			
		} catch(SQLException e) {
			logger.error("Error in fetching the cases year wise for country: " + country);
			e.printStackTrace();
			return null;
		}
	}
	
	/*
	 * Retrieve cases for all the diseases country wise
	 */
	private Map<String, CountryData> getCasesCountryWise() {
		try {
			String[] diseases = {"Diabetes", "Cholera", "Malaria", "Tuberculosis"};
			Map<String, CountryData> diseaseVsCountryDataMap = new LinkedHashMap<String, CountryData>();
			CountryData countryData = new CountryData();
			
			for(String disease : diseases) {
				List<String> countryList = getCountryListForDisease(disease);
				if(countryList != null) {
					for(String country : countryList) {
						countryData.setCountryName(country);
						countryData.setYearVsCasesMap(getCasesYearWiseForCountry(country, disease));
						diseaseVsCountryDataMap.put(disease, countryData);
					}
				}
				else
					return null;
			}
			
			if(diseaseVsCountryDataMap.size() > 0)
				return diseaseVsCountryDataMap;
			else
				return null;
			
		} catch(Exception e) {
			logger.error("Error in fetching the cases data country wise");
			e.printStackTrace();
			return null;
		}
	}
	
	/*
	 * Retrieve cases for @param disease country wise
	 */
	private Map<String, CountryData> getCasesCountryWise(String disease) {
		try {
			Map<String, CountryData> diseaseVsCountryDataMap = new LinkedHashMap<String, CountryData>();
			CountryData countryData = new CountryData();
			
			List<String> countryList = getCountryListForDisease(disease);
			if (countryList != null) {
				for (String country : countryList) {
					countryData.setCountryName(country);
					countryData.setYearVsCasesMap(getCasesYearWiseForCountry(country, disease));
					diseaseVsCountryDataMap.put(disease, countryData);
				}
			} else
				return null;
			
			if(diseaseVsCountryDataMap.size() > 0)
				return diseaseVsCountryDataMap;
			else
				return null;
			
		} catch(Exception e) {
			logger.error("Error in fetching the cases data country wise");
			e.printStackTrace();
			return null;
		}
	}
	
	private Map<Integer, List<Integer>> getDiseaseCasesYearWise(String disease) {
		try{
			logger.info("Retreiving the year wise case data for: " + disease);
			int[] years = {2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013};
			Map<Integer, List<Integer>> yearVsCasesMap = new LinkedHashMap<Integer, List<Integer>>();
			
			for(int year : years) {
				List<Integer> casesList = new ArrayList<Integer>();
				query = "Select no_of_cases from WHO.Disease where indicator like ? AND year = ?";
				pstmt = conn.prepareStatement(query);
				
				pstmt.setString(1, "%" + disease + "%");
				pstmt.setInt(2, year);
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					casesList.add(rs.getInt("no_of_cases"));
				}
				yearVsCasesMap.put(year, casesList);
			}
			
			if(yearVsCasesMap.size() > 0)
				return yearVsCasesMap;
			else
				return null;
			
		} catch(SQLException e) {
			logger.error("Error in fetching the data for disease: " + disease);
			e.printStackTrace();
			return null;
		}
	}
	
	private Map<String, List<Integer>> getCasesCountryWiseForDisease(String disease) {
		try {
			Map<String, List<Integer>> countryVsCasesDataMap = new LinkedHashMap<String, List<Integer>>();
			
			List<String> countryList = getCountryListForDisease(disease);
			if (countryList != null) {
				for (String country : countryList) {
					//countryVsCasesDataMap.put(country, getDiseaseCasesYearWiseForCountry(disease, country));
				}
			} else
				return null;
			
			if(countryVsCasesDataMap.size() > 0)
				return countryVsCasesDataMap;
			else
				return null;
			
		} catch(Exception e) {
			logger.error("Error in fetching the cases data country wise");
			e.printStackTrace();
			return null;
		}
	}
	
	public List<String> retrieveAllOccupations() {
		try {
			logger.info("Retrieving the list of all occupations");
			query = "Select title from Occupation.occupation_data";
			pstmt = conn.prepareStatement(query);
			List<String> jobTitleList = new ArrayList<String>();
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				jobTitleList.add(rs.getString("title"));
			}
			
			if(jobTitleList.size() > 0)
				return jobTitleList;
			else
				return null;
		} catch(Exception e) {
			logger.error("Error in retreiving all the job titles");
			e.printStackTrace();
			return null;
		}
	}
	
	public String retrieveDescriptionForOccupation(String title) {
		try {
			logger.info("Retrieving the description for occupation with title: " + title);
			query = "Select description from Occupation.occupation_data where title = ?";
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, title);
			String jobDescription ;
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				jobDescription = rs.getString("description");
				return jobDescription;
			}
			
			return null;

		} catch(Exception e) {
			logger.error("Error in retreiving all the job titles");
			e.printStackTrace();
			return null;
		}
	}
	
	public String retrieveOccupationDetailsForAJob(String title) {
		try {
			query = "Select * from Occupation.jobTypes";
			pstmt = conn.prepareStatement(query);
			List<PatientOccupation> occupationTypesList = new ArrayList<PatientOccupation>();
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				PatientOccupation occupation = new PatientOccupation();
				occupation.setType(rs.getString("type"));
				occupation.setCategory(rs.getString("category"));
				occupation.setActivityLevel(rs.getString("activity_level"));
				
				occupationTypesList.add(occupation);
			}
			
			for(final PatientOccupation occupation : occupationTypesList) {
				if(title.contains(occupation.getType())) {
					logger.info("Found matching job title with info:"
							+ " Activity Level: " + occupation.getActivityLevel()
							+ " Category: " + occupation.getCategory()
							+ " Type: " + occupation.getType()
							+ " Description: " + retrieveDescriptionForOccupation(title));
					PatientOccupation matchingOccupation = new PatientOccupation();
					matchingOccupation.setActivityLevel(occupation.getActivityLevel());
					matchingOccupation.setCategory(occupation.getCategory());
					matchingOccupation.setType(occupation.getType());
					matchingOccupation.setTitle(title);
					matchingOccupation.setDescription(retrieveDescriptionForOccupation(title));
					return mapper.writeValueAsString(matchingOccupation);
				}
			}
			logger.info("Matching occupation type not found");
			PatientOccupation occupation = new PatientOccupation();
			occupation.setActivityLevel("Light");
			occupation.setCategory("Other");
			occupation.setDescription(retrieveDescriptionForOccupation(title));
			occupation.setTitle(title);
			return mapper.writeValueAsString(occupation);
				
		} catch(Exception e) {
			logger.error("Error in retreiving the occupation details for title: " + title);
			e.printStackTrace();
			return null;
		}
	}
	
	public List<String> retrieveDiseaseList() {
		try {
			query = "Select * from WHO.DiseaseList";
			pstmt = conn.prepareStatement(query);
			List<String> diseaseList = new ArrayList<String>();
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String disease = rs.getString("name");
				if(disease.indexOf("see") > 0) {
					disease = disease.substring(0, (disease.indexOf("see") - 4));
				}
				diseaseList.add(disease);
			}
			if(diseaseList.size() > 0)
				return diseaseList;
			else
				return null;
			
		} catch(Exception e) {
			logger.error("Error in retrieving the disease list");
			e.printStackTrace();
			return null;
		}
	}
}

