package com.tests;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

import com.beans.Disease;
import com.beans.UserInfo;
import com.dao.MysqlDao;

public class MySqlUnitTests {
	
	private MysqlDao dao;
	private UserInfo user;
	private Disease disease;
	
	@Before
	public void initialize() {
		dao = new MysqlDao();
		
		user = new UserInfo();
		user.setFname("junit");
		user.setLname("test");
		user.setEmail("test@junit.com");
		user.setPassword("aaaaaaaa");
		user.setStreet("1 N St");
		user.setAptOrSuite("1");
		user.setState("CA");
		user.setCity("San Jose");
		user.setContact(1234567899);
		user.setZip(12345);
		
		disease = new Disease();
		disease.setIndicator("Dummy Disease");
		disease.setCountry("Test country");
		disease.setNo_of_cases(500);
		disease.setSex("Both Sexes");
		disease.setWho_region("Americas");
		disease.setYear(2014);
	}
	
	@Test
	public void testStoreUserInfo() {
		assertTrue("User registered successfully", dao.storeUserInfo(user));
	}
	
	@Test
	public void testCredentials() {
		assertEquals("Credentials match", "kashyap", dao.checkCredentials("kashyap@patel.com", "aaaaaaaa"));
	}
	
	@Test
	public void testRetrieveUserDetails() {
		assertNotNull("User details fetched", dao.retrieveUserDetails(user.getEmail()));
	}
	
	@Test
	public void testCreateDisease() {
		assertTrue("Disease created", dao.createDisease(disease));
	}
	
	@Test
	public void testUpdateUserDetails() {
		assertTrue("User details updated", dao.updateUserDetails(user));
	}
	
	@Test
	public void testUpdateAndGetVoteCount() {
		assertNotNull("Vote data received", dao.updateAndGetVoteCount("Diabetes"));
	}
	
	@Test
	public void testAverageCasesWorldwide() {
		assertNotNull("Average cases received", dao.getAverageCasesWorldWide());
	}
	
	@Test
	public void testAverageCasesForCountry() {
		assertNotNull("Average case for country received", dao.getAverageCasesForCountry("India"));
	}
	
	@Test
	public void testCountryListForDisease() {
		assertNotNull("Country list not null", dao.getCountryListForDisease("Diabetes"));
	}
	
	@Test
	public void testCasesYearWiseForCountry() {
		assertNotNull("Cases year wise for country not null", dao.getCasesYearWiseForCountry("India", "Malaria"));
	}
	
	@Test
	public void testAllOccupationsRetrieval() {
		assertNotNull("Occupations list not null", dao.retrieveAllOccupations());
	}
	
	@Test
	public void testRetrievingDescriptionForOccupation() {
		assertNotNull("Description retrieved", dao.retrieveDescriptionForOccupation("Engineers, All Other"));
	}
	
	@Test
	public void testRetrievingOccupationDetailsForAJob() {
		assertNotNull("Occupation details received", dao.retrieveOccupationDetailsForAJob("Engineers, All Other"));
	}
	
	@Test
	public void testDiseaseListRetrieval() {
		assertNotNull("Disease list not null", dao.retrieveDiseaseList());
	}

}
