package com.dao;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.beans.Disease;
import com.beans.UserInfo;

public class MysqlDao {
	
	private Properties props = new Properties();
	private Logger logger = LoggerFactory.getLogger(MysqlDao.class);
	private FileInputStream fis ;
	private Connection conn;
	private ResultSet rs;
	private PreparedStatement pstmt;
	private String query;
	
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
	
	public String getVoteCount() {
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
}

